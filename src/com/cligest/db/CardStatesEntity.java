package com.cligest.db;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "card_states", schema = "timesheet", catalog = "")
public class CardStatesEntity {
    private int idCardState;
    private String description;

    @Id
    @Column(name = "id_card_state")
    public int getIdCardState() {
        return idCardState;
    }

    public void setIdCardState(int idCardState) {
        this.idCardState = idCardState;
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
        CardStatesEntity that = (CardStatesEntity) o;
        return idCardState == that.idCardState &&
                Objects.equals(description, that.description);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idCardState, description);
    }
}
