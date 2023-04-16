<%-- 
    Document   : student_dashboard
    Created on : Jan 19, 2023, 8:03:54 PM
    Author     : Ahsan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="com.mycompany.ucms.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in,Login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getRole().getRole().equals("teacher")) {
            session.setAttribute("message", "only Student can access this page");
            response.sendRedirect("teacher_dashboard.jsp");
            return;
        }else if(user.getRole().getRole().equals("admin")){
             session.setAttribute("message", "only Student can access this page");
            response.sendRedirect("admin.jsp");
            return;
        
        
        }
    }
    int sid=user.getStudent().getStudentId();
    ComplaintDao cDao=new ComplaintDao(FactoryProvider.getSessionFactory());
    List<Complaint> allComplaints=cDao.getAllComplaintsByStudentId(sid);
     List<Complaint> newC=cDao.getStatusedComplaintsByStudentId(sid, "new");
     List<Complaint> assign=cDao.getStatusedComplaintsByStudentId(sid, "assigned");
    List<Complaint> pending=cDao.getStatusedComplaintsByStudentId(sid, "pending");
    List<Complaint> underprocess=cDao.getStatusedComplaintsByStudentId(sid, "underprocess");
    List<Complaint> reject=cDao.getStatusedComplaintsByStudentId(sid, "rejected");
    List<Complaint> resolve=cDao.getStatusedComplaintsByStudentId(sid, "resolved");

%>





<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Dashboard</title>
        <%@include file="Components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="Components/navbar.jsp"%>
        <%@include file="Components/message.jsp"%>
        <div class="container-fluid admin">
            <!--first row starts-->
            
            <div class="row mt-2">
                
                <!--all complains-->
                <div class="col md-4">
                    
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img src="img/complaint.png" alt="facultiesIcon" class="img-fluid " style="max-width: 125px">
                            </div>
                            <h1><%= allComplaints.size() %></h1>
                            <h1 class="text-muted text-uppercase"><a href="student_all_complains.jsp">All Complains</a></h1>
                        </div>
                    </div>
                    
                </div>
                            
                 <!--new complains-->
                <div class="col md-4">
                    
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img src="img/complaint.png" alt="facultiesIcon" class="img-fluid " style="max-width: 125px">
                            </div>
                            <h1><%= newC.size() %></h1>
                            <h1 class="text-muted text-uppercase"><a href="student_new_complaints.jsp">New Complains</a></h1>
                        </div>
                    </div>
                    
                </div>
                
                <!--pending complains-->
                <div class="col md-4">
                    
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img src="img/complaint.png" alt="facultiesIcon" class="img-fluid " style="max-width: 125px">
                            </div>
                            <h1><%= pending.size() %></h1>
                            <h1 class="text-muted text-uppercase"><a href="student_pending_complaints.jsp">Pending Complains</a></h1>
                        </div>
                    </div>
                    
                </div>
                
                
            </div>
            
            <!--first row end-->
            
            <div class="row mt-2">
                
                <!--rejected complains-->
                <div class="col md-6">
                    
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img src="img/complaint.png" alt="facultiesIcon" class="img-fluid " style="max-width: 125px">
                            </div>
                            <h1><%= reject.size() %></h1>
                            <h1 class="text-muted text-uppercase"><a href="student_all_reject.jsp">Rejected Complains</a></h1>
                        </div>
                    </div>
                    
                </div>
                
                <!--resolved complains-->
                <div class="col md-6">
                    
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img src="img/complaint.png" alt="facultiesIcon" class="img-fluid " style="max-width: 125px">
                            </div>
                            <h1><%= resolve.size() %></h1>
                            <h1 class="text-muted text-uppercase"><a href="student_all_resolve.jsp">Resolved Complains</a></h1>
                        </div>
                    </div>
                    
                </div>
                
                
            </div>
            
            <!--second row end-->
            
            
        </div>
        
        
    </body>
</html>
