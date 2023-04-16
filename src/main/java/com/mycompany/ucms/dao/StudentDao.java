/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.ucms.dao;

import com.mycompany.ucms.entities.Student;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
/**
 *
 * @author Ahsan
 */
public class StudentDao {
    
    private SessionFactory factory;

    public StudentDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public int saveStudent(Student student){
    
        int studentId=-1;
        try {
            Session session=this.factory.openSession();
            Transaction tx=session.beginTransaction();
            
           studentId=(int) session.save(student);
            
            tx.commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return studentId;
    }
    
    
    public List<Student> getStudents(){
    
        Session session=this.factory.openSession();
        Query query=session.createQuery("From Student");
        List<Student> list=query.list();
        
        session.close();
    
         return list;
    }
    public Student getStudentById(int studentId){
        
        Student student=null;
        try {
            Session session=this.factory.openSession();
            student=session.get(Student.class ,studentId);
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    return student;
    }
    
    
    public boolean deleteStudent(int sid){
        Student student=getStudentById(sid);
        boolean f=false;
        
        try {
            Session session=this.factory.openSession();
            Transaction tx=session.beginTransaction();
            
            session.delete(student);
            
            tx.commit();
            session.close();
                    
            
            f=true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    
    }
    
    public boolean updateStudent(Student student){
    
        boolean f=false;
        try {
            Session session=this.factory.openSession();
            Transaction tx=session.beginTransaction();
            
            session.update(student);
            
            tx.commit();
            session.close();
            
            f=true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    
    
    }
    
    
    public Student getStudentByEmail(String email){
       
          Student student=null;
           try {
               Session session=this.factory.openSession();
               Query query=session.createQuery("FROM Student WHERE stdentEmail=:email");
               query.setParameter("email", email);
               student=(Student)query.uniqueResult();
               
               session.close();
           } catch (Exception e) {
               e.printStackTrace();
           }
       
           return student;
       }
        
         public Student getStudentByRoll(String roll){
       
          Student student=null;
           try {
               Session session=this.factory.openSession();
               Query query=session.createQuery("FROM Student WHERE studentRollNumber=:r");
               query.setParameter("r", roll);
               student=(Student)query.uniqueResult();
               
               session.close();
           } catch (Exception e) {
               e.printStackTrace();
           }
       
           return student;
       }
}
