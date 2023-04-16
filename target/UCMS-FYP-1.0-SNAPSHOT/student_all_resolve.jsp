<%-- 
    Document   : student_all_complains
    Created on : Jan 20, 2023, 9:18:45 PM
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
    ComplaintDao cdao=new ComplaintDao(FactoryProvider.getSessionFactory());
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Compalins</title>
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
                            <h1><%=user.getStudent().getStudentName() %>  Resolved Complaints</h1>
                        </div>
                        
                        <div class="card-body">
                            <table class="table table-striped table-dark">
                                <thead>
                                    <tr>
                                         <th scope="col">#</th>
                                         <th scope="col">Complaint No</th>
                                         <th scope="col">Complaint Date</th>
                                         <th scope="col">Type</th>
                                         <th scope="col">Detail</th>
                                         <th scope="col">Date</th>
                                         <th scope="col">Assigned to </th>
                                         <th scope="col">Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                      <%
                                          int i=1;
                                          List<Complaint> complains=cdao.getStatusedComplaintsByStudentId(sid,"resolved");
                                       for(Complaint c :complains){

                                    %>
                                    <tr>
                                        <th scope="row"> <%= i %> </th>
                                        <td><%= c.getComplaintNo()  %></td>
                                        <td><%= c.getComplaintDate()  %></td>
                                        <td><%= c.getComplaintType() %></td>
                                        <td><a href="#" data-toggle="modal" data-target="#detail-<%=c.getComplaintId() %>">view details</a></td>
                                        <td><%= c.getComplaintDate() %></td>
                                        <td><%=c.getEmployee().getEmployeeName() %></td>
                                        <td><button type="button" class="btn btn-success"> <%=c.getComplaintStatus() %> on <%=c.getResolveDate() %></button></td>
                                       
                                    </tr>
                                    
                                    <% i++;}%>
                                   
                                </tbody>
                                
                                
                            </table>
                            
                            
                        </div>
                        
                    </div>
                    
                    
                </div>
                <div class="col-md-1"></div>
                
            </div>
            
            
            
        </div>
        
        <!--view detail modal satrt-->
        
        <!-- Modal -->
        <%
            for(Complaint c :complains){
        %>
        <div class="modal fade" id="detail-<%=c.getComplaintId() %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center text-white custom-bg">
        <h5 class="modal-title" id="exampleModalLabel">Compaint Detal of <%=c.getComplaintNo() %></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="form-group">
              
              <p type="text" class="form-control" >Student : <%= c.getStudent().getStudentName() %></p>
              
          </div>
              
           <div class="form-group">  
              <p type="text" class="form-control" >Complaint No : <%= c.getComplaintNo() %></p>
          </div>
          <div class="form-group">  
              <p type="text" class="form-control" >Subject : <%= c.getSubject().getSubjectName() %></p>
          </div>
          
          <div class="form-group">  
              <p type="text" class="form-control" >Teacher : <%= c.getEmployee().getEmployeeName() %></p>
          </div>
          
          <div class="form-group">  
              <p type="text" class="form-control" >Semester : <%= c.getSubject().getSemester() %></p>
          </div>
          <div class=" form-group ">
              <p  class="form-control" >Description : <%= c.getComplaintDiscription() %></p>
          
          </div>
          
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>
        <%}%>
        
        <!--view detail modalend -->
        
        
        
    </body>
</html>
