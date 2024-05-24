<%-- 
    Document   : UpdateMenteeProfile
    Created on : 15 May 2024, 9:59:18 pm
    Author     : 2k3so
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Mentee Profile</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f8f9fa;
            }
            .container {
                margin-top: 50px;
            }
            .form-control[readonly] {
                background-color: #e9ecef;
            }
            .avatar-img {
                width: 100px;
                height: 100px;
                object-fit: cover;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2 class="mb-4">Update Mentee Profile</h2>
            <form action="updatementee" method="post">
                <div class="form-group row">
                    <label for="avatar" class="col-sm-2 col-form-label">Avatar</label>
                    <div class="col-sm-2">
                        <img class="avatar-img" src="${mentee.getAvatar()}" alt="Avatar">
                    </div>
                    <div class="col-sm-8">
                        <input type="text" class="form-control-file" name="avatar" value="${mentee.getAvatar()}"><br/>
                        <h4 style="color: green">${message}</h4>
                        <h4 style="color: red">${message1}</h4>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="username" class="col-sm-2 col-form-label">User Name</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="username" value="${mentee.userName}" readonly>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="gmail" class="col-sm-2 col-form-label">Gmail</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="gmail" value="${mentee.gmail}" >
                    </div>
                </div>

                <div class="form-group row">
                    <label for="fullname" class="col-sm-2 col-form-label">Full Name</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="fullname" value="${mentee.fullName}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="dob" class="col-sm-2 col-form-label">DOB</label>
                    <div class="col-sm-10">
                        <input type="date" class="form-control" name="dob" value="${mentee.dob}" />
                    </div>
                </div>
                <div class="form-group row">
                    <label for="sex" class="col-sm-2 col-form-label">Sex</label>
                    <div class="col-sm-10">
                        <select class="form-control" name="sex">
                            <option value="1" ${mentee.sex == '1' ? 'selected' : '1'}>Male</option>
                            <option value="0" ${mentee.sex == '0' ? 'selected' : '0'}>Female</option>
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="address" class="col-sm-2 col-form-label">Address</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="address" value="${mentee.address}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="phone" class="col-sm-2 col-form-label">Phone</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="phone" value="${mentee.phone}" readonly>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-10 offset-sm-2">
                        <button type="submit" class="btn btn-primary">Update</button>
                    </div>
                </div>
            </form>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
