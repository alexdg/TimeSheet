package com.cligest.db;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "employees", schema = "timesheet", catalog = "")
public class EmployeesEntity {
    private int idEmployee;
    private String employeeName;
    private String sapCcName;
    private String ws;

    @Id
    @Column(name = "id_employee")
    public int getIdEmployee() {
        return idEmployee;
    }

    public void setIdEmployee(int idEmployee) {
        this.idEmployee = idEmployee;
    }

    @Basic
    @Column(name = "employee_name")
    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    @Basic
    @Column(name = "SAP_CC_Name")
    public String getSapCcName() {
        return sapCcName;
    }

    public void setSapCcName(String sapCcName) {
        this.sapCcName = sapCcName;
    }

    @Basic
    @Column(name = "WS")
    public String getWs() {
        return ws;
    }

    public void setWs(String ws) {
        this.ws = ws;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        EmployeesEntity that = (EmployeesEntity) o;
        return idEmployee == that.idEmployee &&
                Objects.equals(employeeName, that.employeeName) &&
                Objects.equals(sapCcName, that.sapCcName) &&
                Objects.equals(ws, that.ws);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idEmployee, employeeName, sapCcName, ws);
    }
}
