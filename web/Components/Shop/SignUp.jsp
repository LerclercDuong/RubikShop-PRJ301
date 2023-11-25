<%-- 
    Document   : SignUp
    Created on : Oct 27, 2023, 10:49:24 PM
    Author     : doant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .errorLine{
                color:red;
            }
        </style>
    </head>
    <body>
    <c:set var="INSERT_ERROR" value="${requestScope.INSERT_ERROR}" />
    <div class="container">
        <div class="login-form">
            <form action="MainController" method="POST">
                <h1>Sign Up</h1>
                <p>
                    Tạo account mới
                </p>
                <label for="userID">User ID</label>
                <input type="text" placeholder="Enter user ID" name="userID" />
                <p class="errorLine">${INSERT_ERROR.getUserIDError()}</p>



                <label for="psw">Password</label>
                <input
                    type="password"
                    placeholder="Enter Password"
                    name="password"
                    required
                    />
                <p class="errorLine">${INSERT_ERROR.getPasswordError()}</p>

                <label for="psw-repeat">Repeat Password</label>
                <input
                    type="password"
                    placeholder="Repeat Password"
                    name="confirm"
                    required
                    />
                <p class="errorLine">${INSERT_ERROR.getConfirmError()}</p>

                <label for="fullName">Full Name</label>
                <input type="text" placeholder="Enter full name" name="fullName" />
                <p class="errorLine">${INSERT_ERROR.getFullNameError()}</p>

                <label for="email">Email</label>
                <input type="text" placeholder="Enter Email" name="email" />

                <label for="phone">Phone</label>
                <input type="text" placeholder="Enter phone number" name="phone" />

                <label>
                    <input
                        type="checkbox"
                        checked="checked"
                        name="remember"
                        style="margin-bottom: 15px"
                        />
                    Remember me
                </label>

                <p>
                    By creating an account you agree to our
                    <a href="#">Terms & Privacy</a>.
                </p>
                <input type="hidden" name="roleID" required value="US" />
                <input type="hidden" name="status" required value="1" />
                <input type="hidden" name="action" value="SignUp"></input>
                <div class="buttons">
                    <button type="button" class="cancelbtn">Cancel</button>
                    <button type="submit" class="signupbtn">Sign Up</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
