/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.ucms.entities;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

/**
 *
 * @author Ahsan
 */
@Entity
public class Subject {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY )
    private int subjectId;
    private String courseNo;
    private String subjectName;
    private int semester;
    
    @ManyToOne
    private Department depart;
    @ManyToOne
    private Employee employee;
    @ManyToOne
    private Student student;
     @OneToMany(mappedBy = "subject")
    private List<Complaint> list=new ArrayList<>();

    public Subject() {
    }

    public Subject(int subjectId, String courseNo, String subjectName, int semester, Department depart, Employee employee, Student student) {
        this.subjectId = subjectId;
        this.courseNo = courseNo;
        this.subjectName = subjectName;
        this.semester = semester;
        this.depart = depart;
        this.employee = employee;
        this.student = student;
    }

    public Subject(String courseNo, String subjectName, int semester, Department depart, Employee employee, Student student) {
        this.courseNo = courseNo;
        this.subjectName = subjectName;
        this.semester = semester;
        this.depart = depart;
        this.employee = employee;
        this.student = student;
    }

    public Subject(String courseNo, String subjectName, int semester, Department depart, Employee employee) {
        this.courseNo = courseNo;
        this.subjectName = subjectName;
        this.semester = semester;
        this.depart = depart;
        this.employee = employee;
    }
    

    public int getSemester() {
        return semester;
    }

    public void setSemester(int semester) {
        this.semester = semester;
    }

    public Department getDepart() {
        return depart;
    }

    public void setDepart(Department depart) {
        this.depart = depart;
    }

   
    public int getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(int subjectId) {
        this.subjectId = subjectId;
    }

    public String getCourseNo() {
        return courseNo;
    }

    public void setCourseNo(String courseNo) {
        this.courseNo = courseNo;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public Department getDepartment() {
        return depart;
    }

    public void setDepartment(Department department) {
        this.depart = department;
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

    public List<Complaint> getList() {
        return list;
    }

    public void setList(List<Complaint> list) {
        this.list = list;
    }
    
    

    @Override
    public String toString() {
        return "Subject{" + "subjectId=" + subjectId + ", courseNo=" + courseNo + ", subjectName=" + subjectName + ", department=" + depart + ", employee=" + employee + ", student=" + student + '}';
    }
    
    
    
}
