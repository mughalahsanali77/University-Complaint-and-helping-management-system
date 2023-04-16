<%-- 
    Document   : view-employees
    Created on : Jan 13, 2023, 3:55:06 PM
    Author     : Ahsan
--%>

<%@page import="com.mycompany.ucms.dao.DepartmentDao"%>
<%@page import="com.mycompany.ucms.entities.Department"%>
<%@page import="com.mycompany.ucms.entities.Employee"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.ucms.helper.FactoryProvider"%>
<%@page import="com.mycompany.ucms.dao.EmployeeDao"%>
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


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employees</title>
        <%@include file="Components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="Components/navbar.jsp" %>
        <%@include file="Components/message.jsp" %>

        <div class="container-fluid mt-4">

            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <ul class="navbar-nav ml-auto mr-2 mt-4 " >

                            <button class="btn btn-sm btn-success " data-toggle="modal" data-target="#employeeModal"> <i class="fa fa-plus">Add Employee</i></button>

                        </ul>

                        <div class="card-header custom-bg text-center text-white mt-2">
                            <h3 class="text-center">All Employees</h3>
                        </div>

                        <div class="card-body">

                            <table class="table table-striped table-dark">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Employee Name</th>
                                        <th scope="col">Gender</th>
                                        <th scope="col">CNIC</th>
                                        <th scope="col">Contact</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Employee Code</th>
                                        <th scope="col">Department</th>
                                        <th scope="col">Address</th>
                                        <th scope="col">Action</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <%                                        EmployeeDao eDao = new EmployeeDao(FactoryProvider.getSessionFactory());
                                        List<Employee> listEmployee = eDao.getEmployees();
                                        for (Employee e : listEmployee) {
                                    %>


                                    <tr>
                                        <th scope="row"><%= e.getEmployeeId()%> </th>
                                        <td>  <%= e.getEmployeeName()%> </td>
                                        <td><%= e.getEmployeeGender()%> </td>
                                        <td> <%= e.getEmployeeCnic()%> </td>  
                                        <td> <%= e.getEmployeeContact()%> </td>
                                        <td> <%= e.getEmployeeEmail()%> </td>
                                        <td> <%= e.getEmployeeCode()%> </td>    
                                        <td> <%= e.getDepartment().getDepartmentName()%> </td>    
                                        <td> <%= e.getEmployeeAddress()%> </td>
                                        <td>

                                            <button class="btn-sm btn-outline-success" data-toggle="modal"  data-target="#editModal-<%= e.getEmployeeId()%>" ><i class="fa fa-pencil-square-o"></i></button>
                                            <button class="btn-sm btn-outline-success" data-toggle="modal"  data-target="#deleteModal-<%= e.getEmployeeId()%>" ><i class="fa fa-trash-o"></i></button>
                                        </td>
                                    </tr>



                                    <%
                                        }
                                    %>

                                </tbody>
                            </table>


                            <%
                                for (Employee e : listEmployee) {
                            %>
                            <!--delete modal starts-->


                            <!-- Modal -->
                            <div class="modal fade" id="deleteModal-<%= e.getEmployeeId()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header custom-bg">
                                            <h5 class="modal-title text-center text-white" id="exampleModalLabel">Delete Faculty</h5>
                                            <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <form action="DeleteEmployeeServlet" method="post">
                                                <input type="hidden" value="<%= e.getEmployeeId()%>" name="id"/>
                                                <h3>Are You Sure Your Want To Delete <%= e.getEmployeeName()%>? </h3>

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


                            <div class="modal fade" id="editModal-<%= e.getEmployeeId()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header custom-bg">
                                            <h5 class="modal-title text-center text-white" id="exampleModalLabel">Update Employee</h5>
                                            <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">

                                            <form action="EditEmployeeServlet" method="post">

                                                <div class="form-group">

                                                    <input type="hidden" value="<%= e.getEmployeeId()%>" name="id"/>
                                                    <select name="dptarmentId" class="form-control"  >

                                                        <%
                                                            DepartmentDao dDao = new DepartmentDao(FactoryProvider.getSessionFactory());
                                                            List<Department> listDpt = dDao.getDepartments();
                                                            for (Department dpt : listDpt) {
                                                        %>
                                                        <option value="<%=dpt.getDepartmentId()%>" <%if (dpt.getDepartmentId() == e.getDepartment().getDepartmentId()) {%> selected<%}%>><%=dpt.getDepartmentName()%></option>
                                                        <%
                                                            }
                                                        %>

                                                    </select>

                                                </div>
                                                <div class="form-group">
                                                    <input type="text" class="form-control" value="<%= e.getEmployeeName()%>" placeholder="enter employee name" name="name" required/>
                                                </div>


                                                <div class="form-group">
                                                    <input type="text" class="form-control" value="<%= e.getEmployeeCnic()%>" placeholder="enter employee`s cnic" name="cnic" required/>
                                                </div>

                                                <div class="form-group">
                                                    <input type="text" class="form-control"  value="<%= e.getEmployeeContact()%>"placeholder="enter employee`s contact no" name="contact-no" required/>
                                                </div>

                                                <div class="form-group">
                                                    <input type="text" class="form-control" value="<%= e.getEmployeeEmail()%>" placeholder="enter employee`s email" name="email" required/>
                                                </div>


                                                <div class="form-group">
                                                    <input type="text" class="form-control" value="<%= e.getEmployeeCode()%>" placeholder="enter employee`s code" name="code" required/>
                                                </div>

                                                <div class="form-group">
                                                    <select name="gender" class="form-control" >


                                                        <option value="male" <% if (e.getEmployeeGender().trim().equals("male")) {%>selected <% }%>>Male</option>
                                                        <option value="female" <% if (e.getEmployeeGender().trim().equals("female")) {%>selected <% }%>>Female</option>
                                                        <option value="other" <% if (e.getEmployeeGender().trim().equals("other")) {%>selected <% }%>>Other</option>



                                                    </select>
                                                </div>   


                                                <div class="form-group">
                                                    <textarea style="height:  150px" class="form-control" placeholder="eneter employee`s address detail" name="address" required><%= e.getEmployeeAddress().trim()%></textarea>

                                                </div>

                                                <div class="container mt-2 text-center">
                                                    <input type="submit" class="btn btn-primary custom-bg" value="Save Changes">
                                                </div>

                                            </form>

                                        </div>

                                    </div>
                                </div>
                            </div>



                            <!--edit modal ends-->



                            <%
                                }
                            %>

                        </div>

                    </div>

                </div>
            </div>

        </div>

        <!--employee modal starts-->




        <!-- Modal -->
        <div class="modal fade" id="employeeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Register Employee</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="RegisterEmployeeServlet" method="post">

                            <div class="form-group">
                                <select name="dptarmentId" class="form-control"  >

                                    <%
                                        DepartmentDao dDao = new DepartmentDao(FactoryProvider.getSessionFactory());
                                        List<Department> listDpt11 = dDao.getDepartments();
                                        for (Department dpt : listDpt11) {
                                    %>
                                    <option value="<%=dpt.getDepartmentId()%>"><%=dpt.getDepartmentName()%></option>
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


                                    <option value="null">--->Select<---</option>
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
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>


        <!--employee modal ends-->

    </body>
</html>
