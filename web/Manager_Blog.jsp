<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blog Management</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
                background-color: #f4f4f4;
            }
            h1, h2 {
                color: #333;
            }
            form {
                background-color: #fff;
                padding: 20px;
                margin-bottom: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            label {
                display: block;
                margin-bottom: 8px;
                font-weight: bold;
            }
            input[type="file"],
            input[type="text"],
            input[type="submit"] {
                display: block;
                margin-bottom: 10px;
                padding: 10px;
                width: 100%;
                max-width: 400px;
                border-radius: 3px;
                border: 1px solid #ccc;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }
            table, th, td {
                border: 1px solid #ccc;
            }
            th, td {
                padding: 10px;
                text-align: left;
            }
            th {
                background-color: #f8f8f8;
            }
            img {
                max-width: 100px;
                height: auto;
            }
            .actions form {
                display: inline-block;
            }
            .actions input[type="submit"] {
                width: auto;
                background-color: #4CAF50;
                color: white;
                border: none;
                cursor: pointer;
                padding: 8px 16px;
                margin: 5px 0;
            }
            .actions input[type="submit"]:hover {
                background-color: #45a049;
            }
            .actions form:nth-child(2) input[type="submit"] {
                background-color: #f44336;
            }
            .actions form:nth-child(2) input[type="submit"]:hover {
                background-color: #e53935;
            }
        </style>
    </head>
    <body>
        <h1>Blog Management</h1>

        <!-- Form for Create Blog -->
        <h2>Create Blog</h2>
        <form action="ManagerBlog" method="post" enctype="multipart/form-data">
            <label for="createImg">Upload Image:</label>
            <input type="file" name="img" id="createImg" required><br><br>
            <label for="createLink">Link:</label>
            <input type="text" name="link" id="createLink" required><br><br>
            <input type="submit" value="Create Blog">
        </form>

        <!-- Table for displaying, updating, and deleting blogs -->
        <h2>Manage Blogs</h2>
<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Image</th>
            <th>Link</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${requestScope.blog}" var="blog">
            <tr>
                <td>${blog.blogId}</td>
                <td><img src="uploads/${blog.img}" alt="Blog Image"></td>
                <td>${blog.link}</td>
                <td>${blog.status ? 'Enabled' : 'Disabled'}</td>
                <td class="actions">
                    <!-- Form for Update Blog -->
                    <form action="UpdateBlog" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="blogId" value="${blog.blogId}">
                        <input type="file" name="img"><br>
                        <input type="text" name="link" value="${blog.link}" required><br>
                        <div>
                            <label for="status" class="form-label">Status:</label>
                            <select class="form-control" id="status" name="status">
                                <option value="true" ${blog.status ? 'selected' : ''}>Enable</option>
                                <option value="false" ${!blog.status ? 'selected' : ''}>Disable</option>
                            </select>
                        </div>
                        <input type="submit" value="Update">
                    </form>

                    <!-- Form for Delete Blog -->
                    <form action="EditBlog" method="get">
                        <input type="hidden" name="blogId" value="${blog.blogId}">
                        <input type="submit" value="Delete">
                    </form>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
        <div>${errorMessage}</div>
    </body>
</html>
