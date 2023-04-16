/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.ucms.servlet;

import com.mycompany.ucms.dao.DepartmentDao;
import com.mycompany.ucms.dao.EmployeeDao;
import com.mycompany.ucms.entities.Department;
import com.mycompany.ucms.entities.Employee;
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
public class EditEmployeeServlet extends HttpServlet {

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

            int eid = Integer.parseInt(request.getParameter("id"));
            int dptId = Integer.parseInt(request.getParameter("dptarmentId"));
            String name = request.getParameter("name");
            String cnic = request.getParameter("cnic");
            String contact = request.getParameter("contact-no");
            String email = request.getParameter("email");
            String code = request.getParameter("code");
            String gender = request.getParameter("gender");
            String address = request.getParameter("address");

            DepartmentDao dDao = new DepartmentDao(FactoryProvider.getSessionFactory());
            Department department = dDao.getDepartmentById(dptId);

            EmployeeDao eDao = new EmployeeDao(FactoryProvider.getSessionFactory());
            Employee employee = eDao.getEmployeeById(eid);

            employee.setDepartment(department);
            employee.setEmployeeName(name);
            employee.setEmployeeCnic(cnic);
            employee.setEmployeeCode(code);
            employee.setEmployeeContact(contact);
            employee.setEmployeeEmail(email);
            employee.setEmployeeGender(gender);
            employee.setEmployeeAddress(address);

            boolean f = eDao.updateEmployee(employee);
            HttpSession session = request.getSession();
            if (f) {

                session.setAttribute("message", employee.getEmployeeName() + " updated Successfully");
                response.sendRedirect("view-employees.jsp");
            } else {
                session.setAttribute("message", employee.getEmployeeName() + " unabled to update");
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
