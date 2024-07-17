<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en" dir="ltr">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Update CV of mentor</title>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>       
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

            button {

                position: relative;
                padding: 12px 35px;
                background: #fec195;
                font-size: 17px;
                font-weight: 500;
                color: #181818;
                border: 3px solid #fec195;
                border-radius: 20px;
                box-shadow: 0 0 0 #fec1958c;
                transition: all 0.3s ease-in-out;
                cursor: pointer;
            }

            .star-1 {
                position: absolute;
                top: 20%;
                left: 20%;
                width: 25px;
                height: auto;
                filter: drop-shadow(0 0 0 #fffdef);
                z-index: -5;
                transition: all 1s cubic-bezier(0.05, 0.83, 0.43, 0.96);
            }

            .star-2 {
                position: absolute;
                top: 45%;
                left: 45%;
                width: 15px;
                height: auto;
                filter: drop-shadow(0 0 0 #fffdef);
                z-index: -5;
                transition: all 1s cubic-bezier(0, 0.4, 0, 1.01);
            }

            .star-3 {
                position: absolute;
                top: 40%;
                left: 40%;
                width: 5px;
                height: auto;
                filter: drop-shadow(0 0 0 #fffdef);
                z-index: -5;
                transition: all 1s cubic-bezier(0, 0.4, 0, 1.01);
            }

            .star-4 {
                position: absolute;
                top: 20%;
                left: 40%;
                width: 8px;
                height: auto;
                filter: drop-shadow(0 0 0 #fffdef);
                z-index: -5;
                transition: all 0.8s cubic-bezier(0, 0.4, 0, 1.01);
            }

            .star-5 {
                position: absolute;
                top: 25%;
                left: 45%;
                width: 15px;
                height: auto;
                filter: drop-shadow(0 0 0 #fffdef);
                z-index: -5;
                transition: all 0.6s cubic-bezier(0, 0.4, 0, 1.01);
            }

            .star-6 {
                position: absolute;
                top: 5%;
                left: 50%;
                width: 5px;
                height: auto;
                filter: drop-shadow(0 0 0 #fffdef);
                z-index: -5;
                transition: all 0.8s ease;
            }

            button:hover {
                background: transparent;
                color: #fec195;
                box-shadow: 0 0 25px #fec1958c;
            }

            button:hover .star-1 {
                position: absolute;
                top: -80%;
                left: -30%;
                width: 25px;
                height: auto;
                filter: drop-shadow(0 0 10px #fffdef);
                z-index: 2;
            }

            button:hover .star-2 {
                position: absolute;
                top: -25%;
                left: 10%;
                width: 15px;
                height: auto;
                filter: drop-shadow(0 0 10px #fffdef);
                z-index: 2;
            }

            button:hover .star-3 {
                position: absolute;
                top: 55%;
                left: 25%;
                width: 5px;
                height: auto;
                filter: drop-shadow(0 0 10px #fffdef);
                z-index: 2;
            }

            button:hover .star-4 {
                position: absolute;
                top: 30%;
                left: 80%;
                width: 8px;
                height: auto;
                filter: drop-shadow(0 0 10px #fffdef);
                z-index: 2;
            }

            button:hover .star-5 {
                position: absolute;
                top: 25%;
                left: 115%;
                width: 15px;
                height: auto;
                filter: drop-shadow(0 0 10px #fffdef);
                z-index: 2;
            }

            button:hover .star-6 {
                position: absolute;
                top: 5%;
                left: 60%;
                width: 5px;
                height: auto;
                filter: drop-shadow(0 0 10px #fffdef);
                z-index: 2;
            }

            .fil0 {
                fill: #fffdef;
            }
            .hes{
                float: right;
            }
            .ap-tab-wrapper.border-bottom{
                display: flex;
                justify-content: end;
            }
            .statusol{

                line-height: 20px;
                text-align: center;
                margin-top: 20px;
                width: fit-content;
                display: flex;
                justify-content: center;
                margin-right: 50px;
                font-size: 18px;
            }
            .statusol span{
                margin-left: 10px;
                margin-top: -3px;
            }
            .status-bar{
                display: flex;
                justify-content: center;
            }
            .feedback-container {
                margin-top: 20px;
                padding: 15px;
                border: 1px solid #ced4da;
                border-radius: 5px;
                background-color: #f1f1f1;
            }
            .feedback-container img {
                width: 50px;
                height: 50px;
                border-radius: 50%;
                margin-right: 15px;
            }
            .feedback-content {
                flex: 1;
            }
            .feedback-content strong {
                display: block;
                margin-bottom: 10px;
                font-size: 16px;
                color: #333;
            }
            .feedback-content p {
                margin: 0;
                font-size: 14px;
                color: #555;
            }
            .hidden {
                display: none;
            }
            h4 {

                cursor: pointer;
                padding: 10px 15px;
                margin: 10px 0;
                border-radius: 5px;
                color: #fff;
                text-align: center;
                transition: background-color 0.3s ease;
            }
            #set-rate-as1, #apply-cv-as2 {
                margin: 6px 12px;
                background-color: #a6e9f4;
            }
            #set-rate-as1:hover, #apply-cv-as2:hover {
                background-color: #5a6268;
            }
            #apply-cv-as1, #set-rate-as2 {
                background-color: #a6e9f4;
            }
            #apply-cv-as1:hover, #set-rate-as2:hover {
                background-color: #138496;
            }
            
                .status-radio label {
              
                    font-weight: bold;
                    font-size: 18px;
                    margin-bottom: 15px;
                    display: block;
                    color: #333;
                }

                .skills-container {
                    display: flex;
                    flex-wrap: wrap;
                    gap: 20px;
                }

                .skill-item {
                    background-color: #fff;
                    border: 1px solid #ddd;
                    border-radius: 8px;
                    padding: 12px 20px;
                    display: flex;
                    align-items: center;
                    transition: box-shadow 0.3s ease, transform 0.3s ease;
                    cursor: pointer;
                    width: 100%;
                    max-width: 200px;
                    text-align: center;
                }

                .skill-item:hover {
                    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
                    transform: translateY(-3px);
                }

                .form-check-input {
                    margin-right: 10px;
                   
                    transform: scale(1.2);
                }

                .form-check-label {
                    margin: 0;
                    font-size: 16px;
                    color: #555;
                    flex-grow: 1;
                    text-align: left;
                }

                @media (max-width: 768px) {
                    .skills-container {
                        flex-direction: column;
                    }

                    .skill-item {
                        width: 100%;
                    }
                }
                .form-group {
                    margin-bottom: 25px;
                }
                ev{
  pointer-events: none;
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

                <div class="container-fluid as1">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="d-flex align-items-center user-member__title mb-30 mt-30">
                                <h4 class="text-capitalize" id="apply-cv-as1">Apply CV</h4>
                                <h4 class="text-capitalize" id="set-rate-as1">Set Rate</h4>

                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="user-info-tab w-100 bg-white global-shadow radius-xl mb-50">
                                <div class="ap-tab-wrapper border-bottom ">
                                    <ul class="nav px-30 ap-tab-main text-capitalize flex" id="v-pills-tab" role="tablist" aria-orientation="vertical">

                                        <li class="nav-item hes">

                                            <form action="aplly" method="post" class="status-bar">
                                                <input type="hidden" name="cvId" value="${cv.cvId}"/>
                                                <div class="statusol">
                                                    CV Status: 
                                                    <span class="bg-opacity-success color-success userDatatable-content-status" style="display:none;font-size: 15px;">${requestScope.cv.status.statusName}</span>
                                                    <span class="bg-opacity-danger color-danger userDatatable-content-status" style="display:none;font-size: 15px;">${requestScope.cv.status.statusName}</span>
                                                    <span class="bg-opacity-warning color-warning userDatatable-content-status" style="font-size: 15px;">${requestScope.cv.status.statusName}</span>
                                                </div>
                                                <button type="submit" class="sets">
                                                    Apply CV
                                                    
                                                </button>
                                            </form>                           
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
                                                            <div style="display: none" id="addressError2" class="alert alert-warning alert-dismissible fade show" role="alert">
                                                                    <strong style="color: red">Oh no!</strong> Please input your profession.
                                                                </div>
                                                            </div>
                                                            
                                                            <div class="form-group mb-25">
                                                                <label for="phoneNumber1">Profession introduction</label>
                                                                <textarea name="professionIntro" rows="9" type="text" class="form-control" id="phoneNumber1">${cv.professionIntro}</textarea>
                                                            <div style="display: none" id="addressError2" class="alert alert-warning alert-dismissible fade show" role="alert">
                                                                    <strong style="color: red">Oh no!</strong> Please input your professionIntro.
                                                                </div>
                                                            </div>

                                                            <div class="form-group mb-25">
                                                                <label for="phoneNumber1">Achievement Description</label>
                                                                <textarea name="achievementDescription" rows="9" type="text" class="form-control" id="phoneNumber1">${cv.achievementDescription}</textarea>
                                                             <div style="display: none" id="addressError2" class="alert alert-warning alert-dismissible fade show" role="alert">
                                                                    <strong style="color: red">Oh no!</strong> Please input your Achievement Description.
                                                                </div>
                                                            </div>

                                                            <div class="form-group mb-25">
                                                                <label for="phoneNumber1">Service Description</label>
                                                                <textarea name="serviceDescription" rows="9" type="text" class="form-control" id="phoneNumber1">${cv.serviceDescription}</textarea>
                                                           <div style="display: none" id="addressError2" class="alert alert-warning alert-dismissible fade show" role="alert">
                                                                    <strong style="color: red">Oh no!</strong> Please input your Service Description.
                                                                </div>
                                                            </div>

                                                            <div class="form-group mb-25 status-radio">
                                                                <label for="hiringDateCheckbox">Skill</label>
                                                                <div class="d-flex skills-container">
                                                                    <c:forEach items="${requestScope.skills}" var="skill">
                                                                        <c:set var="isChecked" value="false"/>
                                                                        <c:forEach items="${cv.skills}" var="cvskill">
                                                                            <c:if test="${skill.skillID == cvskill}">
                                                                                <c:set var="isChecked" value="true"/>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                        <div class="form-check skill-item">
                                                                            <input style="margin-left:10px;" name="skills" class="form-check-input" type="checkbox" <c:if test="${isChecked}">checked</c:if> value="${skill.skillID}" id="hiringDateCheckbox-${skill.skillID}">
                                                                            <label class="form-check-label" for="hiringDateCheckbox-${skill.skillID}">${skill.skillName}</label>
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
                                    <div class="feedback-container">
                                        <img src="path/to/admin-avatar.jpg" alt="Admin Avatar">
                                        <div class="feedback-content">
                                            <strong>Feedback From Manager:</strong>
                                            <p>${cv.note}</p>
                                        </div>
                                    </div>
                                </div>


















                            </div>
                        </div>
                    </div>
                </div>
                <div class="container-fluid as2 hidden">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="d-flex align-items-center user-member__title mb-30 mt-30">

                                <h4 class="text-capitalize" id="apply-cv-as2">Apply CV</h4>
                                <h4 class="text-capitalize" id="set-rate-as2">Set Rate</h4>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="user-info-tab w-100 bg-white global-shadow radius-xl mb-50">
                                <form action="SetRate" method="post">
                                    <div class="ap-tab-wrapper border-bottom ">
                                        <ul class="nav px-30 ap-tab-main text-capitalize flex" id="v-pills-tab" role="tablist" aria-orientation="vertical">

                                            <li class="nav-item hes">


                                                <button type="submit" class="sets">
                                                    Set Rate
                                                    
                                                </button>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="tab-content" id="v-pills-tabContent">

                                        <div class="tab-pane fade show active" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                                            <div class="row justify-content-center">
                                                <div class="col-xxl-4 col-10">

                                                    <div class="edit-profile__body">
                                                        <label for="rate" style="font-size: 14px;
                                                               font-weight: 500;
                                                               color: #495057;
                                                               margin-bottom: 5px;
                                                               display: block;;">Your Current Rate:</label>
                                                        <input type="number" class="rate_all" name="rate" value="${rate}" style="width: 100%;
                                                               padding: 10px;
                                                               margin-bottom: 20px;
                                                               border: 1px solid #ced4da;
                                                               border-radius: 5px;
                                                               font-size: 16px;
                                                               color: #495057;">
                                                        <input type="hidden" name="mentorName" value="${mentorName}" hidden="true">

                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div></div></div></div>

















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
        document.addEventListener("DOMContentLoaded", function () {
            document.getElementById('set-rate-as1').addEventListener('click', function () {
            const rate = Number(document.querySelector(".rate_all").value);
            console.log(rate);
            if (rate <= 0) {
                document.getElementById('set-rate-as1').classList.add('ev');
                Toastify({
                    text: ('Bạn chưa nhập Rate. Hãy điền rate !!!'),
                    duration: 5000,
                    gravity: "top",
                    position: "right",
                    backgroundColor: "#ff7b5a",
                }).showToast();
            }
        });
    });
    </script>
    <script>
        document.getElementById('set-rate-as1').addEventListener('click', function () {
            document.querySelector('.as1').classList.add('hidden');
            document.querySelector('.as2').classList.remove('hidden');
        });

        document.getElementById('apply-cv-as2').addEventListener('click', function () {
            document.querySelector('.as2').classList.add('hidden');
            document.querySelector('.as1').classList.remove('hidden');
        });
    </script>
    <script>
    document.addEventListener('DOMContentLoaded', function() {
    const submitButton = document.getElementById('submitForm2'); 

    const nameInput = document.getElementById('fullname2');
    const emailInput = document.getElementById('email2');
    const dobInput = document.getElementById('dob2');
    const addressInput = document.getElementById('address2');
    const professionInput = document.getElementsByName('profession')[0];
    const professionIntroInput = document.getElementsByName('professionIntro')[0];
    const achievementDescriptionInput = document.getElementsByName('achievementDescription')[0];
    const serviceDescriptionInput = document.getElementsByName('serviceDescription')[0];

    const nameError = document.getElementById('nameError2');
    const emailError = document.getElementById('emailError2');
    const dobError = document.getElementById('dobError2');
    const addressErrors = document.querySelectorAll('#addressError2');

    function validateForm() {
        let isValid = true;

        if (!nameInput.value.trim()) {
            nameError.style.display = 'block';
            isValid = false;
        } else {
            nameError.style.display = 'none';
        }

        if (!emailInput.value.trim()) {
            emailError.style.display = 'block';
            isValid = false;
        } else {
            emailError.style.display = 'none';
        }

        if (!dobInput.value.trim()) {
            dobError.style.display = 'block';
            isValid = false;
        } else {
            dobError.style.display = 'none';
        }

        if (!addressInput.value.trim()) {
            addressErrors[0].style.display = 'block';
            isValid = false;
        } else {
            addressErrors[0].style.display = 'none';
        }

        if (!professionInput.value.trim()) {
            addressErrors[1].style.display = 'block';
            isValid = false;
        } else {
            addressErrors[1].style.display = 'none';
        }

        if (!professionIntroInput.value.trim()) {
            addressErrors[2].style.display = 'block';
            isValid = false;
        } else {
            addressErrors[2].style.display = 'none';
        }

        if (!achievementDescriptionInput.value.trim()) {
            addressErrors[3].style.display = 'block';
            isValid = false;
        } else {
            addressErrors[3].style.display = 'none';
        }

        if (!serviceDescriptionInput.value.trim()) {
            addressErrors[4].style.display = 'block';
            isValid = false;
        } else {
            addressErrors[4].style.display = 'none';
        }

        submitButton.disabled = !isValid;

        return isValid;
    }

    const inputs = [nameInput, emailInput, dobInput, addressInput, professionInput, professionIntroInput, achievementDescriptionInput, serviceDescriptionInput];

    inputs.forEach(input => {
        input.addEventListener('input', validateForm);
        input.addEventListener('change', validateForm);
    });

    validateForm(); // Initial check
});



    </script>
</body>
</html>