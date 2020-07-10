package com.cligest;

import com.hopding.jrpicam.RPiCamera;
import com.hopding.jrpicam.enums.Exposure;
import com.hopding.jrpicam.exceptions.FailedToRunRaspistillException;

import javax.swing.*;
import java.awt.GridLayout;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

public class TimeSheetGui {

    public static final long                                 TIME_TO_WAIT_UNTIL_NEXT_CARD_MS = 2500;

    public static final String                               IMAGE_FILESYSTEM_PATH = "/home/pi/Pictures";
    public static final int                                  IMAGE_WIDTH = 1024;
    public static final int                                  IMAGE_HEIGHT = 1024;
    public static final com.hopding.jrpicam.enums.Exposure   IMAGE_EXPOSURE = Exposure.AUTO;
    public static final int                                  IMAGE_TIMEOUT = 2;
    public static final int                                  IMAGE_BRIGHTNESS = 50; // default


    RPiCamera piCamera;

    private boolean pausedState;

    private JFrame jFrame;
    private JPanel jPanel;
    private JTextField jTextFieldTitle, jTextFieldEmployeeName, jTextFieldDateTime;

    public TimeSheetGui () {
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

    public void setTitle (String newTitle) {
        jTextFieldTitle.setText(newTitle);
    }

    public void setEmployeeName (String newTitle) {
        jTextFieldEmployeeName.setText(newTitle);
    }

    public void setDateTime (String newTitle) {
        jTextFieldDateTime.setText(newTitle);
    }

    public void pauseForNextCard() {
        setPausedState(true);
        try {
            Thread.sleep(TIME_TO_WAIT_UNTIL_NEXT_CARD_MS);
        } catch (InterruptedException e) {
            System.out.println("TimeSheetGui.pauseForNextCard: error");
            e.printStackTrace();
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
        System.out.println("TimeSheetGui.takePhoto: " + filename);
        try {
            piCamera.takeStill(filename + ".jpg");
        } catch (Exception e) {
            System.out.println("TimeSheetGui.takePhoto: error");
            e.printStackTrace();
        }
    }

    public void prepCamera() {
        try {
            piCamera = new RPiCamera(IMAGE_FILESYSTEM_PATH);
        } catch (FailedToRunRaspistillException e) {
            System.out.println("TimeSheetGui.prepCamera: no camera");
            e.printStackTrace();
        }

        piCamera.setWidth(IMAGE_WIDTH);
        piCamera.setHeight(IMAGE_HEIGHT);
        piCamera.setBrightness(IMAGE_BRIGHTNESS);
        piCamera.setExposure(IMAGE_EXPOSURE);
        piCamera.setTimeout(IMAGE_TIMEOUT);
    }
}
