
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
            .paginator {
                float:right;
                display: flex !important;
                justify-content: center !important;
                align-items: center !important;
                margin-top: 20px !important;
                margin-bottom: 20px !important;
            }

            .paginator .prev,
            .paginator .next {
                padding: 8px 16px !important;
                text-decoration: none !important;
                color: #007bff !important;
                background-color: #fff !important;
                border: 1px solid #ddd !important;
                border-radius: 8px !important;
            }
            #pagination-links{
                pointer-events: none;
            }

            .paginator .prev {
                border-top-left-radius: 8px !important;
                border-bottom-left-radius: 8px !important;
            }

            .paginator .next {
                border-top-right-radius: 8px !important;
                border-bottom-right-radius: 8px !important;
            }

            .paginator .prev:hover,
            .paginator .next:hover {
                background-color: #f8f9fa !important;
            }

            .paginator .pageNum {
                padding: 8px 16px !important;
                text-decoration: none !important;
                color: #007bff !important;
                background-color: #fff !important;
                border: 1px solid #ddd !important;
                border-radius: 8px !important;
                margin: 0 5px !important;
            }

            .paginator .pageNum.active {
                background-color: #007bff !important;
                color: white !important;
                border: 1px solid #007bff !important;
            }

            .paginator .pageNum:hover {
                background-color: #f8f9fa !important;
            }

            .paginator .prev[style*="hidden"], .paginator .next[style*="hidden"] {
                visibility: hidden !important;
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
                        <ul class="breadcrumb breadcrumb-style ">
                            <li class="breadcrumb-item">
                                <h4 class="page-title m-b-0">Homes</h4>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="ManagerHomePage">
                                    <i class="fas fa-home"></i></a>
                            </li>
                            <li class="breadcrumb-item">SKill</li>

                        </ul>
                        <div class="section-body">
                            <div class="row clearfix">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="card">
                                        <div class="container">
                                            <div class="header">
                                                <h1>Manage Skills</h1>
                                                <div class="buttons">

                                                    <button class="add-btn">Add New Skill</button>
                                                </div>

                                                <form method="get" action="skills">
                                                    <label for="status">Filter by Status:</label>
                                                    <select name="status" id="status">
                                                        <option value="" ${empty param.status ? 'selected' : ''}>All</option>
                                                        <option value="true" ${param.status == 'true' ? 'selected' : ''}>Enable</option>
                                                        <option value="false" ${param.status == 'false' ? 'selected' : ''}>Disable</option>
                                                    </select>

                                                    <label for="skillName">Search by Skill Name:</label>
                                                    <input type="text" name="skillName" id="skillName" value="${param.skillName}"/>

                                                    <button type="submit">Apply</button>
                                                </form>
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
                                           <div style="display: flex; justify-content: end; margin: 10px 0">
    <c:if test="${totalPages > 1}">
        <ul class="pagination">
            <c:if test="${currentPage > 1}">
                <li>
                    <a href="skills?page=${currentPage - 1}&status=${status}&skillName=${skillName}">Previous</a>
                </li>
            </c:if>
            <c:forEach begin="1" end="${totalPages}" var="i">
                <c:choose>
                    <c:when test="${i == currentPage}">
                        <li><span>${i}</span></li>
                    </c:when>
                    <c:otherwise>
                        <li>
                            <a href="skills?page=${i}&status=${status}&skillName=${skillName}">${i}</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:if test="${currentPage < totalPages}">
                <li>
                    <a href="skills?page=${currentPage + 1}&status=${status}&skillName=${skillName}">Next</a>
                </li>
            </c:if>
        </ul>
    </c:if>
</div>




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
                                                            <option value="false">Disable</option>
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
                                                    <form id="addForm" action="createSkill" method="post" enctype="multipart/form-data">
                                                        <label for="addName">Name:</label>
                                                        <input type="text" id="addName" required name="skillName"/>
                                                        <label for="newImg">Upload Image</label>
                                                        <input name="img" type="file" id="newImg" required/>
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
                                <form action="skills" method="post" enctype="multipart/form-data">
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
                                            <input type="file" name="img" />
                                            <input type="hidden" name="existingImg" value="${skill.img}" />
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
                document.addEventListener('DOMContentLoaded', () => {
                    const currentPage = ${currentPage};
                    const totalPages = ${totalPages};
                    const paginationLinks = document.getElementById('pagination-links');
                    const status = '${status}';
                    const skillName = '${skillName}';

                    function createLink(page, text, isActive) {
                        const a = document.createElement('a');
                        a.href = `skills?page=${page}&status=${status}&skillName=${skillName}`;
                        a.textContent = text;
                        a.className = 'pageNum';
                        if (isActive)
                            a.classList.add('active');
                        return a;
                    }

                    if (currentPage > 3) {
                        paginationLinks.appendChild(createLink(1, '1'));
                        paginationLinks.appendChild(document.createTextNode('...'));
                    }

                    for (let i = Math.max(2, currentPage - 1); i <= Math.min(totalPages - 1, currentPage + 1); i++) {
                        paginationLinks.appendChild(createLink(i, i, i === currentPage));
                    }

                    if (currentPage < totalPages - 2) {
                        if (currentPage < totalPages - 3) {
                            paginationLinks.appendChild(document.createTextNode('...'));
                        }
                        paginationLinks.appendChild(createLink(totalPages, totalPages));
                    }
                });
            </script>
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