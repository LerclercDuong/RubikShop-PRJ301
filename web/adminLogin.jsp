<%-- 
    Document   : Login
    Created on : Sep 20, 2023, 11:35:01 AM
    Author     : doant
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login page</title>
        <style>
            .container{
                width: fit-content;
                margin: 2rem auto;
                padding: 2rem;
                box-shadow: 0 0 4px black;
            }
            button{
                border: none;
                box-shadow: 0 0 1px black;
            }
            .social{
                background-color: red;
                text-align: center;
                margin: 10px 0;
            }
            .social a {
                text-decoration: none;
                color: white;
            }
        </style>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    </head>
    <body>

        <c:set var="error" value="${requestScope.ERROR}"/>
        <div class="container">
            <h2 style="color: #00cc99">Login</h2>
            <form action="LoginController" method="post" id="formId">
                <label>User ID</label>
                </br>
                <input type="text" name="userID" required/>
                </br>
                <label>Password</label>
                </br>
                <input type="password" name="password" required/>
                </br>
                </br>
                <button type="reset">Reset</button>
                <div class="g-recaptcha" data-sitekey="6LdRnNYoAAAAACcgcCRkBJ-wlGbJRstrpl1hUZj7"></div>
                <br/>
                <input type="submit" value="Submit">
            </form>
            <p id="error"></p>
            Chưa có account à ? <a href="">Đăng ký</a>
            <br>
            <a href="MainController?action=Shop">Vào shop</a>
        </div>
        ${ERROR}
        <br>
        
        <form action="MainController">
            <input name="action" value="Count"/>
            <button type="submit">Count user</button>
        </form>
        <script>         
            window.onload = function (){
                const form = document.getElementById("formId");
                const error = document.getElementById("error");

                form.addEventListener("submit", function(event){
                    const response = grecaptcha.getResponse();
                    if(!response){
                        event.preventDefault(); // Prevent the form from submitting
                        error.innerHTML = "Chưa xác thực reCAPTCHA";
                    }
                });
            }
        </script>
    </body>
</html>
