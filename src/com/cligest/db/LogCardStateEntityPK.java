package com.cligest.db;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Objects;

public class LogCardStateEntityPK implements Serializable {
    private String idCard;
    private Timestamp datetime;

    @Column(name = "id_card")
    @Id
    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    @Column(name = "datetime")
    @Id
    public Timestamp getDatetime() {
        return datetime;
    }

    public void setDatetime(Timestamp datetime) {
        this.datetime = datetime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        LogCardStateEntityPK that = (LogCardStateEntityPK) o;
        return Objects.equals(idCard, that.idCard) &&
                Objects.equals(datetime, that.datetime);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idCard, datetime);
    }
}
