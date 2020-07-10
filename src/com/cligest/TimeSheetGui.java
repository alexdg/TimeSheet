package com.cligest;

import javax.swing.*;
import java.awt.GridLayout;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

public class TimeSheetGui {

    public static final long TIME_TO_WAIT_UNTIL_NEXT_CARD_MS = 5000;

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
}
