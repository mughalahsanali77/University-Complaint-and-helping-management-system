<%-- 
    Document   : view_departments
    Created on : Jan 13, 2023, 12:20:16 AM
    Author     : Ahsan
--%>

<%@page import="com.mycompany.ucms.entities.Faculty"%>
<%@page import="com.mycompany.ucms.dao.FacultyDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.ucms.entities.Department"%>
<%@page import="com.mycompany.ucms.helper.FactoryProvider"%>
<%@page import="com.mycompany.ucms.dao.DepartmentDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Department</title>
        <%@include file="Components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="Components/navbar.jsp" %>
        <%@include file="Components/message.jsp" %>

        <div class="container-fluid mt-4">

            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <div class="card">
                         <ul class="navbar-nav ml-auto mr-2 mt-4 " >

                            <button class="btn btn-sm btn-success " data-toggle="modal" data-target="#departmentModal"> <i class="fa fa-plus">Add Department</i></button>

                        </ul>


                        <div class="card-header custom-bg text-center text-white mt-2">
                            <h3 class="text-center">All Departments</h3>
                        </div>

                        <div class="card-body">

                            <table class="table table-striped table-dark">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Department</th>
                                        <th scope="col">Description</th>
                                        <th scope="col">Faculty</th>
                                        <th scope="col">Action</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <%                                        DepartmentDao dDao = new DepartmentDao(FactoryProvider.getSessionFactory());
                                        List<Department> listDepartment = dDao.getDepartments();
                                        for (Department d : listDepartment) {
                                    %>

                                    <tr>
                                        <th scope="row"><%= d.getDepartmentId()%> </th>
                                        <td>  <%= d.getDepartmentName()%> </td>
                                        <td><%= d.getDeparmentDescription()%> </td>
                                        <td> <%= d.getFaculty().getFacultyName()%>  </td>
                                        <td>

                                            <button class="btn-sm btn-outline-success" data-toggle="modal"  data-target="#editModal-<%= d.getDepartmentId()%>" ><i class="fa fa-pencil-square-o"></i></button>
                                            <button class="btn-sm btn-outline-success" data-toggle="modal"  data-target="#deletModal<%=d.getDepartmentId()%>" ><i class="fa fa-trash-o"></i></button>
                                        </td>
                                    </tr>




                                    <%
                                        }
                                    %>





                                </tbody>
                            </table>


                            <%
                                for (Department d : listDepartment) {
                            %>

                            <!--delete modal starts-->


                            <!-- Modal -->
                            <div class="modal fade" id="deletModal<%=d.getDepartmentId()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header custom-bg">
                                            <h5 class="modal-title text-center text-white" id="exampleModalLabel">Delete Department</h5>
                                            <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <form action="DeleteDepartmentServlet" method="post">

                                                <h3>Are You Sure Your Want To Delete <%= d.getDepartmentName()%>? </h3>
                                                <input type="hidden" name="id" value="<%=d.getDepartmentId()%>">
                                                
                                                <div class="container text-center">
                                                <input type="submit" class="btn btn-danger mt-4" value="Delete">
                                                </div>
                                            </form>


                                        </div>

                                    </div>
                                </div>
                            </div>


                            <!--delete modal ends-->





                            <!--department modal starts-->


                            <!-- Modal -->
                            <div class="modal fade" id="editModal-<%=d.getDepartmentId()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header custom-bg text-white">
                                            <h5 class="modal-title text-center" id="exampleModalLabel">Edit Department</h5>
                                            <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">

                                            <form action="EditDepartmentServlet" method="post">

                                                <input type="hidden" name="id" value="<%=d.getDepartmentId()%>">

                                                <div class="form-group">

                                                    <select name="facultyId" class="form-control"  >

                                                        <%
                                                            FacultyDao fDao = new FacultyDao(FactoryProvider.getSessionFactory());
                                                            List<Faculty> listFac = fDao.getFaculties();
                                                            for (Faculty f : listFac) {
                                                        %>
                                                        <option value="<%=f.getFacultyId()%>"
                                                                
                                                                <%if( f.getFacultyId() == d.getFaculty().getFacultyId() ){
                                                                %> selected<%}%>
                                                                
                                                                
                                                                
                                                                ><%=f.getFacultyName()%></option>
                                                        <%
                                                            }
                                                        %>

                                                    </select>

                                                </div>
                                                <div class="form-group">
                                                    <input type="text" class="form-control" value="<%= d.getDepartmentName().trim()%>" placeholder="enter department title" name="name" />
                                                </div>
                                                <div class="form-group">
                                                    <textarea style="height:  250px" class="form-control" placeholder="eneter deparment detail" name="detail" required><%= d.getDeparmentDescription().trim()%></textarea>

                                                </div>
                                                <div class="container mt-2 text-center">
                                                    <input type="submit" class="btn btn-primary custom-bg" value="Save Changes">
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">

                                        </div>

                                    </div>
                                </div>
                            </div>



                            <!--department modal ends-->





                            <%
                                }
                            %>




                        </div>

                    </div>

                </div>
                <div class="col-md-1"></div>
            </div>

        </div>
                            
                            
                            
                            
                            
                             <!--department modal starts-->


        <!-- Modal -->
        <div class="modal fade" id="departmentModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Register Department</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="RegisterDepartmentServlet" method="post">

                            <div class="form-group">
                                <select name="facultyId" class="form-control"  >

                                    <%                        
                                        FacultyDao fDao = new FacultyDao(FactoryProvider.getSessionFactory());
                                         List<Faculty> listFac2 = fDao.getFaculties();
                                        for (Faculty f : listFac2) {
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
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>


                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>



        <!--department modal ends-->



    </body>
</html>
