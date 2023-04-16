/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.ucms.servlet;

import com.mycompany.ucms.dao.ComplaintDao;
import com.mycompany.ucms.entities.Complaint;
import com.mycompany.ucms.entities.User;
import com.mycompany.ucms.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ahsan
 */
public class AssignComplainServlet extends HttpServlet {

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
            int cid = Integer.parseInt(request.getParameter("cidd"));
            String FinalStatus=request.getParameter("status");
            out.println(cid);
            ComplaintDao cDao = new ComplaintDao(FactoryProvider.getSessionFactory());

            Complaint com = cDao.getComplaintById(cid);
            if (com.getComplaintStatus().equals("new")) {
                com.setComplaintStatus("pending");
            } else if (com.getComplaintStatus().equals("pending")) {
                com.setComplaintStatus("underprocess");
            }
          

            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("current-user");
            int roleId = user.getRole().getRoleId();

            boolean f = cDao.updateComplaint(com);
            if (roleId == 1) {
                if (f) {
                    session.setAttribute("message", "Complaint has Assigned to " + com.getEmployee().getEmployeeName());
                    response.sendRedirect("view_complaints.jsp");
                    return;
                } else {
                    session.setAttribute("message", "Something went wrong in assigning complain please try again");
                    response.sendRedirect("view_complaints.jsp");
                    return;
                }
            } else if (roleId == 2) {
                if (f) {
                    session.setAttribute("message", "Action as been taken " );
                    response.sendRedirect("teacher_all_complains.jsp");
                    return;
                } else {
                    session.setAttribute("message", "Something went wrong in assigning complain please try again");
                    response.sendRedirect("teacher_all_complains.jsp");
                    return;
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
