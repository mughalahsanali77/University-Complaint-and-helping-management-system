<%-- 
    Document   : view_subjects
    Created on : Jan 16, 2023, 12:08:18 PM
    Author     : Ahsan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subjects</title>
        <%@include file="Components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="Components/navbar.jsp" %>
        <%@include file="Components/message.jsp" %>
        
        <div class="container-fluid">
            
            <div class="card mt-4">
                
                        <ul class="navbar-nav ml-auto mr-2 mt-4 " >

                            <button class="btn btn-sm btn-success " > <i class="fa fa-plus">Add Subjects</i></button>

                        </ul>
                
                <div class="card-header mt-2 custom-bg">
                    <h1 class="text-center text-white">Subjects</h1>
                </div>
                
                <div class="card-body">
                    
                                                <table class="table table-striped table-dark">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Course#</th>
                                        <th scope="col">Semester</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Instructor</th>
                                        <th scope="col">Department</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%                                            StudentDao sDao = new StudentDao(FactoryProvider.getSessionFactory());
                                        List<Student> stdList = sDao.getStudents();
                                        for (Student s : stdList) {

                                    %>
                                    <tr>


                                        <th scope="row"> <%= s.getStudentId()%> </th>
                                        <td> <%= s.getStudentName()%> </td>
                                        <td> <%= s.getStudentFatherName()%> </td>
                                        <td> <%= s.getStudentCnic()%> </td>
                                        <td> <%= s.getStudentContactNo()%> </td>
                                        <td> <%= s.getStdentEmail()%> </td>
                                        <td> <%= s.getStudentGender()%> </td>
                                        <td> <%= s.getStudentRollNumber()%> </td>

                                        <td> <%= s.getDepartment().getDepartmentName()%> </td>


                                        <td>

                                            <button class="btn-sm btn-outline-success" data-toggle="modal" data-target="#editModal-<%=s.getStudentId()%>" ><i class="fa fa-pencil-square-o"></i></button>
                                            <button class="btn-sm btn-outline-success" data-toggle="modal" data-target="#deleteModal-<%=s.getStudentId()%>"><i class="fa fa-trash-o"></i></button>

                                        </td>




                                        <%
                                            }
                                        %>



                                    </tr>

                                </tbody>
                            </table>
                    
                    
                </div>
                
                
                
            </div>
            
        </div>
    </body>
</html>
