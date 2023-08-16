<%-- 
    Document   : createUser.jsp
    Created on : 2 thg 6, 2023, 20:33:12
    Author     : tranthihongphuc
--%>

<%@page import="sample.users.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Page</title>
        <link rel="stylesheet" href="style/createUser.css" >
    </head>
    <body>
        <div class="form">
            <h2>Create New User</h2>
            <c:set var="userError" value="${request.getAttribute('USER_ERROR')}" />
            <c:if test="${empty userError}">
                <c:set var="userError" value="<%= new UserError()%>" />
            </c:if>
            <form action="MainController" method="">
                UserID <input type="text" name="userID" placeholder="UserID must be 5-10c" required=""/><br/>
                ${userError.getUserIDError()}<br/>
                Full Name <input type="text" name="fullName" placeholder="Name must be 5-50c" required=""/><br/>
                ${userError.getFullNameError()}<br/>
                Password <input type="text" name="password" placeholder="Enter your password" required=""/><br/>
                Confirm <input type="text" name="confirm" placeholder="Rewrite your password" required=""/><br/>
                ${userError.getComfirmError()}<br/>
                <input type="submit" name="action" value="Create" class="button"/>
                <input type="reset" value="Reset" class="button"/>
                <p><a href="login.jsp" class="back">Back to login</a></p>
                ${userError.getMessageError()}
            </form>
        </div>
    </body>

</html>
