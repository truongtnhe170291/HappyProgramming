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

            .fl{
                margin-top: 12px;
                line-height: 100px;
                width: 100px;
                height: 40px;
             background-color: #ccc;
            margin-left: auto;
            margin-right: 0;
         outline: none;
         text-align: center;
         
            }
            .cliick{
                
                background-color: #8231D3;
               margin: 5px 5px;
                width: 100%;
                height: 100%;
                border:none;
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
                                <h4 class="text-capitalize">add user</h4>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="user-info-tab w-100 bg-white global-shadow radius-xl mb-50">
                                <div class="ap-tab-wrapper border-bottom ">
                                    <ul class="nav px-30 ap-tab-main text-capitalize flex" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                             
                                        <li class="nav-item">
                                            <a class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill" href="#v-pills-profile" role="tab" aria-selected="false">
                                                <img src="img/svg/briefcase.svg" alt="briefcase" class="svg">Curriculum Vitae</a>
                                        </li>
                                     <li class="nav-item fl ">
                                        
                                            <input value="Send CV" class="nav-link cliick" id="v-pills-profile-tab" data-bs-toggle="pill" type="submit"/>                            
                                        </li>
                                   
                                    </ul>
                                </div>
                                <div class="tab-content" id="v-pills-tabContent">
                  
                                    <div class="tab-pane fade show active" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                                        <div class="row justify-content-center">
                                            <div class="col-xxl-4 col-10">
                                                <div class="mt-40 mb-50">
                                                    <div class="user-tab-info-title mb-35 text-capitalize">
                                                        <h5 class="fw-500">CV Information</h5>
                                                    </div>
                                                    <form action="cv" method="POST" enctype="multipart/form-data">
                                                        <c:set var="cv" value="${requestScope.cv}"/>
                                                        <div class="account-profile d-flex align-items-center mb-4">
                                                            <div class="ap-img pro_img_wrapper">
                                                                <input id="file-uploadcv" type="file" name="uploadcv" class="d-none" accept="image/*">
                                                                <!-- Profile picture image -->
                                                                <label for="file-uploadcv" class="position-relative d-inline-block">
                                                                    <img id="profile-imgcv" class="ap-img__main rounded-circle wh-120 bg-lighter d-flex" src="./imgcv/${cv.imgcv}" alt="profile">
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
                                                                    <label for="name4">Full Name</label>
                                                                    <input name="fullName" value="${cv.fullName}" type="text" class="form-control" id="fullname2" placeholder="Duran Clayton">
                                                                </div>
                                                                <div style="display: none" id="nameError2" class="alert alert-warning alert-dismissible fade show" role="alert">
                                                                    <strong style="color: red">Oh no!</strong> Your name is invalid.
                                                                </div>
                                                            </div>

                                                            <div style="margin-bottom: 15px">
                                                                <div class="form-group mb-25">
                                                                    <label for="phoneNumber1">Mail</label>
                                                                    <input name="gmail" value="${cv.gmail}" type="text" class="form-control" id="email2" placeholder="Design">
                                                                </div>
                                                                <div style="display: none" id="emailError2" class="alert alert-warning alert-dismissible fade show" role="alert">
                                                                    <strong style="color: red">Oh no!</strong> Your email is invalid.
                                                                </div>
                                                            </div>

                                                            <div style="margin-bottom: 15px">
                                                                <div class="form-group mb-25 form-group">
                                                                    <label for="datepicker">Date of birth</label>
                                                                    <div class="position-relative">
                                                                        <input id="dob2" name="dob" value="${cv.dob}" type="date" class="form-control"  placeholder="January 20, 2018">
                                                                    </div>
                                                                </div>
                                                                <div style="display: none" id="dobError2" class="alert alert-warning alert-dismissible fade show" role="alert">
                                                                    <strong style="color: red">Oh no!</strong> Your date of birth is invalid.
                                                                </div>
                                                            </div>
                                                            <div style="display: none" id="dobvcErr" class="alert alert-warning alert-dismissible fade show" role="alert">
                                                                <strong style="color: red">Oh no!</strong> your birthday is invalid.
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

                                                            <div style="margin-bottom: 15px">

                                                                <div class="form-group mb-25">
                                                                    <label for="phoneNumber1">Address</label>
                                                                    <input name="address" value="${cv.address}" type="text" class="form-control" id="address2" placeholder="Design">
                                                                </div>
                                                                <div style="display: none" id="addressError2" class="alert alert-warning alert-dismissible fade show" role="alert">
                                                                    <strong style="color: red">Oh no!</strong> Please input your Address.
                                                                </div>
                                                            </div>

                                                            <div class="form-group mb-25">
                                                                <label for="phoneNumber1">Profession</label>
                                                                <input name="profession" value="${cv.profession}" type="text" class="form-control" id="phoneNumber1" placeholder="Design">
                                                            </div>
                                                            <div class="form-group mb-25">
                                                                <label for="phoneNumber1">Profession introduction</label>
                                                                <textarea name="professionIntro"  type="text" class="form-control" id="phoneNumber1">${cv.professionIntro}</textarea>
                                                            </div>
                                                            
                                                            <div class="form-group mb-25">
                                                                <label for="phoneNumber1">Achievement Description</label>
                                                                <textarea name="achievementDescription"  type="text" class="form-control" id="phoneNumber1">${cv.achievementDescription}</textarea>
                                                            </div>
                                                            
                                                            <div class="form-group mb-25">
                                                                <label for="phoneNumber1">Service Description</label>
                                                                <textarea name="serviceDescription"  type="text" class="form-control" id="phoneNumber1">${cv.serviceDescription}</textarea>
                                                            </div>

                                                            <div class="form-group mb-25 status-radio ">
                                                                <label for="hiringDateCheckbox">Skill</label>
                                                                <div class="d-flex">
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
                                                                <button type="submit" id="submitForm2" class="btn btn-primary btn-default btn-squared text-capitalize radius-md shadow2 btn-sm">SAVE</button>
                                                            </div>
                                                        </div>
                                                    </form>
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
                                </body>
                                </html>