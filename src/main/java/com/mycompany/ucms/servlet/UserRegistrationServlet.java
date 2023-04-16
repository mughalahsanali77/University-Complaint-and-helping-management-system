/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.ucms.servlet;

import com.mycompany.ucms.dao.EmployeeDao;
import com.mycompany.ucms.dao.UserDao;
import com.mycompany.ucms.dao.RoleDao;
import com.mycompany.ucms.dao.StudentDao;
import com.mycompany.ucms.entities.Employee;
import com.mycompany.ucms.entities.Role;
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
public class UserRegistrationServlet extends HttpServlet {

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

            String email = request.getParameter("email");
            String id = request.getParameter("id");
            String password = request.getParameter("password");
            int roleId = Integer.parseInt(request.getParameter("role"));
            out.println(email);
            out.println(id);
            out.println(password);
            out.println(roleId);
           

            RoleDao rDao = new RoleDao(FactoryProvider.getSessionFactory());

            Role role = rDao.getRoleById(roleId);
            out.println(role.getRole());
           
           
            EmployeeDao eDao = new EmployeeDao(FactoryProvider.getSessionFactory());
            StudentDao sDao = new StudentDao(FactoryProvider.getSessionFactory());
            UserDao uDao = new UserDao(FactoryProvider.getSessionFactory());
           
            
            HttpSession session = request.getSession();
             User user =uDao.getUserByEmail(email);
            
//            from here user table checkin conditions starts
             if(user!=null){
                    session.setAttribute("message","Entered Email is  Already Registered");
                    response.sendRedirect("login.jsp");
                    return;
                
            }else if(user==null){
                    user=uDao.getUserStudentById(id);
                    if(user!=null){
                        session.setAttribute("message"," Entered Student Id is Already Registered");
                        response.sendRedirect("login.jsp");
                        return;
                       
                    }else if(user==null){
                         user=uDao.getUserEmployeeById(id);
                         if(user!=null){
                        session.setAttribute("message"," Entered Emp Id is Already Registered");
                        response.sendRedirect("login.jsp");
                        return;
                         }
                    }
                
                }   user=null;
//                user table checking contions end
                if (role.getRole().equals("student")) {
                    
              
//                    finding student by email
                Student student = sDao.getStudentByEmail(email);
               
                if (student != null && student.getStudentRollNumber().equals(id)) {
                    user = new User(email, password, student, role);
                    int uid = uDao.saveUser(user);
                    out.println(user.getUserName());
                    session.setAttribute("message", "Student Registered Succesfully");
                    response.sendRedirect("login.jsp");
                    return;

                } else if (student != null && !student.getStudentRollNumber().equals(id)) {
                    out.println(user.getUserName());
                    session.setAttribute("message", student.getStudentName() + " Please Enter Your correct id");
                    response.sendRedirect("registration.jsp");
                    return;
                } 
                
//                end finding student by email
                
                Student roll= sDao.getStudentByRoll(id);
                if(roll!=null && !roll.getStdentEmail().equals(email)){
                    session.setAttribute("message", roll.getStudentName() + " Please Enter Your correct email");
                    response.sendRedirect("registration.jsp");
                    return;       
                
                }else if (student == null && roll == null ) {
                    out.println(user.getUserName());
                    session.setAttribute("message", "Please Provide Appropiate Details");
                    response.sendRedirect("registration.jsp");
                    return;
                }

            } else if (role.getRole().equals("teacher")) {
                Employee emp = eDao.getEmployeeByEmail(email);
                if (emp != null && emp.getEmployeeCode().equals(id)) {
                    user = new User(email, password, emp, role);
                    int uid = uDao.saveUser(user);
                    out.println(user.getUserName());
                    session.setAttribute("message", "Teacher Registered Succesfully");
                    response.sendRedirect("login.jsp");
                    return;

                } else if (emp != null && !emp.getEmployeeCode().equals(id)) {
                    out.println(user.getUserName());
                    session.setAttribute("message", emp.getEmployeeName() + " Please Enter Your correct id");
                    response.sendRedirect("registration.jsp");
                    return; 
                }else if (emp == null) {
                    out.println(user.getUserName());
                    session.setAttribute("message", "Please Provide Appropiate Details");
                    response.sendRedirect("registration.jsp");
                }
                 

            }else if (user == null) {
                    out.println(user.getUserName());
                    session.setAttribute("message", "Please Provide Appropiate Details");
                    response.sendRedirect("registration.jsp");
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
