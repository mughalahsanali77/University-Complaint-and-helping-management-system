<%-- 
    Document   : view_students
    Created on : Jan 13, 2023, 8:28:59 PM
    Author     : Ahsan
--%>

<%@page import="com.mycompany.ucms.entities.Department"%>
<%@page import="com.mycompany.ucms.entities.Department"%>
<%@page import="com.mycompany.ucms.dao.DepartmentDao"%>
<%@page import="com.mycompany.ucms.entities.Student"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.ucms.helper.FactoryProvider"%>
<%@page import="com.mycompany.ucms.dao.StudentDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Students</title>
        <%@include file="Components/common_css_js.jsp" %>

    </head>
    <body>
        <%@include file="Components/navbar.jsp" %>
        <%@include file="Components/message.jsp" %>

        <div class="container-fluid">
            <div class="row">

                <div class="col-md-12">

                    <div class="card mt-2">
                        <ul class="navbar-nav ml-auto mr-2 mt-4 " >

                            <button class="btn btn-sm btn-success " data-toggle="modal" data-target="#studentModal"> <i class="fa fa-plus">Add Student</i></button>

                        </ul>
                        <div class="card-header text-center text-white custom-bg mt-2">
                            <h3>All Students</h3>
                        </div>

                        <div class="card-body">



                            <table class="table table-striped table-dark">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Student Name</th>
                                        <th scope="col">Father`s Name</th>
                                        <th scope="col">CNIC</th>
                                        <th scope="col">Contact No</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Gender</th>
                                        <th scope="col">Roll No</th>

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


                            <%
                                for (Student s : stdList) {
                            %>
                            <!--delete modal starts-->


                            <!-- Modal -->
                            <div class="modal fade" id="deleteModal-<%=s.getStudentId()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header custom-bg">
                                            <h5 class="modal-title text-center text-white" id="exampleModalLabel">Delete Students</h5>
                                            <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <form action="DeleteStudentServlet" method="post">
                                                <input type="hidden" value="<%=s.getStudentId()%>" name="id" />
                                                <h3>Are You Sure Your Want To Delete <%= s.getStudentName()%> </h3>

                                                <div class="container text-center">
                                                    <input type="submit" class="btn btn-danger mt-4" value="Delete">
                                                </div>
                                            </form>
                                        </div>

                                    </div>
                                </div>
                            </div>


                            <!--delete modal ends-->




                            <!--edit modal starts-->


                            <!-- Modal -->
                            <div class="modal fade" id="editModal-<%=s.getStudentId()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header custom-bg">
                                            <h5 class="modal-title text-center text-white" id="exampleModalLabel">Delete Students</h5>
                                            <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <form action="EditStudentServlet" method="post">
                                                <input type="hidden" value="<%=s.getStudentId()%>" name="id" />


                                                <div class="form-group">          
                                                    <select name="dptarmentId" class="form-control"  >

                                                        <%
                                                            DepartmentDao dDao = new DepartmentDao(FactoryProvider.getSessionFactory());
                                                            List<Department> listDpt = dDao.getDepartments();
                                                            for (Department dpt : listDpt) {
                                                        %>
                                                        <option value="<%=dpt.getDepartmentId()%>"<% if (dpt.getDepartmentId() == s.getDepartment().getDepartmentId()) {%> selected<%}%>><%=dpt.getDepartmentName()%></option>
                                                        <%

                                                            }

                                                        %>

                                                    </select>

                                                </div>

                                                <div class="form-group">
                                                    <input type="text" class="form-control " value="<%= s.getStudentName()%>" placeholder="enter student name" name="name" required/>
                                                </div>

                                                <div class="form-group">
                                                    <input type="text" class="form-control " value="<%= s.getStudentFatherName()%>" placeholder="enter student`s father name" name="fname" required/>
                                                </div>

                                                <div class="form-group">
                                                    <select name="gender" class="form-control " >
                                                        <option value="null">--->Select<---</option>
                                                        <option value="male" <% if (s.getStudentGender().trim().equals("male")) {%>selected <% }%> >Male</option>
                                                        <option value="female" <% if (s.getStudentGender().trim().equals("female")) {%>selected <% }%> >Female</option>
                                                        <option value="other" <% if (s.getStudentGender().trim().equals("other")) {%>selected <% }%>>Other</option>

                                                    </select>
                                                </div>

                                                <div class="form-group">
                                                    <input type="text" class="form-control " value="<%= s.getStudentCnic()%>" placeholder="enter student`s cnic" name="cnic" required/>
                                                </div>

                                                <div class="form-group">
                                                    <input type="text" class="form-control " value="<%= s.getStudentContactNo()%>" placeholder="enter student`s contact no" name="contact-no" required/>
                                                </div>

                                                <div class="form-group">
                                                    <input type="text" class="form-control " value="<%= s.getStdentEmail()%>" placeholder="enter student`s email" name="email" required/>
                                                </div>



                                                <div class="form-group">
                                                    <input type="text" class="form-control "  value="<%= s.getStudentRollNumber()%>" placeholder="enter student`s roll no" name="roll" required/>
                                                </div>

                                                <div class="container text-center">
                                                    <input type="submit" class="btn btn-success mt-4" value="Save Changes">
                                                </div>
                                            </form>
                                        </div>

                                    </div>
                                </div>
                            </div>


                            <!--edit modal ends-->




                            <%}%>



                        </div>




                    </div>



                </div>



            </div>






        </div>

        <!--student modal starts-->



        <!-- Modal -->
        <div class="modal fade" id="studentModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Add Student</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
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
        </div>

        <!--student modal ends-->






    </body>
</html>
