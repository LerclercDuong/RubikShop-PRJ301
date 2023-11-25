<%-- 
    Document   : Navbar
    Created on : Oct 14, 2023, 12:19:12 PM
    Author     : doant
--%>

<%@page import="Models.User"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            html{
                overflow:hidden;
            }
            body{
                overflow:hidden;
            }
            *{
                box-sizing: border-box;
            }
            .crop{
                padding-left: 10px;
                padding-right: 10px;
            }
            .navbar{
                overflow: hidden;
                background-color:  #0066ff;
                /*box-shadow: 0 0 1px #333;*/
                padding: 5px 10px;
                margin-bottom: 10px;    
            }
            .container{     
                width: 100vw;
            }
            ion-icon{
                --ionicon-stroke-width: 45px;
            }
            table{
                background-color: #fff;
                width: 100%;
                height: 70%;
            }
            .create{
                box-shadow: 0 0 2px black;
                width: 30%;
            }
            .create{
                padding:10px;
            }
            .create input{
                border-radius: 5px;
                border: solid black 1px;
            }
            .user_table{
                background-color: white;
                margin: 0 10px;
                /*box-shadow: 0 0 1px black;*/
                border-radius: 10px;
                height: 80vh;
            }
            .table table{

                width: 50%;
            }
            .user_table input{
                border: solid 1px #cccccc;
            }
            .user_table tr{
                height: 20px;
            }
            button{
                display: flex;
                align-items: center;
            }
            .user-management-bar{
                width: 100%;
                display: inline-flex;
                align-items: center;
                justify-content: space-between;

            }
            user_table_detail{
                width: 100%;

            }
        </style>
    </head>
    <body>
    <c:set var="error" value="${requestScope.ERROR}" />
    <c:set var="loginUser" value="${sessionScope.LOGIN_USER}" />

    <c:choose>
        <c:when test="${empty error}">
            <c:set var="error" value="" />
        </c:when>
    </c:choose>

    <nav class="navbar navbar-light crop">
        <div class="container-fluid p-0">
            <c:if test="${not empty loginUser}">
                <a class="navbar-brand">Welcome! ${loginUser.fullName}</a>
                <form action="MainController" method="POST">
                    <input type="submit" name="action" value="Logout"/>
                </form>
            </c:if>
           
        </div>
    </nav>
</body>
</html>
