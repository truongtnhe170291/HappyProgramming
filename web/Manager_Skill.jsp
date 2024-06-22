
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

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

                                                    <button class="add-btn">Add New Employees</button>
                                                </div>
                                            </div>
                                            <table>
                                                <thead>
                                                    <tr>
                                                       
                                                        <th>STT</th>
                                                        <th>ID</th>
                                                        <th>Name</th>
                                                        <th>Status</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="skill" items="${skills}" varStatus="status">
                                                        <tr>
                                                           
                                                            <td>${status.index + 1}</td>
                                                            <td>${skill.skillID}</td>
                                                            <td>${skill.skillName}</td>
                                                            <td><span class="status ${skill.status ? 'enable' : 'disable'}">
                                                                    ${skill.status ? 'Enable' : 'Disable'}
                                                                </span></td>
                                                            <td class="actions">
                                                                

                                                                <button class="btn btn-info" style="color:#002D57;" data-bs-toggle="modal" data-bs-target="#updateModal"
                                                                        data-skillid="${skill.skillID}"
                                                                        data-skillname="${skill.skillName}"
                                                                        data-img="${skill.img}"
                                                                        data-description="${skill.description}"
                                                                        data-status="${skill.status}">
                                                                    Update
                                                                </button>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        <!-- edit ở đây -->
                                        <div id="editPopup" class="popup">
                                            <div class="popup-content">
                                                <h2>Edit Skill</h2>
                                                <form id="editForm" action="udatestatus" method="post">
                                                      <input type="hidden" name="skillID">
                                                    <label for="editName">Name: </label>
                                                    <input type="text" id="editName" required name="editName"/>
                                                   
                                                    <label for="editStatus">Status:</label>
                                                    <select id="editStatus" name="status">
                                                        <option value="true">Enable</option>
                                                        <option value="fales">Disable</option>
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
                                                <form id="addForm" action="createSkill" method="post">

                                                    <label for="addName">Name:</label>
                                                    <input type="text" id="addName" required name="skillName"/>
                                                    <label for="newImg" >Image URL</label>
                                                    <input name="img" type="text" id="newImg" required/>
                                                    <label for="newDescription" class="form-label">Description</label>
                                                    <textarea class="form-control" id="newDescription" name="description" rows="3"></textarea>
                                                    <input type="hidden" name="status" value="true">
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
                </div>
                <!-- Update Modal -->
                <div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true" style="    position: absolute;
                     top: 50%;
                     left: 50%;
                     transform: translate(-50%, -40%);">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="skills" method="post">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="updateModalLabel">Update Skill</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <input type="hidden" name="skillID" id="skillID">
                                    <div class="mb-3">
                                        <label for="skillName" class="form-label">Skill Name</label>
                                        <input type="text" class="form-control" id="skillName" name="skillName" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="img" class="form-label">Image URL</label>
                                        <input type="text" class="form-control" id="img" name="img">
                                    </div>
                                    <div class="mb-3">
                                        <label for="description" class="form-label">Description</label>
                                        <textarea class="form-control" id="description" name="description" rows="3"></textarea>
                                    </div>
                                    <div class="mb-3">
                                        <label for="status" class="form-label">Status</label>
                                        <select class="form-control" id="status" name="status">
                                            <option value="true">Enable</option>
                                            <option value="false">Disable</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary">Save changes</button>
                                </div>
                            </form>
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
                document.body.classList.remove('modal-open');
                document.querySelectorAll('.modal-backdrop').forEach(el => el.remove());
                document.querySelectorAll('.update-btn').forEach(button => {
                    button.addEventListener('click', function () {
                        var myModal = new bootstrap.Modal(document.getElementById('updateModal'));
                        myModal.show();
                    });
                });
                var updateModal = document.getElementById('updateModal');
                updateModal.addEventListener('show.bs.modal', function (event) {
                    var button = event.relatedTarget; // Button that triggered the modal
                    var skillID = button.getAttribute('data-skillid');
                    var skillName = button.getAttribute('data-skillname');
                    var img = button.getAttribute('data-img');
                    var description = button.getAttribute('data-description');
                    var status = button.getAttribute('data-status');

                    // Update the modal's content with the data
                    var modalTitle = updateModal.querySelector('.modal-title');
                    var skillIDInput = updateModal.querySelector('#skillID');
                    var skillNameInput = updateModal.querySelector('#skillName');
                    var imgInput = updateModal.querySelector('#img');
                    var descriptionInput = updateModal.querySelector('#description');
                    var statusInput = updateModal.querySelector('#status');

                    modalTitle.textContent = 'Update Skill: ' + skillName;
                    skillIDInput.value = skillID;
                    skillNameInput.value = skillName;
                    imgInput.value = img;
                    descriptionInput.value = description;
                    statusInput.value = status;
                });
            </script>

            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    
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
                    addForm.addEventListener("submit", function () {

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