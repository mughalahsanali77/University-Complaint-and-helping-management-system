/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.ucms.servlet;

import com.mycompany.ucms.dao.DepartmentDao;
import com.mycompany.ucms.dao.StudentDao;
import com.mycompany.ucms.entities.Department;
import com.mycompany.ucms.entities.Student;
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
public class EditStudentServlet extends HttpServlet {

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
            int studentId=Integer.parseInt(request.getParameter("id"));
            int dptId=Integer.parseInt(request.getParameter("dptarmentId"));
            
            String studentName = request.getParameter("name");
            String studentFatherName = request.getParameter("fname");
            String studentGender = request.getParameter("gender");
            String studentCnic = request.getParameter("cnic");
            String studentContact = request.getParameter("contact-no");
            String studentEmail = request.getParameter("email");
            
            String studentRoll = request.getParameter("roll");
            
            
            
             DepartmentDao dDao=new DepartmentDao(FactoryProvider.getSessionFactory());
            Department dpt=dDao.getDepartmentById(dptId);
            
            StudentDao sDao=new StudentDao(FactoryProvider.getSessionFactory());
            
           
            Student student=sDao.getStudentById(studentId);
            student.setDepartment(dpt);
            student.setStdentEmail(studentEmail);
           
            student.setStudentCnic(studentCnic);
            student.setStudentContactNo(studentContact);
            student.setStudentFatherName(studentFatherName);
            student.setStudentGender(studentGender);
            student.setStudentName(studentName);
            student.setStudentRollNumber(studentRoll);
            
            boolean f=sDao.updateStudent(student);
              HttpSession session = request.getSession();
            if (f) {

                session.setAttribute("message", student.getStudentName() + " updated Successfully");
                response.sendRedirect("view_students.jsp");
            } else {
                session.setAttribute("message", student.getStudentName() + " unabled to update");
                response.sendRedirect("view_srudents.jsp");
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
