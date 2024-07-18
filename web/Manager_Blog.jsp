<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blog Management</title>
         <link rel="stylesheet" href="assetss/css/app.min.css">
        <link rel="stylesheet" href="assetss/css/style.css">
        <link rel="stylesheet" href="assetss/css/components.css">
        <link rel="stylesheet" href="assetss/css/custom.css">
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
     <div class="loader"></div>
      <div id="app">
      <div class="main-wrapper main-wrapper-1">
      <jsp:include page="header_Manager.jsp" />
      <div class="main-content">
      <section class="section">
      <ul class="breadcrumb breadcrumb-style">
                            <li class="breadcrumb-item">
                                <h4 class="page-title m-b-0">Homes</h4>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="ManagerHomePage">
                                    <i class="fas fa-home"></i></a>
                            </li>
                            <li class="breadcrumb-item">Blog</li>

                        </ul>
       <div class="section-body">
         <div class="row clearfix">
                                      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

      <div class="card">
      <div class="card-body">
      <div class="table-responsive">
   
        <div class="card-header">
                                            <h4>Admin Dashboard</h4>
                                        </div>
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
                <td class="tooool">${blog.link}</td>
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
         </div>
</div>
          </div>
                                          </div>
             </div>
                                            </div>
        </section>
          </div>
      </div>
      </div>
         <div class="settingSidebar">
                                <a href="javascript:void(0)" class="settingPanelToggle"> <i class="fa fa-spin fa-cog"></i>
                                </a>
                                <div class="settingSidebar-body ps-container ps-theme-default">
                                    <div class=" fade show active">
                                        <div class="setting-panel-header">Setting Panel
                                        </div>
                                    </div>
                                    <div class="p-15 border-bottom">
                                        <h6 class="font-medium m-b-10">Sidebar Color</h6>
                                        <div class="selectgroup selectgroup-pills sidebar-color">
                                            <label class="selectgroup-item">
                                                <input type="radio" name="icon-input" value="1"
                                                       class="selectgroup-input select-sidebar">
                                                <span class="selectgroup-button selectgroup-button-icon" data-toggle="tooltip"
                                                      data-original-title="Light Sidebar"><i class="fas fa-sun"></i></span>
                                            </label>
                                            <label class="selectgroup-item">
                                                <input type="radio" name="icon-input" value="2"
                                                       class="selectgroup-input select-sidebar" checked>
                                                <span class="selectgroup-button selectgroup-button-icon" data-toggle="tooltip"
                                                      data-original-title="Dark Sidebar"><i class="fas fa-moon"></i></span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="p-15 border-bottom">
                                        <h6 class="font-medium m-b-10">Color Theme</h6>
                                        <div class="theme-setting-options">
                                            <ul class="choose-theme list-unstyled mb-0">
                                                <li title="white" class="active">
                                                    <div class="white"></div>
                                                </li>
                                                <li title="cyan">
                                                    <div class="cyan"></div>
                                                </li>
                                                <li title="black">
                                                    <div class="black"></div>
                                                </li>
                                                <li title="purple">
                                                    <div class="purple"></div>
                                                </li>
                                                <li title="orange">
                                                    <div class="orange"></div>
                                                </li>
                                                <li title="green">
                                                    <div class="green"></div>
                                                </li>
                                                <li title="red">
                                                    <div class="red"></div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="p-15 border-bottom">
                                        <div class="theme-setting-options">
                                            <label class="m-b-0">
                                                <input type="checkbox" name="custom-switch-checkbox" class="custom-switch-input"
                                                       id="mini_sidebar_setting">
                                                <span class="custom-switch-indicator"></span>
                                                <span class="control-label p-l-10">Mini Sidebar</span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="p-15 border-bottom">
                                        <div class="theme-setting-options">
                                            <label class="m-b-0">
                                                <input type="checkbox" name="custom-switch-checkbox" class="custom-switch-input"
                                                       id="sticky_header_setting">
                                                <span class="custom-switch-indicator"></span>
                                                <span class="control-label p-l-10">Sticky Header</span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="mt-4 mb-4 p-3 align-center rt-sidebar-last-ele">
                                        <a href="#" class="btn btn-icon icon-left btn-primary btn-restore-theme">
                                            <i class="fas fa-undo"></i> Restore Default
                                        </a>
                                    </div>
                                </div>
                            </div>
          <script src="assetss/js/app.min.js"></script>
            <script src="assetss/bundles/jquery-validation/dist/jquery.validate.min.js"></script>
            <!-- JS Libraies -->
            <script src="assetss/bundles/jquery-steps/jquery.steps.min.js"></script>
            <!-- Page Specific JS File -->
            <script src="assetss/js/page/form-wizard.js"></script>
            <!-- Template JS File -->   
            <script src="assetss/js/scripts.js"></script>
            <!-- Custom JS File -->
            <script src="assetss/js/custom.js"></script>
            <script>
                               document.addEventListener('DOMContentLoaded', () => {
                                   let textlimit = document.querySelector('.tooool').textContent;
                                    if(textlimit.length > 10){
                                        textlimit = textlimit.slice(0,28) + '...';
                                        console.log(textlimit);
                                    }else{
                                        textlimit = textlimit;
                                    }                   
    });

            </script>
    </body>
</html>
