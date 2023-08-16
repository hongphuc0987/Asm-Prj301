<%-- 
    Document   : createUser.jsp
    Created on : 2 thg 6, 2023, 20:33:12
    Author     : tranthihongphuc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="style/loginn.css"/> 
    </head>
    <body>
        <div class="login">
            <h2> Welcome To WebPage</h2>
            <div class="table">
                <form action="MainController" method="POST">

                    <p><input type="text" name="userID" placeholder="Enter UserID" required=""/></p>
                    <p><input type="password" name="password" placeholder="Enter password" required=""/></p>
                    <p><input type="submit" name="action" value="Login" class="button"/></p>
                    <p><input type="reset"  name="reset" value="Reset" class="button"/></p>
                </form>
            </div>
            <p><a href="createUser.jsp" class="create"> Create User</a></p>
        </div>
</body>
</html>
