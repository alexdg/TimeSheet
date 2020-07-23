package com.cligest;

import net.bytebuddy.asm.Advice;
import org.hibernate.dialect.Database;

import javax.xml.crypto.Data;
import java.text.SimpleDateFormat;
import java.util.Date;

public class RFIDPollingThread implements Runnable {

    public static  int                      THREAD_SLEEP_MS = 100;
    public static final int                 READER_ENTERING = 0;
    public static final int                 READER_EXITING = 1;
    public static final String              DATE_FORMAT = "yyyyMMdd_HHmmss";


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
        if (readerID == READER_ENTERING) {
            action =1;
            sound = TimeSheetGui.SOUND_ENTERING;
        } else {
            action= 3;
            sound = TimeSheetGui.SOUND_EXITING;
        }

        // take a photo
        Date date = new Date();
        String photoFilename = cardUID + "_" + (new SimpleDateFormat(DATE_FORMAT)).format(date);
        timeSheetGui.takePhoto(photoFilename);

        int employeeID = -1; // look employees table for reference

        if (DatabaseLib.isCardValid(cardUID)) {
            // valid card
            employeeID = DatabaseLib.getEmployeeID(cardUID);
        } else {
            // invalid card
            action++;  // look at the actions table for reference
            sound = timeSheetGui.SOUND_INVALID_CARD;

        }

        DatabaseLib.logCardAction(cardUID, employeeID, date, Main.DEVICE_ID, action, photoFilename );

        timeSheetGui.setEmployeeName(DatabaseLib.getEmployeeName(employeeID));
        timeSheetGui.setTitle(DatabaseLib.getAction(action));
        timeSheetGui.playSound(sound);
        timeSheetGui.pauseForNextCard();
    }

    public boolean isAlive() {
        return this.thisThread.isAlive();
    }
}
