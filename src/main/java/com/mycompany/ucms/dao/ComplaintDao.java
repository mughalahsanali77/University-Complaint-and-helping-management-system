/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.ucms.dao;

import com.mycompany.ucms.entities.Complaint;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author Ahsan
 */
public class ComplaintDao {

    private SessionFactory factory;

    public ComplaintDao(SessionFactory factory) {
        this.factory = factory;
    }

    public int saveComplaint(Complaint complain) {
        int cId = -404;

        try {
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();

            cId = (int) session.save(complain);

            tx.commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return cId;
    }

    public Complaint getComplaintById(int cid) {
        Complaint complaint = null;

        try {
            Session session = this.factory.openSession();

            complaint = session.get(Complaint.class, cid);

            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return complaint;

    }

    public List<Complaint> getAllComplaints() {
        List<Complaint> list = null;

        try {
            Session session = this.factory.openSession();
            Query query = session.createQuery("From Complaint");
            list = query.list();
            session.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Complaint> getAllComplaintsByFacultyId(int facId) {
        List<Complaint> list = null;

        try {
            Session session = this.factory.openSession();
            Query query = session.createQuery("From Complaint WHERE faculty.facultyId=:facId");
            query.setParameter("facId", facId);
            list = query.list();
            session.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Complaint> getAllComplaintsByDepartmentId(int dptId) {
        List<Complaint> list = null;

        try {
            Session session = this.factory.openSession();
            Query query = session.createQuery("From Complaint WHERE department.departmentId=:dptId");
            query.setParameter("dptId", dptId);
            list = query.list();
            session.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Complaint> getAllComplaintsByEmployeeId(int id) {

        Session session = this.factory.getCurrentSession();
        Transaction tx = session.beginTransaction();
        
        Query query = session.createQuery("From Complaint WHERE employee.employeeId=:id");
        query.setParameter("id", id);
          List<Complaint> complaints = query.getResultList();
        tx.commit();
        session.close();
        return complaints;
    }

    public List<Complaint> getAllComplaintsByStudentId(int studentId) {
        Session session = this.factory.getCurrentSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createQuery("FROM Complaint WHERE student.StudentId = :studentId");
        query.setParameter("studentId", studentId);

        List<Complaint> complaints = query.getResultList();
        tx.commit();
        session.close();
        return complaints;

    }

    public List<Complaint> getStatusedComplaintsByStudentId(int studentId, String status) {
        Session session = this.factory.getCurrentSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createQuery("FROM Complaint WHERE student.StudentId = :studentId AND complaintStatus = :status");
        query.setParameter("studentId", studentId);
        query.setParameter("status", status);
        List<Complaint> complaints = query.getResultList();
        tx.commit();
        session.close();
        return complaints;
    }
  public List<Complaint> getStatusedComplaintsByEmpId(int emp, String status) {
        Session session = this.factory.getCurrentSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createQuery("FROM Complaint WHERE employee.employeeId = :emp AND complaintStatus = :status");
        query.setParameter("emp",emp);
        query.setParameter("status", status);
        List<Complaint> complaints = query.getResultList();
        tx.commit();
        session.close();
        return complaints;
    }
    public List<Complaint> getComplaintsByStatus(String status) {

        Session session = this.factory.getCurrentSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createQuery("From Complaint WHERE complaintStatus=:status");
        query.setParameter("status", status);
        List<Complaint> list = query.list();
        tx.commit();
        session.close();

        return list;
    }

    public boolean updateComplaint(Complaint complaint) {
        boolean f = false;

        try {
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();

            session.update(complaint);

            tx.commit();
            session.close();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public boolean deleteComplaint(int cid) {

        boolean f = false;
        Complaint com = getComplaintById(cid);
        if (com != null) {

            try {
                Session session = this.factory.openSession();
                Transaction tx = session.beginTransaction();

                session.delete(com);

                tx.commit();
                session.close();

                f = true;
            } catch (Exception e) {
                e.printStackTrace();
            }

        }

        return f;

    }

}
