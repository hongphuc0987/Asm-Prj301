<%-- 
    Document   : error
    Created on : 26 thg 5, 2023, 20:18:37
    Author     : tranthihongphuc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
        <style>
            h1{
                color: red;
                text-align: center;

            }
        </style>
    </head>
    <body>
<!--        <h1>Error: <%=session.getAttribute("ERROR_LOGIN")%> </h1>-->
        <h1>Error: ${sessionScope.ERROR_LOGIN}</h1>
    </body>
</html>
