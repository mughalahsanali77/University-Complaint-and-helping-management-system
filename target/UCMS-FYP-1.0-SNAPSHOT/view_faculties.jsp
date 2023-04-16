<%-- 
    Document   : view_faculties
    Created on : Jan 12, 2023, 11:44:46 PM
    Author     : Ahsan
--%>

<%@page import="com.mycompany.ucms.entities.Faculty"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.ucms.helper.FactoryProvider"%>
<%@page import="com.mycompany.ucms.dao.FacultyDao"%>
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
        <title>Faculties</title>
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

                            <button class="btn btn-sm btn-success " data-toggle="modal" data-target="#facultyModal"> <i class="fa fa-plus">Add Faculty</i></button>

                        </ul>

                        <div class="card-header custom-bg text-center text-white mt-2">

                            <h3 class="text-center">All Faculties</h3>
                        </div>

                        <div class="card-body">

                            <table class="table table-striped table-dark">
                                <thead>
                                    <tr>

                                        <th scope="col">#</th>
                                        <th scope="col">Faculty</th>
                                        <th scope="col">Description</th>
                                        <th scope="col">Action</th>

                                    </tr>

                                </thead>
                                <tbody>
                                    <%                                        FacultyDao fDao = new FacultyDao(FactoryProvider.getSessionFactory());
                                        List<Faculty> listFaculty = fDao.getFaculties();
                                        for (Faculty f : listFaculty) {
                                    %>

                                    <tr>
                                        <th scope="row"><%= f.getFacultyId()%> </th>
                                        <td>  <%= f.getFacultyName()%> </td>
                                        <td><%= f.getFacultyDescription()%> </td>
                                        <td>

                                            <button class="btn-sm btn-outline-success" data-toggle="modal" data-target="#editModal-<%= f.getFacultyId()%>" ><i class="fa fa-pencil-square-o"></i></button>
                                            <button class="btn-sm btn-outline-success" data-toggle="modal" data-target="#deleteModal-<%= f.getFacultyId()%>"><i class="fa fa-trash-o"></i></button>
                                        </td>
                                    </tr>


                                    <%
                                        }
                                    %>

                                </tbody>
                            </table>


                            <%
                                for (Faculty f : listFaculty) {
                            %>


                            <div class="modal" id="editModal-<%= f.getFacultyId()%>">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header custom-bg">
                                            <h5 class="modal-title text-center text-white">Edit Faculty</h5>
                                            <button type="button" class="close text-white" data-dismiss="modal">&times;</button>
                                        </div>
                                        <div class="modal-body">
                                            <form action="EditFacultyServlet" method="post">
                                                <input type="hidden" name="id" value="<%= f.getFacultyId()%>">
                                                <div class="form-group">
                                                    <label for="name">Name:</label>
                                                    <input type="text" class="form-control" id="name" name="name" value="<%= f.getFacultyName()%>">
                                                </div>
                                                <div class="form-group">
                                                    <label for="address">Discription:</label>
                                                    <textarea name="detail"  style="height:  200px" class="form-control"><%=f.getFacultyDescription().trim()%> </textarea>
                                                </div>

                                                <input type="submit" class="btn btn-primary custom-bg" value="Save Changes">
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>



                            <!--edit modal ends-->


                            <!--deletemodal starts-->


                            <div class="modal fade" id="deleteModal-<%=f.getFacultyId()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header custom-bg">
                                            <h5 class="modal-title text-center text-white" id="exampleModalLabel">Delete Faculty</h5>
                                            <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">

                                            <form action="DeleteFacultyServlet" method="post">
                                                <input type="hidden" name="id" value="<%=f.getFacultyId()%>">
                                                <h3>Are you sure to delete <%=f.getFacultyName()%>?</h3>

                                                <input type="submit" class="btn btn-danger mt-4" value="Delete">

                                            </form>
                                        </div>

                                    </div>
                                </div>
                            </div>


                            <!--deletemodal ends-->
                            <%
                                }
                            %>





                        </div>

                    </div>

                </div>
                <div class="col-md-1"></div>
            </div>

        </div>

        <!--faculty modal starts-->
        <!-- Modal -->
        <div class="modal fade" id="facultyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Register Faculty</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form action="RegisterFacultyServlet" method="post">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="enter faculty title" name="faculty-title" required/>
                            </div>
                            <div class="form-group">
                                <textarea style="height:  250px" class="form-control" placeholder="eneter faculty detail" name="faculty-detail" required></textarea>

                            </div>
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Faculty</button>

                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>


                            </div>
                        </form>

                    </div>

                </div>
            </div>
        </div>



        <!--faculty modal ends-->






    </body>
</html>
