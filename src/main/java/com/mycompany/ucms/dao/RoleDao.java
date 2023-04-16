/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.ucms.dao;

import com.mycompany.ucms.entities.Role;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Ahsan
 */
public class RoleDao {
    
    private SessionFactory factory;

    public RoleDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public int saveRole( Role role ){
    
        Session session=this.factory.openSession();
        Transaction tx=session.beginTransaction();
        
        int roleId=(int)session.save(role);
        
        tx.commit();
        session.close();
    
    return roleId;
    }
    
    public Role getRoleById(int id){
        Role role=null;
        
        try {
        
            Session session=this.factory.openSession();
           
           role= session.get(Role.class, id);
            session.close();
                    
            
        } catch (Exception e) {
        }
    
    
        return role;
    }
    
    
    
    
    
    
    
    
}
