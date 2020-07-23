package com.cligest;

import com.cligest.db.ActionsEntity;
import com.cligest.db.EmployeesEntity;
import com.cligest.db.LogCardActionEntity;
import com.cligest.db.LogCardStateEntity;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import javax.persistence.NoResultException;
import java.sql.Timestamp;
import java.util.Date;

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
        Main.log.debug("DatabaseLib.getSession: called");

        session = ourSessionFactory.openSession();
    }

    public static boolean isCardValid (String cardUID) {
        boolean result = false;
        getSession();

        LogCardStateEntity logCardStateEntity = null;

        String hql = "from LogCardStateEntity p where p.idCard = :idcard order by p.datetime desc";

        try {
            logCardStateEntity = session.createQuery(hql, LogCardStateEntity.class).setParameter("idcard",cardUID).getResultList().get(0);
            if( logCardStateEntity.getCardState() == 1) {
                // card is active
                result = true;
                Main.log.info("DatabaseLib.isCardValid card is active");
            }
        } catch (Exception e) {
            Main.log.info("Invalid cardUID = " + cardUID);
            result = false;
        }

        return result;
    }

    public static String getAction(int action) {
        getSession();
        return ((ActionsEntity) session.find(ActionsEntity.class, action)).getDescription();

    }

    public static int getEmployeeID(String cardUID) {
        // if you're calling this method, it means you know that the cardUID is valid
        getSession();

        LogCardStateEntity logCardStateEntity = null;

        String hql = "from LogCardStateEntity p where p.idCard = :idcard order by p.datetime desc";
        logCardStateEntity = session.createQuery(hql, LogCardStateEntity.class).setParameter("idcard",cardUID).getResultList().get(0);

        return logCardStateEntity.getIdEmployee();
    }

    public static String getEmployeeName(int idEmployee) {
        getSession();
        return ((EmployeesEntity) session.find(EmployeesEntity.class, idEmployee)).getEmployeeName();
    }

    public static void logCardAction(String cardUID, int employeeID, Date date, int deviceId, int action, String photoFilename) {
        getSession();

        Main.log.info("logCardAction called: cardUID = " + cardUID + ", employeeID = " + employeeID + ", date = " + date + ", deviceId = " + deviceId + ", action = " + action + ", photoFilename = " + photoFilename);

        Transaction tx = session.beginTransaction();
        LogCardActionEntity logCardActionEntity = new LogCardActionEntity();
        logCardActionEntity.setIdCard(cardUID);
        logCardActionEntity.setIdEmployee(employeeID);
        logCardActionEntity.setDatetime(new Timestamp(date.getTime()));
        logCardActionEntity.setIdDevice(deviceId);
        logCardActionEntity.setIdAction(action);
        logCardActionEntity.setImageFile(photoFilename);
        session.save(logCardActionEntity);
        tx.commit();
    }
}
