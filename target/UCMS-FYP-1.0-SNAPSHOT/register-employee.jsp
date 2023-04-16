<%-- 
    Document   : register-employee
    Created on : Jan 12, 2023, 4:37:38 PM
    Author     : Ahsan
--%>

<%@page import="java.util.List"%>
<%@page import="com.mycompany.ucms.dao.DepartmentDao"%>
<%@page import="com.mycompany.ucms.helper.FactoryProvider"%>
<%@page import="com.mycompany.ucms.dao.FacultyDao"%>
<%@page import="com.mycompany.ucms.entities.Department"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Employee</title>
        <%@include file="Components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="Components/navbar.jsp" %>
        <%@include file="Components/message.jsp" %>




        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3 custom-bg "></div>

                <div class=" col-md-6">
                    <div class="card">
                        <div class="card-header  mt-3 custom-bg text-white text-center">
                            <h3>Register Employee</h3>
                        </div>

                        <div class="card-body">


                            <form action="RegisterEmployeeServlet" method="post">

                                <div class="form-group">
                                    <select name="dptarmentId" class="form-control"  >

                                        <%                                        DepartmentDao dDao = new DepartmentDao(FactoryProvider.getSessionFactory());
                                            List<Department> list = dDao.getDepartments();

                                            for (Department dpt : list) {
                                        %>
                                        <option value="<%=dpt.getDepartmentId()%>"  ><%=dpt.getDepartmentName()%></option>
                                        <%
                                            }
                                        %>

                                    </select>

                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="enter employee name" name="name" required/>
                                </div>


                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="enter employee`s cnic" name="cnic" required/>
                                </div>

                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="enter employee`s contact no" name="contact-no" required/>
                                </div>

                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="enter employee`s email" name="email" required/>
                                </div>


                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="enter employee`s code" name="code" required/>
                                </div>

                                <div class="form-group">
                                    <select name="gender" class="form-control" >

                                        <option value="male">Male</option>
                                        <option value="female">Female</option>
                                        <option value="other">Other</option>

                                    </select>
                                </div>   


                                <div class="form-group">
                                    <textarea style="height:  150px" class="form-control" placeholder="eneter employee`s address detail" name="address" required></textarea>

                                </div>
                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Add Employee</button>
                                    <button class="btn btn-outline-primary"><a href="admin.jsp" >Back</a></button>

                                </div>
                            </form>
                        </div>
                    </div>

                </div>
                <div class="col-md-3 custom-bg "></div>
            </div>
        </div>
    </body>
</html>
