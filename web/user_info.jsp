<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en" dir="ltr">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>FMASTER</title>
        <style>
            .status-active {
                border-radius: 30%;
                text-align: center;
                width: 50px;
                background: rgba(var(--color-success-rgba), 0.15);
                color: #01b81a;
            }

            .status-not-active {
                border-radius: 30%;
                text-align: center;
                width: 50px;
                background: rgba(var(--color-danger-rgba), 0.15);
                color: #ff0f0f;
            }
            .form-check{
                margin-right: 10px;
            }
        </style>

        <jsp:include page="style/linkcss.jsp" />

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>

    <body class="layout-light side-menu">
        <div class="mobile-search">
            <form action="/" class="search-form">
                <img src="img/svg/search.svg" alt="search" class="svg">
                <input class="form-control me-sm-2 box-shadow-none" type="search" placeholder="Search..." aria-label="Search">
            </form>
        </div>
        <div class="mobile-author-actions"></div>
        <jsp:include page="control_nav.jsp" />

        <main class="main-content">

            <jsp:include page="sidebar.jsp" />

            <div class="contents">

                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="d-flex align-items-center user-member__title mb-30 mt-30">
                                <h4 class="text-capitalize">add user</h4>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="user-info-tab w-100 bg-white global-shadow radius-xl mb-50">
                                <div class="ap-tab-wrapper border-bottom ">
                                    <ul class="nav px-30 ap-tab-main text-capitalize" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill" href="#v-pills-home" role="tab" aria-selected="true">
                                                <img src="img/svg/user.svg" alt="user" class="svg">personal info</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill" href="#v-pills-profile" role="tab" aria-selected="false">
                                                <img src="img/svg/briefcase.svg" alt="briefcase" class="svg">Curriculum Vitae</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="tab-content" id="v-pills-tabContent">
                                    <div class="tab-pane fade  show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                                        <div class="row justify-content-center">
                                            <div class="col-xxl-4 col-10">
                                                <form action="UpdateAccountServlet" id="updateAccountForm" method="post" enctype="multipart/form-data">
                                                    <div class="mt-sm-40 mb-sm-50 mt-20 mb-20">
                                                        <div class="user-tab-info-title mb-sm-40 mb-20 text-capitalize">
                                                            <h5 class="fw-500">Personal Information</h5>
                                                        </div>
                                                        <div class="account-profile d-flex align-items-center mb-4">
                                                            <div class="ap-img pro_img_wrapper">
                                                                <input id="file-upload" type="file" name="fileUpload" class="d-none" accept="image/*">
                                                                <!-- Profile picture image -->
                                                                <label for="file-upload" class="position-relative d-inline-block">
                                                                    <img id="profile-img" class="ap-img__main rounded-circle wh-120 bg-lighter d-flex" src="img\\tungche2.jpg" alt="hình nền">
                                                                    <span class="cross position-absolute" id="remove_pro_pic">
                                                                        <img src="img/svg/camera.svg" alt="camera" class="svg">
                                                                    </span>
                                                                </label>
                                                            </div>

                                                            <div class="account-profile__title">
                                                                <h6 class="fs-15 ms-20 fw-500 text-capitalize">Profile Photo</h6>
                                                            </div>
                                                        </div>

                                                        <div class="edit-profile__body">
                                                            <div class="form-group mb-25">
                                                                <label for="name1">User name</label>
                                                                <input type="text" class="form-control" id="name1" name="username" value="${user.userName}" placeholder="${user.userName}" readonly>
                                                            </div>
                                                            <div style="margin-bottom: 15px">
                                                                <div class="form-group mb-25">
                                                                    <label for="name1">Full Name</label>
                                                                    <input type="text" class="form-control" id="fullname" name="fullname" value="${user.fullName}" placeholder="${user.fullName}">
                                                                </div>
                                                                <div style="display: none" id="nameError" class="alert alert-warning alert-dismissible fade show disabled" role="alert">
                                                                    <strong style="color: red;">Oh No!</strong> Your name is not valid.
                                                                </div>
                                                            </div>
                                                            <div class="form-group mb-25">
                                                                <div class="sexOption">
                                                                    <label for="sexOption">
                                                                        Sex
                                                                    </label>
                                                                    <select class="js-example-basic-single js-states form-control" id="sexOption" name="sex">
                                                                        <option value="1" ${user.sex == '1' ? 'selected' : '1'}>Male</option>
                                                                        <option value="0" ${user.sex == '0' ? 'selected' : '0'}>Female</option>>
                                                                    </select>
                                                                </div>
                                                            </div>

                                                            <div style="margin-bottom: 15px">
                                                                <div class="form-group mb-25">
                                                                    <label for="name2">Email</label>
                                                                    <input type="email" class="form-control" id="email" name="gmail" value="${user.gmail}" placeholder="${user.gmail}">
                                                                </div>
                                                                <div style="display: none" id="emailError" class="alert alert-warning alert-dismissible fade show disabled" role="alert">
                                                                    <strong style="color: red;">Oh No!</strong> Your email is not valid.
                                                                </div>
                                                            </div>

                                                            <div style="margin-bottom: 15px">
                                                                <div class="form-group mb-25">
                                                                    <label for="dob">Date of birth</label>
                                                                    <input type="date" class="form-control" id="dob" name="dob" value="${user.dob}">
                                                                </div>
                                                                <div style="display: none" id="dobError" class="alert alert-warning alert-dismissible fade show disabled" role="alert">
                                                                    <strong style="color: red;">Oh No!</strong> Your date of birth is invalid.
                                                                </div>
                                                            </div>

                                                            <div style="margin-bottom: 15px">
                                                                <div class="form-group mb-25">
                                                                    <label for="phoneNumber5">phone number</label>
                                                                    <input type="tel" class="form-control" id="phoneNumber" name="phone" value="${user.phone}" placeholder="${user.phone}" >
                                                                </div>
                                                                <div style="display: none" id="phoneError" class="alert alert-warning alert-dismissible fade show" role="alert">
                                                                    <strong style="color: red;">Oh No!</strong> Your phone number is not valid.
                                                                </div>
                                                            </div>

                                                            <div class="form-group mb-25">
                                                                <label for="address">Address</label>
                                                                <input type="text" class="form-control" id="address" name="address" value="${user.address}" placeholder="${user.address}">
                                                            </div>

                                                            <div class="button-group d-flex pt-sm-25 justify-content-md-end justify-content-start ">
                                                                <!-- Button trigger modal -->
                                                                <button id="submitForm" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                                                    Save &amp; Next
                                                                </button>

                                                                <!-- Modal -->
                                                                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                    <div class="modal-dialog">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h1 class="modal-title fs-5" id="exampleModalLabel">Notification </h1>
                                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                This will change your info!
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                                <button type="submit" class="btn btn-primary">Save changes</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                                        <div class="row justify-content-center">
                                            <div class="col-xxl-4 col-10">
                                                <div class="mt-40 mb-50">
                                                    <div class="user-tab-info-title mb-35 text-capitalize">
                                                        <h5 class="fw-500">CV Information</h5>
                                                    </div>
                                                    <div class="edit-profile__body">
                                                        <form action="cv" method="POST">
                                                            <c:set var="cv" value="${requestScope.cv}"></c:set>
                                                                <div class="form-group mb-25">
                                                                    <label for="name4">Full Name</label>
                                                                    <input name="fullName" value="${cv.fullName}" type="text" class="form-control" id="name4" placeholder="Duran Clayton">
                                                            </div>
                                                            <div class="form-group mb-25">
                                                                <label for="phoneNumber1">Mail</label>
                                                                <input name="gmail" value="${cv.gmail}" type="text" class="form-control" id="phoneNumber1" placeholder="Design">
                                                            </div>
                                                            <div class="form-group mb-25 form-group">
                                                                <label for="datepicker">Date of birth</label>
                                                                <div class="position-relative">
                                                                    <input name="dob" value="${cv.dob}" type="date" class="form-control"  placeholder="January 20, 2018">
                                                                </div>
                                                            </div>
                                                            <div class="form-group mb-25">
                                                                <label for="phoneNumber">Sex</label>
                                                                <div class="d-flex">
                                                                    <div class="radio-horizontal-list d-flex flex-wrap">
                                                                        <div class="radio-theme-default custom-radio ">
                                                                            <input name="sex" ${cv.sex ? "checked": ""} class="radio" type="radio"  value="1" id="radio-hl1">
                                                                            <label for="radio-hl1">
                                                                                <span class="radio-text">Male</span>
                                                                            </label>
                                                                        </div>
                                                                        <div class="radio-theme-default custom-radio ">
                                                                            <input name="sex" ${cv.sex ? "": "checked"} class="radio" type="radio"  value="0" id="radio-hl2">
                                                                            <label for="radio-hl2">
                                                                                <span class="radio-text">Female</span>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group mb-25">
                                                                <label for="phoneNumber1">Address</label>
                                                                <input name="address" value="${cv.address}" type="text" class="form-control" id="phoneNumber1" placeholder="Design">
                                                            </div>

                                                            <div class="form-group mb-25">
                                                                <label for="phoneNumber1">Profession</label>
                                                                <input name="profession" value="${cv.profession}" type="text" class="form-control" id="phoneNumber1" placeholder="Design">
                                                            </div>
                                                            <div class="form-group mb-25">
                                                                <label for="phoneNumber1">Profession introduction</label>
                                                                <input name="professionIntro" value="${cv.professionIntro}" type="text" class="form-control" id="phoneNumber1" placeholder="Design">
                                                            </div>
                                                            <div class="form-group mb-25">
                                                                <label for="phoneNumber1">Achievement Description</label>
                                                                <input name="achievementDescription" value="${cv.achievementDescription}" type="text" class="form-control" id="phoneNumber1" placeholder="Design">
                                                            </div>
                                                            <div class="form-group mb-25">
                                                                <label for="phoneNumber1">Service Description</label>
                                                                <input name="serviceDescription" value="${cv.serviceDescription}" type="text" class="form-control" id="phoneNumber1" placeholder="Design">
                                                            </div>
                                                            <div class="form-group mb-25 status-radio ">
                                                                <label for="hiringDateCheckbox">Skill</label>
                                                                <div class="d-flex ">
                                                                    <c:forEach items="${requestScope.skills}" var="skill">
                                                                        <c:set var="isChecked" value="false"/>
                                                                        <c:forEach items="${cv.skills}" var="cvskill">
                                                                            <c:if test="${skill.skillID == cvskill}">
                                                                                <c:set var="isChecked" value="true"/>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                        <div class="form-check">
                                                                            <input name="skills" class="form-check-input" type="checkbox" <c:if test="${isChecked}">checked</c:if> value="${skill.skillID}" id="hiringDateCheckbox">
                                                                            <label class="form-check-label" for="hiringDateCheckbox">${skill.skillName}</label>
                                                                        </div>

                                                                    </c:forEach>
                                                                </div>
                                                            </div>
                                                            <div class="button-group d-flex pt-20 justify-content-md-end justify-content-start">
                                                                <button id="edit_oki" class="btn btn-light btn-default btn-squared fw-400 text-capitalize radius-md btn-sm">edit</button>
                                                                <button type="submit" id="button_oki" class="btn btn-primary btn-default btn-squared text-capitalize radius-md shadow2 btn-sm">Save & Next</button>
                                                            </div>

                                                        </form>


                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                </main>
                                <div id="overlayer">
                                    <div class="loader-overlay">
                                        <div class="dm-spin-dots spin-lg">
                                            <span class="spin-dot badge-dot dot-primary"></span>
                                            <span class="spin-dot badge-dot dot-primary"></span>
                                            <span class="spin-dot badge-dot dot-primary"></span>
                                            <span class="spin-dot badge-dot dot-primary"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="overlay-dark-sidebar"></div>
                                <div class="customizer-overlay"></div>

                                <script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBgYKHZB_QKKLWfIRaYPCadza3nhTAbv7c"></script>
                                <script>
                                    document.addEventListener('DOMContentLoaded', function () {
                                        var emailInput = document.getElementById('email');
                                        var emailError = document.getElementById('emailError');
                                        var phoneInput = document.getElementById('phoneNumber');
                                        var phoneError = document.getElementById('phoneError');
                                        var nameInput = document.getElementById('fullname');
                                        var nameError = document.getElementById('nameError');
                                        var dobInput = document.getElementById('dob');
                                        var dobError = document.getElementById('dobError');
                                        var submitForm = document.getElementById('submitForm');

                                        if (emailInput) {
                                            emailInput.addEventListener('input', function () {
                                                var emailValue = emailInput.value;
                                                if (!validateEmail(emailValue)) {
                                                    emailError.style.display = 'block';
                                                    submitForm.disabled = true;
                                                } else {
                                                    emailError.style.display = 'none';
                                                    submitForm.disabled = false;
                                                }
                                            });
                                        }

                                        if (phoneInput) {
                                            phoneInput.addEventListener('input', function () {
                                                var phoneValue = phoneInput.value;
                                                if (!validatePhone(phoneValue)) {
                                                    phoneError.style.display = 'block';
                                                    submitForm.disabled = true;
                                                } else {
                                                    phoneError.style.display = 'none';
                                                    submitForm.disabled = false;
                                                }
                                            });
                                        }

                                        if (nameInput) {
                                            nameInput.addEventListener('input', function () {
                                                var nameValue = nameInput.value;
                                                if (!validateName(nameValue)) {
                                                    nameError.style.display = 'block';
                                                    submitForm.disabled = true;
                                                } else {
                                                    nameError.style.display = 'none';
                                                    submitForm.disabled = false;
                                                }
                                            });
                                        }

                                        if (dobInput) {
                                            dobInput.addEventListener('input', function () {
                                                var dobValue = dobInput.value;
                                                if (!validateBirthDate(dobValue)) {
                                                    dobError.style.display = 'block';
                                                    submitForm.disabled = true;
                                                } else {
                                                    dobError.style.display = 'none';
                                                    submitForm.disabled = false;
                                                }
                                            });
                                        }

                                        function validatePhone(phone) {
                                            var re = /^(0|84)(2(0[3-9]|1[0-689]|2[0-25-9]|3[2-9]|4[0-9]|5[124-9]|6[0369]|7[0-7]|8[0-9]|9[012346789])|3[2-9]|5[25689]|7[06-9]|8[0-9]|9[012346789])([0-9]{7})$/;
                                            return re.test(phone);
                                        }

                                        function validateEmail(email) {
                                            var re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                                            return re.test(email);
                                        }

                                        function validateName(name) {
                                            var re = /^[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]+$/;
                                            return re.test(name);
                                        }

                                        function validateBirthDate(birthDate) {
                                            var currentDate = new Date();

                                            var selectedDate = new Date(birthDate);

                                            if (selectedDate >= currentDate) {
                                                return false;
                                            }
                                            return true;
                                        }
                                    });

                                </script>
                                <script>
                                    document.getElementById('file-upload').addEventListener('change', function (event) {
                                        const file = event.target.files[0];
                                        if (file) {
                                            const reader = new FileReader();
                                            reader.onload = function (e) {
                                                document.getElementById('profile-img').src = e.target.result;
                                            }
                                            reader.readAsDataURL(file);
                                        }
                                    });
                                    document.addEventListener('DOMContentLoaded', () => {
                                        const save = document.getElementById("button_oki");
                                        const cancel = document.getElementById("edit_oki");
                                        const form1 = document.getElementById("form1-status");
                                        const form2 = document.getElementById("form2-status");
                                        const formall1 = document.getElementById("activett_1");
                                        const formall2 = document.getElementById("activett_2");
                                        save.addEventListener('click', () => {
                                            form1.textContent = 'Active';
                                            form2.textContent = 'Active';
                                            formall1.classList.remove('status-not-active');
                                            formall1.classList.add('status-active');
                                            formall2.classList.remove('status-not-active');
                                            formall2.classList.add('status-active');
                                        });
                                        cancel.addEventListener('click', () => {
                                            form1.textContent = 'Not Active';
                                            form2.textContent = 'Not Active';
                                            formall1.classList.remove('status-active');
                                            formall1.classList.add('status-not-active');
                                            formall2.classList.remove('status-active');
                                            formall2.classList.add('status-not-active');
                                        });
                                    });
                                </script>
                                <jsp:include page="style/linkJS.jsp" />

                                </body>
                                </html>