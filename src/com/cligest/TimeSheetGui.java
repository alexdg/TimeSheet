package com.cligest;

import com.hopding.jrpicam.RPiCamera;
import com.hopding.jrpicam.enums.Exposure;
import com.hopding.jrpicam.exceptions.FailedToRunRaspistillException;

import javax.swing.*;
import java.awt.GridLayout;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import java.io.IOException;




public class TimeSheetGui {


    public static long                                 TIME_TO_WAIT_UNTIL_NEXT_CARD_MS = 2500;

    public static String                               IMAGE_FILESYSTEM_LOCAL_PATH = "/home/pi/Pictures";
    public static String                               IMAGE_FILESYSTEM_REMOTE_PATH = "/home/pi/Pictures_Backup";
    public static int                                  IMAGE_WIDTH = 1024;
    public static int                                  IMAGE_HEIGHT = 1024;
    public static final com.hopding.jrpicam.enums.Exposure   IMAGE_EXPOSURE = Exposure.AUTO;
    public static int                                  IMAGE_TIMEOUT_MS = 2;
    public static int                                  IMAGE_BRIGHTNESS = 50;
    public static int                                  IMAGE_ROTATION = 0;

    public static String                                  SOUND_ENTERING;
    public static String                                  SOUND_EXITING;
    public static String                                  SOUND_INVALID_CARD;
    public static String                                  SOUND_REPEAT_WARNING;

    RPiCamera piCamera;

    private boolean pausedState;

    private JFrame jFrame;
    private JPanel jPanel;
    private JTextField jTextFieldTitle, jTextFieldEmployeeName, jTextFieldDateTime;


    public TimeSheetGui () {
        Main.log.debug("TimeSheetGui.TimeSheetGui: constructor");
        loadProperties();

        jFrame = new JFrame("TimeSheet");

        jFrame.addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent windowEvent){
                System.exit(0);
            }
        });


        jPanel = new JPanel(new GridLayout(3, 1));

        jTextFieldTitle = new JTextField();
        jTextFieldTitle.setEditable(false);

        jTextFieldEmployeeName = new JTextField();
        jTextFieldEmployeeName.setEditable(false);

        jTextFieldDateTime = new JTextField();
        jTextFieldDateTime.setEditable(false);

        jPanel.add(jTextFieldTitle);
        jPanel.add(jTextFieldEmployeeName);
        jPanel.add(jTextFieldDateTime);

        jFrame.setContentPane(jPanel);
        jFrame.pack();
        jFrame.setLocationRelativeTo(null);
        jFrame.setSize(400,400);

        // prep the camera
        prepCamera();

        jFrame.setVisible(true);
    }

    public void loadProperties() {
        Main.log.debug("TimeSheetGui.loadProperties");

        TIME_TO_WAIT_UNTIL_NEXT_CARD_MS = Long.parseLong(Main.properties.getProperty("TIME_TO_WAIT_UNTIL_NEXT_CARD_MS"));
        IMAGE_FILESYSTEM_LOCAL_PATH = Main.properties.getProperty("IMAGE_FILESYSTEM_LOCAL_PATH");
        IMAGE_FILESYSTEM_REMOTE_PATH = Main.properties.getProperty("IMAGE_FILESYSTEM_REMOTE_PATH");
        IMAGE_WIDTH = Integer.parseInt(Main.properties.getProperty("IMAGE_WIDTH"));
        IMAGE_HEIGHT = Integer.parseInt(Main.properties.getProperty("IMAGE_HEIGHT"));
        IMAGE_TIMEOUT_MS = Integer.parseInt(Main.properties.getProperty("IMAGE_TIMEOUT_MS"));
        IMAGE_BRIGHTNESS = Integer.parseInt(Main.properties.getProperty("IMAGE_BRIGHTNESS"));
        IMAGE_ROTATION = Integer.parseInt(Main.properties.getProperty("IMAGE_ROTATION"));
        SOUND_ENTERING = Main.properties.getProperty("SOUND_ENTERING");
        SOUND_EXITING = Main.properties.getProperty("SOUND_EXITING");
        SOUND_INVALID_CARD = Main.properties.getProperty("SOUND_INVALID_CARD");
        SOUND_REPEAT_WARNING = Main.properties.getProperty("SOUND_REPEAT_WARNING");
    }

    public void setTitle (String newTitle) {
        jTextFieldTitle.setText(newTitle);
    }

    public void setEmployeeName (String newTitle) {
        jTextFieldEmployeeName.setText(newTitle);
    }

    public void setDateTime (String newTitle) {
        jTextFieldDateTime.setText(newTitle);
    }

    public void setPauseForNextCard() {
        setPausedState(true);
    }

    public void pauseForNextCard() {
        try {
            Thread.sleep(TIME_TO_WAIT_UNTIL_NEXT_CARD_MS);

        } catch (InterruptedException e) {
            Main.log.error("TimeSheetGui.pauseForNextCard: error", e);
        }

        clearScreen();
        setPausedState(false);
    }

    private void clearScreen() {
        setTitle("");
        setEmployeeName("");
        setDateTime("");
    }

    public boolean isPausedState() {
        return pausedState;
    }

    public void setPausedState(boolean pausedState) {
        this.pausedState = pausedState;
    }

    public void takePhoto(String filename) {
        Main.log.debug("TimeSheetGui.takePhoto: " + filename);
        try {
            piCamera.takeStill(filename + ".jpg");
        } catch (Exception e) {
            Main.log.error("TimeSheetGui.takePhoto: error", e);
        }

        // now copy it to remote location
        try {
            Runtime.getRuntime().exec("cp " + IMAGE_FILESYSTEM_LOCAL_PATH + "/" + filename + ".jpg " +
                    IMAGE_FILESYSTEM_REMOTE_PATH + "/" + filename + ".jpg");
        } catch (IOException e) {
            Main.log.error("TimeSheetGui.takePhoto: error copying file to remote location", e);
        }
    }

    public void prepCamera() {
        try {
            piCamera = new RPiCamera(IMAGE_FILESYSTEM_LOCAL_PATH);
        } catch (FailedToRunRaspistillException e) {
            Main.log.error("TimeSheetGui.prepCamera: no camera", e);
        }

        piCamera.setWidth(IMAGE_WIDTH);
        piCamera.setHeight(IMAGE_HEIGHT);
        piCamera.setBrightness(IMAGE_BRIGHTNESS);
        piCamera.setExposure(IMAGE_EXPOSURE);
        piCamera.setTimeout(IMAGE_TIMEOUT_MS);
        piCamera.setRotation(IMAGE_ROTATION);
        piCamera.setFullPreviewOff();
        piCamera.setPreviewFullscreen(false);
        piCamera.turnOffPreview();
    }

    public void playSound(String sound) {
        try {
            Runtime.getRuntime().exec("aplay -q " + sound);
        } catch (Exception e) {
            Main.log.error("Sound error file: " + sound, e);
        }
    }
}
