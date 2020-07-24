package com.cligest;

import java.text.SimpleDateFormat;
import java.util.Date;

public class RFIDPollingThread implements Runnable {

    public static int                       THREAD_SLEEP_MS = 100;
    public static int                       EMPLOYEE_INVALID_ID = -1;

    public static int                      TIME_ZONE_GMT = 0;

    public static final int                 READER_ENTERING = 0;
    public static final int                 READER_EXITING = 1;
    public static final String              DATE_FILE_FORMAT = "yyyyMMdd_HHmmss";
    public static final String              DATE_HUMAN_FORMAT = "yyyy/MM/dd HH:mm";
    public static final String              DATE_HHMM_HUMAN_FORMAT = "HH:mm:ss";

    public static final int                 ACTION_ENTER = 1;
    public static final int                 ACTION_ENTER_INVALID = 2;
    public static final int                 ACTION_EXIT = 3;
    public static final int                 ACTION_EXIT_INVALID = 4;

    private Thread thisThread;

    private TimeSheetGui timeSheetGui;
    private int readerID;
    private AcrDevice readerDevices;

    public RFIDPollingThread (TimeSheetGui tsGui, int rID, AcrDevice rDevices) {
        this.loadProperties();

        thisThread = new Thread (this, "Reader " + rID);

        timeSheetGui = tsGui;
        readerID  = rID;
        readerDevices = rDevices;

        Main.log.debug("RFIDPollingThread.RFIDPollingThread: created " + rID);

        thisThread.start();

    }

    private void loadProperties() {
        Main.log.debug("RFIDPollingThread.loadProperties");

        THREAD_SLEEP_MS = Integer.parseInt(Main.properties.getProperty("THREAD_SLEEP_MS"));
        EMPLOYEE_INVALID_ID  = Integer.parseInt(Main.properties.getProperty("EMPLOYEE_INVALID_ID"));
        TIME_ZONE_GMT  = Integer.parseInt(Main.properties.getProperty("TIME_ZONE_GMT"));
    }

    public void run() {
        Main.log.info("RFIDPollingThread.run: id " + readerID);
        String cardUID = null;
        while (true) {

            cardUID = null;
            cardUID = readerDevices.getCardUID(readerID);

            if (cardUID != null) {
                if (cardUID.length() == 12) {
                    if (!timeSheetGui.isPausedState()) {
                        // we got a card ID
                        Main.log.debug("RFIDPollingThread.run: we got a card and system is not paused " + cardUID);
                        // chop off the last 4 chars
                        processCard(cardUID.substring(0,8));
                    }
                }
            }

            try {
                Thread.sleep(THREAD_SLEEP_MS);
            } catch (InterruptedException e) {
                Main.log.error("RFIDPollingThread.run: thread error", e);
            }
        }
    }

    private void processCard (String cardUID) {
        // check with database that card is valid
        Main.log.info("RFIDPollingThread.processCard called with cardUID=" + cardUID);

        // set pause the system
        timeSheetGui.setPauseForNextCard();

        int action;
        String sound;
        String datetime = "";
        if (readerID == READER_ENTERING) {
            action = ACTION_ENTER;
            sound = TimeSheetGui.SOUND_ENTERING;
        } else {
            action= ACTION_EXIT;
            sound = TimeSheetGui.SOUND_EXITING;
        }

        // take a photo
        Date date = new Date();
        String photoFilename = cardUID + "_" + (new SimpleDateFormat(DATE_FILE_FORMAT)).format(date);
        timeSheetGui.takePhoto(photoFilename);

        int employeeID = EMPLOYEE_INVALID_ID; // look employees table for reference

        if (DatabaseLib.isCardValid(cardUID)) {
            // valid card
            employeeID = DatabaseLib.getEmployeeID(cardUID);
            // get the last time the employee entered and exited
            Date ddEnter = DatabaseLib.getLastAction(employeeID, RFIDPollingThread.ACTION_ENTER);
            Date ddExit = DatabaseLib.getLastAction(employeeID, RFIDPollingThread.ACTION_EXIT);

            if (action == ACTION_EXIT) {

                if (ddEnter == null) {
                    // exiting without entering !
                    datetime = "Está a sair sem ter entrado!";
                    sound = TimeSheetGui.SOUND_EXIT_WITHOUT_ENTER;
                } else {
                    if (ddExit != null) {
                        // not first time exiting
                        if (ddExit.getTime() > ddEnter.getTime()) {
                            // exit more recent than last enter
                            sound = timeSheetGui.SOUND_EXIT_WITHOUT_ENTER;
                            datetime = "Está a sair outra vez!\n" +
                                    "A sua saída foi : " +
                                    (new SimpleDateFormat(DATE_HUMAN_FORMAT)).format(ddExit);
                        } else {
                            // normal exit
                            datetime = "Entrou às : " + (new SimpleDateFormat(DATE_HUMAN_FORMAT)).format(ddEnter) + "\n"
                                    + "Saiu às : " + (new SimpleDateFormat(DATE_HUMAN_FORMAT)).format(date) + "\n"
                                    + "Permaneceu durante : " + new SimpleDateFormat(DATE_HHMM_HUMAN_FORMAT)
                                    .format(new Date((date.getTime() - ddEnter.getTime() - (TIME_ZONE_GMT * 60*60*1000))));
                        }
                    }
                }
            } else {
                // normal enter
                // set default normal message
                datetime = "Bem-vindo!\n" +
                        "Entrou às :" + (new SimpleDateFormat(DATE_HUMAN_FORMAT)).format(date);

                if ((ddEnter != null) && (ddExit != null )) {
                    // we have a previous exit and enter
                    // not first time exiting
                    if (ddEnter.getTime() > ddExit.getTime()) {
                        // enter more recent than exit
                        sound = timeSheetGui.SOUND_REPEAT_WARNING;
                        datetime = "Está a entrar outra vez!\n" +
                                "A sua nova entrada agora é : " +
                                (new SimpleDateFormat(DATE_HUMAN_FORMAT)).format(date);
                    }
                }
            }
        } else {
            // invalid card
            action++;  // look at the actions table for reference
            sound = timeSheetGui.SOUND_INVALID_CARD;
            datetime = "Acção registada.";
        }

        DatabaseLib.logCardAction(cardUID, employeeID, date, Main.DEVICE_ID, action, photoFilename );

        timeSheetGui.setEmployeeName(DatabaseLib.getEmployeeName(employeeID));
        timeSheetGui.setTitle(DatabaseLib.getAction(action));
        timeSheetGui.setDateTime(datetime);
        timeSheetGui.playSound(sound);
        timeSheetGui.pauseForNextCard();
    }

    public boolean isAlive() {
        return this.thisThread.isAlive();
    }
}
