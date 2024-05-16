<%-- 
    Document   : changpass
    Created on : May 16, 2024, 4:21:37 PM
    Author     : DIEN MAY XANH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change pass</title>
    </head>
    <body>
          <h1>Change Password</h1>
    <form method="post" action="ChangPassServlet">
        <input type="hidden" name="user" value="thang">
        <label for="opass">Old Password:</label>
        <input type="password" name="opass" id="opass" required><br>
        
        <label for="pass">New Password:</label>
        <input type="password" name="pass" id="pass" required><br>
        
        <label for="rpass">Confirm New Password:</label>
        <input type="password" name="rpass" id="rpass" required><br>
        
        <input type="submit" value="CHANGE">
    </form>
    
    <c:if test="${not empty ms}">
        <p style="color: red;">${ms}</p>
    </c:if>
    
    <c:if test="${not empty mss}">
        <p style="color: green;">${mss}</p>
    </c:if>
    </body>
</html>
