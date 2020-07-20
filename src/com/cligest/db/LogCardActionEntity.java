package com.cligest.db;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "log_card_action", schema = "timesheet", catalog = "")
public class LogCardActionEntity {
    private String idCard;
    private int idEmployee;
    private Timestamp datetime;
    private int idDevice;
    private int idAction;
    private String imageFile;

    @Basic
    @Column(name = "id_card")
    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    @Basic
    @Column(name = "id_employee")
    public int getIdEmployee() {
        return idEmployee;
    }

    public void setIdEmployee(int idEmployee) {
        this.idEmployee = idEmployee;
    }

    @Basic
    @Column(name = "datetime")
    public Timestamp getDatetime() {
        return datetime;
    }

    public void setDatetime(Timestamp datetime) {
        this.datetime = datetime;
    }

    @Basic
    @Column(name = "id_device")
    public int getIdDevice() {
        return idDevice;
    }

    public void setIdDevice(int idDevice) {
        this.idDevice = idDevice;
    }

    @Basic
    @Column(name = "id_action")
    public int getIdAction() {
        return idAction;
    }

    public void setIdAction(int idAction) {
        this.idAction = idAction;
    }

    @Basic
    @Column(name = "image_file")
    public String getImageFile() {
        return imageFile;
    }

    public void setImageFile(String imageFile) {
        this.imageFile = imageFile;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        LogCardActionEntity that = (LogCardActionEntity) o;
        return idEmployee == that.idEmployee &&
                idDevice == that.idDevice &&
                idAction == that.idAction &&
                Objects.equals(idCard, that.idCard) &&
                Objects.equals(datetime, that.datetime) &&
                Objects.equals(imageFile, that.imageFile);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idCard, idEmployee, datetime, idDevice, idAction, imageFile);
    }
}
