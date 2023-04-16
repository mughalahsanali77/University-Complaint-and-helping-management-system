package com.mycompany.ucms.dao;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import org.hibernate.SessionFactory;
import org.hibernate.Session;
import com.mycompany.ucms.entities.User;
import java.util.List;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
/**
 *
 * @author Ahsan
 */
public class UserDao {
    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    
    public User  getUserByEmailAndPaasword(String email,String password){
        User user =null;
    
        try {
            String query="FROM User WHERE userName =: e AND userPassword =: p";
            Session session= this.factory.openSession();
            Query  q=session.createQuery(query);
            q.setParameter("e", email);
            q.setParameter("p",password);
            
            user=(User) q.uniqueResult();
                        
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return user;
    }
    
    
    
    public User getUserByEmail(String email){
    User user =null;
    
        try {
            String query="FROM User WHERE userName =: e";
            Session session= this.factory.openSession();
            Query  q=session.createQuery(query);
            q.setParameter("e", email);
           
            
            user=(User) q.uniqueResult();
                        
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return user;
    }
    
     public User getUserStudentById(String Id){
         User user =null;
    
        try {
            String query="FROM User WHERE student.studentRollNumber =: e";
            Session session= this.factory.openSession();
            Query  q=session.createQuery(query);
            q.setParameter("e", Id);
           
            
            user=(User) q.uniqueResult();
                        
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return user;
    }
    
     
     
     
     public User getUserEmployeeById(String Id){
         User user =null;
    
        try {
            String query="FROM User WHERE  employee.employeeCode =: e";
            Session session= this.factory.openSession();
            Query  q=session.createQuery(query);
            q.setParameter("e", Id);
           
            
            user=(User) q.uniqueResult();
                        
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return user;
    }
    
    
    public int saveUser(User user){
        
        Session s=this.factory.openSession();
        Transaction t=s.beginTransaction();
        
        int userId=(int)s.save(user);
        
        t.commit();
        s.close();
    
        return userId;
    }
    
    public boolean updateUser(User user){
    
        boolean f=false;
        
        try {
            Session s=this.factory.openSession();
            Transaction t=s.beginTransaction();
            s.update(user);
            t.commit();
            s.close();
            f=true;
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    
    }
    
    public List<User> getAllUsers(){
    
        List<User> list=null;
        
        try {
            Session session=this.factory.openSession();
            Query query=session.createQuery("From User");
            list=query.list();
            
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    
        return list;
    
    }
    
    
    
}
