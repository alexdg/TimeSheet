package com.cligest.db;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "timesheet_devices", schema = "timesheet", catalog = "")
public class TimesheetDevicesEntity {
    private int idDevice;
    private int idLocation;
    private String description;

    @Id
    @Column(name = "id_device")
    public int getIdDevice() {
        return idDevice;
    }

    public void setIdDevice(int idDevice) {
        this.idDevice = idDevice;
    }

    @Basic
    @Column(name = "id_location")
    public int getIdLocation() {
        return idLocation;
    }

    public void setIdLocation(int idLocation) {
        this.idLocation = idLocation;
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
        TimesheetDevicesEntity that = (TimesheetDevicesEntity) o;
        return idDevice == that.idDevice &&
                idLocation == that.idLocation &&
                Objects.equals(description, that.description);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idDevice, idLocation, description);
    }
}
