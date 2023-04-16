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
public class Student {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int StudentId;
    @Column(name = "student_name")
    private String studentName;
    @Column(name = "student_father_name")
    private String studentFatherName;
    @Column(name = "student_cnic", unique = true)
    private String studentCnic;
    @Column(name = "student_contact_no")
    private String studentContactNo;
    @Column(unique = true, name = "student_email")
    private String stdentEmail;
    @Column(name = "student_gender")
    private String studentGender;
    @Column(unique = true, name = "student_roll_number")
    private String studentRollNumber;
    @ManyToOne
    private Department department;
    @OneToMany(mappedBy = "student")
    private List<Subject> subjects = new ArrayList<>();

    @OneToMany(mappedBy = "student")
    private List<Complaint> list = new ArrayList<>();

    @ManyToOne
    private Role role;
    
    @OneToOne
    private User user;
    

    public Student() {
    }

    public Student(int StudentId, String studentName, String studentFatherName, String studentCnic, String studentContactNo, String stdentEmail, String studentGender, String studentRollNumber, Department department) {
        this.StudentId = StudentId;
        this.studentName = studentName;
        this.studentFatherName = studentFatherName;
        this.studentCnic = studentCnic;
        this.studentContactNo = studentContactNo;
        this.stdentEmail = stdentEmail;
        this.studentGender = studentGender;
        this.studentRollNumber = studentRollNumber;
        this.department = department;

    }

    public Student(String studentName, String studentFatherName, String studentCnic, String studentContactNo, String stdentEmail, String studentGender, String studentRollNumber, Department department) {
        this.studentName = studentName;
        this.studentFatherName = studentFatherName;
        this.studentCnic = studentCnic;
        this.studentContactNo = studentContactNo;
        this.stdentEmail = stdentEmail;
        this.studentGender = studentGender;
        this.studentRollNumber = studentRollNumber;
        this.department = department;
    }

    public Student(int StudentId, String studentName, String studentFatherName, String studentCnic, String studentContactNo, String stdentEmail, String studentGender, String studentRollNumber, Department department, Role role) {
        this.StudentId = StudentId;
        this.studentName = studentName;
        this.studentFatherName = studentFatherName;
        this.studentCnic = studentCnic;
        this.studentContactNo = studentContactNo;
        this.stdentEmail = stdentEmail;
        this.studentGender = studentGender;
        this.studentRollNumber = studentRollNumber;
        this.department = department;
        this.role = role;
    }
    
    

    public int getStudentId() {
        return StudentId;
    }

    public void setStudentId(int StudentId) {
        this.StudentId = StudentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getStudentFatherName() {
        return studentFatherName;
    }

    public void setStudentFatherName(String studentFatherName) {
        this.studentFatherName = studentFatherName;
    }

    public String getStudentCnic() {
        return studentCnic;
    }

    public void setStudentCnic(String studentCnic) {
        this.studentCnic = studentCnic;
    }

    public String getStudentContactNo() {
        return studentContactNo;
    }

    public void setStudentContactNo(String studentContactNo) {
        this.studentContactNo = studentContactNo;
    }

    public String getStdentEmail() {
        return stdentEmail;
    }

    public void setStdentEmail(String stdentEmail) {
        this.stdentEmail = stdentEmail;
    }

    public String getStudentGender() {
        return studentGender;
    }

    public void setStudentGender(String studentGender) {
        this.studentGender = studentGender;
    }

    public String getStudentRollNumber() {
        return studentRollNumber;
    }

    public void setStudentRollNumber(String studentRollNumber) {
        this.studentRollNumber = studentRollNumber;
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
        return "Student{" + "StudentId=" + StudentId + ", studentName=" + studentName + ", studentFatherName=" + studentFatherName + ", studentCnic=" + studentCnic + ", studentContactNo=" + studentContactNo + ", stdentEmail=" + stdentEmail + ", studentGender=" + studentGender + ", studentRollNumber=" + studentRollNumber + ", department=" + department + ", subjects=" + subjects + ", list=" + list + ", role=" + role + ", user=" + user + '}';
    }

   

    
}
