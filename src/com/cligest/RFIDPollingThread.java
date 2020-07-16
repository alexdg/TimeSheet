package com.cligest;

import java.text.SimpleDateFormat;
import java.util.Date;

public class RFIDPollingThread implements Runnable {

    public static final int                 THREAD_SLEEP_MS = 100;
    public static final int                 READER_ENTERING = 0;
    public static final int                 READER_EXITING = 1;
    public static final String              DATE_FORMAT = "yyyyMMdd_HHmmss";


    private Thread thisThread;

    private TimeSheetGui timeSheetGui;
    private int readerID;
    private AcrDevice readerDevices;

    public RFIDPollingThread (TimeSheetGui tsGui, int rID, AcrDevice rDevices) {
        thisThread = new Thread (this, "Reader " + rID);

        timeSheetGui = tsGui;
        readerID  = rID;
        readerDevices = rDevices;

        System.out.println("RFIDPollingThread.RFIDPollingThread: created " + rID);

        thisThread.start();
    }

    public void run() {
        System.out.println("RFIDPollingThread.run: id " + readerID);
        String cardUID = null;
        while (true) {

            cardUID = null;
            cardUID = readerDevices.getCardUID(readerID);

            if (cardUID != null) {
                if (cardUID.length() == 12) {
                    if (!timeSheetGui.isPausedState()) {
                        // we got a card ID
                        System.out.println("RFIDPollingThread.run: we got a card and system is not paused " + cardUID);
                        processCard(cardUID);
                    }
                }
            }

            try {
                Thread.sleep(THREAD_SLEEP_MS);
            } catch (InterruptedException e) {
                System.out.println("RFIDPollingThread.run: thread error");
                e.printStackTrace();
            }
        }
    }

    private void processCard (String cardUID) {
        // check with database that card is valid


        // temporary code
        timeSheetGui.setEmployeeName(cardUID);

        String action = null;
        if (readerID == READER_ENTERING) {
            // employee is entering
            action = "ENTERING";

            timeSheetGui.setTitle(action);
        } else {
            // employee is exiting
            action = "EXITING";
        }
        timeSheetGui.setTitle(action);

        // take a photo
        timeSheetGui.takePhoto(cardUID + "_" + action + "_" + (new SimpleDateFormat(DATE_FORMAT)).format(new Date()));

        timeSheetGui.pauseForNextCard();
    }

    public boolean isAlive() {
        return this.thisThread.isAlive();
    }
}
