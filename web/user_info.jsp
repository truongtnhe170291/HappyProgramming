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
            .fcontent{
                background-color: #01B81A26;
                color: #01B81A;
            }
            .tcontent{
                background-color: #FF0F0F26;
                color: #FF0F0F;
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
                                    <ul class="nav px-30 ap-tab-main text-capitalize" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill" href="#v-pills-home" role="tab" aria-selected="true">
                                                <img src="img/svg/user.svg" alt="user" class="svg">personal info</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill" href="#v-pills-profile" role="tab" aria-selected="false">
                                                <img src="img/svg/briefcase.svg" alt="briefcase" class="svg">Curriculum Vitae</a>
                                        </li>
                                        <li class="nav-item">
                                           <div class="cards">                                        
                                               <span class="text_ct">Active</span>                          
                                  </div>
                               </li>
                                    </ul>
                                </div>
                                <div class="tab-content" id="v-pills-tabContent">
                                    <div class="tab-pane fade  show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                                        <div class="row justify-content-center">
                                            <div class="col-xxl-4 col-10">
                                                <form id ="myForm" action="updatementee" method="post">
                                                    <div class="mt-sm-40 mb-sm-50 mt-20 mb-20">
                                                        <div class="user-tab-info-title mb-sm-40 mb-20 text-capitalize">
                                                            <h5 class="fw-500">Personal Information</h5>
                                                        </div>
                                                        <div class="account-profile d-flex align-items-center mb-4">
                                                            <div class="ap-img pro_img_wrapper">
                                                                <input id="file-upload" type="file" name="fileUpload" class="d-none" accept="image/*">
                                                                <!-- Profile picture image -->
                                                                <label for="file-upload" class="position-relative d-inline-block">
                                                                    <img id="profile-img" class="ap-img__main rounded-circle wh-120 bg-lighter d-flex" src="img\tungche2.jpg" alt="profile">
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
                                                                <input type="text" class="form-control" id="name1" name="username" value="${mentee.userName}" placeholder="${mentee.userName}" readonly>
                                                            </div>
                                                            <div class="form-group mb-25">
                                                                <label for="name1">Full Name</label>
                                                                <input type="text" class="form-control" id="name1" name="fullname" value="${mentee.fullName}" placeholder="${mentee.fullName}">
                                                            </div>
                                                            <div class="form-group mb-25">
                                                                <div class="sexOption">
                                                                    <label for="sexOption">
                                                                        Sex
                                                                    </label>
                                                                    <select class="js-example-basic-single js-states form-control" id="sexOption" name="sex">
                                                                        <option value="1" ${mentee.sex == '1' ? 'selected' : '1'}>Male</option>
                                                                        <option value="0" ${mentee.sex == '0' ? 'selected' : '0'}>Female</option>>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group mb-25">
                                                                <label for="name2">Email</label>
                                                                <input type="email" class="form-control" id="name2" name="gmail" value="${mentee.gmail}" placeholder="${mentee.gmail}">
                                                            </div>
                                                            <div class="form-group mb-25">
                                                                <label for="dob">Date of birth</label>
                                                                <input type="date" class="form-control" name="dob" value="${mentee.dob}">
                                                            </div>
                                                            <div class="form-group mb-25">
                                                                <label for="phoneNumber5">phone number</label>
                                                                <input type="tel" class="form-control" id="phoneNumber" name="phone" value="${mentee.phone}" placeholder="${mentee.phone}">
                                                            </div>
                                                            <div class="form-group mb-25">
                                                                <label for="address">Address</label>
                                                                <input type="text" class="form-control" id="address" name="address" value="${mentee.address}" placeholder="${mentee.address}">
                                                            </div>

                                                            <div class="button-group d-flex pt-sm-25 justify-content-md-end justify-content-start ">
                                                               

                                                                <button type="submit" class="btn btn-primary btn-default btn-squared text-capitalize radius-md shadow2 btn-sm">
                                                                    Save &amp; Next
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                                <button id="edit_oki" class="btn btn-light btn-default btn-squared fw-400 text-capitalize radius-md btn-sm author_2"> cancel </button>
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
                                                                <button type="submit" id="button_oki" class="btn btn-primary btn-default btn-squared text-capitalize radius-md shadow2 btn-sm">Save & Next</button>
                                                            </div>

                                                        </form>
                                                <button id="edit_oki" class="btn btn-light btn-default btn-squared fw-400 text-capitalize radius-md btn-sm author_1">edit</button>

                                             
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
                                       <jsp:include page="style/linkJS.jsp" />
                                       <script>
                                      const text = document.querySelector(".text_ct");
                                const card = document.querySelector(".cards");
                                card.classList.add("fcontent");
                                const two = document.querySelectorAll("#edit_oki");
                                two.forEach((editButton) => {
                                  editButton.addEventListener("click", (event) => {
                                    text.textContent = "change";
                                    card.classList.remove("fcontent");
                                    card.classList.add("tcontent");
                                  });
                                });

                                 </script>
                                </body>
                                </html>