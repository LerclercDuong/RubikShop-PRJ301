<%-- 
    Document   : Product
    Created on : Oct 15, 2023, 1:46:13 AM
    Author     : doant
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.List"%>
<%@page import="Models.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <!--<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/css/styles.css" />-->
    </head>
    <body>
        <fmt:formatNumber value="${someNumber}" pattern="###,###,###" />
        <c:set var="current_category" value="${paramValues.category}"/>
        <div class="category-menu">
            <a href="MainController?action=Product&category=&search=${requestScope.SEARCH}"> 
                <div class="category-items">
                    All category
                </div>
            </a>
            <c:forEach var="category" items="${requestScope.CATEGORY}">
                <a href="MainController?action=Product&category=${category.getCategoryName()}&search=${requestScope.SEARCH}"> 
                    <div class="category-items">
                        ${category.getCategoryName()}
                    </div>
                </a>
            </c:forEach>
        </div>
        <section class="section all-products" id="products">
            <div class="top container">
                <div>
                    <c:choose>
                        <c:when test="${empty requestScope.SEARCH}">
                            <h1>All Product</h1>
                        </c:when>
                        <c:otherwise>
                            <h1>Search product: <span style="font-weight: 400;">${requestScope.SEARCH}</span></h1>
                            </c:otherwise>
                        </c:choose>

                </div>

                <form>
                    <select>
                        <option value="1">Defualt Sorting</option>
                        <option value="2">Sort By Price</option>
                        <option value="3">Sort By Popularity</option>
                        <option value="4">Sort By Sale</option>
                        <option value="5">Sort By Rating</option>
                    </select>
                    <span><i class="bx bx-chevron-down"></i></span>
                </form>
            </div>
            <div class="product-center container">


                <c:forEach var="product" items="${requestScope.LIST_PRODUCT}">
                    <div class="product-item">
                        <div class="overlay">
                            <a href="productDetails.html" class="product-thumb">
                                <img src=${product.getImage()} alt="" />
                            </a>
                            <span class="discount">10%</span>
                        </div>
                        <div class="product-info">
                            <span>Quantity: ${product.getUnitInStock()}</span>
                            <a href="productDetails.html">${product.getProductName()}</a>
                            <h4><fmt:formatNumber value="${product.unitPrice}" pattern="###,###,###" /> VNĐ</h4>
                        </div>
                        <ul class="icons">
                            <li><i class="bx bx-heart"></i></li>
                            <li><i class="bx bx-search"></i></li>
                            <li id="addToCartButton" onclick="addToCart(${String.valueOf(product.getProductID())})"><i class="bx bx-cart" ></i></li>
                        </ul>
                    </div>
                </c:forEach>
            </div>
        </section>
        
    </body>
    <script>
        // Assuming you have the productID and quantity variables defined

        const addToCartButton = document.getElementById('addToCartButton');
        function addToCart(productID) {
            fetch("MainController?action=AddCart&productID=" + productID + "&quantity=1")
                    .then(response => {
                        if (response.ok) {
                            // Update the page content or provide a success message to the user
                            // For example, you can display a confirmation message
                            alert('Product added to the cart successfully');
                        } else {
                            // Handle the case where the request was not successful (e.g., show an error message)
                            alert('Failed to add the product to the cart');
                        }
                    })
                    .catch(error => {
                        // Handle any network-related errors
                        console.error('Network error:', error);
                    });
        }


    </script>
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</html>
