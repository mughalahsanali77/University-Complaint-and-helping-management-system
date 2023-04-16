<%-- 
    Document   : index
    Created on : Jan 11, 2023, 1:01:45 PM
    Author     : Ahsan
--%>

<%@page import="com.mycompany.ucms.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UCMS : Home</title>
        <%@include file="Components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="Components/navbar.jsp" %>
        <h1>UCMS Home Page</h1>
        
        <%
          out.println(FactoryProvider.getSessionFactory());
                
        %>
    </body>
</html>
