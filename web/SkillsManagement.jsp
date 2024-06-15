<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>List of Skills</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/7005da8e68.js" crossorigin="anonymous"></script>
</head>
<body class="container">
    <h1>Skill List</h1>
    <button class="btn btn-info" data-bs-toggle="modal" data-bs-target="#createModal">Create New Skill</button>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Skill Name</th>
                <th>Image</th>
                <th>Description</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="skill" items="${skills}">
                <tr>
                    <td>${skill.skillName}</td>
                    <td><img src="${skill.img}" alt="${skill.skillName}" width="50"></td>
                    <td>${skill.description}</td>
                    <td>${skill.status ? 'Active' : 'Inactive'}</td>
                    <td>
                        <button class="btn btn-info" data-bs-toggle="modal" data-bs-target="#updateModal"
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
        // JavaScript to handle modal data population
        var updateModal = document.getElementById('updateModal');
        updateModal.addEventListener('show.bs.modal', function (event) {
            var button = event.relatedTarget;
            var skillID = button.getAttribute('data-skillid');
            var skillName = button.getAttribute('data-skillname');
            var img = button.getAttribute('data-img');
            var description = button.getAttribute('data-description');
            var status = button.getAttribute('data-status');

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
</body>
</html>
