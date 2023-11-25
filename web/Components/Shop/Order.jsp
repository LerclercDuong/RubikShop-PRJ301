<%-- 
    Document   : Order
    Created on : Oct 28, 2023, 3:33:14 AM
    Author     : doant
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .list{
                max-width: 1220px;
                margin: 0 auto;
                min-height: 90vh;
            }
            .order-tag{
                box-shadow: 0 0 1px black;
                margin: 10px 0;
                padding: 20px;
            }
        </style>
    </head>

    <body>
        <div class="list">
            <h2 style="color: var(--green);">Lịch sử giao dịch</h2>
            <ul>

                <c:forEach var="order" items="${requestScope.ORDER_LIST}">
                    <li class="order-tag">
                        <h2>#${order.getOrderID()}</h2>
                        <h3>${order.getUserID()}</h3>
                        <h3>${order.getOrderDate()}</h3>
                        <c:set var="total" value="${0}"/>
                        <br>
                        <h4>Sản phẩm</h4>
                        <c:forEach var="od" items="${order.getOrderDetail()}">
                            <c:set var="total" value="${total + od.getPrice()}"/>
                            <p>${od.getProduct().getProductName()} - ${od.getQuantity()} - <fmt:formatNumber value="${od.getPrice()}" pattern="###,###,###" /> VNĐ</p>
                        </c:forEach>
                        <br>
                        <h4>Tổng tiền: <fmt:formatNumber value="${total}" pattern="###,###,###" /> VNĐ</h4>                
                    </li>
                </c:forEach>
            </ul>


        </div>

    </body>
</html>
