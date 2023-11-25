<%-- 
    Document   : Cart
    Created on : Oct 14, 2023, 11:26:31 PM
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
            .ship-info input{
                height: 40px;
                padding: 10px;
                border-radius: 5px;
            }
            .payment-info button{
                height: 40px;
                padding: 10px;
                border-radius: 5px;
            }
            .payment-info button:hover{
                color: white;
                background-color: var(--green);
                cursor: pointer;
            }
            .checkout-button{
                box-shadow: 0 0 1px #222;
                transition: ease-in-out 0.3s;
            }
            .checkout-button:hover{
                background-color: green;
                cursor: pointer;
            }
            .payment-method{
                width: 200px;
                display: inline-flex;
                align-items: center;
                gap: 10px;
            }
            .payment-method img{
                width: 100%;
            }
        </style>
    </head>
    <body>
        <c:set var="LOGIN_USER" value="${sessionScope.LOGIN_USER}"/>
        <c:set var="total" value="${0}"/>
        <div class="container cart">
            <table>
                <tr>
                    <th>Product</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Action</th>
                    <th>Subtotal</th>
                </tr>
                <c:forEach var="cart" items="${sessionScope.CART.getCart().values()}">
                    <form action="MainController">
                        <input name="action" value="UpdateCart" type="hidden"/>
                        <input name="productID" value="${cart.getProduct().getProductID()}" type="hidden"/>
                        <tr>
                            <td>
                                <div class="cart-info">
                                    <img src="${cart.getProduct().getImage()}" alt="" />
                                    <div>
                                        <p>${cart.getProduct().getProductName()}</p>
                                        <span></span> <br />
                                        <a href="MainController?action=DeleteCart&productID=${cart.getProduct().getProductID()}">remove</a>
                                    </div>
                                </div>
                            </td>
                            <td><fmt:formatNumber value="${cart.getProduct().getUnitPrice()}" pattern="###,###,###" /> VNĐ</td>
                            <td><input type="number" name="quantity" value="${cart.getQuantity()}" min="1" /></td>
                            <td><button type="submit">Update</button></td>
                            <td> <fmt:formatNumber value="${cart.getQuantity() * cart.getProduct().getUnitPrice()}" pattern="###,###,###" /> VNĐ </td>
                        </tr>  
                    </form>
                    <c:set var="total" value="${total + (cart.quantity * cart.product.unitPrice)}" />
                </c:forEach>
            </table>
            <!-- Your content goes here -->
            <div class="total-price">
                <table>
                    <tr>
                        <td>Total</td>
                        <td><fmt:formatNumber value="${total}" pattern="###,###,###" /> VNĐ</td>
                    </tr>
                </table>
                <c:if test="${not empty LOGIN_USER && not empty sessionScope.CART && sessionScope.CART.getCart().size() > 0}">
                    <button class="checkout btn checkout-button" onclick="displayCheckOut()" style="border: none;">Thanh toán</button>
                </c:if>
                <c:if test="${empty LOGIN_USER}">
                    <br>
                    <p>Vui lòng đăng nhập để hoàn tất thanh toán</p>

                </c:if>
                <c:if test="${empty sessionScope.CART || sessionScope.CART.getCart().size() eq 0 }">
                    <br>
                    <p>Giỏ hàng trống, vui lòng thêm sản phẩn</p>
                </c:if>

                <!--<a href="MainController?action=CreateOrder">test checkout</a>-->
            </div>
        </div>
        <div class="hide-popup" id="checkOutPopUp">

            <div class="popup-content">
                <form class=""
                      action="MainController" 
                      method="POST">
                    <div class="popup-close">
                        <i class='bx bx-x' onclick="closeCheckOut()"></i>
                    </div>
                    <div class="popup-left">
                        <div class="left-content ship-info" style="display: flex; flex-direction: column; gap: 10px; width:420px; justify-content: flex-start;">
                            <h3>Nhập thông tin nhận hàng</h3>
                            <input type="text" name="fullName" required placeholder="Nhập họ tên..." value="${LOGIN_USER.fullName}" />
                            <input type="email" name="email" required placeholder="Nhập email..." value="${LOGIN_USER.email}" />
                            <input type="text" name="address" required placeholder="Nhập địa chỉ..." value="${LOGIN_USER.address}" />
                            <input type="text" name="phone" required placeholder="Nhập số điện thoại" value="${LOGIN_USER.phone}" />
                        </div>
                    </div>
                    <div class="popup-right">
                        <div class="right-content payment-info" 
                             style="display: flex; flex-direction: column; gap: 10px; justify-content: flex-start; ">
                            <div class="payment-method">
                                <img src="https://cdn.haitrieu.com/wp-content/uploads/2022/10/Logo-ZaloPay-2s.png"/>
                                <input type="radio" name="method"  required value="ZaloPay">
                            </div>

                            <div class="payment-method">
                                <img src="https://cdn-icons-png.flaticon.com/512/3796/3796142.png"/>
                                <input type="radio" name="method"  required value="COD">
                            </div>
                            <input type="hidden" name="totalCost"  value="${total}">
                            <input type="hidden" name="action"  value="CheckOut">
                            <td>Tổng tiền:</td>
                            <td><fmt:formatNumber value="${total}" pattern="###,###,###" /> VNĐ</td>
                            <button type="submit">Thanh toán</button>

                        </div>
                    </div>
                </form>

            </div>

        </div>
    </body>
    <script type="text/javascript">
        const checkOutPopUp = document.getElementById("checkOutPopUp");
        checkOutPopUp.classList.remove("popup");
        function displayCheckOut() {
            checkOutPopUp.classList.add("popup")
            checkOutPopUp.classList.remove("hide-popup")
        }
        function closeCheckOut() {
            checkOutPopUp.classList.add("hide-popup")
            checkOutPopUp.classList.remove("popup")
        }
    </script>
</html>
