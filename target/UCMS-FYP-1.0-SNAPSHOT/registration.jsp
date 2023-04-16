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
        <%--<%@include file="Components/navbar.jsp" %>--%>
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
                            <form action="UserRegistrationServlet" method="post">
                                <div class="form-group">
                                    <labe for="role">Select Your Role</labe> 
                                    <select name="role" class="form-control" required >


                                        <option value="">--->Select Your Role<---</option>
                                        <option value="2">Teacher</option>
                                        <option value="3">Student</option>


                                    </select>
                                </div> 



                                <div class="form-group">
                                    <label for="email">Enter Your Email</label>
                                    <input type="email" name="email" class="form-control" placeholder="enter your email ehich is given to university"/>
                                </div>

                                <div class="form-group">
                                    <label for="id">Enter Your Id</label>
                                    <input type="text"  name="id" class="form-control" placeholder="enter your university registered id"/>
                                </div>

                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" name="password" class="form-control" placeholder="enter password"/>
                                </div>

                                <div class="container text-center ">
                                    <button type="submit" class="btn btn-outline-success">Register</button>
                                    <button type="reset" class="btn btn-outline-warning">Reset</button>
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
