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
public class Department {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int departmentId;
    @Column(name="department_name",length=100)
    private String departmentName;
    @Column(name="department_description",length=100)
    private String deparmentDescription;
    @ManyToOne
    private Faculty faculty; 
    @OneToMany(mappedBy = "department")
   private List<Student> student=new ArrayList<>();
    
    @OneToMany(mappedBy ="depart")
    private List<Subject> subjects=new ArrayList<>();
    
     @OneToMany(mappedBy = "department")
    private List<Complaint> list=new ArrayList<>();

    public Department() {
    }

    public Department(String departmentName, String deparmentDescription, Faculty faculty) {
        this.departmentName = departmentName;
        this.deparmentDescription = deparmentDescription;
        this.faculty = faculty;
    }

    public Department(int departmentId, String departmentName, String deparmentDescription, List<Student> student) {
        this.departmentId = departmentId;
        this.departmentName = departmentName;
        this.deparmentDescription = deparmentDescription;
        this.student=student;
    }

    public Department(String departmentName, String deparmentDescription, List<Student> student) {
        this.departmentName = departmentName;
        this.deparmentDescription = deparmentDescription;
       this.student=student;
    }

    public int getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(int departmentId) {
        this.departmentId = departmentId;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getDeparmentDescription() {
        return deparmentDescription;
    }

    public void setDeparmentDescription(String deparmentDescription) {
        this.deparmentDescription = deparmentDescription;
    }

    public Faculty getFaculty() {
        return faculty;
    }

    public void setFaculty(Faculty faculty) {
        this.faculty = faculty;
    }

    public List<Student> getStudent() {
        return student;
    }

    public void setStudent(List<Student> student) {
        this.student = student;
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
    

    @Override
    public String toString() {
        return "Department{" + "departmentId=" + departmentId + ", departmentName=" + departmentName + ", deparmentDescription=" + deparmentDescription + ", faculty=" + faculty + ", student=" + student + ", subjects=" + subjects + '}';
    }
    

   

   

 
  
    

   
    
    
}
