<%@page import="com.mycompany.ucms.dao.UserDao"%>
<%@page import="com.mycompany.ucms.entities.Complaint"%>
<%@page import="com.mycompany.ucms.dao.ComplaintDao"%>
<%@page import="com.mycompany.ucms.entities.Subject"%>
<%@page import="com.mycompany.ucms.dao.SubjectDao"%>
<%@page import="com.mycompany.ucms.entities.Student"%>
<%@page import="com.mycompany.ucms.dao.StudentDao"%>
<%@page import="com.mycompany.ucms.entities.Employee"%>
<%@page import="com.mycompany.ucms.dao.EmployeeDao"%>
<%@page import="com.mycompany.ucms.entities.Department"%>
<%@page import="com.mycompany.ucms.dao.DepartmentDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.ucms.entities.Faculty"%>
<%@page import="com.mycompany.ucms.helper.FactoryProvider"%>
<%@page import="com.mycompany.ucms.dao.FacultyDao"%>
<%@page import="com.mycompany.ucms.entities.User"%>
<%@include file="common_css_js.jsp" %>
<%
    User user1 = (User) session.getAttribute("current-user");
    FacultyDao fDaoNav = new FacultyDao(FactoryProvider.getSessionFactory());
    List<Faculty> listFacNav = fDaoNav.getFaculties();
    DepartmentDao dDaoNav = new DepartmentDao(FactoryProvider.getSessionFactory());
    List<Department> listDptNav = dDaoNav.getDepartments();
    EmployeeDao eDaoNav = new EmployeeDao(FactoryProvider.getSessionFactory());
    List<Employee> listEmpNav = eDaoNav.getEmployees();
    StudentDao sDaoNav = new StudentDao(FactoryProvider.getSessionFactory());
    List<Student> listStuNav = sDaoNav.getStudents();
    SubjectDao subDaoNav = new SubjectDao(FactoryProvider.getSessionFactory());
    List<Subject> subListNav = subDaoNav.getSubjects();

    ComplaintDao cDaoNav = new ComplaintDao(FactoryProvider.getSessionFactory());
    List<Complaint> listComNav = cDaoNav.getAllComplaints();

    UserDao uDaoNav = new UserDao(FactoryProvider.getSessionFactory());
    List<User> listUserNav = uDaoNav.getAllUsers();


%>

<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
    <a class="navbar-brand" href="index.jsp">UC&HMS</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <%                if (user1 != null && user1.getRole().getRoleId() == 3) {
            %>
            <li class="nav-item active">
                <a class="nav-link" href="student_dashboard.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
            <%}%>

            <%
                if (user1 != null && user1.getRole().getRoleId() == 2) {
            %>
            <li class="nav-item active">
                <a class="nav-link" href="teacher_dashboard.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
            <%}%>
            <%
                if (user1 != null && user1.getRole().getRoleId() == 1) {
            %>
            <li class="nav-item active">
                <a class="nav-link" href="admin.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
            <%}%>

            <%
                if (user1 != null && user1.getRole().getRoleId() == 1) {
            %>  
            <li class="nav-item dropdown" >
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Complain
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="view_complaints.jsp">All Complain</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item admin" href="view_all_new_complaint.jsp">New Complaints</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="view_all_pending_complaint.jsp">Pending Complaints</a>
                    <a class="dropdown-item" href="view_all_rejected_complaint.jsp">Rejected Complaints</a>
                    <a class="dropdown-item" href="view_all_resolved_complaint.jsp">Resolved Complaints</a>


                </div>

            </li>
            <%}%>






            <%                    if (user1 != null && user1.getRole().getRoleId() == 3) {
            %>



            <a class="text-white ml-auto mt-2" href="#" data-toggle="modal" data-target="#complainModal">File Complain</a>



            <%
                }
            %>

        </ul>



        <ul class="navbar-nav ml-auto" >

            <li>
                <h4 class="text-light mx-5  ml-2">UNIVERSITY COMPLAINT AND HELPING MANAGEMENT SYSTEM</h4>
            </li>

            <li class="nav-item active">
                <%
                    if (user1 == null) {
                %>

            <li class="nav-item active">
                <a class="nav-link" href="login.jsp">Login</a>
            </li>

            <li class="nav-item active">
                <a class="nav-link" href="registration.jsp">Register</a>
                
            </li>
            <%
            } else {
            %>

            <li class="nav-item active">
                <%
                    if (user1.getRole().getRole().equals("admin")) {
                %>
                <a class="nav-link" href="#!" data-toggle="modal" data-target="#admin-profile-modal"><span class="fa fa-user-circle"></span><%= user1.getUserName()%></a>
                    <%} else if (user1.getRole().getRole().equals("student")) {
                    %>
                <a class="nav-link" href="#!" data-toggle="modal" data-target="#student-profile-modal"><span class="fa fa-user-circle"></span><%= user1.getStudent().getStudentName()%></a>
                    <%} else if (user1.getRole().getRole().equals("teacher")) {
                    %>
                <a class="nav-link" href="#" data-toggle="modal" data-target="#teacher-profile-modal"><span class="fa fa-user-circle"></span><%= user1.getEmployee().getEmployeeName()%></a>

                <%} %>

            </li>

            <li class="nav-item active">
                <a class="nav-link" href="LogoutServlet">Logout</a>
            </li>


            <%
                }
            %>


        </ul>

    </div>
</nav>




<!--student profile management starts-->

<%
    if (user1 != null) {

        if (user1.getRole().getRoleId() == 3) {

%>



<!-- Modal -->
<div class="modal fade" id="student-profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header custom-bg text-center">
                <h5 class="modal-title text-white " id="exampleModalLabel"> Profile</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">



                <!--data table-->
                <div id="profile-detail">
                    <form action="UpdateStudent" method="post">
                        <table class="table">

                            <tbody>

                                <tr>
                                    <th scope="row">Name</th>
                                    <td><input type="text" name="name" value="<%= user1.getStudent().getStudentName()%>" class="form-control"/></td>
                                   

                                </tr>
                                <tr>
                                    <th scope="row">Father`s Name</th>
                                    <td><input type="text" name="fname" value="<%= user1.getStudent().getStudentFatherName() %>" class="form-control"/></td>
                                   
                                </tr>
                                <tr>
                                    <th scope="row">Gender</th>
                                    <td><%=user1.getStudent().getStudentGender()%></td>

                                </tr>
                                <tr>
                                    <th scope="row"> CNIC </th>
                                    <td><input type="text" name="cnic" value="<%= user1.getStudent().getStudentCnic() %>" class="form-control"/></td>
                                   
                                </tr>
                                <tr>
                                    <th scope="row"> Mobile No </th>
                                    <td> <input type="text" name="mobile" value="<%=user1.getStudent().getStudentContactNo()%>" class="form-control"/>  </td>
                                

                                </tr>

                                <tr>
                                    <th scope="row">Email</th>
                                    <td><input class="form-control" type="text" value="<%=user1.getStudent().getStdentEmail()%>" name="email"/></td>

                                    
                                </tr>
                                <tr>
                                    <th scope="row"> Department </th>
                                    <td><%=user1.getStudent().getDepartment().getDepartmentName()%></td>

                                </tr>
                                <tr>
                                    <th scope="row"> Roll No </th>
                                    <td><%=user1.getStudent().getStudentRollNumber()%></td>

                                </tr>




                            </tbody>
                        </table>

                        <div class="container text-center">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-success"   >Save Changes</button>
                            <button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#change-password-modal" >Change Password</button>
                        </div>
                    </form>
                </div>


            </div>

        </div>
    </div>
</div>



<!--student profile management ends-->





<!--file compalin starts-->

<!-- Modal -->
<div class="modal fade" id="complainModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content ">
            <div class="modal-header custom-bg text-white text-center">
                <h5 class="modal-title" id="exampleModalLabel">File New Complain</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="FileComplainServlet" method="post">
                    <table class="table">
                        <tr>
                            <td class="form-group">Faculty</td>
                            <td>
                                <select class="form-control" name="faculty">
                                    <option class="form-group " value="" >SELECT</option>

                                    <%

                                        for (Faculty fNav : listFacNav) {
                                    %>
                                    <option class="form-group " value="<%= fNav.getFacultyId()%>" ><%= fNav.getFacultyName()%></option>
                                    <%
                                        }

                                    %>
                                </select>

                            </td>
                            <td>Department</td>
                            <td>
                                <select class="form-control" name="department">
                                    <option class="form-group " value="" >SELECT</option>
                                    <%                                  for (Department dNav : listDptNav) {%>
                                    <option class="form-group" value="<%=dNav.getDepartmentId()%>"> <%= dNav.getDepartmentName()%></option>
                                    <%}%>
                                </select>

                            </td>
                        </tr>
                        <tr>
                            <td class="form-group">Teacher</td>
                            <td >
                                <select name="teacher" class="form-control">
                                    <option class="form-group " value="" >SELECT</option>
                                    <%
                                        for (Employee tNav : listEmpNav) {
                                    %>
                                    <option class="form-group" value="<%= tNav.getEmployeeId()%>" ><%= tNav.getEmployeeName()%></option>
                                    <%}%>
                                </select>
                            </td>

                            <td class="form-group">Subject</td>
                        <option class="form-group " value="" >SELECT</option>
                        <td >
                            <select name="subject" class="form-control">
                                <option class="form-group " value="" >SELECT</option>
                                <%
                                    for (Subject subNav : subListNav) {
                                %>
                                <option class="form-group" value="<%= subNav.getSubjectId()%>" ><%= subNav.getSubjectName()%></option>
                                <%}%>
                            </select>
                        </td>
                        </tr>
                        <tr>
                            <td ><label>Complain Type</label></td>
                            <td colspan="4">
                                <select name="complain-type" class="form-control" >
                                    <option class="form-group " value="" >SELECT</option>
                                    <option class="form-group" value="Marksheet" >Marksheet</option>
                                    <option class="form-group" value="LowAttendence" >Low Attendence</option>

                                </select>
                            </td>
                        </tr>





                    </table>

                    <div class="container">  
                        <label>Complain Details</label>
                        <textarea class="form-control"  style="height: 200px;" name="detail" placeholder="enter tour complain detail here"></textarea> 
                    </div>
                    <div class="container text-center mt-3">
                        <button type="submit" class="btn btn-primary">File Complain</button>
                    </div>

                </form>
            </div>

        </div>
    </div>
</div>

<!--file compalin ends-->
<!--teacher profile management starts-->
<%} else if (user1.getRole().getRoleId() == 2) {
%>


<div class="modal fade" id="teacher-profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header custom-bg text-center">
                <h5 class="modal-title text-white " id="exampleModalLabel"> Profile</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">



                <!--data table-->
                <div id="profile-detail">
                    <form action="UpdateEmployee" method="post">
                    <table class="table">

                        <tbody>

                            <tr>
                                <th scope="row">Name</th>
                                <td><input class="form-control" type="text" value="<%= user1.getEmployee().getEmployeeName()%>" name="name"/></td>
                                
                             </tr>
                            <tr>
                                <th scope="row">Gender</th>
                                <td><%=user1.getEmployee().getEmployeeGender()%></td>

                            </tr>
                            <tr>
                                <th scope="row">CNIC</th>
                                
                                <td> <input class="form-control" type="text" name="cnic" value="<%=user1.getEmployee().getEmployeeCnic()%>"/></td>
                               

                            </tr>
                            <tr>
                                <th scope="row"> Contact </th>
                                
                                <td> <input class="form-control" type="text" name="contact" value="<%=user1.getEmployee().getEmployeeContact()%>"/></td> 

                            </tr>
                            <tr>
                                <th scope="row"> Email </th>
                                
                                <td> <input class="form-control" type="text" name="email" value="<%=user1.getEmployee().getEmployeeEmail()%>"/></td>
                                      
                            </tr>

                            <tr>
                                <th scope="row">Employee Code</th>
                                <td><%=user1.getEmployee().getEmployeeCode()%> </td>

                            </tr>
                            <tr>
                                <th scope="row"> Department </th>
                                <td><%=user1.getEmployee().getDepartment().getDepartmentName()%> </td>

                            </tr>
                            <tr>
                                <th scope="row"> Address </th>
                              
                                <td> <input class="form-control" type="text" name="address" value="<%=user1.getEmployee().getEmployeeAddress()%>"/></td>
                                
                            </tr>




                        </tbody>
                    </table>
             <div class="container text-center">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-success"  >Save Changes</button>
                <button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#change-password-modal" >Change Password</button>
            </div>
                    </form>
                </div>


            </div>
            
        </div>
    </div>
</div>


<!--teacher profile management ends-->


<%} else if (user1.getRole().getRoleId() == 1) {
%>
<!--admin profile modal starts-->

<div class="modal fade" id="admin-profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header custom-bg text-center">
                <h5 class="modal-title text-white " id="exampleModalLabel"> Profile</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">



                <!--data table-->
                <div id="profile-detail">
                    <table class="table">

                        <tbody>

                            <tr>
                                <th scope="row">Email</th>
                                <td><%= user1.getUserName()%></td>

                            </tr>



                            <tr>
                                <th scope="row"> Role </th>
                                <td><%=user1.getRole().getRole()%></td>

                            </tr>




                        </tbody>
                    </table>
                </div>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#change-password-modal" >Change Password</button>
            </div>
        </div>
    </div>
</div>


<!--admin profile modal ends-->
<%}%>


<!--cahnge password modal starts-->


<!-- Modal -->
<div class="modal fade" id="change-password-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header text-white custom-bg">
                <h5 class="modal-title" id="exampleModalLabel">Change Password</h5>
                <button type="button" class="close text-whiteS" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="ChangePasswordServlet" method="post">

                    <table class="table">
                        <tr>
                            <td>Old password :</td>
                            <td><input type="password" class="form-control" name="old_password" ></td>
                        </tr>

                        <tr>
                            <td>new password :</td>
                            <td><input type="password" class="form-control" name="new_password" ></td>
                        </tr>
                        <tr>
                            <td>confirm new password :</td>
                            <td><input type="password" class="form-control" name="confirm_new_password" ></td>
                        </tr>


                    </table>


                    <div class="text-center">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save changes</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>



<!--cahnge password modal end-->

<%
    }
%>