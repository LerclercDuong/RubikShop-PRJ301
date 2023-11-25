<%-- 
    Document   : Header
    Created on : Oct 14, 2023, 11:49:13 AM
    Author     : doant
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link
            href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
            rel="stylesheet"
            />
        <!-- Glide js -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/css/glide.core.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/css/glide.theme.css">
        <!-- Custom StyleSheet -->
        <style>
            .avatar-img{
                width: 25px;
                border-radius: 50%;
            }
            .user-login-form{
                line-height: 5rem;
            }
            .user-login-form button{
                height: 40px;
                border: none;
                border-radius: 10px;
                width: 120px;
            }
            .user-login-form button:hover{
                cursor: pointer;
                background-color: var(--green);
                color: white;
            }
            .user-login-form input{
                height: 40px;
                width: 60%;
                border: solid 1px #999999;
                padding: 10px;
                border-radius: 4px;
            }
            .user-login-form label{
                height: fit-content;
            }
            .logout-button{
                color: white;
                border-radius: 5px;
                width: 50%;
                background-color: red;
                transition: ease-in-out all .5s;
                text-align: center;
            }
            .logout-button:hover{
                background-color: #00cc00;
                cursor: pointer;
            }
            .login-google{
                background-color: red;
                padding: 10px;
                color: white;
                border-radius: 5px;
            }
            .user-info-box{
                width: 100%;
                display: inline-flex;
                justify-content: space-between;
                gap: 10px;
                flex-direction: column;
                align-items: center;
                line-height: 4.5rem;
            }
            .userProfile{
                text-align: center;
                font-weight: 600;
                font-size: 24px;
                height: fit-content;
            }
            .userProfile .userpicimg{
                width: 100px;
                border-radius: 50%;            
            }
            .information p{
                height: fit-content;
            }

        </style>
    </head>

    <body>  
        <c:set var="LOGIN_USER" value="${sessionScope.LOGIN_USER}"/>
        <c:set var="CART" value="${sessionScope.CART}"/>
        <header class="header" id="header">
            <!-- Top Nav -->
            <div class="top-nav">
                <div class="container d-flex">
                    <p>Order Online Or Call Us: +84 0869381397</p>
                    <ul class="d-flex">
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">FAQ</a></li>
                        <li><a href="#">Contact</a></li>
                    </ul>
                </div>
            </div>
            <div class="navigation">
                <div class="nav-center container d-flex">
                    <a href="MainController" class="logo"><h1>Rubik shop</h1></a>

                    <ul class="nav-list d-flex">
                        <li class="nav-item">
                            <a href="MainController?action=HomePage" class="nav-link">Home</a>
                        </li>
                        <li class="nav-item">
                            <a href="MainController?action=Product&category=&search=" class="nav-link">Product</a>
                        </li>
                        <li class="nav-item">
                            <a href="#terms" class="nav-link">Terms</a>
                        </li>
                        <li class="nav-item">
                            <a href="#about" class="nav-link">About</a>
                        </li>
                        <li class="nav-item">
                            <a href="#contact" class="nav-link">Contact</a>
                        </li>
                        <li class="icons d-flex">
                            <a class="icon">
                                <i class="bx bx-user"></i>
                            </a>
                            <div class="icon">

                                <i class="bx bx-search"></i>
                            </div>
                            <div class="icon">
                                <i class="bx bx-shopping-bag" ></i>
                                <span class="d-flex">0</span>
                            </div>
                            <a href="MainController?action=ViewCart" class="icon">
                                <i class="bx bx-cart"></i>
                                <span class="d-flex">0</span>
                            </a>
                        </li>
                    </ul>

                    <div class="icons d-flex">
                        <a class="icon">
                            <c:if test="${not empty LOGIN_USER}">
                                <c:if test="${empty LOGIN_USER.userImg}">
                                    <img class="avatar-img" 
                                         src="https://avatars3.githubusercontent.com/u/9384699?s=400&v=4" 
                                         onclick="displayUserInfo()"/>
                                </c:if>
                                <c:if test="${not empty LOGIN_USER.userImg}">
                                    <img class="avatar-img" 
                                         src="${LOGIN_USER.userImg}" 
                                         onclick="displayUserInfo()"/>
                                </c:if>

                            </c:if>
                            <c:choose>
                                <c:when test="${empty LOGIN_USER}">
                                    <i class="bx bx-user" 
                                       onclick="displayUserInfo()"></i>
                                </c:when>
                            </c:choose>
                        </a>
                        <div class="icon">
                            <i class="bx bx-search" 
                               onclick="displaySearchBox()"></i>   
                        </div>
                        <a href="MainController?action=ViewOrder" class="icon">
                            <i class="bx bx-shopping-bag"></i>
                            <!--<span class="d-flex">0</span>-->
                        </a>
                        <a href="MainController?action=ViewCart" class="icon">
                            <i class="bx bx-cart"></i>
                            <c:if test="${not empty CART}">
                                <span class="d-flex">${CART.getCart().size()}</span>
                            </c:if>                         
                        </a>
                    </div>

                    <div class="hamburger">
                        <i class="bx bx-menu-alt-left"></i>
                    </div>
                </div>
                <!--search product popup-->
                <div class="popup hide-popup" id="searchPopUp" 
                     style="display: inline-flex; align-items: center; justify-content: center;">
                    <div class="" style="width: 50%; ">
                        <div class="popup-close">
                            <i class='bx bx-x' onclick="closeSearchBox()"></i>
                        </div>
                        <form action="MainController">
                            <input style="width: 100%; height: 50px; padding: 10px; border-radius: 10px; margin-bottom: 20%; border:none;" placeholder="Tìm kiếm sản phẩm" name="search" value="${requestScope.SEARCH}"/>
                            <input type="hidden" name="action" value="Product"/>
                            <input type="hidden" name="page" value="1"/>
                        </form>

                    </div>
                </div>
                <!--user information popup-->
                <div class="popup hide-popup" id="userInfoPopUp">
                    <div class="popup-content" style="width: 360px; height: 60%;">
                        <div class="popup-close">
                            <i class='bx bx-x' onclick="closeUserInfo()"></i>
                        </div>
                        <div style="height: 100%; ">
                            <!--if logged in show user info-->
                            <c:if test="${not empty LOGIN_USER}">
                                <div class="user-info-box">
                                    <div class="userProfile">
                                        <c:if test="${empty LOGIN_USER.userImg}">
                                            <img src="https://avatars3.githubusercontent.com/u/9384699?s=400&v=4" alt="" class="userpicimg"/> 
                                        </c:if>
                                        <c:if test="${not empty LOGIN_USER.userImg}">
                                            <img src="${LOGIN_USER.userImg}" alt="" class="userpicimg"/> 
                                        </c:if>
                                        <p>${LOGIN_USER.fullName}</p>
                                    </div>
                                    <div class="information">
                                        <p><b>UserID: </b>${LOGIN_USER.userID}</p>
                                        <p><b>FullName: </b>${LOGIN_USER.fullName}</p>
                                        <p><b>Phone: </b>${LOGIN_USER.phone}</p>
                                        <p><b>Address: </b>${LOGIN_USER.address}</p>
                                    </div>

                                    <a href="MainController?action=UserLogout" class="logout-button">Đăng xuất</a>    
                                </div>

                            </c:if>                               
                            <!--if user is not login yet, show login form-->
                            <c:if test="${empty LOGIN_USER}">
                                <h2 style="color: #00cc99">Login</h2>

                                <form action="MainController" method="post" class="user-login-form">
                                    <label>User ID</label>
                                    </br>
                                    <input type="text" name="userID" required/>
                                    </br>
                                    <label>Password</label>
                                    </br>
                                    <input type="password" name="password" required/>
                                    </br>
                                    </br>
                                    <button type="submit" name="action" value="UserLogin">Login</button>
                                    <button type="reset">Reset</button>

                                </form>
                                <a class="login-google" 
                                   href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8084/UserManagement/GoogleLoginController&response_type=code&client_id=855488679914-ufab2lk6mdpu22kmncqtd93sijru1p3l.apps.googleusercontent.com&approval_prompt=force&access_type=offline&include_granted_scopes=true">
                                    Login With Google</a>  <br>
                                Chưa có account à ? <a href="MainController?action=SignUp"> Đăng ký</a>

                            </c:if>

                        </div>
                    </div>
                </div>
            </div>

        </header>

    </body>
    <script type="text/javascript">
        const userInfoPopUp = document.getElementById("userInfoPopUp");
        const searchPopUp = document.getElementById("searchPopUp");
        searchPopUp.classList.remove("popup");
        userInfoPopUp.classList.remove("popup");
        //search box function
        function displaySearchBox() {
            searchPopUp.classList.add("popup")
            searchPopUp.classList.remove("hide-popup")
        }
        function closeSearchBox() {
            searchPopUp.classList.add("hide-popup")
            searchPopUp.classList.remove("popup")
        }
        //user info function
        function displayUserInfo() {
            userInfoPopUp.classList.add("popup")
            userInfoPopUp.classList.remove("hide-popup")
        }
        function closeUserInfo() {
            userInfoPopUp.classList.add("hide-popup")
            userInfoPopUp.classList.remove("popup")
        }
        function onSuccess(googleUser) {
            console.log('Logged in as: ' + googleUser.getBasicProfile().getName());
        }
        function onFailure(error) {
            console.log(error);
        }
        function renderButton() {
            gapi.signin2.render('my-signin2', {
                'scope': 'profile email',
                'width': 240,
                'height': 50,
                'longtitle': true,
                'theme': 'dark',
                'onsuccess': onSuccess,
                'onfailure': onFailure
            });
        }
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/glide.min.js"></script>
    <script src="/js/slider.js"></script>
    <script src="/js/index.js"></script>
</html>
