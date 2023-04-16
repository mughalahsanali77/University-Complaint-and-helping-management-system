<%-- 
    Document   : teacher_dashboard
    Created on : Jan 19, 2023, 8:06:16 PM
    Author     : Ahsan
--%>

<%@page import="com.mycompany.ucms.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in,Login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getRole().getRole().equals("student")) {
            session.setAttribute("message", "only Teacher can access this page");
            response.sendRedirect("student_dashboard.jsp");
            return;
        }else if(user.getRole().getRole().equals("admin")){
             session.setAttribute("message", "only Teacher can access this page");
            response.sendRedirect("admin.jsp");
            return;
        
        
        }
    }
    
    int id=user.getEmployee().getEmployeeId();
     ComplaintDao cdao=new ComplaintDao(FactoryProvider.getSessionFactory());
                                          
                                          List<Complaint> resolved=cdao.getStatusedComplaintsByEmpId(id, "resolved");
                                          List<Complaint> rejected=cdao.getStatusedComplaintsByEmpId(id, "rejected");
                                          List<Complaint> underprocess=cdao.getStatusedComplaintsByEmpId(id, "inderprocess");

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Teacher Dashboard</title>
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
                                <img src="img/complaint (2).png" alt="facultiesIcon" class="img-fluid " style="max-width: 125px">
                            </div>
                            <h1></h1>
                            <h1 class="text-muted text-uppercase"><a href="teacher_all_complains.jsp">All Complains</a></h1>
                        </div>
                    </div>
                    
                </div>
                
                <!--pending complains-->
                <div class="col md-4">
                    
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img src="img/complaint (2).png" alt="facultiesIcon" class="img-fluid " style="max-width: 125px">
                            </div>
                            <h1></h1>
                            <h1 class="text-muted text-uppercase"><a href="teacher_all_new.jsp">New Complains</a></h1>
                        </div>
                    </div>
                    
                </div>
                
                 <div class="col md-4">
                    
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img src="img/complaint (2).png" alt="facultiesIcon" class="img-fluid " style="max-width: 125px">
                            </div>
                            <h1></h1>
                            <h1 class="text-muted text-uppercase"><a href="teacher_all_pending.jsp">UnderProcess</a></h1>
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
                            <h1></h1>
                            <h1 class="text-muted text-uppercase"><a href="teacher_all_rejected.jsp">Rejected Complains</a></h1>
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
                            <h1></h1>
                            <h1 class="text-muted text-uppercase"><a href="teacher_all_resolved.jsp">Resolved Complains</a></h1>
                        </div>
                    </div>
                    
                </div>
                
                
            </div>
            
            <!--second row end-->
            
            
        </div>
        
        
    </body>
</html>
