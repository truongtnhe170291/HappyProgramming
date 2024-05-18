<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en" dir="ltr">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>HexaDash</title>
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

        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@400;500;600;700&display=swap" rel="stylesheet">

        <!-- inject:css-->

        <link rel="stylesheet" href="assets/vendor_assets/css/bootstrap/bootstrap.css">

        <link rel="stylesheet" href="assets/vendor_assets/css/daterangepicker.css">

        <link rel="stylesheet" href="assets/vendor_assets/css/fontawesome.css">

        <link rel="stylesheet" href="assets/vendor_assets/css/footable.standalone.min.css">

        <link rel="stylesheet" href="assets/vendor_assets/css/fullcalendar@5.2.0.css">

        <link rel="stylesheet" href="assets/vendor_assets/css/jquery-jvectormap-2.0.5.css">

        <link rel="stylesheet" href="assets/vendor_assets/css/jquery.mCustomScrollbar.min.css">

        <link rel="stylesheet" href="assets/vendor_assets/css/leaflet.css">

        <link rel="stylesheet" href="assets/vendor_assets/css/line-awesome.min.css">

        <link rel="stylesheet" href="assets/vendor_assets/css/magnific-popup.css">

        <link rel="stylesheet" href="assets/vendor_assets/css/MarkerCluster.css">

        <link rel="stylesheet" href="assets/vendor_assets/css/MarkerCluster.Default.css">

        <link rel="stylesheet" href="assets/vendor_assets/css/select2.min.css">

        <link rel="stylesheet" href="assets/vendor_assets/css/slick.css">

        <link rel="stylesheet" href="assets/vendor_assets/css/star-rating-svg.css">

        <link rel="stylesheet" href="assets/vendor_assets/css/trumbowyg.min.css">

        <link rel="stylesheet" href="assets/vendor_assets/css/wickedpicker.min.css">

        <link rel="stylesheet" href="<link rel="stylesheet" href="HappyProgramming/Web Pages/views/styles.css">">

        <!-- endinject -->

        <link rel="icon" type="image/png" sizes="16x16" href="img/favicon.png">

        <!-- Fonts -->
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

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
                                            <a class="nav-link" id="v-pills-messages-tab" data-bs-toggle="pill" href="#v-pills-messages" role="tab" aria-selected="false">
                                                <img src="img/svg/share-2.svg" alt="share-2" class="svg">Social</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="tab-content" id="v-pills-tabContent">
                                    <div class="tab-pane fade  show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                                        <div class="row justify-content-center">
                                            <div class="col-xxl-4 col-10">
                                                <form action="updatementee" method="post">
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
                                                                <button class="btn btn-light btn-default btn-squared fw-400 text-capitalize radius-md btn-sm">
                                                                    cancel
                                                                </button>

                                                                <button type="submit" class="btn btn-primary btn-default btn-squared text-capitalize radius-md shadow2 btn-sm">
                                                                    Save &amp; Next
                                                                </button>
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
                                                                    <a href="#"><img class="svg" src="img/svg/chevron-right.svg" alt="chevron-right"></a>
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

                                                        <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                                                            <div class="row justify-content-center">
                                                                <div class="col-xxl-4 col-10">
                                                                    <div class="user-social-profile mt-40 mb-50">
                                                                        <div class="user-tab-info-title mb-40 text-capitalize">
                                                                            <h5>social profiles</h5>
                                                                        </div>
                                                                        <div class="edit-profile__body">
                                                                            <form>
                                                                                <div class=" mb-30">
                                                                                    <label for="socialUrl">facebook</label>
                                                                                    <div class="input-group flex-nowrap">
                                                                                        <div class="input-group-prepend">
                                                                                            <span class="input-group-text bg-facebook border-facebook text-white wh-44 radius-xs justify-content-center" id="addon-wrapping1">
                                                                                                <i class="lab la-facebook-f fs-18"></i>
                                                                                            </span>
                                                                                        </div>
                                                                                        <input type="text" class="form-control form-control--social" placeholder="Url" aria-label="Username" aria-describedby="addon-wrapping1" id="socialUrl">
                                                                                    </div>
                                                                                </div>
                                                                                <div class=" mb-30">
                                                                                    <label for="twitterUrl">twitter</label>
                                                                                    <div class="input-group flex-nowrap">
                                                                                        <div class="input-group-prepend">
                                                                                            <span class="input-group-text bg-twitter border-twitter text-white wh-44 radius-xs justify-content-center" id="addon-wrapping2">
                                                                                                <i class="lab la-twitter fs-18"></i>
                                                                                            </span>
                                                                                        </div>
                                                                                        <input type="text" class="form-control form-control--social" placeholder="@Username" aria-label="Username" aria-describedby="addon-wrapping2" id="twitterUrl">
                                                                                    </div>
                                                                                </div>
                                                                                <div class=" mb-30">
                                                                                    <label for="webUrl">Website</label>
                                                                                    <div class="input-group flex-nowrap">
                                                                                        <div class="input-group-prepend">
                                                                                            <span class="input-group-text bg-ruby border-ruby text-white wh-44 radius-xs justify-content-center" id="addon-wrapping3">
                                                                                                <i class="las la-basketball-ball fs-18"></i>
                                                                                            </span>
                                                                                        </div>
                                                                                        <input type="text" class="form-control form-control--social" placeholder="Url" aria-label="Username" aria-describedby="addon-wrapping3" id="webUrl">
                                                                                    </div>
                                                                                </div>
                                                                                <div class=" mb-30">
                                                                                    <label for="instagramUrl">instagram</label>
                                                                                    <div class="input-group flex-nowrap">
                                                                                        <div class="input-group-prepend">
                                                                                            <span class="input-group-text bg-instagram border-instagram text-white wh-44 radius-xs justify-content-center" id="addon-wrapping4">
                                                                                                <i class="lab la-instagram fs-18"></i>
                                                                                            </span>
                                                                                        </div>
                                                                                        <input type="text" class="form-control form-control--social" aria-describedby="addon-wrapping4" placeholder="Url" id="instagramUrl">
                                                                                    </div>
                                                                                </div>
                                                                                <div class=" mb-30">
                                                                                    <label for="githubUrl">github</label>
                                                                                    <div class="input-group flex-nowrap">
                                                                                        <div class="input-group-prepend">
                                                                                            <span class="input-group-text bg-dark border-dark  text-white wh-44 radius-xs justify-content-center" id="addon-wrapping5">
                                                                                                <i class="lab la-github fs-18"></i>
                                                                                            </span>
                                                                                        </div>
                                                                                        <input type="text" class="form-control form-control--social" placeholder="Username" aria-label="Username" aria-describedby="addon-wrapping5" id="githubUrl">
                                                                                    </div>
                                                                                </div>
                                                                                <div class=" mb-30">
                                                                                    <label for="mediumUrl">medium</label>
                                                                                    <div class="input-group flex-nowrap">
                                                                                        <div class="input-group-prepend">
                                                                                            <span class="input-group-text bg-dark border-dark text-white wh-44 radius-xs justify-content-center" id="addon-wrapping6">
                                                                                                <i class="lab la-medium fs-18"></i>
                                                                                            </span>
                                                                                        </div>
                                                                                        <input type="text" class="form-control form-control--social" placeholder="Username" aria-label="medium" aria-describedby="addon-wrapping6" id="mediumUrl">
                                                                                    </div>
                                                                                </div>
                                                                                <div class="button-group d-flex pt-20 justify-content-md-end justify-content-start">


                                                                                    <button class="btn btn-light btn-default btn-squared fw-400 text-capitalize radius-md">back
                                                                                    </button>







                                                                                    <button class="btn btn-primary btn-default btn-squared text-capitalize radius-md shadow2">Save profile
                                                                                    </button>





                                                                                </div>
                                                                            </form>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <footer class="footer-wrapper">
                                    <div class="footer-wrapper__inside">
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="footer-copyright">
                                                        <p><span>© 2023</span><a href="#">Sovware</a>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="footer-menu text-end">
                                                        <ul>
                                                            <li>
                                                                <a href="#">About</a>
                                                            </li>
                                                            <li>
                                                                <a href="#">Team</a>
                                                            </li>
                                                            <li>
                                                                <a href="#">Contact</a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <!-- ends: .Footer Menu -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </footer>
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
                                <!-- inject:js-->
                                <script src="assets/vendor_assets/js/jquery/jquery-3.5.1.min.js"></script>
                                <script src="assets/vendor_assets/js/jquery/jquery-ui.js"></script>
                                <script src="assets/vendor_assets/js/bootstrap/popper.js"></script>
                                <script src="assets/vendor_assets/js/bootstrap/bootstrap.min.js"></script>
                                <script src="assets/vendor_assets/js/moment/moment.min.js"></script>
                                <script src="assets/vendor_assets/js/accordion.js"></script>
                                <script src="assets/vendor_assets/js/apexcharts.min.js"></script>
                                <script src="assets/vendor_assets/js/autoComplete.js"></script>
                                <script src="assets/vendor_assets/js/Chart.min.js"></script>
                                <script src="assets/vendor_assets/js/daterangepicker.js"></script>
                                <script src="assets/vendor_assets/js/drawer.js"></script>
                                <script src="assets/vendor_assets/js/dynamicBadge.js"></script>
                                <script src="assets/vendor_assets/js/dynamicCheckbox.js"></script>
                                <script src="assets/vendor_assets/js/footable.min.js"></script>
                                <script src="assets/vendor_assets/js/fullcalendar@5.2.0.js"></script>
                                <script src="assets/vendor_assets/js/google-chart.js"></script>
                                <script src="assets/vendor_assets/js/jquery-jvectormap-2.0.5.min.js"></script>
                                <script src="assets/vendor_assets/js/jquery-jvectormap-world-mill-en.js"></script>
                                <script src="assets/vendor_assets/js/jquery.countdown.min.js"></script>
                                <script src="assets/vendor_assets/js/jquery.filterizr.min.js"></script>
                                <script src="assets/vendor_assets/js/jquery.magnific-popup.min.js"></script>
                                <script src="assets/vendor_assets/js/jquery.peity.min.js"></script>
                                <script src="assets/vendor_assets/js/jquery.star-rating-svg.min.js"></script>
                                <script src="assets/vendor_assets/js/leaflet.js"></script>
                                <script src="assets/vendor_assets/js/leaflet.markercluster.js"></script>
                                <script src="assets/vendor_assets/js/loader.js"></script>
                                <script src="assets/vendor_assets/js/message.js"></script>
                                <script src="assets/vendor_assets/js/moment.js"></script>
                                <script src="assets/vendor_assets/js/muuri.min.js"></script>
                                <script src="assets/vendor_assets/js/notification.js"></script>
                                <script src="assets/vendor_assets/js/popover.js"></script>
                                <script src="assets/vendor_assets/js/select2.full.min.js"></script>
                                <script src="assets/vendor_assets/js/slick.min.js"></script>
                                <script src="assets/vendor_assets/js/trumbowyg.min.js"></script>
                                <script src="assets/vendor_assets/js/wickedpicker.min.js"></script>
                                <script src="assets/theme_assets/js/apexmain.js"></script>
                                <script src="assets/theme_assets/js/charts.js"></script>
                                <script src="assets/theme_assets/js/drag-drop.js"></script>
                                <script src="assets/theme_assets/js/footable.js"></script>
                                <script src="assets/theme_assets/js/full-calendar.js"></script>
                                <script src="assets/theme_assets/js/googlemap-init.js"></script>
                                <script src="assets/theme_assets/js/icon-loader.js"></script>
                                <script src="assets/theme_assets/js/jvectormap-init.js"></script>
                                <script src="assets/theme_assets/js/leaflet-init.js"></script>
                                <script src="assets/theme_assets/js/main.js"></script>
                                <!-- endinject-->
                                </body>
                                </html>