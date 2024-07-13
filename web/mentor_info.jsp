<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en" dir="ltr">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Update CV of mentor</title>

        <style>
            .author_2{
                transform: translate(750px,-87px);
            }
            .author_1{
                transform: translate(770px,-35px);
            }
            .cards{
                border-radius: 40px;
                text-align: center;
                width: 100px;
                height: 30px;
                margin-left: 500px;
                margin-top: 20px;
            }
        

            th,
            td {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: center;
            }

            th {
                background-color: #f2f2f2;
            }

            td {
                position: relative;
            }

            td span {
                display: block;
                font-size: 14px;
                color: #666;
                margin-bottom: 5px;
            }

            td hr {
                border: none;
                border-top: 1px solid #ddd;
                margin: 5px 0;
            }

            td input[type="checkbox"] {
                transform: scale(1.2);
            }
        </style>

        <jsp:include page="style/linkcss.jsp" />


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
                                <h4 class="text-capitalize">Update CV of mentor</h4>
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
                                    
                                   
                                    </ul>
                                </div>
                                <div class="tab-content" id="v-pills-tabContent">
                                    <div class="tab-pane fade  show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                                        <div class="row justify-content-center">
                                            <div class="col-xxl-4 col-10">
                                                <form id ="myForm" action="UpdateAccountServlet" method="post" enctype="multipart/form-data">
                                                    <c:set var="mentor" value="${requestScope.user}"/>
                                                    <div class="mt-sm-40 mb-sm-50 mt-20 mb-20">
                                                        <div class="user-tab-info-title mb-sm-40 mb-20 text-capitalize">
                                                            <h5 class="fw-500">Personal Information</h5>
                                                        </div>
                                                        <div class="account-profile d-flex align-items-center mb-4">
                                                            <div class="ap-img pro_img_wrapper">
                                                                <input id="file-upload" type="file" name="fileUpload" class="d-none" accept="image/*">
                                                                <!-- Profile picture image -->
                                                                <label for="file-upload" class="position-relative d-inline-block">
                                                                    <img id="profile-img" class="ap-img__main rounded-circle wh-120 bg-lighter d-flex" src="./img/${mentor.avatar}" alt="profile">
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
                                                            <div style="margin-bottom: 15px">
                                                                <div class="form-group mb-25">
                                                                    <label for="name1">User name</label>
                                                                    <input type="text" class="form-control" id="name1" name="username" value="${mentor.userName}" placeholder="${mentor.userName}" readonly>
                                                                </div>
                                                            </div>

                                                            <div style="margin-bottom: 15px">
                                                                <div class="form-group mb-25">
                                                                    <label for="name1">Full Name</label>
                                                                    <input type="text" class="form-control" id="fullname" name="fullname" value="${mentor.fullName}" placeholder="Your name...">
                                                                </div>
                                                                <div style="display: none" id="nameError" class="alert alert-warning alert-dismissible fade show" role="alert">
                                                                    <strong style="color: red">Oh no!</strong> Your name is not valid.
                                                                </div>
                                                            </div>

                                                            <div class="form-group mb-25">
                                                                <div class="sexOption">
                                                                    <label for="sexOption">
                                                                        Sex
                                                                    </label>
                                                                    <select class="js-example-basic-single js-states form-control" id="sexOption" name="sex">
                                                                        <option value="1" ${mentor.sex == '1' ? 'selected' : '1'}>Male</option>
                                                                        <option value="0" ${mentor.sex == '0' ? 'selected' : '0'}>Female</option>>
                                                                    </select>
                                                                </div>
                                                            </div>

                                                            <div style="margin-bottom: 15px"> 
                                                                <div class="form-group mb-25">
                                                                    <label for="name2">Email</label>
                                                                    <input readonly type="email" class="form-control" id="name2" name="gmail" value="${mentor.gmail}" placeholder="${mentor.gmail}">
                                                                </div>
                                                            </div>

                                                            <div style="margin-bottom: 15px">
                                                                <div class="form-group mb-25">
                                                                    <label for="dob">Date of birth</label>
                                                                    <input id="dob" type="date" class="form-control" name="dob" value="${mentor.dob}">
                                                                </div>
                                                                <div style="display: none" id="dobError" class="alert alert-warning alert-dismissible fade show" role="alert">
                                                                    <strong style="color: red">Oh no!</strong> Your date of birth is invalid.
                                                                </div>
                                                            </div>

                                                            <div style="margin-bottom: 15px">
                                                                <div class="form-group mb-25">
                                                                    <label for="phoneNumber5">phone number</label>
                                                                    <input id="phoneNumber" type="tel" class="form-control" id="phoneNumber" name="phone" value="${mentor.phone}" placeholder="Your phone number...">
                                                                </div>
                                                                <div style="display: none" id="phoneError" class="alert alert-warning alert-dismissible fade show" role="alert">
                                                                    <strong style="color: red">Oh no!</strong> Your phone number is not valid.
                                                                </div>
                                                            </div>

                                                            <div style="margin-bottom: 15px">
                                                                <div class="form-group mb-25">
                                                                    <label for="address">Address</label>
                                                                    <input type="text" class="form-control" id="address" name="address" value="${mentor.address}" placeholder="Your address...">
                                                                </div>
                                                                <div style="display: none" id="addressError" class="alert alert-warning alert-dismissible fade show" role="alert">
                                                                    <strong style="color: red">Oh no!</strong> Please input your Address.
                                                                </div>
                                                            </div>

                                                            <div class="button-group d-flex pt-sm-25 justify-content-md-end justify-content-start ">
                                                                <button id="submitForm" type="button" class="btn btn-primary btn-default btn-squared text-capitalize radius-md shadow2 btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                                                    Save
                                                                </button>
                                                            </div>
                                                            <!-- Modal -->
                                                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h1 class="modal-title fs-5" id="exampleModalLabel">Notification</h1>
                                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            This will change your information!
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
                                                </form>
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

                                <script>
                                    document.addEventListener('DOMContentLoaded', function () {
                                        var emailInput = document.getElementById('email');
                                        var emailError = document.getElementById('emailError');
                                        var mailcv = document.getElementById('mailcv');
                                        var mailcvErr = document.getElementById('mailcvErr');
                                        var phoneInput = document.getElementById('phoneNumber');
                                        var phoneError = document.getElementById('phoneError');
                                        var nameInput = document.getElementById('fullname');
                                        var nameError = document.getElementById('nameError');
                                        var dobInput = document.getElementById('dob');
                                        var dobError = document.getElementById('dobError');
                                        var dobcv = document.getElementById('dobcv');
                                        var dobcvErr = document.getElementById('dobcvErr');
                                        var submitForm = document.getElementById('submitForm');
                                        var addressInput = document.getElementById('address');
                                        var addressError = document.getElementById('addressError');

                                        var emailInput2 = document.getElementById('email2');
                                        var emailError2 = document.getElementById('emailError2');
                                        var nameInput2 = document.getElementById('fullname2');
                                        var nameError2 = document.getElementById('nameError2');
                                        var dobInput2 = document.getElementById('dob2');
                                        var dobError2 = document.getElementById('dobError2');
                                        var submitForm2 = document.getElementById('submitForm2');
                                        var addressInput2 = document.getElementById('address2');
                                        var addressError2 = document.getElementById('addressError2');

                                        if (addressInput) {
                                            addressInput.addEventListener('input', function () {
                                                var addressValue = addressInput.value;
                                                if (addressValue === "") {
                                                    addressError.style.display = 'block';
                                                    submitForm.disabled = true;
                                                } else {
                                                    addressError.style.display = 'none';
                                                    submitForm.disabled = false;
                                                }
                                            });
                                        }

                                        if (addressInput2) {
                                            addressInput2.addEventListener('input', function () {
                                                var addressValue = addressInput2.value;
                                                if (addressValue === "") {
                                                    addressError2.style.display = 'block';
                                                    submitForm2.disabled = true;
                                                } else {
                                                    addressError2.style.display = 'none';
                                                    submitForm2.disabled = false;
                                                }
                                            });
                                        }

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

                                        if (emailInput2) {
                                            emailInput2.addEventListener('input', function () {
                                                var emailValue = emailInput2.value;
                                                if (!validateEmail(emailValue)) {
                                                    emailError2.style.display = 'block';
                                                    submitForm2.disabled = true;
                                                } else {
                                                    emailError2.style.display = 'none';
                                                    submitForm2.disabled = false;
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

                                        if (nameInput2) {
                                            nameInput2.addEventListener('input', function () {
                                                var nameValue = nameInput2.value;
                                                if (!validateName(nameValue)) {
                                                    nameError2.style.display = 'block';
                                                    submitForm2.disabled = true;
                                                } else {
                                                    nameError2.style.display = 'none';
                                                    submitForm2.disabled = false;
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

                                        if (dobInput2) {
                                            dobInput2.addEventListener('input', function () {
                                                var dobValue = dobInput2.value;
                                                if (!validateBirthDate(dobValue)) {
                                                    dobError2.style.display = 'block';
                                                    submitForm2.disabled = true;
                                                } else {
                                                    dobError2.style.display = 'none';
                                                    submitForm2.disabled = false;
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

                                    document.getElementById('file-upload').addEventListener('change', function (event) {
                                        const file = event.target.files[0];
                                        if (file) {
                                            const reader = new FileReader();
                                            reader.onload = function (e) {
                                                document.getElementById('profile-img').src = e.target.result;
                                            };
                                            reader.readAsDataURL(file);
                                        }
                                    });


                                    document.getElementById('file-uploadcv').addEventListener('change', function (event) {
                                        const file = event.target.files[0];
                                        if (file) {
                                            const reader = new FileReader();
                                            reader.onload = function (e) {
                                                document.getElementById('profile-imgcv').src = e.target.result;
                                            };
                                            reader.readAsDataURL(file);
                                        }
                                    });

                                </script>
                                <script>
                                    function checkCVStatus(cvStatus) {
                                        if (cvStatus !== 2) {
                                            $('#exampleModal2').modal('show');
                                            $('#exampleModal2').on('hidden.bs.modal', function (e) {
                                                location.reload();
                                            });
                                        }
                                    }

                                </script>
                                </body>
                                </html>