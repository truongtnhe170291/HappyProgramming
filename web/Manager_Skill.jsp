<%-- 
    Document   : Manager_Skill
    Created on : Jun 16, 2024, 5:28:11 PM
    Author     : DIEN MAY XANH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Manager_Skill</title>

    <link rel="stylesheet" href="assetss/css/app.min.css">
        <link rel="stylesheet" href="assetss/css/style.css">
        <link rel="stylesheet" href="assetss/css/components.css">
        <link rel="stylesheet" href="assetss/css/custom.css">
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <style>
        </style>
  </head>
  <body>
      <div class="loader"></div>
        <div id="app">
            <div class="main-wrapper main-wrapper-1">
                <div class="navbar-bg"></div>
                <nav class="navbar navbar-expand-lg main-navbar sticky">
                    <div class="form-inline mr-auto">
                        <ul class="navbar-nav mr-3">
                            <li><a href="#" data-toggle="sidebar" class="nav-link nav-link-lg
                                   collapse-btn"> <i data-feather="align-justify"></i></a></li>
                            <li><a href="#" class="nav-link nav-link-lg fullscreen-btn">
                                    <i data-feather="maximize"></i>
                                </a></li>
                            <li>
                                <form class="form-inline mr-auto">
                                    <div class="search-element">
                                        <input class="form-control" type="search" placeholder="Search" aria-label="Search" data-width="200">
                                        <button class="btn" type="submit">
                                            <i class="fas fa-search"></i>
                                        </button>
                                    </div>
                                </form>
                            </li>
                        </ul>
                    </div>
                    <ul class="navbar-nav navbar-right">

                        <li class="dropdown dropdown-list-toggle"><a href="#" data-toggle="dropdown"
                                                                     class="nav-link notification-toggle nav-link-lg"><i data-feather="bell" class="bell"></i>
                            </a>
                            <div class="dropdown-menu dropdown-list dropdown-menu-right pullDown">
                                <div class="dropdown-header">
                                    Notifications
                                    <div class="float-right">
                                        <a href="#">Mark All As Read</a>
                                    </div>
                                </div>
                                <div class="dropdown-footer text-center">
                                    <a href="#">View All <i class="fas fa-chevron-right"></i></a>
                                </div>
                            </div>
                        </li>
                        <li class="dropdown"><a href="#" data-toggle="dropdown"
                                                class="nav-link dropdown-toggle nav-link-lg nav-link-user"> <img alt="image" src="assetss/img/user.png"
                                                                                             class="user-img-radious-style"> <span class="d-sm-none d-lg-inline-block"></span></a>
                            <div class="dropdown-menu dropdown-menu-right pullDown">
                                <div class="dropdown-title">Hello Sarah Smith</div>
                                <div class="dropdown-divider"></div>
                                <a href="auth-login.html" class="dropdown-item has-icon text-danger"> <i class="fas fa-sign-out-alt"></i>
                                    Logout
                                </a>
                            </div>
                        </li>
                    </ul>
                </nav>
                <div class="main-sidebar sidebar-style-2">
                    <aside id="sidebar-wrapper">

                        <ul class="sidebar-menu">
                            <li class="menu-header">Main</li>
                            <li class="dropdown active">
                                <a href="#" class="menu-toggle nav-link has-dropdown"><i
                                        data-feather="monitor"></i><span>Dashboard</span></a>
                                <ul class="dropdown-menu">
                                    <li class="active"><a class="nav-link" href="Homes_manager.jsp">Dashboard 1</a></li>
                                </ul>
                            </li>
                            <li class="menu-header">Request</li>
                            <li class="dropdown">
                                <a href="#" class="menu-toggle nav-link has-dropdown"><i data-feather="layout"></i><span>CV Management</span></a>
                                <ul class="dropdown-menu">
                                    <li><a class="nav-link" href="listCV">List CV</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="menu-toggle nav-link has-dropdown"><i data-feather="layout"></i><span>Schedule Management</span></a>
                                <ul class="dropdown-menu">
                                    <li><a class="nav-link" href="HandleSlotMentor">Schedule</a></li>
                                </ul>
                            </li>

                        </ul>
                    </aside>
                </div>
                <div class="main-content">
                    <section class="section">
                        <ul class="breadcrumb breadcrumb-style ">
                            <li class="breadcrumb-item">
                                <h4 class="page-title m-b-0">Homes</h4>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="Homes_manager.jsp">
                                    <i class="fas fa-home"></i></a>
                            </li>
                            <li class="breadcrumb-item">Schedule</li>

                        </ul>
                        <div class="section-body">
                            <div class="row clearfix">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="card">
                                        <div class="container">
      <div class="header">
        <h1>Manage Employees</h1>
        <div class="buttons">
          <button class="delete-btn">Delete</button>
          <button class="add-btn">Add New Employees</button>
        </div>
      </div>
      <table>
        <thead>
          <tr>
            <th><input type="checkbox" id="selectAll" /></th>
            <th>STT</th>
            <th>ID</th>
            <th>Name</th>
            <th>Status</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><input type="checkbox" /></td>
            <td><img src="src" alt="alt" /></td>
            <td>1</td>
            <td>Java</td>
            <td><span class="status enable">Enable</span></td>
            <td class="actions">
              <button class="edit-btn">✏️</button>
              <button class="delete-btn">🗑️</button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <!-- edit ở đây -->
    <div id="editPopup" class="popup">
      <div class="popup-content">
        <h2>Edit Skill</h2>
        <form id="editForm">
          <label for="editName">Name:</label>
          <input type="text" id="editName" required />

          <label for="editStatus">Status:</label>
          <select id="editStatus">
            <option value="enable">Enable</option>
            <option value="disable">Disable</option>
          </select>

          <div class="popup-buttons">
            <button type="submit">Save</button>
            <button type="button" id="closePopup">Cancel</button>
          </div>
        </form>
      </div>
    </div>
    <!-- add ở đây -->
    <div id="addPopup" class="popup">
      <div class="popup-content">
        <h2>Add New Skill</h2>
        <form id="addForm">
          <label for="addName">Name:</label>
          <input type="text" id="addName" required />

          <label for="addStatus">Status:</label>
          <select id="addStatus">
            <option value="enable">Enable</option>
            <option value="disable">Disable</option>
          </select>

          <div class="popup-buttons">
            <button type="submit">Add</button>
            <button type="button" id="closeAddPopup">Cancel</button>
          </div>
        </form>
      </div>
    </div>
                                    </div>
                                    </div>
                                        </div>
                                    </div>
                        </section>
                    <div class="settingSidebar">
                        <a href="javascript:void(0)" class="settingPanelToggle"> <i class="fa fa-spin fa-cog"></i>
                        </a>
                        <div class="settingSidebar-body ps-container ps-theme-default">
                            <div class=" fade show active">
                                <div class="setting-panel-header">Setting Panel
                                </div>
                                <div class="p-15 border-bottom">
                                    <h6 class="font-medium m-b-10">Select Layout</h6>
                                    <div class="selectgroup layout-color w-50">
                                        <label class="selectgroup-item">
                                            <input type="radio" name="value" value="1" class="selectgroup-input-radio select-layout" checked>
                                            <span class="selectgroup-button">Light</span>
                                        </label>
                                        <label class="selectgroup-item">
                                            <input type="radio" name="value" value="2" class="selectgroup-input-radio select-layout">
                                            <span class="selectgroup-button">Dark</span>
                                        </label>
                                    </div>
                                </div>
                                <div class="p-15 border-bottom">
                                    <h6 class="font-medium m-b-10">Sidebar Color</h6>
                                    <div class="selectgroup selectgroup-pills sidebar-color">
                                        <label class="selectgroup-item">
                                            <input type="radio" name="icon-input" value="1" class="selectgroup-input select-sidebar">
                                            <span class="selectgroup-button selectgroup-button-icon" data-toggle="tooltip"
                                                  data-original-title="Light Sidebar"><i class="fas fa-sun"></i></span>
                                        </label>
                                        <label class="selectgroup-item">
                                            <input type="radio" name="icon-input" value="2" class="selectgroup-input select-sidebar" checked>
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
                <script>
               document.addEventListener("DOMContentLoaded", function () {
                // Select all checkboxes
                const selectAllCheckbox = document.querySelector("#selectAll");
                const checkboxes = document.querySelectorAll('tbody input[type="checkbox"]');
                selectAllCheckbox.addEventListener("change", function () {
                  checkboxes.forEach(checkbox => checkbox.checked = selectAllCheckbox.checked);
                });
                checkboxes.forEach(checkbox => {
                  checkbox.addEventListener("change", function () {
                    if (!this.checked) {
                      selectAllCheckbox.checked = false;
                    }
                  });
                });
                // Edit button functionality
                const editButtons = document.querySelectorAll(".edit-btn");
                const editPopup = document.querySelector("#editPopup");
                const editNameInput = document.querySelector("#editName");
                const editStatusInput = document.querySelector("#editStatus");
                const editForm = document.querySelector("#editForm");
                const closeEditPopupButton = document.querySelector("#closePopup");
                editButtons.forEach(button => {
                  button.addEventListener("click", function () {
                    const row = button.closest("tr");
                    const name = row.querySelector("td:nth-child(4)").textContent;
                    const status = row.querySelector(".status").classList.contains("enable") ? "enable" : "disable";
                    editNameInput.value = name;
                    editStatusInput.value = status;
                    editPopup.style.display = "block";
                  });
                });
                closeEditPopupButton.addEventListener("click", function () {
                  editPopup.style.display = "none";
                });
                editForm.addEventListener("submit", function (e) {
                  e.preventDefault();
                  const newName = editNameInput.value;
                  const newStatus = editStatusInput.value;
                  const row = Array.from(document.querySelectorAll("tr")).find(tr => 
                    tr.querySelector("td:nth-child(4)").textContent === editNameInput.value
                  );
                  if (row) {
                    row.querySelector("td:nth-child(4)").textContent = newName;
                    const statusCell = row.querySelector(".status");
                    statusCell.classList.remove("enable", "disable");
                    statusCell.classList.add(newStatus);
                    statusCell.textContent = newStatus.charAt(0).toUpperCase() + newStatus.slice(1);
                  }
                  editPopup.style.display = "none";
                });
                // Add button functionality
                const addButton = document.querySelector(".add-btn");
                const addPopup = document.querySelector("#addPopup");
                const addNameInput = document.querySelector("#addName");
                const addStatusInput = document.querySelector("#addStatus");
                const addForm = document.querySelector("#addForm");
                const closeAddPopupButton = document.querySelector("#closeAddPopup");
                addButton.addEventListener("click", function () {
                  addPopup.style.display = "block";
                });
                closeAddPopupButton.addEventListener("click", function () {
                  addPopup.style.display = "none";
                });
                addForm.addEventListener("submit", function (e) {
                  e.preventDefault();
                  const newName = addNameInput.value;
                  const newStatus = addStatusInput.value;
                  const newRow = document.createElement("tr");
                  newRow.innerHTML = 
                    '<td><input type="checkbox"></td>' +
                    '<td>' + (document.querySelectorAll("tbody tr").length + 1) + '</td>' +
                    '<td>' + (document.querySelectorAll("tbody tr").length + 1) + '</td>' +
                    '<td>' + newName + '</td>' +
                    '<td><span class="status ' + newStatus + '">' + newStatus.charAt(0).toUpperCase() + newStatus.slice(1) + '</span></td>' +
                    '<td class="actions">' +
                      '<button class="edit-btn">✏️</button>' +
                      '<button class="delete-btn">🗑️</button>' +
                    '</td>';
                  document.querySelector("tbody").appendChild(newRow);
                  // Reset the form and close the popup
                  addForm.reset();
                  addPopup.style.display = "none";
                  // Add edit button event listener to the newly added row
                  newRow.querySelector(".edit-btn").addEventListener("click", function () {
                    const row = this.closest("tr");
                    const name = row.querySelector("td:nth-child(4)").textContent;
                    const status = row.querySelector(".status").classList.contains("enable") ? "enable" : "disable";
                    editNameInput.value = name;
                    editStatusInput.value = status;
                    editPopup.style.display = "block";
                  });
                });
              });
                </script>
         <script src="assetss/js/app.min.js"></script>
        <script src="assetss/bundles/jquery-validation/dist/jquery.validate.min.js"></script>
        <script src="assetss/bundles/jquery-steps/jquery.steps.min.js"></script>
        <script src="assetss/js/page/form-wizard.js"></script>
        <script src="assetss/js/scripts.js"></script>
        <script src="assetss/js/custom.js"></script>

  </body>
</html>