<%-- 
    Document   : AdminDashbroad
    Created on : Jun 24, 2024, 11:42:21 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="assetss/css/app.min.css">
        <link rel="stylesheet" href="assetss/css/style.css">
        <link rel="stylesheet" href="assetss/css/components.css">
        <link rel="stylesheet" href="assetss/css/custom.css">
    <style>
      body {
        background-color: #f9f9f9;
        color: #333;
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
      }

      .dashboard {
        padding: 20px;
      }

      h1 {
        text-align: center;
        color: #333;
      }

      .accounts-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      }

      .accounts-table th,
      .accounts-table td {
        padding: 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
      }

      .accounts-table th {
        background-color: #f1f1f1;
      }

      .disable-btn {
        background-color: #ff4c4c;
        color: #fff;
        border: none;
        padding: 10px 20px;
        cursor: pointer;
        border-radius: 5px;
      }

      .disable-btn:hover {
        background-color: #ff1c1c;
      }

      .popup {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        justify-content: center;
        align-items: center;
      }

      .popup-content {
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        text-align: center;
        width: 400px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      }

      .close-btn {
        float: right;
        font-size: 24px;
        cursor: pointer;
        color: #333;
      }

      textarea {
        width: 100%;
        padding: 10px;
        border-radius: 5px;
        border: 1px solid #ddd;
        margin-top: 10px;
        background-color: #fff;
        color: #333;
      }

      .submit-btn {
        background-color: #4caf50;
        color: #fff;
        border: none;
        padding: 10px 20px;
        margin-top: 10px;
        cursor: pointer;
        border-radius: 5px;
      }

      .submit-btn:hover {
        background-color: #45a049;
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
                            <li class="breadcrumb-item">Active</li>

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
       
     <table class="accounts-table">
    <thead>
        <tr>
            <th>STT</th>
            <th>Name</th>
            <th>Role</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="account" items="${accounts}" varStatus="status">
            <tr>
                <td>${status.index + 1}</td>
                <td>${account.fullName}</td>
                <td>
                    <c:choose>
                        <c:when test="${account.roleId == 1}">
                            Mentee
                        </c:when>
                        <c:when test="${account.roleId == 2}">
                            Mentor
                        </c:when>
                    </c:choose>
                </td>
                <td>${account.statusId == 1 ? 'Enabled' : 'Disabled'}</td>
                <td>
                    <form action="accountstatus" method="post" style="display:inline;">
                        <input type="hidden" name="userName" value="${account.userName}">
                        <input type="hidden" name="newStatus" value="${account.statusId == 1 ? 2 : 1}">
                        <button type="submit">
                            ${account.statusId == 1 ? 'Disable' : 'Enable'}
                        </button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
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
    <div id="popup" class="popup">
      <div class="popup-content">
        <span class="close-btn" onclick="closePopup()">&times;</span>
        <h2>Disable Account</h2>
        <textarea id="reason" rows="4"></textarea>
        <button class="submit-btn" onclick="disableAccount()">Submit</button>
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
      function showPopup(menteeId) {
        document.getElementById("popup").style.display = "flex";
        document.getElementById("popup").dataset.menteeId = menteeId;
      }

      function closePopup() {
        document.getElementById("popup").style.display = "none";
        document.getElementById("reason").value = "";
      }

      function disableAccount() {
        const menteeId = document.getElementById("popup").dataset.menteeId;
        const reason = document.getElementById("reason").value;

        if (reason.trim() === "") {
          alert("Please provide a reason for disabling the account.");
          return;
        }

        console.log(`Disabling account `+menteeId `for reason: `+reason);

        closePopup();
      }
    </script>
  </body>
</html>

