package com.cligest;

import org.hibernate.dialect.Database;

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
    private String action;

    public RFIDPollingThread (TimeSheetGui tsGui, int rID, AcrDevice rDevices) {
        this.loadProperties();

        thisThread = new Thread (this, "Reader " + rID);

        timeSheetGui = tsGui;
        readerID  = rID;
        readerDevices = rDevices;

        // set Action string
        if (readerID == READER_ENTERING) {
            // employee is entering
            action = "ENTERING";
        } else {
            // employee is exiting
            action = "EXITING";
        }

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

        if (DatabaseLib.isCardValid(cardUID)) {
            // temporary GUI code
            timeSheetGui.setEmployeeName(cardUID);

            timeSheetGui.setTitle(action);

            // take a photo
            timeSheetGui.takePhoto(cardUID + "_" + action + "_" + (new SimpleDateFormat(DATE_FORMAT)).format(new Date()));
        } else {
            // temporary GUI code
            timeSheetGui.setTitle("INVALID");
        }

        timeSheetGui.pauseForNextCard();
    }

    public boolean isAlive() {
        return this.thisThread.isAlive();
    }
}
