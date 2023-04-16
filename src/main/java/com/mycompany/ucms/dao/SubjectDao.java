/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.ucms.dao;

import com.mycompany.ucms.entities.Student;
import com.mycompany.ucms.entities.Subject;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author Ahsan
 */
public class SubjectDao {
    
    private SessionFactory factory;

    public SubjectDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public int addSubject(Subject subject){
    int subjectId=-1;
        try {
                Session session=this.factory.openSession();
                Transaction tx=session.beginTransaction();
                
              subjectId=(int)  session.save(subject);
                
                tx.commit();
                session.close();
                
        } catch (Exception e) {
            e.printStackTrace();
        }
    
        return subjectId;
    }
    
    public List<Subject> getSubjects(){
        List<Subject> list=null;
        try {
            Session session=this.factory.openSession();
            
            Query query=session.createQuery("FROM Subject");
            list=query.list();
            
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    return list;
    }
    
    public Subject getSubjectById(int sid){
    
        Subject subject=null;
        
    
        try {
            Session session=this.factory.openSession();
            
            subject=session.get(Subject.class, sid);
            
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    
    
        return subject;
    }
    
    public boolean deleteSubject(int sid){
        boolean f=false;
        Subject subject=getSubjectById(sid);
        if(subject!=null){
            
            try {
                Session session=this.factory.openSession();
                Transaction tx=session.beginTransaction();
                
                session.delete(subject);
                
                tx.commit();
                session.close();
                f=true;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    
        return f;
    }
    
       public boolean updateSubject(Subject subject){
    
        boolean f=false;
        try {
            Session session=this.factory.openSession();
            Transaction tx=session.beginTransaction();
            
            session.update(subject);
            
            tx.commit();
            session.close();
            
            f=true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    
    
    }
    
       public List<Subject> getSubjectsByDepartment(int dptId){
    
        List<Subject> list=null;
        try {
            Session session=this.factory.openSession();
            Query query=session.createQuery("FROM Subject WHERE department.deparmentId=:dptId");
            query.setParameter("dptId", dptId);
            list=query.list();      
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    
    
    
        return list;
    }
       
       
   
    
}
