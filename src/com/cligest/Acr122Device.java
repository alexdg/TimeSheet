package com.cligest;

import org.nfctools.mf.MfCardListener;
import org.nfctools.spi.acs.Acr122ReaderWriter;
import org.nfctools.spi.acs.AcsTerminal;

import javax.smartcardio.CardTerminal;
import java.io.IOException;

/**
 * An ACR122 device.
 */
public class Acr122Device extends AcsTerminal {

    /**
     * The ACR122 reader/writer
     */
    private Acr122ReaderWriter readerWriter;

    /**
     * Constructor.
     */
    public Acr122Device(CardTerminal terminal) {
        setCardTerminal(terminal);
        readerWriter = new Acr122ReaderWriter(this);
    }

    @Override
    public void open() throws IOException {
        Main.log.info("Opening device");
        super.open();
    }

    /**
     * Start listening for cards using the provided listener.
     *
     * @param listener a listener
     */
    public void listen(MfCardListener listener) throws IOException {
        Main.log.info("Listening for cards...");
        readerWriter.setCardListener(listener);
    }

    @Override
    public void close() throws IOException {
        Main.log.info("Closing device");
        readerWriter.removeCardListener();
        super.close();
    }
}

