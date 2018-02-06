<%-- 
    Document   : login
    Created on : Feb 5, 2018, 7:59:25 AM
    Author     : Mayada Saleh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="POST" action="LoginServlet">
            userEmail:<input type="text" name="userEmail">
            <br><br>
            Password: <input type="text" name="password">
            <br><br>
            <input type="submit" value="login">
            
        </form>
        
            
    </body>
</html>
