<%-- 
    Document   : viewCart
    Created on : 10 thg 6, 2023, 08:41:44
    Author     : tranthihongphuc
--%>

<%@page import="sample.shopping.Fruit"%>
<%@page import="sample.shopping.Cart"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart</title>
        <link rel="stylesheet" href="style/cart.css">
        <c:set var="loginUser" value="${sessionScope.LOGIN_USER}" />
        <c:if test="${empty loginUser }">
            <c:redirect url="login.jsp" />
        </c:if>
    </head>
    <body>
        <div class="viewCart">

            <c:if test="${empty sessionScope.CART}">
                <h1>No item in shopping cart</h1>
            </c:if>

            <c:if test="${not empty sessionScope.CART}">
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Total</th>
                            <th>Update</th>
                            <th>Remove</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="count" value="1" />
                        <c:set var="total" value="0" />

                        <c:forEach items="${sessionScope.CART.cart}" var="fruit">
                            <c:set var="itemTotal" value="${fruit.value.quantity * fruit.value.price}" />
                            <c:set var="total" value="${total + itemTotal}" />

                        <form action="MainController">
                            <tr>
                                <td>${count}</td>
                                <td>
                                    <input type="text" name="id" value="${fruit.value.id}" readonly/>
                                </td>
                                <td>${fruit.value.name}</td>
                                <td>
                                    <input type="number" name="quantity" value="${fruit.value.quantity}"/>
                                </td>
                                <td>${fruit.value.price}</td>
                                <td>${itemTotal}</td>
                                <td>
                                    <input type="submit" name="action" value="Modify"/>
                                </td>
                                <td>
                                    <input type="submit" name="action" value="Remove">
                                </td>
                            </tr>
                        </form>
                        <c:set var="count" value="${count + 1}" />
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <h2>Total Purchase: ${total}</h2>
        </c:if>
        <p><a href="shopping.jsp"class="add">Add more items </a></p>
    </body>
</html>
