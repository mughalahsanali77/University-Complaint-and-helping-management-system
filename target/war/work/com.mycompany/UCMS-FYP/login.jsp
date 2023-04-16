<%-- 
    Document   : login
    Created on : Jan 4, 2023, 3:13:50 PM
    Author     : Ahsan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login - UCMS</title>
        <%@include file="Components/common_css_js.jsp" %>
    </head>

    <%@include file="Components/navbar.jsp" %>

    <div class="container loginForm ">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card mt-3">
                    <div class="card-header  text-center text-white custom-bg">
                        <h3>Login Here..!!!</h3>
                    </div>
                   
                    <div class="card-body">
                        <%@include file="Components/message.jsp" %>
                        <form action="LoginServlet" method="post">
                            
                            <div class="form-group">
                                
                                <label >Select Your Role</label>
                                <select class="form-control">
                                    <option value="1">Admin</option>
                                    <option value="2">Teacher</option>
                                    <option value="3">Student</option>
                                        
                                    
                                </select>
                                
                                
                            </div>
                            
                            
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input  name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                            </div>
                            <div class="container ">
                                <a href="register.jsp" class="text-center d-block mb-3">if not registered click here...!</a>
                                
                            </div>
                            <div class="container text-center">
                                 <button type="submit" class="btn btn-primary border-0 custom-bg">Submit</button>
                                 <button type="Reset" class="btn btn-primary border-0 custom-bg">Reset</button>
                            </div>
                        </form>

                    </div>
                   

                </div>
            </div>  
        </div>
    </div>


</html>
