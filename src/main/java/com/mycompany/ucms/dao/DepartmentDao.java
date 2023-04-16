/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.ucms.dao;

import com.mycompany.ucms.entities.Department;
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
public class DepartmentDao {
    private SessionFactory factory;

    public DepartmentDao(SessionFactory factory) {
        this.factory = factory;
    }
      public int saveDepartment(Department department){
       
      int  departmentId=-1;
      try{
           Session session=this.factory.openSession();
           Transaction tx=session.beginTransaction();
           
           departmentId=(int)session.save(department);
           
           tx.commit();
           session.close();
      }catch(Exception e){
          e.printStackTrace();;
      }
   
       return departmentId;
   }
      
      public List<Department> getDepartments(){
       Session session=this.factory.openSession();
       Query query=session.createQuery("from Department");
       List<Department> list=query.list();
       return list;
      
      }
      
      public Department getDepartmentById(int dptId){
      
          Department dpt=null;
          try {
              Session session=this.factory.openSession();
              dpt=session.get(Department.class, dptId);
              session.close();
                      
          } catch (Exception e) {
              e.printStackTrace();
          }
      return dpt;
      
      }
      
      
      public boolean deleteDeparment(int dptId){
          boolean f=false;
           Department dpt= getDepartmentById(dptId);
          try {
              Session session=this.factory.openSession();
              Transaction tx=session.beginTransaction();
              
              session.delete(dpt);
              
              tx.commit();
              session.close();
              
              f=true;
          } catch (Exception e) {
              e.printStackTrace();
          }
      
      return f;
      }
      
      public boolean updateDepartment(Department dpt){
          boolean f=false;
          try {
              Session session=this.factory.openSession();
              Transaction tx=session.beginTransaction();
              
              session.update(dpt);
              
              tx.commit();
              session.close();
              f=true;
          } catch (Exception e) {
              e.printStackTrace();
          }
      
      return f;
      }
      
      public List<Department> getDepartmentsByFacultyId(int facId){
            List<Department> list=null;
        try {
            Session session=this.factory.openSession();
            Query query=session.createQuery("FROM Department WHERE faculty.facultyId=:facId");
            query.setParameter("facId", facId);
            list=query.list();      
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
      
            return list;
      
      }
    
}
