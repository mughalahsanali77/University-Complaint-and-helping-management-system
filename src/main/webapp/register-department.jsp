<%-- 
    Document   : register-department
    Created on : Jan 12, 2023, 2:02:33 PM
    Author     : Ahsan
--%>

<%@page import="java.util.List"%>
<%@page import="com.mycompany.ucms.entities.Faculty"%>
<%@page import="com.mycompany.ucms.helper.FactoryProvider"%>
<%@page import="com.mycompany.ucms.dao.FacultyDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Department</title>
        <%@include file="Components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="Components/navbar.jsp" %>
        <%@include file="Components/message.jsp" %>

        <%            FacultyDao faculty = new FacultyDao(FactoryProvider.getSessionFactory());
            List<Faculty> list = faculty.getFaculties();

        %>

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3"></div>

                <div class=" col-md-6">
                    <div class="card">
                        <div class="card-header  mt-3 custom-bg text-white text-center">
                            <h3>Register Department</h3>
                        </div>

                        <div class="card-body">


                            <form action="RegisterDepartmentServlet" method="post">

                                <div class="form-group">
                                    <select name="facultyId" class="form-control"  >

                                        <%                                        for (Faculty f : list) {
                                        %>
                                        <option value="<%=f.getFacultyId()%>"  ><%=f.getFacultyName()%></option>
                                        <%
                                            }
                                        %>

                                    </select>

                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="enter department title" name="name" required/>
                                </div>
                                <div class="form-group">
                                    <textarea style="height:  250px" class="form-control" placeholder="eneter deparment detail" name="detail" required></textarea>

                                </div>
                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Add Department</button>
                                    <button class="btn btn-outline-primary"><a href="admin.jsp" >Back</a></button>

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
