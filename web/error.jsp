<%-- 
    Document   : error.jsp
    Created on : Oct 25, 2023, 2:24:43 PM
    Author     : doant
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Loi roi!</h1>
        <h2>${requestScope.ERROR}</h2>
    </body>
</html>
