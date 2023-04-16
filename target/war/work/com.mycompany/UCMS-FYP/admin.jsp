<%-- 
    Document   : admin
    Created on : Jan 11, 2023, 4:10:56 PM
    Author     : Ahsan
--%>

<%@page import="com.mycompany.ucms.entities.Student"%>
<%@page import="com.mycompany.ucms.dao.StudentDao"%>
<%@page import="com.mycompany.ucms.entities.Employee"%>
<%@page import="com.mycompany.ucms.dao.EmployeeDao"%>
<%@page import="com.mycompany.ucms.dao.FacultyDao"%>
<%@page import="com.mycompany.ucms.entities.Faculty"%>
<%@page import="com.mycompany.ucms.helper.FactoryProvider"%>
<%@page import="com.mycompany.ucms.entities.Department"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.ucms.dao.DepartmentDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UCMS : Admin</title>
        <%@include file="Components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include  file="Components/navbar.jsp" %>
        <%@include file="Components/message.jsp" %>

      
        <div class="container-fluid admin">
              <%           
            FacultyDao faculty = new FacultyDao(FactoryProvider.getSessionFactory());
            List<Faculty> listFac = faculty.getFaculties();
            DepartmentDao dDao = new DepartmentDao(FactoryProvider.getSessionFactory());
            List<Department> listDpt = dDao.getDepartments();
            EmployeeDao eDao=new EmployeeDao(FactoryProvider.getSessionFactory());
            List<Employee> listEmp=eDao.getEmployees();
            StudentDao sDao=new StudentDao(FactoryProvider.getSessionFactory());
            List<Student> listStu=sDao.getStudents();
            
        %>

            <!--first row starts-->

            <div class="row mt-2">

                <!--faculty column-->
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img src="img/campus.png" alt="facultiesIcon" class="img-fluid rounded-circle" style="max-width: 125px">
                            </div>
                            <h1><%= listFac.size() %></h1>
                            <h1 class="text-muted text-uppercase"><a href="view_faculties.jsp">Faculties</a></h1>
                        </div>
                    </div>
                </div>


                <!--deparment column-->
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img src="img/corporate.png" alt="deparmentIcon" class="img-fluid rounded-circle" style="max-width: 125px">
                            </div>
                            <h1><%= listDpt.size() %></h1>
                            <h1 class="text-muted text-uppercase"><a href="view_departments.jsp">Departments</a></h1>
                        </div>
                    </div>
                </div>




                <!--employee column-->
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img src="img/employees.png" alt="teacersIcon" class="img-fluid " style="max-width: 125px">
                            </div>
                            <h1><%= listEmp.size() %></h1>
                            <h1 class="text-muted text-uppercase"> <a href="view-employees.jsp"> Employees </a> </h1>
                        </div>
                    </div>
                </div>



                <!--students column-->
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img src="img/students-cap.png" alt="teacersIcon" class="img-fluid " style="max-width: 125px">
                            </div>
                            <h1><%= listStu.size() %></h1>
                            <h1 class="text-muted text-uppercase"> <a href="view_students.jsp">Students</a></h1>
                        </div>
                    </div>
                </div>



            </div>
            <!--first row ends-->

            <!--second row starts-->


            <div class="row mt-2">

                <!--faculty column-->
                <div class="col-md-3">
                    <div class="card" >

                        <div class="card-body text-center">
                            <div class="container">
                                <img src="img/homework.png" alt="facultiesIcon" class="img-fluid " style="max-width: 125px">
                            </div>
                            <h1 class="text-uppercase "><a href="view_subjects.jsp">Subjects</a></h1>
                        </div>
                    </div>
                </div>


                <!--deparment column-->
                <div class="col-md-3">
                    <div class="card">

                        <div class="card-body text-center">
                            <div class="container">
                                <img src="img/university.png" alt="deparmentIcon" class="img-fluid " style="max-width: 125px">
                            </div>
                            <p class="mt-2 text-muted "><a href="#" data-toggle="modal"  data-target="#departmentModal" >click here to add deparment</a></p>
                            <h1 class="text-uppercase">Add Depart</h1>
                        </div>
                    </div>
                </div>




                <!-- add employee column-->
                <div class="col-md-3">
                    <div class="card">

                        <div class="card-body text-center">
                            <div class="container">
                                <img src="img/homework.png" alt="teacersIcon" class="img-fluid " style="max-width: 125px">
                            </div>
                            <p class="mt-2"><a href="" data-toggle="modal" data-target="#employeeModal">click here to add employee</a></p>
                            <h1 class=" text-uppercase"></h1>
                        </div>
                    </div>
                </div>



                <!--add students column-->
                <div class="col-md-3">
                    <div class="card">

                        <div class="card-body text-center">
                            <div class="container">
                                <img src="img/student.png" alt="teacersIcon" class="img-fluid " style="max-width: 125px">
                            </div>
                            <p class="mt-2 text-muted "><a href="#" data-toggle="modal" data-target="#studentModal" >click here to add student</a></p>
                            <h1 class=" text-uppercase">add Student</h1>
                        </div>
                    </div>
                </div>



            </div>


            <!--second row ends-->





        </div>





    </body>
</html>
