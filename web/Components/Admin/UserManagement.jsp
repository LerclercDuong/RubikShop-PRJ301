<%-- 
    Document   : UserManagement
    Created on : Oct 13, 2023, 2:08:59 AM
    Author     : doant
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="Models.User"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <title>JSP Page</title>

        <style>
            a{
                text-decoration: none;
                color: white;
            }
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
                gap: 10px;
            }
            .navbar{
                overflow: hidden;
                background-color: #00cc99;
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

            .user_table{
                background-color: white;
                margin: 0;
                flex-basis: 100%;
                transition: ease-out 1s;
                /*box-shadow: 0 0 1px black;*/
                border-radius: 10px;
                height: 70vh;
            }
            .table table{
                width: 50%;
            }
            .user_table input{
                border: #ccc solid 1px;
                width: 90%;
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
            .hide{
                display: none;
            }
            .error-alert{
                padding: 10px;
                display: flex;
                background-color: #ff3333;
                color: white;
                position: absolute;
                right: 20px;
                top: 10px;
                border-radius: 10px;
            }
            #close-errorLog{
                margin: 0 5px;
                border: none;
                /*background: none;*/
            }

        </style>
    </head>
    <body>
        <c:set var="search" value="${param.search}" />
        <c:choose>
            <c:when test="${empty search}">
                <c:set var="search" value="" />
            </c:when>
            <c:otherwise>
                <c:set var="search" value="${search}" />
            </c:otherwise>
        </c:choose>

        <c:set var="ERROR" value="${requestScope.ERROR}" />

        <c:if test="${not empty ERROR}">
            <div class="error-alert">
                <c:out value="${ERROR}"/>
                <button type="button" id="close-errorLog" onclick="removeErrorLog()">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        </c:if>

        <!-- Your HTML content here -->

        <div class="user-management-bar crop mb-2 mt-2">
            <h4>User Management</h4>
            <div style="display:inline-flex; gap:10px;">
                <form class="d-flex " action="MainController">
                    <input class="form-control me-2" name="search" type="text" value="${search}" aria-label="Search" placeholder="Tìm kiếm user...">
                    <input type="hidden" name="action" value="SearchUser" class="btn btn-outline-success"/>
                    <input type="submit" value="Tìm" class="btn btn-outline-success"/>
                </form>
                <a class="btn btn-outline-success ml-2" href="insertUser.jsp">New</a>
            </div>
        </div>

        <div class="wrapper crop d-flex justify-content-between">

            <div class="user_table crop pt-2">
                <p>${requestScope.LIST_USER.size()} User were found</p>

                <div class="user_table_detail">
                    <table border="0">
                        <tr>
                            <th class="text-left">User ID</th>
                            <th class="text-left">Full Name</th>
                            <th class="text-left">Password</th>    
                            <th class="text-left">Email</th> 
                            <th class="text-left">GoogleID</th> 
                            <th class="text-left">Address</th> 
                            <th class="text-left">Phone</th> 
                            <th class="text-left">Role ID</th>
                            <th class="text-left">Options</th>
                        </tr>
                        <c:forEach var="user" items="${requestScope.LIST_USER}">
                            <tr style="height: 6vh; border: none; border-bottom-color: rgb(222, 226, 230);">
                            <form action="MainController" method="POST">
                                <td class="text-left">
                                    <input type="text" name="userID" value="${user.getUserID()}"/>
                                </td>
                                <td class="text-left">
                                    <input type="text" name="fullName" value="${user.getFullName()}"/>
                                </td>
                                <td class="text-left">
                                    <input type="text" name="password" value="${user.getPassword()}"/>
                                </td>
                                <td class="text-left">
                                    <input type="text" name="email" value="${user.getEmail()}"/>
                                </td>
                                <td class="text-left">
                                    <input type="text" name="googleID" readonly value="${user.getGoogleID()}"/>
                                </td>
                                <td class="text-left">
                                    <input type="text" name="address" value="${user.getAddress()}"/>
                                </td>
                                <td class="text-left">
                                    <input type="text" name="phone" value="${user.getPhone()}"/>
                                </td>
                                <td class="text-left">
                                    <input type="text" readonly name="roleID" value="${user.getRoleID()}"/>
                                </td>
                                <td>
                                    <div style="display: flex; min-width: 10vw; justify-content: flex-start; height: 2rem; gap:10px">
                                        <input class="btn btn-primary" type="submit" name="action" value="UpdateUser" placeholder="Update"/>
                                        <input type="hidden" name="userID" value="${user.getUserID()}"/>
                                        <input type="hidden" name="search" value="${search}"/>
                                        <a onclick="doDelete('${user.userID}')" class="btn btn-danger"><ion-icon name="trash-outline"></ion-icon></a>
                                    </div>
                                </td>
                            </form>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>


        </div>

        <script type="text/javascript">
            function displayCreateUser() {
                const createTable = document.getElementById("create_user");
                if (createTable.classList.value === 'hide') {
                    createTable.classList.remove("hide");
                } else {
                    createTable.classList.add("hide");
                }
            }

            function removeErrorLog() {
                console.log("delete");
                const createTable = document.getElementById("close-errorLog");
            <c:set var="ERROR" value="${''}"/>
            }

            function doDelete(e) {
                if (confirm("Dong y xoa user nay")) {
                    window.location = "MainController?userID=" + e + "&action=DeleteUser&search=" + "${search}";
                }
            }
        </script>
    </body>
</html>
