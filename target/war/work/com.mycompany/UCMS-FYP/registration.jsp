<%-- 
    Document   : registration
    Created on : Jan 12, 2023, 12:53:36 PM
    Author     : Ahsan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <%@include file="Components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="Components/navbar.jsp" %>
        <%@include file="Components/message.jsp" %>
        
        <div class="container">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <div class="card mt-2">
                        <div class="card-header custom-bg text-white">
                            <h1>Registration</h1>
                        </div>
                        <div class="card-body">
                            <form action="RegistrationServlet" method="post">
                                 <div class="form-group">
                                     
                                <select name="role" class="form-control" >


                                    <option value="null">--->Select Your Role<---</option>
                                    <option value="teacher">Teacher</option>
                                    <option value="student">Student</option>
                                    

                                </select>
                            </div>   
                                
                            </form>
                                
                            
                        </div>
                        
                    </div>
                    
                    
                </div>
                <div class="col-md-3"></div>
                
            </div>
        </div>
        
        
        
    </body>
</html>
