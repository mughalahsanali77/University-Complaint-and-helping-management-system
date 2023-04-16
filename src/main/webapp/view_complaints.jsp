<%-- 
    Document   : view_complaints
    Created on : Jan 19, 2023, 12:10:33 PM 
    Author     : Ahsan
--%>

<%@page import="com.mycompany.ucms.entities.Complaint"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.ucms.helper.FactoryProvider"%>
<%@page import="com.mycompany.ucms.dao.ComplaintDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaints</title>
     <%@include file="Components/common_css_js.jsp" %>
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
                            <h1>All Complaints</h1>
                        </div>
                        
                        <div class="card-body">
                            <table class="table table-striped table-dark">
                                <thead>
                                    <tr>
                                         <th scope="col">#</th>
                                         <th scope="col">Date</th>
                                         <th scope="col">Type</th>
                                          <th scope="col">Discription</th>
                                          <th scope="col">Status</th>
                                         <th scope="col">Student Name</th>
                                         
                                         <th scope="col">Roll nO</th>
                                         <th scope="col">Department</th>
                                       
                                         
                                         
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                    <%
                                        ComplaintDao cDao=new ComplaintDao(FactoryProvider.getSessionFactory());
                                        List<Complaint> complaintsList=cDao.getAllComplaints();
                                        for(Complaint c :complaintsList){

                                    %>
                                    <tr>
                                        <td><%=c.getComplaintId()%></td>
                                        <td><%= c.getComplaintDate() %></td>
                                        <td><%= c.getComplaintType() %></td>
                                         <td><a href="#" data-toggle="modal" data-target="#detail-<%=c.getComplaintId() %>">view details</a></td>                                  
                                        <td><button type="button" class="btn btn-warning"><%=c.getComplaintStatus()%></button></td>
                                  
                                         <td><%= c.getStudent().getStudentName() %></td>
                                        <td><%= c.getStudent().getStudentRollNumber() %></td>
                                        <td><%= c.getDepartment().getDepartmentName() %></td>
                               
                                   
                                    
                                    <%}%>
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
            for(Complaint c :complaintsList){
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
