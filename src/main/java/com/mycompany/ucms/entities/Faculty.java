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
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Ahsan
 */
@Entity
public class Faculty {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int facultyId;
    @Column(length =100,name="faculty_name")
    String facultyName;
     @Column(length =500,name="faculty_description")
    String facultyDescription;
    
    @OneToMany(mappedBy = "faculty")
    private List<Department> departments=new ArrayList<>();
    
     @OneToMany(mappedBy = "faculty")
    private List<Complaint> list=new ArrayList<>();

    public Faculty() {
    }

    public Faculty(int facultyId, String facultyName, String facultyDescription) {
        this.facultyId = facultyId;
        this.facultyName = facultyName;
        this.facultyDescription = facultyDescription;
    }

    public Faculty(String facultyName, String facultyDescription) {
        this.facultyName = facultyName;
        this.facultyDescription = facultyDescription;
    }

    public int getFacultyId() {
        return facultyId;
    }

    public void setFacultyId(int facultyId) {
        this.facultyId = facultyId;
    }

    public String getFacultyName() {
        return facultyName;
    }

    public void setFacultyName(String facultyName) {
        this.facultyName = facultyName;
    }

    public String getFacultyDescription() {
        return facultyDescription;
    }

    public void setFacultyDescription(String facultyDescription) {
        this.facultyDescription = facultyDescription;
    }

    public List<Department> getDepartments() {
        return departments;
    }

    public void setDepartments(List<Department> departments) {
        this.departments = departments;
    }

    public List<Complaint> getList() {
        return list;
    }

    public void setList(List<Complaint> list) {
        this.list = list;
    }

    
    @Override
    public String toString() {
        return "Faculty{" + "facultyId=" + facultyId + ", facultyName=" + facultyName + ", facultyDescription=" + facultyDescription + ", departments=" + departments + '}';
    }
    

    
     
     
     
     
}
