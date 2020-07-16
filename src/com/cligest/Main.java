package com.cligest;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class Main {

    public static Properties properties;

    public static int MAIN_THREAD_SLEEP_MS = 1500; // default
    public static int DEVICE_ID = 0;

    public static void loadPropertiesFile(String filename) throws IOException {
        properties = new Properties();
        properties.load(new FileInputStream(filename));

    }

    public static void loadProperties() {
        System.out.println("Main.loadProperties");

        MAIN_THREAD_SLEEP_MS = Integer.parseInt(Main.properties.getProperty("MAIN_THREAD_SLEEP_MS"));
        DEVICE_ID = Integer.parseInt(Main.properties.getProperty("DEVICE_ID"));
    }

    public static void main(String[] args) {
        System.out.println("Main.main: start");

        // check for properties file

        if (args.length == 0) {
            System.out.println("Main.main: missing properties filename is argument");
            System.exit(1);
        }

        try {
            loadPropertiesFile(args[0]);
        } catch (IOException e){
            System.out.println("Main.main: error loading properties file: " + args[0]);
            e.printStackTrace();
            System.exit(1);
        }

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
