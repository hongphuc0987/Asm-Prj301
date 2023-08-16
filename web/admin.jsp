<%--
    Document   : admin
    Created on : 26 thg 5, 2023, 21:45:35
    Author     : tranthihongphuc
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="sample.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <c:set var="loginUser" value="${sessionScope.LOGIN_USER}" />
        <c:set var="list" value="${requestScope.LIST_USER}" />

        <c:if test="${empty loginUser or loginUser.roleID ne 'AD'}">
            <c:redirect url="login.jsp" />
        </c:if>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin page</title>
        <link rel="stylesheet" href="style/admin.css"/>
    </head>
    <body>
        <h1>Welcome:${sessionScope.LOGIN_USER.fullName} </h1>
        <c:url var="logoutLink" value="MainController">
            <c:param name="action" value="Logout"></c:param>
        </c:url>
        <div class="button-row">
            <a href="${logoutLink}">LogOut</a>
            <a href="shopping.jsp">Shopping Page</a>
        </div>
        <form action="MainController">
            Search <input type="text" name ="search" value="${param.search}"/>
            <input type="submit" name="action" value="Search"/>
        </form>
        <c:if test="${requestScope.LIST_USER!=null}">
            <c:if test="${not empty requestScope.LIST_USER}">
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>UserID</th>
                            <th>FullName</th>
                            <th>RoleID</th>
                            <th>Password</th>
                            <th>Update</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="dto" varStatus="counter" items="${requestScope.LIST_USER}">
                        <form action="MainController">
                            <tr>
                                <td>${counter.count}</td>
                                <td>${dto.userID}</td>
                                <td>
                                    <input type="text" name="fullName" value="${dto.fullName}"> 
                                </td>
                                <c:if test="${dto.roleID == 'AD'}">
                                    <td>
<!--                                        <input type="hidden" name="roleID" value="${dto.roleID}">-->
                                        <input type="checkbox" name="roleID" value="ON" checked="checked">
                                    </td>
                                </c:if>
                                <c:if test="${dto.roleID == 'US'}">
                                    <td>
<!--                                        <input type="hidden" name="roleID" value="${dto.roleID}">-->
                                        <input type="checkbox" name="roleID" value="null" >
                                    </td>
                                </c:if>



                                <td>${dto.password}</td>

                                <td>
                                    <input type="hidden"  name="userID" value="${dto.userID}">
                                    <input type="hidden" name="search" value="${search}"/>
                                    <input type="submit" name="action" value="Update">
                                </td>
                                <td>
                                    <input type="hidden"  name="userID" value="${dto.userID}">
                                    <input type="submit" name="action" value="Delete">
                                    <input type="hidden" name="search" value="${search}"/>
                                </td>

                            </tr>
                        </form>
                    </c:forEach>
                </tbody>
            </table>


        </c:if>
        <c:if test="${empty requestScope.LIST_USER}">
            NO RECORD FOUND !!!!
        </c:if>
    </c:if>

</body>
</html>


