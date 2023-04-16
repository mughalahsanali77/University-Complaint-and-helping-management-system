<%-- 
    Document   : view_subjects
    Created on : Jan 16, 2023, 12:08:18 PM
    Author     : Ahsan
--%>

<%@page import="com.mycompany.ucms.entities.Employee"%>
<%@page import="com.mycompany.ucms.dao.EmployeeDao"%>
<%@page import="com.mycompany.ucms.dao.DepartmentDao"%>
<%@page import="com.mycompany.ucms.entities.Department"%>
<%@page import="com.mycompany.ucms.entities.Faculty"%>
<%@page import="com.mycompany.ucms.dao.FacultyDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.ucms.entities.Subject"%>
<%@page import="com.mycompany.ucms.dao.SubjectDao"%>
<%@page import="com.mycompany.ucms.helper.FactoryProvider"%>
<%@page import="com.mycompany.ucms.dao.StudentDao"%>
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
        <title>Subjects</title>
        <%@include file="Components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="Components/navbar.jsp" %>
        <%@include file="Components/message.jsp" %>

        <div class="container-fluid">

            <div class="card mt-4">

                <ul class="navbar-nav ml-auto mr-2 mt-4 " >

                    <button class="btn btn-sm btn-success " data-toggle="modal" data-target="#Modal" > <i class="fa fa-plus">Add Subjects</i></button>

                </ul>

                <div class="card-header mt-2 custom-bg">
                    <h1 class="text-center text-white">Subjects</h1>
                </div>

                <div class="card-body">

                    <table class="table table-striped table-dark">
                        <thead>
                            <tr>

                                <th scope="col">Course#</th>

                                <th scope="col">Name</th>
                                <th scope="col">Instructor</th>
                                <th scope="col">Department</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%                                            SubjectDao sDao = new SubjectDao(FactoryProvider.getSessionFactory());
                                List<Subject> subList = sDao.getSubjects();
                                for (Subject s : subList) {

                            %>
                            <tr>

                                <td> <%= s.getCourseNo()%> </td>
                                <th scope="row"> <%= s.getSubjectName()%> </th>
                                <td> <%= s.getEmployee().getEmployeeName()%> </td>
                                <td> <%= s.getDepartment().getDepartmentName()%> </td>



                                <td>

                                    <button class="btn-sm btn-outline-success" data-toggle="modal" data-target="#editModal-<%=s.getSubjectId()%>" ><i class="fa fa-pencil-square-o"></i></button>
                                    <button class="btn-sm btn-outline-success" data-toggle="modal" data-target="#deleteModal-<%=s.getSubjectId()%>"><i class="fa fa-trash-o"></i></button>

                                </td>




                                <%
                                    }
                                %>



                            </tr>

                        </tbody>
                    </table>


                    <!--Subject modal starts-->
                    <!-- Modal -->
                    <div class="modal fade" id="Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header custom-bg text-white">
                                    <h5 class="modal-title" id="exampleModalLabel">Register Subject</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">

                                    <form action="RegisterSubjectsServlet" method="post">
                                        <input type="hidden" name="operation" value="save" />
                                        <div class="form-group">
                                            <label for="dpt">Select Department:</label>
                                            <select class="form-control" id="facultySelect" name="dpt" onchange="loadDepartments()">
                                                <%
                                                    DepartmentDao dDao = new DepartmentDao(FactoryProvider.getSessionFactory());
                                                    List<Department> department = dDao.getDepartments();
                                                    for (Department dpt : department) {
                                                %>
                                                <option value="<%= dpt.getDepartmentId()%>"><%= dpt.getDepartmentName()%></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                        </div>


                                        <div class="form-group">
                                            <label for="teacher">Select Teacher:</label>
                                            <select  class="form-control" id="departmentSelect" name="teacher">
                                                <%
                                                    EmployeeDao eDao = new EmployeeDao(FactoryProvider.getSessionFactory());
                                                    List<Employee> emp = eDao.getEmployees();
                                                    for (Employee e : emp) {
                                                %>
                                                <option value="<%= e.getEmployeeId()%>"> <%= e.getEmployeeName()%> </option>

                                                <%
                                                    }
                                                %>
                                            </select>
                                        </div>




                                        <div class="form-group">
                                            <label for="semester">Select Semester:</label>

                                            <select name="semester" class="form-control">

                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>

                                            </select>

                                        </div>




                                        <div class="form-group">
                                            <label for="semester">Course#:</label>
                                            <input type="text" class="form-control" placeholder="enter course no" name="course" required/>
                                        </div>
                                        <div class="form-group">
                                            <label for="name">Subject name:</label>
                                            <input type="text" class="form-control" placeholder="enter subject name" name="name" required/>
                                        </div>

                                        <div class="container text-center">
                                            <button class="btn btn-outline-success">Add Subject</button>

                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>


                                        </div>
                                    </form>

                                </div>

                            </div>
                        </div>
                    </div>



                    <!--faculty modal ends-->






                    <%
                        for (Subject s : subList) {

                    %>

  <!--delete modal starts-->


                            <!-- Modal -->
                            <div class="modal fade" id="deleteModal-<%= s.getSubjectId() %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header custom-bg">
                                            <h5 class="modal-title text-center text-white" id="exampleModalLabel">Delete Subject</h5>
                                            <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <form action="DeleteSubjectServlet" method="post">
                                                
                                        <input type="hidden" name="operation" value="delete"/>
                                                <input type="hidden" value="<%= s.getSubjectId()%>" name="id"/>
                                                <h3>Are You Sure Your Want To Delete <%= s.getSubjectName() %>? </h3>

                                                <div class="container text-center">
                                                    <input type="submit" class="btn btn-danger mt-4" value="Delete">
                                                </div>
                                            </form>
                                        </div>

                                    </div>
                                </div>
                            </div>


                            <!--delete modal ends-->
                            
                            
                    <!--Subject edit modal starts-->
                    <!-- Modal -->
                    <div class="modal fade" id="editModal-<%= s.getSubjectId()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header custom-bg text-white">
                                    <h5 class="modal-title" id="exampleModalLabel">Edit Subject</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">

                                    <form action="EditSubjectServlet" method="post">
                                        <input type="hidden" name="subjectId" value="<%= s.getSubjectId()%>"/>
                                       
                                        <div class="form-group">
                                            <label for="dpt">Select Department:</label>
                                            <select class="form-control" id="facultySelect" name="dpt" >
                                                <%

                                                    for (Department dpt : department) {
                                                %>
                                                <option value="<%= dpt.getDepartmentId()%>"<%if (dpt.getDepartmentId() == s.getDepartment().getDepartmentId()) {%> selected<%}%> ><%= dpt.getDepartmentName()%></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                        </div>


                                        <div class="form-group">
                                            <label for="teacher">Select Teacher:</label>
                                            <select  class="form-control" id="departmentSelect" name="teacher">
                                                <%
                                                    for (Employee e : emp) {
                                                %>
                                                <option value="<%= e.getEmployeeId()%>" <%if (e.getEmployeeId() == s.getEmployee().getEmployeeId()) {%> selected<%}%>> <%= e.getEmployeeName()%> </option>

                                                <%
                                                    }
                                                %>
                                            </select>
                                        </div>




                                        <div class="form-group">
                                            <label for="semester">Select Semester:</label>

                                            <select name="semester" class="form-control">

                                                <option value="1" <% if (s.getSemester() == 1) { %>selected<%}%> >1</option>
                                                <option value="2" <% if (s.getSemester() == 2) { %>selected<%}%>>2</option>
                                                <option value="3"<% if (s.getSemester() == 3) { %>selected<%}%>>3</option>
                                                <option value="4"<% if (s.getSemester() == 4) { %>selected<%}%>>4</option>
                                                <option value="5"<% if (s.getSemester() == 5) { %>selected<%}%>>5</option>
                                                <option value="6"<% if (s.getSemester() == 6) { %>selected<%}%>>6</option>
                                                <option value="7"<% if (s.getSemester() == 7) { %>selected<%}%>>7</option>
                                                <option value="8"<% if (s.getSemester() == 8) { %>selected<%}%>>8</option>

                                            </select>

                                        </div>




                                        <div class="form-group">
                                            <label for="semester">Course#:</label>
                                            <input type="text" value=" <%= s.getCourseNo()%> " class="form-control" placeholder="enter course no" name="course" required/>
                                        </div>
                                        <div class="form-group">
                                            <label for="name">Subject name:</label>
                                            <input type="text" class="form-control" value=" <%= s.getSubjectName()%> " placeholder="enter subject name" name="name" required/>
                                        </div>

                                        <div class="container text-center">
                                            <button class="btn btn-outline-success">Update Subject</button>

                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>


                                        </div>
                                    </form>

                                </div>

                            </div>
                        </div>
                    </div>



                    <!--subject edit modal ends-->

                    <%
                        }
                    %>

                </div>



            </div>

        </div>
    </body>
</html>
