package com.cligest.db;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "actions", schema = "timesheet", catalog = "")
public class ActionsEntity {
    private int idAction;
    private String description;

    @Id
    @Column(name = "id_action")
    public int getIdAction() {
        return idAction;
    }

    public void setIdAction(int idAction) {
        this.idAction = idAction;
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
        ActionsEntity that = (ActionsEntity) o;
        return idAction == that.idAction &&
                Objects.equals(description, that.description);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idAction, description);
    }
}
