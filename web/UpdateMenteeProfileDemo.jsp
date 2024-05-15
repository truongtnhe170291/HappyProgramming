<%-- 
    Document   : UpdateMenteeProfile
    Created on : 15 May 2024, 9:59:18 pm
    Author     : 2k3so
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="UpdateMenteeProfile" method="post">
            <table>
                <tr>
                    <td>Avatar</td>
                    <td><input type="file" name="avatar" value="${mentee}" accept="image/*" /></td>
                </tr>
                <tr>
                    <td>Gmail</td>
                    <td><input type="text" name="gmail" value="${mentee.gmail}" readonly /></td>
                </tr>
                <tr>
                    <td>User Name</td>
                    <td><input type="text" name="username" value="${mentee.userName}" /></td>
                </tr>
                <tr>
                    <td>Full Name</td>
                    <td><input type="text" name="fullname" value="${mentee.fullName}" /></td>
                </tr>
                <tr>
                    <td>DOB</td>
                    <td><input type="text" name="dob" value="${mentee.dob}" /></td>
                </tr>
                <tr>
                    <td>Sex</td>
                    <td><input type="text" name="sex" value="${mentee.sex}" /></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><input type="text" name="address" value="${mentee.address}" /></td>
                </tr>
                <tr>
                    <td>Phone</td>
                    <td><input type="text" name="phone" value="${mentee.phone}" readonly /></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Update" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>
