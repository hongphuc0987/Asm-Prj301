<%-- 
    Document   : shopping
    Created on : 9 thg 6, 2023, 21:37:38
    Author     : tranthihongphuc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.shopping.Fruit"%>
<%@page import="java.util.List"%>
<%@page import="sample.users.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fruit Farm</title>
        <link rel="stylesheet" href="style/shoppingg.css"/>
        <c:set var="loginUser" value="${sessionScope.LOGIN_USER}" />
        <c:if test="${empty loginUser }">
            <c:redirect url="login.jsp" />
        </c:if>
    </head>
    <body>

        <c:set var="list"  value="<%= new UserDAO().getListFruit()%>"/>


        <h1>Welcome to Fruit Farm</h1>
        <form action="MainController" method="GET">

            Choose Fruit:
            <select name="fruit">

                <c:forEach var="item" varStatus="counter" items="${list}">

                    <option value="${item}">${item.getName()}</option>
                </c:forEach>



            </select>
            <input  type="number" name="quantity" value ="1"/>
            <input  type="submit" name="action" value="Add to cart"/></br>
            <input  type ="submit" name="action" value="View Cart"/>
        </form>
        <%
            String message = (String) request.getAttribute("SHOPPING_MESSAGE");
            if (message == null) {
                message = "";
            }
        %>
        <h2 ><%= message%></h2>
        <c:set var="message" value="${requestScope.SHOPPING_MESSAGE}"/>
        
        <c:set var="loginUser" value="${sessionScope.LOGIN_USER}" />
        <c:if test="${not empty loginUser and loginUser.roleID eq 'AD'}">
            <a href="admin.jsp"class="back">Back to admin page</a>
        </c:if>
            
        <c:if test="${not empty loginUser and loginUser.roleID eq 'US'}">
            <a href="user.jsp" class="back">Back to user page</a>
        </c:if>



    </body>
</html>


