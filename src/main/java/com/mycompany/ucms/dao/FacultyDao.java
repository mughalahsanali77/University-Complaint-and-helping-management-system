/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.ucms.dao;

import com.mycompany.ucms.entities.Faculty;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author Ahsan
 */
public class FacultyDao {
    private  SessionFactory factory;

    public FacultyDao(SessionFactory factory) {
        this.factory = factory;
    }

   public int saveFaculty(Faculty faculty){
       
      
           Session session=this.factory.openSession();
           Transaction tx=session.beginTransaction();
           
          int  facultyId=(int)session.save(faculty);
           
           tx.commit();
           session.close();
      
   
       return facultyId;
   }
   public List<Faculty> getFaculties(){
   
        Session session=this.factory.openSession();
        
           Query query=session.createQuery("From Faculty");
           
           List<Faculty> list=query.list();
           return list;
   
   }
   
   public Faculty getFacultyById(int facultyId){
   
       
       Faculty faculty=null;
       try {
           Session session=this.factory.openSession();
           faculty=session.get(Faculty.class, facultyId);
           session.close();
                   
                   
       } catch (Exception e) {
           e.printStackTrace();
       }
          
    return faculty;
   }
   
   
   public void deleteFaculty(int facultyId){
       Faculty faculty= getFacultyById(facultyId);
       try {
           Session session=this.factory.openSession();
           Transaction tx=session.beginTransaction();
           
           session.delete(faculty);
           
           tx.commit();
           session.close();
           
       } catch (Exception e) {
           e.printStackTrace();
       }
   
   
   }
   
   
   public boolean updateFaculty(Faculty faculty){
       boolean f=false;
       try {
           Session session=this.factory.openSession();
           Transaction tx=session.beginTransaction();
           
           session.update(faculty);
           
           tx.commit();
           session.close();
           f=true;
                   
       } catch (Exception e) {
           e.printStackTrace();
       }
       return f;
   }
   
   
}
