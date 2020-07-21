package com.cligest;

import com.cligest.db.LogCardStateEntity;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class DatabaseLib {
    private static final SessionFactory ourSessionFactory;
    private static Session session;

    static {
        try {
            Configuration configuration = new Configuration();
            configuration.configure();

            ourSessionFactory = configuration.buildSessionFactory();


        } catch (Throwable ex) {
            throw new ExceptionInInitializerError(ex);
        }
    }

    private static void getSession() throws HibernateException {
        Main.log.info("DatabaseLib.getSession: called");

        session = ourSessionFactory.openSession();
    }

    public static boolean isCardValid (String cardUID) {
        boolean result = false;
        getSession();

        LogCardStateEntity logCardStateEntity = null;

        String hql = "from LogCardStateEntity p where p.idCard = :idcard order by p.datetime asc";

        logCardStateEntity = session.createQuery(hql, LogCardStateEntity.class).setParameter("idcard","f2e24d19").getSingleResult();

        if ( logCardStateEntity != null ) {
            if( logCardStateEntity.getCardState() == 1) {
                // card is active
                result = true;
                Main.log.info("DatabaseLib.isCardValid card is active");;
            }
        }

        return result;
    }

}
