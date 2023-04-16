/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.ucms.servlet;

import com.mycompany.ucms.dao.DepartmentDao;
import com.mycompany.ucms.dao.FacultyDao;
import com.mycompany.ucms.entities.Department;
import com.mycompany.ucms.entities.Faculty;
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
public class RegisterDepartmentServlet extends HttpServlet {

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
            
            String dptName=request.getParameter("name");
            String dptDetail=request.getParameter("detail");
            int facId=Integer.parseInt(request.getParameter("facultyId"));
            
            out.println("<h1>"+dptName+"<br>");
            out.println(dptDetail+"</h1><br>");
             out.println("<h1>Hello</h1>");
             
             
             FacultyDao facultyDao=new FacultyDao(FactoryProvider.getSessionFactory());
            Faculty faculty=facultyDao.getFacultyById(facId);
            
            Department dpt=new Department(dptName, dptDetail, faculty);
            
            
            DepartmentDao dptDao =new DepartmentDao(FactoryProvider.getSessionFactory());
            
           int dptId=(int) dptDao.saveDepartment(dpt);
            HttpSession session=request.getSession();
            
           if(dptId>0){
            session.setAttribute("message", "Department Added Successfully name="+dptName+" and Id Assigned = "+dptId);
            response.sendRedirect("view_departments.jsp");
           }
           else{
             session.setAttribute("message", "Departmeny not Added");
            response.sendRedirect("view_departments.jsp");
           
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
