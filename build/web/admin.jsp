<%-- 
    Document   : admin
    Created on : Sep 27, 2023, 1:44:41 AM
    Author     : doant
--%>

<%@page import="Models.UserDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <style>
            *{
                box-sizing: border-box;
            }
            .crop{
                padding-left: 5rem;
                padding-right: 5rem;
            }
            .navbar{
                overflow: hidden;
                background-color: #99ccff;
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
                width: 70%;
                box-shadow: 0 0 2px black;
                /*padding: 10px;*/
            }
            .table table{
                width: 50%;
            }
            .wrapper{
                width: 100%;
                gap: 10px;
                /*padding: 10px*/
            }
            button{
                display: flex;
                align-items: center;
            }
            
        </style>
    </head>
    <body>
        <%
            String error = (String) request.getAttribute("ERROR");
            if (error == null) {
                error = "";
            }

            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().equals("AD")) {
                response.sendRedirect("login.html");
            }
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
        <nav class="navbar navbar-light crop">
            <div class="container-fluid p-0">
                <a class="navbar-brand">Welcome! <%= loginUser.getFullName()%></a>
                <form action="MainController" method="POST">
                    <input type="submit" name="action" value="Logout"/>
                </form>
                <form class="d-flex" action="MainController">
                    <input class="form-control me-2" name="search" type="text" value="<%= search%>" aria-label="Search" placeholder="Search ten user">
                    <input type="submit" name="action" value="Search" class="btn btn-outline-success">
                    <!--<button class="btn btn-outline-success" type="submit">Search</button>-->
                </form>
            </div>
        </nav>
        <div class="wrapper crop d-flex justify-content-between">
            <div class="create">
                <h4>Create new user</h4>
                <form method="POST" action="MainController">
                    <button type="submit" class="btn btn-primary mt-2 mb-2"><ion-icon name="add-outline"></ion-icon>New</button><br/>
                    <label>UserID</label><br>
                    <input type="text" name="userID" required><br/>
                    <label>Password</label><br>
                    <input type="password" name="password" required><br/>
                    <label>Confirm Password</label><br>
                    <input type="password" name="confirm" required><br/>
                    <label>Full name</label><br>
                    <input type="text" name="fullName" required></input><br>
                    <label>Role ID</label><br>
                    <input type="text" name="roleID" readonly="" value="US" required></input><br>
                    <label>Status</label><br>
                    <input type="text" name="status" required></input><br>
                    <input type="hidden" name="action" value="Insert"></input><br>
                    <input type="hidden" name="search" value="<%=search%>"/>
                </form>

            </div>
            <%
                List<UserDTO> listUser = (List<UserDTO>) request.getAttribute("LIST_USER");
                if (listUser != null && !listUser.isEmpty()) {
            %>
            <%
                int total = listUser.size();
            %>
            <div class="user_table">
                <div>
                    <h6><%= error%></h6>
                </div>
                <h4><%=total%> User were found</h4>

                <div class="d-flex justify-content-around table">
                    <table border="1">
                        <tr>
                            <th class="text-center" style="background-color: #99ccff;">User ID</th>
                            <th class="text-center" style="background-color: #99ccff;">Full Name</th>
                            <th class="text-center" style="background-color: #99ccff;">Role ID</th>
                            <th class="text-center" style="background-color: #F2F07E;">Options</th>
                        </tr>
                        <% for (UserDTO user : listUser) {%>
                        <tr style="height: 6vh; border-bottom-width: 0.8px; border-bottom-color: rgb(222, 226, 230);">
                        <form action="MainController" method="POST">

                            <td class="px-3">
                                <input type="text" name="userID" value="<%= user.getUserID()%>"/>
                            </td>
                            <td class="px-1">
                                <input type="text" name="fullName" value="<%= user.getFullName()%>"/>
                            </td>
                            <td class="px-5">
                                <input type="text" name="roleID" value="<%= user.getRoleID()%>"/>
                            </td>
                            <td>
                                <div style="display: flex; min-width: 10vw; justify-content: space-evenly; height: 2rem;">
                                    <input class="btn btn-primary" type="submit" name="action" value="Update" placeholder="Update"/>
                                    <input type="hidden" name="userID" value="<%= user.getUserID()%>"/>
                                    <input type="hidden" name="search" value="<%=search%>"/>
                                    <!--<a class="btn btn-primary" onclick="" ><ion-icon name="create-outline"></ion-icon></a>-->
                                    <a onclick="doDelete('<%= user.getUserID()%>')" class="btn btn-danger" href="#"><ion-icon name="trash-outline"></ion-icon></a>
                                </div>
                            </td>
                        </form>
                        </tr>   

                        <% } %>
                    </table>
                </div>
                <%
                    }
                %>
            </div>
            <%= error%>
        </div>
        <script type="text/javascript">
            function doDelete(e) {
                if (confirm("Dong y xoa user nay")) {
                    window.location = "MainController?userID=" + e + "&action=Delete&search=" + "<%= search%>";
                }
            }
        </script>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
