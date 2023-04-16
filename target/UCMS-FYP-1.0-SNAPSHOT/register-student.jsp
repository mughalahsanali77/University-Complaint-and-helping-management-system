<%-- 
    Document   : register-student
    Created on : Jan 12, 2023, 8:41:43 PM
    Author     : Ahsan
--%>

<%@page import="com.mycompany.ucms.entities.Department"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.ucms.helper.FactoryProvider"%>
<%@page import="com.mycompany.ucms.dao.DepartmentDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Student Page</title>
        <%@include file="Components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="Components/navbar.jsp" %>
        <%@include file="Components/message.jsp" %>
        
        <div class="container">
            <div class="row">
                <div class="col-md-3"></div>
                
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <h3>Register Student</h3>
                        </div>
                        
                        <div class="card-body">
                             <form action="RegisterStudentServlet" method="post">

                              <div class="form-group">
                                <select name="dptarmentId" class="form-control"  >

                                    <%
                                        DepartmentDao dDao = new DepartmentDao(FactoryProvider.getSessionFactory());
                                        List<Department> listDpt = dDao.getDepartments();

                                        for (Department dpt : listDpt) {
                                    %>
                                    <option value="<%=dpt.getDepartmentId()%>"><%=dpt.getDepartmentName()%></option>
                                    <%
                                        }
                                    %>

                                </select>

                            </div>

                            <div class="form-group">
                                <input type="text" class="form-control " placeholder="enter student name" name="name" required/>
                            </div>

                            <div class="form-group">
                                <input type="text" class="form-control " placeholder="enter student`s father name" name="fname" required/>
                            </div>

                            <div class="form-group">
                                <select name="gender" class="form-control " >
                                    <option value="null">--->Select<---</option>
                                    <option value="male">Male</option>
                                    <option value="female">Female</option>
                                    <option value="other">Other</option>

                                </select>
                            </div>

                            <div class="form-group">
                                <input type="text" class="form-control " placeholder="enter student`s cnic" name="cnic" required/>
                            </div>

                            <div class="form-group">
                                <input type="text" class="form-control " placeholder="enter student`s contact no" name="contact-no" required/>
                            </div>

                            <div class="form-group">
                                <input type="text" class="form-control " placeholder="enter student`s email" name="email" required/>
                            </div>

                            <div class="form-group">
                                <input type="text" class="form-control " placeholder="enter student`s batch" name="batch" required/>
                            </div>

                            <div class="form-group">
                                <input type="text" class="form-control " placeholder="enter student`s roll no" name="roll" required/>
                            </div>



                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Student</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

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
