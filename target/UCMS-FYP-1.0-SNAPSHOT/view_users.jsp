<%-- 
    Document   : view_users
    Created on : Jan 19, 2023, 11:33:37 PM
    Author     : Ahsan
--%>

<%@page import="com.mycompany.ucms.helper.FactoryProvider"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.ucms.dao.UserDao"%>
<%@page import="com.mycompany.ucms.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in,Login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getRole().getRole().equals("student")) {
            session.setAttribute("message", "only Admin can access this page");
            response.sendRedirect("student_dashboard.jsp");
            return;
        }else if(user.getRole().getRole().equals("teacher")){
             session.setAttribute("message", "only Admin can access this page");
            response.sendRedirect("teacher_dashboard.jsp");
            return;
        
        
        }
    }

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Users</title>
        <%@include file="Components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="Components/navbar.jsp" %>
        <%@include file="Components/message.jsp" %>
        
        
        <div class="container-fluid">
            
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <div class="card mt-3">
                        <div class="card-header  custom-bg text-center text-white">
                            <h1>All Users</h1>
                        </div>
                        
                        <div class="card-body">
                            <table class="table table-striped table-dark">
                                <thead>
                                    <tr>
                                         <th scope="col">#</th>
                                         <th scope="col">User Email</th>
                                         <th scope="col">User Role</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                    <%
                                        UserDao uDao=new UserDao(FactoryProvider.getSessionFactory());
                                        List<User> usersList=uDao.getAllUsers();
                                        for(User u :usersList){

                                    %>
                                    <tr>
                                        <th scope="row"> <%= u.getUserId() %> </th>
                                        <td><%= u.getUserName() %></td>
                                        <td><%= u.getRole().getRole() %></td>
                                        <td></td>
                                        
                                    </tr>
                                    
                                    <%}%>
                                </tbody>
                                
                                
                            </table>
                            
                            
                        </div>
                        
                    </div>
                    
                    
                </div>
                <div class="col-md-1"></div>
                
            </div>
            
            
            
        </div>
        
        
    </body>
</html>
