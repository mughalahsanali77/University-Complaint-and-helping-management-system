/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.ucms.servlet;

import com.mycompany.ucms.dao.UserDao;
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
public class ChangePasswordServlet extends HttpServlet {

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

            String oldPassword = request.getParameter("old_password");
            String newPassword = request.getParameter("new_password");
            String confirmNewPassword = request.getParameter("confirm_new_password");

            HttpSession session = request.getSession();
            User u = (User) session.getAttribute("current-user");

            if (u.getUserPassword().equals(oldPassword)) {

                if (newPassword.equals(confirmNewPassword)) {

                    u.setUserPassword(newPassword);
                    UserDao uDao = new UserDao(FactoryProvider.getSessionFactory());
                    boolean f = uDao.updateUser(u);
                    if (f) {
                        session.setAttribute("message", "Password Changed Successfully");
                        if (u.getRole().getRoleId() == 1) {
               
                            response.sendRedirect("admin.jsp");
                            return;
                        } else if (u.getRole().getRoleId() == 2) {
                            response.sendRedirect("teacher_dashboard.jsp");
                            return;
                        } else if (u.getRole().getRoleId() == 3) {
                            response.sendRedirect("student_dashboard.jsp");
                            return;
                        }

                    }
                }else if(!newPassword.equals(confirmNewPassword)){
                
                    session.setAttribute("message", "New Password and confirm Password not matched");
                        if (u.getRole().getRoleId() == 1) {
               
                            response.sendRedirect("admin.jsp");
                            return;
                        } else if (u.getRole().getRoleId() == 2) {
                            response.sendRedirect("teacher_dashboard.jsp");
                            return;
                        } else if (u.getRole().getRoleId() == 3) {
                            response.sendRedirect("student_dashboard.jsp");
                            return;
                        }
                }

            } else {

                if (u.getRole().getRoleId() == 1) {
                    session.setAttribute("message", "Old Password Not Matched");
                    response.sendRedirect("admin.jsp");
                } else if (u.getRole().getRoleId() == 2) {
                    session.setAttribute("message", "Old Password Not Matched");
                    response.sendRedirect("teacher_dashboard.jsp");
                } else if (u.getRole().getRoleId() == 3) {
                    session.setAttribute("message", "Old Password Not Matched");
                    response.sendRedirect("student_dashboard.jsp");
                }

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
