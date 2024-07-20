<%-- 
    Document   : control_nav
    Created on : May 18, 2024, 8:56:02 AM
    Author     : 84979
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Fmaster</title>
        <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1, maximum-scale=1, user-scalable=no">
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!-- Favicons-->
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon"/>
        <link rel="apple-touch-icon" type="image/x-icon" href="img/apple-touch-icon-57x57-precomposed.png">
        <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="img/apple-touch-icon-72x72-precomposed.png">
        <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="img/apple-touch-icon-114x114-precomposed.png">
        <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="img/apple-touch-icon-144x144-precomposed.png">

        <!-- GOOGLE WEB FONT -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Raleway:400,500,600,700,800" rel="stylesheet">

        <!-- CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/superfish.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">


        <style>

            .form {
                max-width: 600px;
                margin: 50px auto;
                padding: 20px;
                background: linear-gradient(145deg, #f3f4f6, #ffffff);
                border-radius: 15px;
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
                transition: all 0.3s ease-in-out;
            }

            .form:hover {
                box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
            }

            .form label span {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
                color: #333;
            }

            .form input,
            .form select {
                width: 100%;
                padding: 10px;
                margin: 5px 0 20px 0;
                display: inline-block;
                border: 1px solid #ddd;
                border-radius: 4px;
                box-sizing: border-box;
                background-color: #f9f9f9;
                transition: border-color 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
            }

            .form input:focus,
            .form select:focus {
                border-color: #007bff;
                box-shadow: 0 0 8px rgba(0, 123, 255, 0.3);
            }

            .form input[type="file"] {
                display: none;
            }

            label[for="file-upload"] {
                display: flex;
                flex-direction: column;
                align-items: center;
                cursor: pointer;
            }

            label[for="file-upload"] img {
                width: 120px;
                height: 120px;
                border-radius: 50%;
                object-fit: cover;
                margin-bottom: 10px;
                border: 3px solid #ddd;
                transition: border-color 0.3s ease-in-out, transform 0.3s ease-in-out;
            }

            label[for="file-upload"]:hover img {
                border-color: #007bff;
                transform: scale(1.05);
            }




            .form h5 {
                margin: 5px 0 10px 0;
                font-size: 14px;
                color: red;
            }

            .flext {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-bottom: 15px;
            }
            button {
                display: flex !important;
                align-items: center !important;
                justify-content: center;
                text-align: center;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -0%);
                --glow-color: rgb(217, 176, 255);
                /* --glow-spread-color: rgba(191, 123, 255, 0.781); */
                --enhanced-glow-color: rgb(231, 206, 255);
                /* --btn-color: rgb(100, 61, 136); */
                border: .25em solid var(--glow-color);
                padding: 1em 3em;
                /* color: var(--glow-color); */
                /* font-size: 15px; */
                font-weight: bold;
                /* background-color: var(--btn-color); */
                border-radius: 1em;
                outline: none;
                /* box-shadow: 0 0 1em .25em var(--glow-color),
                     0 0 4em 1em var(--glow-spread-color),
                     inset 0 0 .75em .25em var(--glow-color); */
                text-shadow: 0 0 .5em var(--glow-color);
                position: relative;
                transition: all 0.3s;
            }
            button::after {
                pointer-events: none;
                content: "";
                position: absolute;
                top: 120%;
                left: 0;
                height: 100%;
                width: 100%;
                background-color: var(--glow-spread-color);
                filter: blur(2em);
                opacity: .7;
                transform: perspective(1.5em) rotateX(35deg) scale(1, .6);
            }

            button:hover {
                color: var(--btn-color);
                background-color: var(--glow-color);
                box-shadow: 0 0 1em .25em var(--glow-color),
                    0 0 4em 2em var(--glow-spread-color),
                    inset 0 0 .75em .25em var(--glow-color);
            }

            button:active {
                box-shadow: 0 0 0.6em .25em var(--glow-color),
                    0 0 2.5em 2em var(--glow-spread-color),
                    inset 0 0 .5em .25em var(--glow-color);
            }
            .account-profile__title h6 {
                text-align: center;
                color: #007bff;
                font-size: 18px;
                margin-top: 10px;
            }

            #profile-img {
                border: 2px solid #007bff;
            }

            .js-example-basic-single {
                width: 100%;
            }

            @media (max-width: 600px) {
                .form {
                    padding: 15px;
                }

                .form button.submit {
                    padding: 10px;
                    font-size: 14px;
                }

                label[for="file-upload"] img {
                    width: 100px;
                    height: 100px;
                }
            }

            .rounded-circle {
                width: 200px;
                height: 200px;
            }
        </style>
    </head>
    <body>

           <header id="header" data-fullwidth="true">
            <div class="header-inner">
                <div class="container">
                    <!--Logo-->
                    <div id="logo">
                        <a href="homeMentee">
                            <span class="logo-default">FMASTER</span>
                            <span class="logo-dark">FMASTER</span>
                        </a>
                    </div>
                    <!--End: Logo-->
                    <!-- Search -->
                    <div id="search"><a id="btn-search-close" class="btn-search-close"
                                        aria-label="Close search form"><i class="icon-x"></i></a>
                        <form class="search-form" action="search-results-page.html" method="get">
                            <input class="form-control" name="q" type="text" placeholder="Type & Search..." />
                            <span class="text-muted">Start typing & press "Enter" or "ESC" to close</span>
                        </form>
                    </div>
                    <!-- end: search -->
                    <!--Header Extras-->
                    <div class="header-extras">
                        <ul>
                            <li>
                                <a id="btn-search" href="#"> <i class="icon-search"></i></a>
                            </li>
                        </ul>
                    </div>
                    <!--end: Header Extras-->
                    <!--Navigation Resposnive Trigger-->
                    <div id="mainMenu-trigger">
                        <a class="lines-button x"><span class="lines"></span></a>
                    </div>
                    <!--end: Navigation Resposnive Trigger-->
                    <!--Navigation-->
                    <div id="mainMenu">
                        <div class="container">
                            <nav>
                                <ul>
                                  

                                    <li class="dropdown"><a href="#">Features</a>
                                        <ul class="dropdown-menu">
                                            <li><a href="skill">SKILLS</a></li>
                                                <c:if test="${sessionScope.user != null && sessionScope.user.roleId == 1}">
                                                <li><a href="StaticRequest">REQUEST STATIC</a></li>
                                                <li><a href="ListRequest">History Request</a></li>
                                                <li><a href="Schedule_General_Mentee">General Schedule</a></li>
                                                </c:if>
                                        </ul>
                                    </li>
                                    <c:if test="${sessionScope.user == null}">
                                        <li><a href="login.jsp">Login</a></li>
                                        <li><a href="sign_up.jsp">Sign up</a></li>
                                        </c:if>

                                    <c:if test="${sessionScope.user != null}">
                                        <li class="t">
                                            <a href="javascript:;" class="nav-item-toggle">
                                                <span class="nav-item__title">${sessionScope.user.fullName}<i
                                                        class="las la-angle-down nav-item__arrow"></i></span>
                                            </a>
                                            <ul class="dropdown-menu">
                                                <li>
                                                    <div class="nav-author__info">
                                                        <div class="author-img">
                                                            <img src="./img/${user.avatar}" alt=""
                                                                 class="rounded-circle">
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <a href="UpdateAccountServlet">
                                                        <i class="uil uil-user"></i> Profile</a>
                                                </li>
                                                
                                                <li>
                                                    <a href="wallet">
                                                      <i class="fas fa-wallet"></i> Your Wallet
                                                    </a>
                                                </li>
                                                
                                                <li>
                                                    <a href="changepass">
                                                        <i class="uil uil-key-skeleton"></i> Change Password
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="Signout_Servlet" class="nav-author__signout">
                                                        <i class="uil uil-sign-out-alt"></i> Sign Out</a>
                                                </li>
                                            </ul>
                                        </li>
                                    </c:if>
                                </ul>
                            </nav>
                        </div>
                    </div>
                    <!--END: NAVIGATION-->
                </div>
            </div>
        </header>   

        <section id="main_content">

            <div class="container">

                <ol class="breadcrumb">
                    <li><a href="homeMentee">Home</a></li>
                    <li class="active">Mentee Profile</li>
                </ol>
                <div class="row">
                    <div class="col-md-12">

                        <!--  Tabs -->   
                        <ul class="nav nav-tabs" id="mytabs">
                            <li class="active"><a href="#profile" data-toggle="tab">Profile</a></li>
                        </ul>

                        <div class="tab-content">

                            <div class="tab-pane fade in active" id="profile">
                                <div class="row">
                                    <form class="form" action="UpdateAccountServlet" method="post" enctype="multipart/form-data">
                                        <div>
                                            <div class="">
                                                <div class="flext">
                                                    <input id="file-upload" type="file" name="fileUpload" class="d-none">
                                                    <label for="file-upload" class="">
                                                        <img id="profile-img" class="ap-img__main rounded-circle wh-120 bg-lighter d-flex" src="./img/${user.avatar}" alt="profile">                                                                  

                                                    </label>
                                                </div>

                                            </div>
                                        </div>

                                        <label>
                                            <span>Username</span>
                                            <input class="input" type="text" name="username" value="${user.userName}" readonly>

                                        </label>  

                                        <div style="margin-bottom: 15px">
                                            <label>
                                                <span>Fullname</span>
                                                <input id="fullname" class="input" type="text" placeholder="" name="fullname" required="" value="${user.fullName}">

                                            </label>   
                                            <h5 id="nameError" style="display: none"><strong style="color: red;">Oh No!</strong> Your name is not valid.</h5>
                                        </div>
                                        <label>
                                            <label for="sexOption">
                                                <span>Sex</span>
                                            </label>
                                            <select class="js-example-basic-single js-states form-control" id="sexOption" name="sex">
                                                <option value="1" ${mentee.sex == '1' ? 'selected' : '1'}>Male</option>
                                                <option value="0" ${mentee.sex == '0' ? 'selected' : '0'}>Female</option>
                                            </select>
                                        </label> 

                                        <div style="margin-bottom: 15px">
                                            <label>
                                                <span>Email</span>
                                                <input readonly id="email" class="input" type="email" name="gmail" placeholder="" value="${user.gmail}" required="">

                                            </label> 
                                            <h5 id="emailError" style="display: none"><strong style="color: red;">Oh No!</strong> Your email is not valid.</h5>
                                        </div>

                                        <div style="margin-bottom: 15px">
                                            <label>
                                                <span>Date of birth</span>
                                                <input id="dob" class="input" type="date" name="dob" placeholder="" value="${user.dob}" required="">
                                            </label> 
                                            <h5 id="dobError" style="display: none"><strong style="color: red;">Oh No!</strong> Your date of birth is invalid.</h5>
                                        </div>

                                        <div style="margin-bottom: 15px">
                                            <label>
                                                <span>Phone number</span>
                                                <input id="phoneNumber" class="input" type="tel" placeholder="" name="phone" value="${user.phone}" required="" minlength="10" maxlength="10">
                                            </label>
                                            <h5 id="phoneError" style="display: none"><strong style="color: red;">Oh No!</strong> Your phone number is not valid.</h5>
                                        </div>

                                        <div style="margin-bottom: 15px">
                                            <label>
                                                <span>Address</span>
                                                <input id="address" class="input" type="text" placeholder="" name="address" value="${user.address}" required="">
                                            </label>
                                            <h5 id="addressError" style="display: none"><strong style="color: red;">Oh No!</strong> Please input your Address.</h5>
                                        </div>
                                        <button id="submitForm" class="submit">Save</button>
                                    </form>
                                </div><!-- End row -->
                            </div><!-- End tab-pane --> 



                        </div>
                    </div><!-- End tab-pane -->
                </div><!-- End col-md-8--> 
            </div>  
        </section><!-- End main_content-->

        <a id="scrollTop"><i class="icon-chevron-up"></i><i class="icon-chevron-up"></i></a>

        <!-- JQUERY -->
        <script src="jss/jquery-2.2.4.min.js"></script>

        <!-- OTHER JS --> 
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
                var addressInput = document.getElementById('address');
                var addressError = document.getElementById('addressError');

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
        </script>
        <script src="jss/superfish.js"></script>
        <script src="jss/bootstrap.min.js"></script>
        <script src="jss/retina.min.js"></script>
        <script src="assets/validate.js"></script>
        <script src="jss/jquery.placeholder.js"></script>
        <script src="jss/classie.js"></script>
        <script src="jss/uisearch.js"></script>
        <script src="js/jquery.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/functions.js"></script>
        <jsp:include page="style/linkJS.jsp" />

    </body>
</html>