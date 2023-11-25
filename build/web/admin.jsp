<%-- 
    Document   : admin
    Created on : Sep 27, 2023, 1:44:41 AM
    Author     : doant
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <style>

            html{
                overflow:hidden;
            }
            body{
                overflow:hidden;
            }
            .wrapper{
                width: 100%;
                height: 100vh;
                display: flex;
                justify-content: space-between;
                gap: 0;
            }
            .sidebar{
                width:10%;
            }
            .right-screen{
                background-color: #cccccc;
                flex-basis: 100%;
                overflow-y: scroll;
            }
        </style>
    </head>
    <body>
        <c:set var="userInfo" value="${sessionScope.LOGIN_USER}" />

        <c:if test="${empty userInfo || userInfo.roleID eq 'US'}">
            <c:redirect url="adminLogin.jsp" />         
        </c:if>

        <div class="wrapper">
            <section class="sidebar">
                <jsp:include page="/Components/Admin/Sidebar.jsp" />
            </section>
            <div class="right-screen">
                <section class="navbar">
                    <jsp:include page="/Components/Admin/Navbar.jsp" />
                </section>
                <section class="interface">
                    <jsp:include page="/Components/Admin/UserManagement.jsp" />
                </section>
            </div>
        </div>

        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
