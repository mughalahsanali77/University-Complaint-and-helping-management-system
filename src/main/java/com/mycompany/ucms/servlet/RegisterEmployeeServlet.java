/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.ucms.servlet;

import com.mycompany.ucms.dao.DepartmentDao;
import com.mycompany.ucms.dao.EmployeeDao;
import com.mycompany.ucms.dao.RoleDao;
import com.mycompany.ucms.entities.Department;
import com.mycompany.ucms.entities.Employee;
import com.mycompany.ucms.entities.Role;
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
public class RegisterEmployeeServlet extends HttpServlet {

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
         String employeeName =request.getParameter("name");
         String employeeContact =request.getParameter("contact-no");
         String employeeEmail =request.getParameter("email");
         String employeeCnic =request.getParameter("cnic");
         String employeeGender =request.getParameter("gender");
         String employeeCode =request.getParameter("code");
         String employeeAddress =request.getParameter("address");
         int dptId=Integer.parseInt(request.getParameter("dptarmentId"));
         
            
            DepartmentDao dDao=new DepartmentDao(FactoryProvider.getSessionFactory());
            Department dpt=dDao.getDepartmentById(dptId);
            RoleDao rDao=new RoleDao(FactoryProvider.getSessionFactory());
            Role role=rDao.getRoleById(2);
            
            Employee emp=new Employee(employeeName, employeeContact, employeeCnic, employeeEmail, employeeGender, employeeAddress, employeeCode, dpt);
            emp.setRole(role);
            EmployeeDao eDao=new EmployeeDao(FactoryProvider.getSessionFactory());
            int empId= eDao.saveEmployee(emp);
            
            HttpSession session=request.getSession();
            if(empId>0){
            
                session.setAttribute("message","Employee Save SuucessFully Employee Name = "+emp.getEmployeeName()+" and id="+empId);
                response.sendRedirect("view-employees.jsp");
              
            }else{
                session.setAttribute("message","Something went wrong!! please try again");
                response.sendRedirect("view-employees.jsp");
            
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
