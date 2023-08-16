<%-- 
    Document   : user
    Created on : 26 thg 5, 2023, 21:50:26
    Author     : tranthihongphuc
--%>

<%@page import="sample.users.UserDTO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Page</title>
    <c:set var="loginUser" value="${sessionScope.LOGIN_USER}" />
    <c:set var="list" value="${requestScope.LIST_USER}" />

    <c:if test="${empty loginUser or loginUser.roleID ne 'US'}">
        <c:redirect url="login.jsp" />
    </c:if>
    <link rel="stylesheet" href="style/user.css"/>
</head>
<body>
    <h1>Hello User role : ${sessionScope.LOGIN_USER.fullName} </h1></br>
    <a href="shopping.jsp">Shopping Page</a>
</body>

