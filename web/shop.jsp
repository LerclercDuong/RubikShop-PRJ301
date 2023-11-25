<%-- 
    Document   : shop2
    Created on : Oct 27, 2023, 8:53:50 PM
    Author     : doant
--%>

<%@page import="Models.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rubik shop hàng đầu VN</title>
        <link
            href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
            rel="stylesheet"
            />

        <!-- Glide js -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/css/glide.core.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/css/glide.theme.css">
        <!-- Custom StyleSheet -->
        <style>
            <%@ include file="../../css/styles.css"%>
        </style>
    </head>
    <body>
        <c:set var="loginUser" value="${sessionScope.LOGIN_USER}" />
        <c:if test="${loginUser.roleID eq 'AD'}">
            <c:remove var="LOGIN_USER" scope="session" />
        </c:if>

        <c:set var="action" value="${param.action}" />
        <c:choose>
            <c:when test="${empty action}">
                <c:set var="action" value="" />
            </c:when>
        </c:choose>
        <!--header--> 
        <header>
            <%@ include file="/Components/Shop/Header.jsp" %>
        </header>

        <section>
            <c:choose>
                <c:when test="${action eq 'Product'}">
                    <jsp:include page="/Components/Shop/Product.jsp" />
                </c:when>
                <c:when test="${action eq 'Category'}">
                    <jsp:include page="/Components/Shop/Category.jsp" />
                </c:when>
                <c:when test="${action eq 'ViewCart'}">
                    <jsp:include page="/Components/Shop/Cart.jsp" />
                </c:when>
                <c:when test="${action eq 'HomePage' || empty action}">
                    <jsp:include page="/Components/Shop/Home.jsp" />
                </c:when>
                <c:when test="${action eq 'SignUp'}">
                    <jsp:include page="/Components/Shop/SignUp.jsp" />
                </c:when>
                <c:when test="${action eq 'ViewOrder'}">
                    <jsp:include page="/Components/Shop/Order.jsp" />
                </c:when>
            </c:choose>
        </section>
        <!--footer-->
        <footer>
            <%@ include file="/Components/Shop/Footer.jsp" %>
        </footer>

        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

    </body>
</html>
