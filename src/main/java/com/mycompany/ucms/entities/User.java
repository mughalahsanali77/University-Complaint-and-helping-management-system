/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.ucms.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

/**
 *
 * @author Ahsan
 */
@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
   private int userId;
    private String userName;
    private String userPassword;
    @OneToOne
    private Student student;
    @OneToOne
    private Employee employee;
    @ManyToOne
    private Role role;

    public User() {
    }

    public User(int userId, String userName, String userPassword, Student student, Employee employee, Role role) {
        this.userId = userId;
        this.userName = userName;
        this.userPassword = userPassword;
        this.student = student;
        this.employee = employee;
        this.role = role;
    }

    public User(String userName, String userPassword, Student student, Employee employee, Role role) {
        this.userName = userName;
        this.userPassword = userPassword;
        this.student = student;
        this.employee = employee;
        this.role = role;
    }

    public User(String userName, String userPassword, Student student, Role role) {
        this.userName = userName;
        this.userPassword = userPassword;
        this.student = student;
        this.role = role;
    }

    public User(String userName, String userPassword, Employee employee, Role role) {
        this.userName = userName;
        this.userPassword = userPassword;
        this.employee = employee;
        this.role = role;
    }

   

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", userName=" + userName + ", userPassword=" + userPassword + ", student=" + student + ", employee=" + employee + ", role=" + role + '}';
    }

  

  
}
