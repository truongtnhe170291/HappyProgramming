<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>List of Skills</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/7005da8e68.js" crossorigin="anonymous"></script>
    </head>
    
    <body class="container">
        <h1 class="mt-5 mb-4">Skill List</h1>
        <button class="btn btn-info mb-3" data-bs-toggle="modal" data-bs-target="#createModal">Create New Skill</button>
        <table class="table table-striped">
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
                <!-- Skills list will be populated here -->
                <c:forEach  items="${skills}" var="skill" varStatus="status">
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td>${status.index + 1}</td>
                        <td>${skill.skillID}</td>
                        <td>${skill.skillName}</td>
                         <td>${skill.status ? 'Active' : 'Inactive'}</td>
                        <td>
                <button class="btn btn-info me-2" data-bs-toggle="modal" data-bs-target="#updateModal"
                        data-skillid="${skill.skillID}"
                        data-skillname="${skill.skillName}"
                        data-img="${skill.img}"
                        data-description="${skill.description}"
                        data-status="${skill.status}">
                    Update
                </button>
                <button class="btn btn-secondary me-2" data-bs-toggle="modal" data-bs-target="#editStatusModal"
                        data-skillid="${skill.skillID}"
                        data-status="${skill.status}">
                    Edit Status
                </button>
                
            </td>
        </tr>
    </c:forEach>
</tbody>
</table>

<!-- Create Modal -->
<div class="modal fade" id="createModal" tabindex="-1" aria-labelledby="createModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="createSkill" method="post">
                <div class="modal-header">
                    <h5 class="modal-title" id="createModalLabel">Create New Skill</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="newSkillName" class="form-label">Skill Name</label>
                        <input type="text" class="form-control" id="newSkillName" name="skillName" required>
                    </div>
                    <div class="mb-3">
                        <label for="newImg" class="form-label">Image URL</label>
                        <input type="text" class="form-control" id="newImg" name="img">
                    </div>
                    <div class="mb-3">
                        <label for="newDescription" class="form-label">Description</label>
                        <textarea class="form-control" id="newDescription" name="description" rows="3"></textarea>
                    </div>
                    <input type="hidden" name="status" value="true">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Create Skill</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Update Modal -->
<div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="skills" method="post">
                <div class="modal-header">
                    <h5 class="modal-title" id="updateModalLabel">Update Skill</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="skillID" id="updateSkillID">
                    <div class="mb-3">
                        <label for="updateSkillName" class="form-label">Skill Name</label>
                        <input type="text" class="form-control" id="updateSkillName" name="skillName" required>
                    </div>
                    <div class="mb-3">
                        <label for="updateImg" class="form-label">Image URL</label>
                        <input type="text" class="form-control" id="updateImg" name="img">
                    </div>
                    <div class="mb-3">
                        <label for="updateDescription" class="form-label">Description</label>
                        <textarea class="form-control" id="updateDescription" name="description" rows="3"></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="updateStatus" class="form-label">Status</label>
                        <select class="form-control" id="updateStatus" name="status">
                            <option value="true">Active</option>
                            <option value="false">Inactive</option>
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

<!-- Edit Status Modal -->
<div class="modal fade" id="editStatusModal" tabindex="-1" aria-labelledby="editStatusModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="udatestatus" method="post">
                <div class="modal-header">
                    <h5 class="modal-title" id="editStatusModalLabel">Edit Status</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="skillID" id="editStatusSkillID">
                    <div class="mb-3">
                        <label for="editStatus" class="form-label">Status</label>
                        <select class="form-control" id="editStatus" name="status">
                            <option value="true">Active</option>
                            <option value="false">Inactive</option>
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
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Select all checkboxes
        const selectAllCheckbox = document.querySelector("#selectAll");
        const checkboxes = document.querySelectorAll('.rowCheckbox');

        // Function to handle "Select All" checkbox
        selectAllCheckbox.addEventListener("change", function () {
            checkboxes.forEach(checkbox => checkbox.checked = selectAllCheckbox.checked);
        });

        // Function to handle individual checkbox changes
        checkboxes.forEach(checkbox => {
            checkbox.addEventListener("change", function () {
                if (!this.checked) {
                    selectAllCheckbox.checked = false;
                } else {
                    // Check if all checkboxes are checked
                    const allChecked = Array.from(checkboxes).every(checkbox => checkbox.checked);
                    selectAllCheckbox.checked = allChecked;
                }
            });
        });

        // Function to populate data in update modal
        var updateModal = new bootstrap.Modal(document.getElementById('updateModal'));
        updateModal._element.addEventListener('show.bs.modal', function (event) {
            var button = event.relatedTarget;
            var skillID = button.getAttribute('data-skillid');
            var skillName = button.getAttribute('data-skillname');
            var img = button.getAttribute('data-img');
            var description = button.getAttribute('data-description');
            var status = button.getAttribute('data-status');

            var modalTitle = updateModal._element.querySelector('.modal-title');
            var skillIDInput = updateModal._element.querySelector('#updateSkillID');
            var skillNameInput = updateModal._element.querySelector('#updateSkillName');
            var imgInput = updateModal._element.querySelector('#updateImg');
            var descriptionInput = updateModal._element.querySelector('#updateDescription');
            var statusInput = updateModal._element.querySelector('#updateStatus');

            modalTitle.textContent = 'Update Skill: ' + skillName;
            skillIDInput.value = skillID;
            skillNameInput.value = skillName;
            imgInput.value = img;
            descriptionInput.value = description;
            statusInput.value = status;
        });

        // Function to populate data in edit status modal
        var editStatusModal = new bootstrap.Modal(document.getElementById('editStatusModal'));
        editStatusModal._element.addEventListener('show.bs.modal', function (event) {
            var button = event.relatedTarget;
            var skillID = button.getAttribute('data-skillid');
            var status = button.getAttribute('data-status');

            var editStatusSkillIDInput = editStatusModal._element.querySelector('#editStatusSkillID');
            var editStatusInput = editStatusModal._element.querySelector('#editStatus');

            editStatusSkillIDInput.value = skillID;
            editStatusInput.value = status;
        });
    });
</script>

<!--  <script>
   document.addEventListener("DOMContentLoaded", function () {
        // Select all checkboxes
        const selectAllCheckbox = document.querySelector("#selectAll");
        const checkboxes = document.querySelectorAll('.rowCheckbox');

        // Function to handle "Select All" checkbox
        selectAllCheckbox.addEventListener("change", function () {
            checkboxes.forEach(checkbox => checkbox.checked = selectAllCheckbox.checked);
        });

        // Function to handle individual checkbox changes
        checkboxes.forEach(checkbox => {
            checkbox.addEventListener("change", function () {
                if (!this.checked) {
                    selectAllCheckbox.checked = false;
                } else {
                    // Check if all checkboxes are checked
                    const allChecked = Array.from(checkboxes).every(checkbox => checkbox.checked);
                    selectAllCheckbox.checked = allChecked;
                }
            });
        });

    // JavaScript to handle data population for update modal
    var updateModal = document.getElementById('updateModal');
    updateModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget;
        var skillID = button.getAttribute('data-skillid');
        var skillName = button.getAttribute('data-skillname');
        var img = button.getAttribute('data-img');
        var description = button.getAttribute('data-description');
        var status = button.getAttribute('data-status');

        var modalTitle = updateModal.querySelector('.modal-title');
        var skillIDInput = updateModal.querySelector('#updateSkillID');
        var skillNameInput = updateModal.querySelector('#updateSkillName');
        var imgInput = updateModal.querySelector('#updateImg');
        var descriptionInput = updateModal.querySelector('#updateDescription');
        var statusInput = updateModal.querySelector('#updateStatus');
        modalTitle.textContent = 'Update Skill: ' + skillName;
        skillIDInput.value = skillID;
        skillNameInput.value = skillName;
        imgInput.value = img;
        descriptionInput.value = description;
        statusInput.value = status;
    });

    // JavaScript to handle data population for edit status modal
    var editStatusModal = document.getElementById('editStatusModal');
    editStatusModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget;
        var skillID = button.getAttribute('data-skillid');
        var status = button.getAttribute('data-status');

        var editStatusSkillIDInput = editStatusModal.querySelector('#editStatusSkillID');
        var editStatusInput = editStatusModal.querySelector('#editStatus');

        editStatusSkillIDInput.value = skillID;
        editStatusInput.value = status;
    });
</script>-->
</body>
</html>

