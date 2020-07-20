package com.cligest.db;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "locations", schema = "timesheet", catalog = "")
public class LocationsEntity {
    private int idLocation;
    private String address;
    private String place;

    @Id
    @Column(name = "id_location")
    public int getIdLocation() {
        return idLocation;
    }

    public void setIdLocation(int idLocation) {
        this.idLocation = idLocation;
    }

    @Basic
    @Column(name = "address")
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Basic
    @Column(name = "place")
    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        LocationsEntity that = (LocationsEntity) o;
        return idLocation == that.idLocation &&
                Objects.equals(address, that.address) &&
                Objects.equals(place, that.place);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idLocation, address, place);
    }
}
