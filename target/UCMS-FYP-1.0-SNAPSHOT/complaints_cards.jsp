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

    ComplaintDao cDao=new ComplaintDao(FactoryProvider.getSessionFactory());
    List<Complaint> allComplaints=cDao.getAllComplaints();
    List<Complaint> pending=cDao.getComplaintsByStatus("underprocess");
    List<Complaint> newC=cDao.getComplaintsByStatus("new");
    List<Complaint> reject=cDao.getComplaintsByStatus("rejected");
    List<Complaint> resolve=cDao.getComplaintsByStatus("resolved");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All types Complaints</title>
   <%@include file="Components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include  file="Components/navbar.jsp" %>
        <%@include file="Components/message.jsp" %>
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
                            <h1 class="text-muted text-uppercase"><a href="view_complaints.jsp">All Complains</a></h1>
                        </div>
                    </div>
                    
                </div>
                
                
                
                <!--new compaints-->
                <div class="col md-4">
                    
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img src="img/complaint (2).png" alt="facultiesIcon" class="img-fluid " style="max-width: 125px">
                            </div>
                            <h1><%= newC.size() %></h1>
                            <h1 class="text-muted text-uppercase"><a href="view_all_new_complaint.jsp">New Complains</a></h1>
                        </div>
                    </div>
                    
                </div>
                
                <!--pending complains-->
                <div class="col md-4">
                    
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img src="img/time-management.png " alt="facultiesIcon" class="img-fluid " style="max-width: 125px">
                            </div>
                            <h1><%= pending.size() %></h1>
                            <h1 class="text-muted text-uppercase"><a href="view_all_pending_complaint.jsp">Pending Complains</a></h1>
                        </div>
                    </div>
                    
                </div>
                
                
            </div>
            
            <!--first row end-->
            
            <div class="row mt-2">
                <!--under process-->
                
                 <div class="col md-6">
                    
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img src="img/process.png " alt="facultiesIcon" class="img-fluid " style="max-width: 125px">
                            </div>
                            <h1><%= reject.size() %></h1>
                            <h1 class="text-muted text-uppercase"><a href="view_all_underprocess_complaints.jsp">Underproces</a></h1>
                        </div>
                    </div>
                    
                </div>
                
                
                
                
                
                
                <!--rejected complains-->
                <div class="col md-6">
                    
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img src="img/cross.png " alt="facultiesIcon" class="img-fluid " style="max-width: 125px">
                            </div>
                            <h1><%= reject.size() %></h1>
                            <h1 class="text-muted text-uppercase"><a href="view_all_rejected_complaint.jsp">Rejected Complains</a></h1>
                        </div>
                    </div>
                    
                </div>
                
                <!--resolved complains-->
                <div class="col md-6">
                    
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img src="img/check-mark.png " alt="facultiesIcon" class="img-fluid " style="max-width: 125px">
                            </div>
                            <h1><%= resolve.size() %></h1>
                            <h1 class="text-muted text-uppercase"><a href="view_all_resolved_complaint.jsp">Resolved Complains</a></h1>
                        </div>
                    </div>
                    
                </div>
                
                
            </div>
            
            <!--second row end-->
            
            
        </div>
        
        
        
        
        
    </body>
</html>
