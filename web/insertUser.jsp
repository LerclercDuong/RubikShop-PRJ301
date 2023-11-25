<%-- 
    Document   : insertUser
    Created on : Oct 27, 2023, 4:53:04 PM
    Author     : doant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <style>
            #create_user{
                margin: 0 auto;
                border-radius: 10px;
                width: 50%;
                padding:10px;
                background-color: white;
                height: fit-content;
            }
            #create_user input{
                width: 80%;
                border-radius: 5px;
                border: solid #cccccc 1px;
            }
            .errorLine{
                color: red;
            }
        </style>
    </head>
    <body>
        
        <a href="MainController?search=&action=SearchUser">Quay về trang Admin</a>
        <c:set var="INSERT_ERROR" value="${requestScope.INSERT_ERROR}" />
        <div id="create_user" class="">
            <h2>Create new user</h2>
            <form method="POST" action="MainController">
                <label>UserID</label><br>
                <input type="text" name="userID" required><br/>
                <p class="errorLine">${INSERT_ERROR.getUserIDError()}</p>
                <label>Password</label><br>
                <input type="password" name="password" required><br/>
                <p class="errorLine">${INSERT_ERROR.getPasswordError()}</p>
                <label>Confirm Password</label><br>
                <input type="password" name="confirm" required><br/>
                <p class="errorLine">${INSERT_ERROR.getConfirmError()}</p>
                <label>Full name</label><br>
                <input type="text" name="fullName" required></input><br>
                <p class="errorLine">${INSERT_ERROR.getFullNameError()}</p>
                <label>Email</label><br>
                <input type="text" name="email" ></input><br>
                <label>Address</label><br>
                <input type="text" name="address" ></input><br>
                <label>Phone</label><br>
                <input type="text" name="phone" ></input><br>
                <label>Role ID</label><br>
                <input type="text" name="roleID" readonly="" value="US" required></input><br>
                <label>Status</label><br>
                <input type="text" name="status" value="1" required></input><br>
                <input type="hidden" name="action" value="InsertUser"></input><br>
                <input type="hidden" name="search" value="${search}"/>
                <button type="submit" class="btn btn-primary mt-2 mb-2"><ion-icon name="add-outline"></ion-icon>New</button><br/>
            </form>
        </div>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
