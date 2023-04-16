/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.ucms.servlet;

import com.mycompany.ucms.dao.EmployeeDao;
import com.mycompany.ucms.dao.StudentDao;
import com.mycompany.ucms.entities.Employee;
import com.mycompany.ucms.entities.Student;
import com.mycompany.ucms.entities.User;
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
public class UpdateEmployee extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
          
            
                       HttpSession session=request.getSession();
            User u=(User)session.getAttribute("curent-user");
            Employee s= u.getEmployee();
           
           String name=request.getParameter("name");
           String cnic=request.getParameter("cnic");
           String contact=request.getParameter("contact");
           String email=request.getParameter("email");
           String address=request.getParameter("addres");
           
           
          
           out.println(name);
           out.println(cnic);
           out.println(contact);
           out.println(email);
           out.println(address);
          s.setEmployeeAddress(address);
          s.setEmployeeCnic(cnic);
          s.setEmployeeName(name);
          s.setEmployeeContact(contact);
          s.setEmployeeEmail(email);
          
            EmployeeDao eDao=new EmployeeDao(FactoryProvider.getSessionFactory());
          boolean f=eDao.updateEmployee(s);
          
          
          if(f){
            
                session.setAttribute("message","Profile Updated Successfuly");
                response.sendRedirect("teacher_dashboard.jsp");
                return;
              
            }else{
                session.setAttribute("message","Something went wrong!! please try again");
                 response.sendRedirect("teacher_dashboard.jsp");
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
