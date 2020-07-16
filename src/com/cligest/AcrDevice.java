package com.cligest;

import org.nfctools.mf.MfCardListener;
import org.nfctools.mf.MfReaderWriter;
import org.nfctools.mf.card.MfCard;
import org.nfctools.mf.ndef.MfNdefReader;
import org.nfctools.mf.tools.MfClassicCardScanner;
import org.nfctools.ndef.NdefContext;
import org.nfctools.ndef.NdefMessageDecoder;
import org.nfctools.ndef.Record;
import org.nfctools.spi.acs.Acr122ReaderWriter;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Iterator;
import java.util.List;
import javax.smartcardio.*;

public class AcrDevice {

    public static final int RFID_READERS = 2; // you need 2 of them for this app to work.

    public static       int WAIT_FOR_CARD_PRESENT_MS = 500; // default
    public static final int WAIT_FOR_CARD_ABSENT_MS = 5000;

    public static final byte[] APDU_BUZZER_OFF = {(byte) 0xFF, (byte) 0x00, (byte) 0x52, (byte) 0x00, (byte) 0x00};
    public static final byte[] APDU_BUZZER_ON = {(byte) 0xFF, (byte) 0x00, (byte) 0x52, (byte) 0xFF, (byte) 0x00};
    public static final byte[] APDU_READ_RFID_UID = {(byte) 0xFF, (byte) 0xCA, (byte) 0x00, (byte) 0x00, (byte) 0x00};


    public static final byte APDU_SUCCESS_SW1 = (byte)0x90;
    public static final byte APDU_SUCCESS_SW2 = (byte)0x00;

    public static final byte APDU_FAIL_SW1 = (byte)0x63;
    public static final byte APDU_FAIL_SW2 = (byte)0x00;



    private static Acr122ReaderWriter[] devs = new Acr122ReaderWriter[RFID_READERS];
    private static CardTerminal[] devsTerminal = new CardTerminal[RFID_READERS];
    private NdefMessageDecoder decoder = NdefContext.getNdefMessageDecoder();

    private boolean[] sendBuzzerOff = {false, false}; // 2 readers, 2 buzzer flags

    public AcrDevice() {
        loadProperties();
    }

    public static String convertToHex(byte[] bytes) {
        StringBuilder sb = new StringBuilder();
        for (byte b : bytes) {
            sb.append(String.format("%02X", b));
        }
        return sb.toString();
    }

    public void loadProperties() {
        System.out.println("AcrDevice.loadProperties");

        WAIT_FOR_CARD_PRESENT_MS = Integer.parseInt(Main.properties.getProperty("WAIT_FOR_CARD_PRESENT_MS"));
    }

    public void getAvailableTerminals() {

        TerminalFactory terminalFactory = TerminalFactory.getDefault();

        try {
            List<CardTerminal> terminals = terminalFactory.terminals().list();

            int cnt = 0;
            CardTerminal terminal;
            for (Iterator i$ = terminals.iterator(); i$.hasNext(); ) {
                terminal = (CardTerminal) i$.next();
                System.out.println("terminal.getName() = " + terminal.getName());
                devs[cnt] = new Acr122ReaderWriter(new Acr122Device(terminal));
                devsTerminal[cnt] = terminal;
                cnt++;
            }
        } catch (CardException var5) {
            var5.printStackTrace();
        }
    }

    public void turnOffBuzzer(int deviceNumber) {
        sendBuzzerOff[deviceNumber] = true;
    }

    public String getCardUID(int deviceNumber) {
        String result = null;
        try {
            if (devsTerminal[deviceNumber].waitForCardPresent(WAIT_FOR_CARD_PRESENT_MS)) {

                Card newCard = devsTerminal[deviceNumber].connect("*");
                System.out.println("newCard = " + newCard);

                result = sendAPDU(newCard, APDU_READ_RFID_UID);

                System.out.println("convertToHex(responseAPDU.getBytes() = " + result);


                // should we turn the buzzer off?
                if (sendBuzzerOff[deviceNumber]) {
                    System.out.println("AcrDevice.getCardUID: turn off buzzer for " + deviceNumber);
                    try {
                        sendAPDU(newCard, APDU_BUZZER_OFF);
                    } catch (CardException e) {
                        // failed try again next time
                        sendBuzzerOff[deviceNumber] = true;
                    } finally {
                        // Job done
                        sendBuzzerOff[deviceNumber] = false;
                    }
                }

                //devsTerminal[deviceNumber].waitForCardAbsent(WAIT_FOR_CARD_ABSENT_MS);

                newCard.disconnect(false);
            }
        } catch (CardException e) {
            e.printStackTrace();
        }

        return result;
    }

    private String sendAPDU(Card card, byte[] msg) throws CardException {
        String result = null;

        CommandAPDU commandAPDU = new CommandAPDU(msg);
        ResponseAPDU responseAPDU = null;

        responseAPDU = card.getBasicChannel().transmit(commandAPDU);

        //@todo check if these 2 bytes are null??

        if (responseAPDU.getSW1() == APDU_FAIL_SW1 && responseAPDU.getSW2() == APDU_FAIL_SW2) {
            // message OK
            System.out.println("AcrDevice.sendAPDU: message failed");
        } else {
            // message NOT OK
            result = convertToHex(responseAPDU.getBytes());
        }

        return result;
    }

    public void startTerminals() {
        System.out.println("AcrDeviceTest.startTerminals: start");
        try {
            devs[0].waitForCard(new cardListener(), 10000);
        } catch (IOException e) {
            System.out.println("AcrDeviceTest.startTerminals: exception");
            e.printStackTrace();
        }
        System.out.println("AcrDeviceTest.startTerminals: end");
    }

    private class cardListener implements MfCardListener {
        @Override
        public void cardDetected(MfCard mfCard, MfReaderWriter mfReaderWriter) throws IOException {

            System.out.println("mfCard.getTagType() = " + mfCard.getTagType());

            //System.out.println("mfCard.getId() = " + mfCard.getId());

            System.out.println("mfCard.getGeneralBytes().length = " + mfCard.getGeneralBytes().length);

            System.out.println("mfCard.getGeneralBytes() = " + convertToHex(mfCard.getGeneralBytes()));

            System.out.println("mfCard.toString() = " + mfCard.toString());

            MfNdefReader ndefReader = new MfNdefReader(mfReaderWriter, decoder);

            try {
                List<Record> records = ndefReader.readNdefMessage(mfCard);
                for (Record record : records) {
                    System.out.println("record.toString() = " + record.toString());
                }
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
    }
}
