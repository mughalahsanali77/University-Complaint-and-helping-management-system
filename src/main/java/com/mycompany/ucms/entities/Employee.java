/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.ucms.entities;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Ahsan
 */
@Entity
public class Employee {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "employee_id")
    private int employeeId;
    @Column(name = "employee_name", length = 50)
    private String employeeName;
    @Column(name = "employee_contact", length = 12, unique = true)
    private String employeeContact;
    @Column(name = "employee_cnic", length = 16, unique = true)
    private String employeeCnic;
    @Column(name = "employee_email", length = 50, unique = true)
    private String employeeEmail;
    @Column(name = "employee_gender", length = 50)
    private String employeeGender;
    @Column(name = "employee_address")
    private String employeeAddress;
    @Column(name = "employee_code", length = 50)
    private String employeeCode;

    @OneToMany(mappedBy = "employee")
    private List<Subject> subjects = new ArrayList<>();
    @ManyToOne
    private Department department;

    @OneToMany(mappedBy = "employee")
    private List<Complaint> list = new ArrayList<>();
    @ManyToOne
    private Role role;
    @OneToOne
    private User user;

    public Employee() {

    }

    public Employee(int employeeId, String employeeName, String employeeContact, String employeeCnic, String employeeEmail, String employeeGender, String employeeAddress, String employeeCode, Department department) {
        this.subjects = new ArrayList<>();
        this.employeeId = employeeId;
        this.employeeName = employeeName;
        this.employeeContact = employeeContact;
        this.employeeCnic = employeeCnic;
        this.employeeEmail = employeeEmail;
        this.employeeGender = employeeGender;
        this.employeeAddress = employeeAddress;
        this.employeeCode = employeeCode;

        this.department = department;
    }

    public Employee(String employeeName, String employeeContact, String employeeCnic, String employeeEmail, String employeeGender, String employeeAddress, String employeeCode, Department department) {
        this.subjects = new ArrayList<>();
        this.employeeName = employeeName;
        this.employeeContact = employeeContact;
        this.employeeCnic = employeeCnic;
        this.employeeEmail = employeeEmail;
        this.employeeGender = employeeGender;
        this.employeeAddress = employeeAddress;
        this.employeeCode = employeeCode;

        this.department = department;
    }

    public Employee(int employeeId, String employeeName, String employeeContact, String employeeCnic, String employeeEmail, String employeeGender, String employeeAddress, String employeeCode, Department department, Role role) {
        this.employeeId = employeeId;
        this.employeeName = employeeName;
        this.employeeContact = employeeContact;
        this.employeeCnic = employeeCnic;
        this.employeeEmail = employeeEmail;
        this.employeeGender = employeeGender;
        this.employeeAddress = employeeAddress;
        this.employeeCode = employeeCode;
        this.department = department;
        this.role = role;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public String getEmployeeContact() {
        return employeeContact;
    }

    public void setEmployeeContact(String employeeContact) {
        this.employeeContact = employeeContact;
    }

    public String getEmployeeCnic() {
        return employeeCnic;
    }

    public void setEmployeeCnic(String employeeCnic) {
        this.employeeCnic = employeeCnic;
    }

    public String getEmployeeEmail() {
        return employeeEmail;
    }

    public void setEmployeeEmail(String employeeEmail) {
        this.employeeEmail = employeeEmail;
    }

    public String getEmployeeGender() {
        return employeeGender;
    }

    public void setEmployeeGender(String employeeGender) {
        this.employeeGender = employeeGender;
    }

    public String getEmployeeAddress() {
        return employeeAddress;
    }

    public void setEmployeeAddress(String employeeAddress) {
        this.employeeAddress = employeeAddress;
    }

    public String getEmployeeCode() {
        return employeeCode;
    }

    public void setEmployeeCode(String employeeCode) {
        this.employeeCode = employeeCode;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public List<Subject> getSubjects() {
        return subjects;
    }

    public void setSubjects(List<Subject> subjects) {
        this.subjects = subjects;
    }

    public List<Complaint> getList() {
        return list;
    }

    public void setList(List<Complaint> list) {
        this.list = list;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Employee{" + "employeeId=" + employeeId + ", employeeName=" + employeeName + ", employeeContact=" + employeeContact + ", employeeCnic=" + employeeCnic + ", employeeEmail=" + employeeEmail + ", employeeGender=" + employeeGender + ", employeeAddress=" + employeeAddress + ", employeeCode=" + employeeCode + ", subjects=" + subjects + ", department=" + department + ", list=" + list + ", role=" + role + ", user=" + user + '}';
    }

   

}
