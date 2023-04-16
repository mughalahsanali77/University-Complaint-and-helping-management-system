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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Ahsan
 */
@Entity
public class Complaint {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int complaintId;
    @Column(length = 1000)
    private String complaintDiscription;
    private String complaintNo;
    private String complaintStatus;
    private String complaintType;
    @Temporal(value = TemporalType.DATE)
    private Date complaintDate;
    @Temporal(value = TemporalType.DATE)
    private Date resolveDate;
    @ManyToOne
    private Faculty faculty;
    @ManyToOne
    private Department department;
    @ManyToOne
    private Employee employee;
    @ManyToOne
    private Student student;
    @ManyToOne
    private Subject subject;
    
   

    public Complaint() {
    }

    public Complaint(int complaintId, String complaintDiscription, String complaintNo, String complaintStatus, String complaintType, Date complaintDate, Date resolveDate, Faculty faculty, Department department, Employee employee, Student student, Subject subject) {
        this.complaintId = complaintId;
        this.complaintDiscription = complaintDiscription;
        this.complaintNo = complaintNo;
        this.complaintStatus = complaintStatus;
        this.complaintType = complaintType;
        this.complaintDate = complaintDate;
        this.resolveDate = resolveDate;
        this.faculty = faculty;
        this.department = department;
        this.employee = employee;
        this.student = student;
        this.subject = subject;
    }

    public Complaint(String complaintDiscription, String complaintNo, String complaintStatus, String complaintType, Date complaintDate, Date resolveDate, Faculty faculty, Department department, Employee employee, Student student, Subject subject) {
        this.complaintDiscription = complaintDiscription;
        this.complaintNo = complaintNo;
        this.complaintStatus = complaintStatus;
        this.complaintType = complaintType;
        this.complaintDate = complaintDate;
        this.resolveDate = resolveDate;
        this.faculty = faculty;
        this.department = department;
        this.employee = employee;
        this.student = student;
        this.subject = subject;
    }

    public int getComplaintId() {
        return complaintId;
    }

    public void setComplaintId(int complaintId) {
        this.complaintId = complaintId;
    }

    public String getComplaintDiscription() {
        return complaintDiscription;
    }

    public void setComplaintDiscription(String complaintDiscription) {
        this.complaintDiscription = complaintDiscription;
    }

    public String getComplaintNo() {
        return complaintNo;
    }

    public void setComplaintNo(String complaintNo) {
        this.complaintNo = complaintNo;
    }

    public String getComplaintStatus() {
        return complaintStatus;
    }

    public void setComplaintStatus(String complaintStatus) {
        this.complaintStatus = complaintStatus;
    }

    public String getComplaintType() {
        return complaintType;
    }

    public void setComplaintType(String complaintType) {
        this.complaintType = complaintType;
    }

    public Date getComplaintDate() {
        return complaintDate;
    }

    public void setComplaintDate(Date complaintDate) {
        this.complaintDate = complaintDate;
    }

    public Date getResolveDate() {
        return resolveDate;
    }

    public void setResolveDate(Date resolveDate) {
        this.resolveDate = resolveDate;
    }

    public Faculty getFaculty() {
        return faculty;
    }

    public void setFaculty(Faculty faculty) {
        this.faculty = faculty;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    @Override
    public String toString() {
        return "Complaint{" + "complaintId=" + complaintId + ", complaintDiscription=" + complaintDiscription + ", complaintNo=" + complaintNo + ", complaintStatus=" + complaintStatus + ", complaintType=" + complaintType + ", complaintDate=" + complaintDate + ", resolveDate=" + resolveDate + ", faculty=" + faculty + ", department=" + department + ", employee=" + employee + ", student=" + student + ", subject=" + subject + '}';
    }
    
    
    
    
    

}
