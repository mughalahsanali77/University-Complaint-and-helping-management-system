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
     ComplaintDao cdao=new ComplaintDao(FactoryProvider.getSessionFactory());
                                          
                                          
int id=user.getEmployee().getEmployeeId();
List<Complaint> Pcomplains=cdao.getStatusedComplaintsByEmpId(id, "pending");
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
                            <h1><%=user.getEmployee().getEmployeeName() %> All Complaints</h1>
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
                                         <th scope="col" colspan="2" >status</th>
                                     
                                    </tr>
                                </thead>
                                <tbody>
                                      <%
                                          
                                     
                                          List<Complaint> complains=cdao.getAllComplaintsByEmployeeId(id);
                                          int i=1;
                                          for(Complaint c :complains){
                                           if(!c.getComplaintStatus().equals("new")){

                                    %>
                                    <tr>
                                        <th scope="row"> <%= i %> </th>
                                        <td><%= c.getComplaintNo()  %></td>
                                        <td><%= c.getComplaintDate()  %></td>
                                        <td><%= c.getComplaintType() %></td>
                                        <td><a href="#" data-toggle="modal" data-target="#detail-<%=c.getComplaintId() %>">view details</a></td>
                                        <td><%= c.getComplaintDate() %></td>
                                        <td><%= c.getComplaintStatus() %></td>
                                       
                                        
                                    </tr>
                                    
                                    <% i++;}}%>
                                   
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
            for(Complaint cc :complains){
        %>
        <div class="modal fade" id="detail-<%=cc.getComplaintId() %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center text-white custom-bg">
        <h5 class="modal-title" id="exampleModalLabel">Compaint Detal of <%=cc.getComplaintNo() %></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="form-group">
              
              <p type="text" class="form-control" >Student : <%= cc.getStudent().getStudentName() %></p>
              
          </div>
              <div class="form-group">
              
              <p type="text" class="form-control" >Roll No : <%= cc.getStudent().getStudentRollNumber() %></p>
              
          </div>
              
           <div class="form-group">  
              <p type="text" class="form-control" >Complaint No : <%= cc.getComplaintNo() %></p>
          </div>
          <div class="form-group">  
              <p type="text" class="form-control" >Subject : <%= cc.getSubject().getSubjectName() %></p>
          </div>
          
          <div class="form-group">  
              <p type="text" class="form-control" >Teacher : <%= cc.getEmployee().getEmployeeName() %></p>
          </div>
          
          <div class="form-group">  
              <p type="text" class="form-control" >Semester : <%= cc.getSubject().getSemester() %></p>
          </div>
          <div class=" form-group ">
              <p  class="form-control" >Description : <%= cc.getComplaintDiscription() %></p>
          
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
