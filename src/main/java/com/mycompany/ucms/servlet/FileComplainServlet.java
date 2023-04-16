/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.ucms.servlet;

import com.mycompany.ucms.dao.ComplaintDao;
import com.mycompany.ucms.dao.DepartmentDao;
import com.mycompany.ucms.dao.EmployeeDao;
import com.mycompany.ucms.dao.FacultyDao;
import com.mycompany.ucms.dao.StudentDao;
import com.mycompany.ucms.dao.SubjectDao;
import com.mycompany.ucms.dao.UserDao;
import com.mycompany.ucms.entities.Complaint;
import com.mycompany.ucms.entities.Department;
import com.mycompany.ucms.entities.Employee;
import com.mycompany.ucms.entities.Faculty;
import com.mycompany.ucms.entities.Student;
import com.mycompany.ucms.entities.Subject;
import com.mycompany.ucms.entities.User;
import com.mycompany.ucms.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ahsan
 */
public class FileComplainServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           int fac=Integer.parseInt(request.getParameter("faculty"));
           int dpt=Integer.parseInt(request.getParameter("department"));
           int tech=Integer.parseInt(request.getParameter("teacher"));
           int sub=Integer.parseInt(request.getParameter("subject"));
           String complainType=request.getParameter("complain-type");
           String complainDetail=request.getParameter("detail");
           
            FacultyDao fDao = new FacultyDao(FactoryProvider.getSessionFactory());   
            DepartmentDao dDao = new DepartmentDao(FactoryProvider.getSessionFactory());    
            EmployeeDao eDao = new EmployeeDao(FactoryProvider.getSessionFactory());    
            SubjectDao subDao = new SubjectDao(FactoryProvider.getSessionFactory()); 
            ComplaintDao cDao = new ComplaintDao(FactoryProvider.getSessionFactory()); 
          
            Faculty faculty=fDao.getFacultyById(fac);
            Department department=dDao.getDepartmentById(dpt);
            Employee employee=eDao.getEmployeeById(tech);
            Subject subject=subDao.getSubjectById(sub);
            
            HttpSession session=request.getSession();
            User studentUser=(User)session.getAttribute("current-user");
            Student student= studentUser.getStudent();
            
            int comNo=cDao.getAllComplaints().size()+1;

            Complaint c=new Complaint();
            c.setComplaintDate(new Date());
            c.setComplaintDiscription(complainDetail);
            c.setComplaintNo("UCMS-"+comNo);
            c.setComplaintStatus("new");
            c.setComplaintType(complainType);
            c.setDepartment(department);
            c.setEmployee(employee);
            c.setFaculty(faculty);
            c.setStudent(student);
            c.setSubject(subject);
            
            int cid=cDao.saveComplaint(c);
            if(cid>0){
                session.setAttribute("message", "Your Complain Has Been Filed Against Complain No = "+c.getComplaintNo());
                response.sendRedirect("student_dashboard.jsp");
                return;
            }else{
                session.setAttribute("message", "Something went wrong in filing complain please try again");
                response.sendRedirect("student_dashboard.jsp");
                return;
            }

           
        
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
