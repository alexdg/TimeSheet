package com.cligest;

import javax.swing.*;

public class Main {

    public static final int MAIN_THREAD_SLEEP_MS = 1500;

    public static void main(String[] args) {
        System.out.println("Main.main: start");

        // initiate Card Readers
        AcrDevice devices = new AcrDevice();
        devices.getAvailableTerminals();
        devices.turnOffBuzzer(RFIDPollingThread.READER_ENTERING);
        devices.turnOffBuzzer(RFIDPollingThread.READER_EXITING);

        // simple test
        // devices.getCardUID(0);
        // devices.getCardUID(1);

        // show GUI
        TimeSheetGui timeSheetGui = new TimeSheetGui();

        // set Threads
        RFIDPollingThread r1 = new RFIDPollingThread(timeSheetGui, RFIDPollingThread.READER_ENTERING, devices);

        RFIDPollingThread r2 = new RFIDPollingThread(timeSheetGui, RFIDPollingThread.READER_EXITING, devices);

        try
        {
            while(r1.isAlive() && r2.isAlive())
            {
                Thread.sleep(MAIN_THREAD_SLEEP_MS);
            }
        }
        catch(InterruptedException e)
        {
            System.out.println("Main.main: main thread interrupted");
            e.printStackTrace();
        }
        System.out.println("Main.main: main thread run is over");

        System.out.println("Main.main: end");
    }
}
