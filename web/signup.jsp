<%-- 
    Document   : signup
    Created on : Feb 4, 2018, 8:49:22 PM
    Author     : abanoub samy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="POST" action="SignUpServlet">
            
            userName:<input type="text" name="username">
            <br><br>
            userEmail:<input type="text" name="userEmail">
            <br><br>
            Password: <input type="text" name="password">
            <br><br>
            address: <input type="text" name="address">
            
            <br><br>
            Date of birth: <input type="text" name="data of birth">
            <br><br>
            gender: <input type="text" name="gender">
            <br><br>
            job: <input type="text" name="job">
            <br><br>
            credit: <input type="text" name="credit">
            <br><br>
            <input type="submit" value="submit">
            
            
            
            
            
            
            
        </form>
        
        
    </body>
</html>
