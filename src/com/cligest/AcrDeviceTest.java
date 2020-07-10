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

public class AcrDeviceTest {

    private static Acr122ReaderWriter[] devs = new Acr122ReaderWriter[2];
    private static CardTerminal[] devsTerminal = new CardTerminal[2];
    private NdefMessageDecoder decoder = NdefContext.getNdefMessageDecoder();

    public static String convertToHex(byte[] bytes) {
        StringBuilder sb = new StringBuilder();
        for (byte b : bytes) {
            sb.append(String.format("%02X ", b));
        }
        return sb.toString();
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
            }
        } catch (CardException var5) {
            var5.printStackTrace();
        }
    }

    public void getBasicAccess(int deviceNumber) {
        try {

            Card newCard = devsTerminal[deviceNumber].connect("*");
            System.out.println("newCard = " + newCard);
            ;
            CommandAPDU commandAPDU = new CommandAPDU(new byte[]{(byte) 0xFF, (byte) 0xCA, (byte) 0x00, (byte) 0x00, (byte) 0x00});
            ResponseAPDU responseAPDU = null;

            responseAPDU = newCard.getBasicChannel().transmit(commandAPDU);

            if (responseAPDU.getSW1() == 0x63 && responseAPDU.getSW2() == 0x00) System.out.println("Failed");

            System.out.println("convertToHex(responseAPDU.getBytes() = " + convertToHex(responseAPDU.getBytes()));

            newCard.disconnect(false);
        } catch (CardException e) {
            e.printStackTrace();
        }

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
