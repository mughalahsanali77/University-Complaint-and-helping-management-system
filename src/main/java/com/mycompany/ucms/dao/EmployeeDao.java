/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.ucms.dao;

import com.mycompany.ucms.entities.Employee;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author Ahsan
 */
public class EmployeeDao {
    
    private SessionFactory factory;

    public EmployeeDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public int saveEmployee(Employee employee){
    
        int empId=-1;
        try {
            Session session=this.factory.openSession();
            Transaction tx=session.beginTransaction();
            
            empId=(int)session.save(employee);
                    
            tx.commit();
            session.close();
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return empId;
    
    }
    
    public List<Employee> getEmployees(){
    
        Session session=this.factory.openSession();
        Query query=session.createQuery("From Employee");
        List<Employee> list=query.list();
        session.close();
        
        return list;
                
    }
    
    
    public Employee getEmployeeById(int empId){
    
        Employee emp=null;
        try {
            Session session=this.factory.openSession();
            
            emp=session.get(Employee.class, empId);
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return emp;
    
    }
    
    public boolean deleteEmployee(int empId){
    
        boolean f=false;
        Employee employee=getEmployeeById(empId);
        try {
            Session session=this.factory.openSession();
            Transaction tx=session.beginTransaction();
            
            session.delete(employee);
            
            tx.commit();
            session.close();
            f=true;
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    
        return f;
    }
    
    public boolean updateEmployee(Employee employee){
        
        boolean f=false;
        try {
            Session session=this.factory.openSession();
            Transaction tx=session.beginTransaction();
            
            session.update(employee);
            
            tx.commit();
            session.close();
            
            f=true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    
    
        return f;
    
    }
    
    
    public Employee getEmployeeByEmail(String email){
    
        Employee emp=null;
        try {
            Session session =this.factory.openSession();
            Query q=session.createQuery("From Employee Where employeeEmail=:email");
            q.setParameter("email", email);
            emp=(Employee)q.uniqueResult();
            
            
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    
        return emp;
    }
    
      public Employee getEmployeeByEmpCode(String empCode){
    
        Employee emp=null;
        try {
            Session session =this.factory.openSession();
            Query q=session.createQuery("From Employee Where employeeCode=:empCode");
            q.setParameter("empCode", empCode);
            emp=(Employee)q.uniqueResult();
            
            
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    
        return emp;
    }
    
}
