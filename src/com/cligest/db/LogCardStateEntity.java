package com.cligest.db;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "log_card_state", schema = "timesheet", catalog = "")
@IdClass(LogCardStateEntityPK.class)
public class LogCardStateEntity {
    private String idCard;
    private Timestamp datetime;
    private int cardState;
    private int idEmployee;
    private String description;

    @Id
    @Column(name = "id_card")
    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    @Id
    @Column(name = "datetime")
    public Timestamp getDatetime() {
        return datetime;
    }

    public void setDatetime(Timestamp datetime) {
        this.datetime = datetime;
    }

    @Basic
    @Column(name = "card_state")
    public int getCardState() {
        return cardState;
    }

    public void setCardState(int cardState) {
        this.cardState = cardState;
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
    @Column(name = "description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        LogCardStateEntity that = (LogCardStateEntity) o;
        return cardState == that.cardState &&
                idEmployee == that.idEmployee &&
                Objects.equals(idCard, that.idCard) &&
                Objects.equals(datetime, that.datetime) &&
                Objects.equals(description, that.description);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idCard, datetime, cardState, idEmployee, description);
    }
}
