/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.ucms.servlet;

import com.mycompany.ucms.dao.DepartmentDao;
import com.mycompany.ucms.dao.EmployeeDao;
import com.mycompany.ucms.dao.SubjectDao;
import com.mycompany.ucms.entities.Department;
import com.mycompany.ucms.entities.Employee;
import com.mycompany.ucms.entities.Subject;
import com.mycompany.ucms.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ahsan
 */
public class EditSubjectServlet extends HttpServlet {

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
            int dpt=Integer.parseInt(request.getParameter("dpt"));
             int teacher=Integer.parseInt(request.getParameter("teacher"));
            int semester=Integer.parseInt(request.getParameter("semester"));
             String course=request.getParameter("course");
             String name=request.getParameter("name");
             
            int subjectId=Integer.parseInt(request.getParameter("subjectId"));
                   
             SubjectDao sDao=new SubjectDao(FactoryProvider.getSessionFactory());
            Subject subject=sDao.getSubjectById(subjectId);
            DepartmentDao dDAO=new DepartmentDao(FactoryProvider.getSessionFactory());
            Department department=dDAO.getDepartmentById(dpt);
            EmployeeDao eDao=new EmployeeDao(FactoryProvider.getSessionFactory());
            Employee employee=eDao.getEmployeeById(teacher);
            
            
            subject.setCourseNo(course);
            subject.setDepart(department);
            subject.setEmployee(employee);
            subject.setSemester(semester);
            subject.setSubjectName(name);
            
           
            boolean f=sDao.updateSubject(subject);
            HttpSession session = request.getSession();
            
             if (f) {

                session.setAttribute("message", subject.getSubjectName()+ " Updated  Successfully");
                response.sendRedirect("view_subjects.jsp");

            } else {
                session.setAttribute("message", "Something went wrong!! please try again");
                response.sendRedirect("view_subjects.jsp");

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
