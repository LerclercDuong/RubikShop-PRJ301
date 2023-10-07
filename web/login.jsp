<%-- 
    Document   : Login
    Created on : Sep 20, 2023, 11:35:01 AM
    Author     : doant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String errorMessage = (String) request.getAttribute("ERROR");
        %>
        
        <h2><%= errorMessage %></h2>
    </body>
</html>
