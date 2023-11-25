<%-- 
    Document   : Home
    Created on : Oct 14, 2023, 11:53:44 PM
    Author     : doant
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link
            href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
            rel="stylesheet"
            />
        <!-- Glide js -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/css/glide.core.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/css/glide.theme.css">
        <style>
            <%@ include file="../../css/styles.css"%>
        </style>
    </head>
    <body>

        <%--<c:set var="CATEGORY_LIST" value="${requestScope.CATEGORY}"/>--%>
        <%--<c:set var="PRODUCT_LIST" value="${requestScope.PRODUCT}"/>--%>
        <div class="hero">
            <div class="glide" id="glide_1">
                <div class="glide__track" data-glide-el="track">
                    <ul class="glide__slides">
                        <li class="glide__slide">
                            <div class="center">
                                <div class="left">
                                    <span class="">New Inspiration 2020</span>
                                    <h1 class="">NEW COLLECTION!</h1>
                                    <p>Trending from men's and women's  style collection</p>
                                    <a href="#" class="hero-btn">SHOP NOW</a>
                                </div>
                                <div class="right">
                                    <img class="img1" src="https://www.gancube.com/wp-content/themes/chtemp/static/GAN356AIRM/images/img1.png" alt="">
                                </div>
                            </div>
                        </li>
                        <li class="glide__slide">
                            <div class="center">
                                <div class="left">
                                    <span>New Inspiration 2020</span>
                                    <h1>THE PERFECT MATCH!</h1>
                                    <p>Trending from men's and women's  style collection</p>
                                    <a href="#" class="hero-btn">SHOP NOW</a>
                                </div>
                                <div class="right">
                                    <img class="img2" src="https://toyster.sg/cdn/shop/files/GAN12MaglevPhoto-1_1200x1200.png?v=1687281081" alt="">
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <section class="section category">
            <div class="title">
                <h1>DANH MỤC</h1>
                <p>All the latest picked from designer of our store</p>
            </div>
            <div class="cat-center">
                <c:forEach var="category" items="${requestScope.CATEGORY}">
                    <a href="MainController?action=Product&category=${category.getCategoryName()}&search=">
                        <div class="cat">
                            <img src="${category.categoryImage}" style="width: 100%;" alt="" />
                            <div class="cat-name">
                                <p>${category.categoryName}</p>
                            </div>
                        </div> 
                    </a>

                </c:forEach>


            </div>
        </section>
        <section class="section new-arrival">
            <div class="title">
                <h1>NEW ARRIVALS</h1>
                <p>All the latest picked from designer of our store</p>
            </div>

            <div class="product-center">
                <c:forEach items = "${requestScope.PRODUCT}" var="product" begin="0" end="7">
                    <div class="product-item">
                        <div class="overlay">
                            <a href="productDetails.html" class="product-thumb">
                                <img src="${product.getImage()}" alt="" />
                            </a>
                        </div>
                        <div class="product-info">
                            <span>Quantity: ${product.getUnitInStock()}</span>
                            <a href="productDetails.html">${product.getProductName()}</a>
                            <h4> <fmt:formatNumber value="${product.getUnitPrice()}" pattern="###,###,###" /> VNĐ</h4>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/glide.min.js"></script>
    <script src="./js/slider.js"></script>
    <script src="./js/index.js"></script>
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
</html>
