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
                margin-left: 12rem;
                display: flex;
                flex-direction: column;
                gap: 10px;
                width: 700px;
                padding: 20px;
                border-radius: 20px;
                position: relative;
                background-color: #fff;
                color: #ccc;
                box-shadow: 1px 1px 1px 2px rgba(122,112,331);
            }

            .title {
                font-size: 28px;
                font-weight: 600;
                letter-spacing: -1px;
                position: relative;
                display: flex;
                align-items: center;
                padding-left: 30px;
                color: #00bfff;
            }

            .title::before {
                width: 18px;
                height: 18px;
            }

            .title::after {
                width: 18px;
                height: 18px;
                animation: pulse 1s linear infinite;
            }

            .title::before,
            .title::after {
                position: absolute;
                content: "";
                height: 16px;
                width: 16px;
                border-radius: 50%;
                left: 0px;
                background-color: #00bfff;
            }

            .message,
            .signin {
                font-size: 14.5px;
                color: rgba(255, 255, 255, 0.7);
            }

            .signin {
                text-align: center;
            }

            .signin a:hover {
                text-decoration: underline royalblue;
            }

            .signin a {
                color: #00bfff;
            }

            .flex {
                display: flex;
                width: 100%;
                gap: 6px;
            }

            .form label {
                position: relative;
            }

            .form label .input {
                background-color: #333;
                color: #fff;
                width: 100%;
                padding: 20px 05px 05px 10px;
                outline: 0;
                border: 1px solid rgba(105, 105, 105, 0.397);
                border-radius: 10px;
            }

            .form label .input + span {
                color: rgba(255, 255, 255, 0.5);
                position: absolute;
                left: 10px;
                top: 0px;
                font-size: 0.9em;
                cursor: text;
                transition: 0.3s ease;
            }

            .form label .input:placeholder-shown + span {
                top: 12.5px;
                font-size: 0.9em;
            }
            .form label .input:focus + span,
            .form label .input:valid + span {
                color: #00bfff;
                top: 0px;
                font-size: 0.7em;
                font-weight: 600;
            }

            .input {
                font-size: medium;
            }

            .submit {
                border: none;
                outline: none;
                padding: 10px;
                border-radius: 10px;
                color: #fff;
                font-size: 16px;
                transform: .3s ease;
                background-color: #00bfff;
            }

            .submit:hover {
                background-color: #00bfff96;
            }

            @keyframes pulse {
                from {
                    transform: scale(0.9);
                    opacity: 1;
                }

                to {
                    transform: scale(1.8);
                    opacity: 0;
                }
            }
            li {
                list-style-type: none;
            }
            #header{
                position: fixed;
            }
            #profile-img{
                width: 200px;
                height: 200px;
            }
            #file-upload{
                display: none;
            }
            .flext{
                width: 50%;

            }
            .row{

                margin-top: 20px;
                display: flex;

            }
            .rounded-circle{
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
                        <a href="homes.jsp">
                            <span class="logo-default">POLO</span>
                            <span class="logo-dark">POLO</span>
                        </a>
                    </div>
                    <!--End: Logo-->
                    <!-- Search -->
                    <div id="search"><a id="btn-search-close" class="btn-search-close" aria-label="Close search form"><i class="icon-x"></i></a>
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
                                    <li><a href="homes.jsp">Home</a></li>

                                    <li class="dropdown"><a href="#">Features</a>
                                        <ul class="dropdown-menu"> 
                                            <li><a href="blog_skill.jsp">Mentor detail</a></li>
                                            <li><a href="user_info.jsp">CV</a></li>                            
                                        </ul>
                                    </li>
                                    <li><a href="login.jsp">Login</a></li>
                                    <li><a href="sign_up.jsp">Sign up</a></li>
                                    <li class="t">
                                        <a href="javascript:;" class="nav-item-toggle">
                                            <span class="nav-item__title">Minh vq<i class="las la-angle-down nav-item__arrow"></i></span>
                                        </a>
                                        <ul class="dropdown-menu"> 
                                            <li>  <div class="nav-author__info">
                                                    <div class="author-img">
                                                        <img src="img/author-nav.jpg" alt="" class="rounded-circle">
                                                    </div>
                                                    <div>
                                                        <span>UI Designer</span>
                                                    </div>
                                                </div></li>
                                            <li>
                                                <a href="updatementee">
                                                    <i class="uil uil-user"></i> Profile</a>
                                            </li>           
                                            <li>
                                                <a href="">
                                                    <i class="uil uil-setting"></i>
                                                    Settings</a>
                                            </li>
                                            <li>
                                                <a href="newPassword.jsp">
                                                    <i class="uil uil-key-skeleton"></i> Change Password</a>
                                            </li>
                                            <li>
                                                <a href="">
                                                    <i class="uil uil-users-alt"></i> Apply CV</a>
                                            </li>
                                            <li>
                                                <a href="">
                                                    <i class="uil uil-bell"></i> Help</a>
                                            </li>
                                            <li>
                                                <a href="login.jsp" class="nav-author__signout">
                                                    <i class="uil uil-sign-out-alt"></i> Sign Out</a>
                                            </li>
                                        </ul>
                                    </li>
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
                    <li><a href="homes.jsp">Home</a></li>
                    <li class="active">Active page</li>
                </ol>
                <div class="row">
                    <div class="col-md-12">

                        <!--  Tabs -->   
                        <ul class="nav nav-tabs" id="mytabs">
                            <li class="active"><a href="#profile" data-toggle="tab">Profile</a></li>
                            <li><a href="#agenda" data-toggle="tab">My Agenda</a></li>
                            <li><a href="#plans" data-toggle="tab">Plans/billing</a></li>
                        </ul>

                        <div class="tab-content">

                            <div class="tab-pane fade in active" id="profile">
                                <div class="row">
                                    <form class="form" action="UpdateAccountServlet?role=mentee" method="post" enctype="multipart/form-data">
                                        <div>
                                            <div class="">
                                                <div class="flext">
                                                    <input id="file-upload" type="file" name="fileUpload" class="d-none">
                                                    <label for="file-upload" class="">
                                                        <img id="profile-img" class="ap-img__main rounded-circle wh-120 bg-lighter d-flex" src="img\tungche2.jpg" alt="profile">                                                                  
                                                        <img src="img\camera.png"/>
                                                    </label>
                                                </div>

                                                <div class="account-profile__title">
                                                    <h6 class="fs-15 ms-20 fw-500 text-capitalize">Profile Photo</h6>
                                                </div>
                                            </div>
                                        </div>

                                        <label>
                                            <input class="input" type="text" name="username" value="${user.userName}" readonly>
                                            <span>Username</span>
                                        </label>  
                                        <label>
                                            <input class="input" type="text" placeholder="" name="fullname" required="" value="${user.fullName}">
                                            <span>Fullname</span>
                                        </label>              
                                        <label>
                                            <label for="sexOption">
                                                Sex
                                            </label>
                                            <select class="js-example-basic-single js-states form-control" id="sexOption" name="sex">
                                                <option value="1" ${mentee.sex == '1' ? 'selected' : '1'}>Male</option>
                                                <option value="0" ${mentee.sex == '0' ? 'selected' : '0'}>Female</option>
                                            </select>
                                        </label> 
                                        <label>
                                            <input class="input" type="email" name="gmail" placeholder="" value="${user.gmail}" required="">
                                            <span>Email</span>
                                        </label> 

                                        <label>
                                            <input class="input" type="date" name="dob" placeholder="" value="${user.dob}" required="">
                                            <span>Date of birth</span>
                                        </label> 

                                        <label>
                                            <input class="input" type="tel" placeholder="" name="phone" value="${user.phone}" required="" minlength="10" maxlength="10">
                                            <span>Phone number</span>
                                        </label>
                                        <label>
                                            <input class="input" type="text" placeholder="" name="address" value="${user.address}" required="">
                                            <span>Address</span>
                                        </label>
                                        <button class="submit">Save</button>
                                    </form>
                                </div><!-- End row -->
                            </div><!-- End tab-pane --> 



                            <div class="tab-pane fade" id="agenda">

                                <div class="row">
                                    <aside class="col-md-4">
                                        <div class="box_style_1"  id="external-events">
                                            <h4>Draggable Events</h4>
                                            <div class='external-event'>Coffe Break</div>
                                            <div class='external-event'>Meeting</div>
                                            <div class='external-event'>Lesson</div>
                                            <div class='external-event'>Exam</div>
                                            <p><input type='checkbox' id='drop-remove' /><label for='drop-remove'>remove after drop</label></p>
                                        </div>
                                    </aside>

                                    <div class="col-md-8">
                                        <div id="calendar"></div><!-- End calendar --> 
                                    </div>
                                </div><!-- End row --> 

                            </div><!-- End tab-pane --> 

                            <div class="tab-pane fade" id="plans">
                                <h3>Change your Payment method</h3>
                                <div  id="payment_opt">
                                    <label class="radio-inline">
                                        <input type="radio" name="payment" checked><img src="img/logo_paypal.png" alt="Paypal" class="payment_logos">
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio"  name="payment"><img src="img/logo_visa.png" alt="Card" class="payment_logos">
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="payment"><img src="img/logo_master.png" alt="Card" class="payment_logos">
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="payment"><img src="img/logo_maestro.png" alt="Card" class="payment_logos">
                                    </label>
                                </div>       
                                <hr>                     

                                <h3>Order summary</h3>
                                <div class="table-responsive">             
                                    <table class="table table-hover " style="margin-bottom:0;">
                                        <thead>
                                            <tr>								
                                                <th>Items</th>
                                                <th>Amount</th>									
                                            </tr></thead>
                                        <tbody>
                                            <tr>
                                                <td>Price of the course</td>
                                                <td>?0.99</td>
                                            </tr>
                                            <tr class="info" style="border-top: 2px solid #ccc; border-bottom: 2px solid #ccc; font-size:18px">
                                                <td><strong>TOTAL</strong></td>
                                                <td><strong>?0.99</strong></td>
                                            </tr>
                                            <tr>
                                                <td><small>without VAT</small></td>
                                                <td><small>? 0.83</small></td>
                                            </tr>
                                            <tr>
                                                <td><small>VAT (19%)</small></td>
                                                <td> <small>?0.16</small> </td>
                                            </tr>

                                        </tbody></table>
                                </div>
                            </div><!-- End tab-pane -->
                        </div><!-- End col-md-8--> 
                    </div>  
                </div><!-- End row-->   
            </div><!-- End container -->
        </section><!-- End main_content-->

        <a id="scrollTop"><i class="icon-chevron-up"></i><i class="icon-chevron-up"></i></a>

        <!-- JQUERY -->
        <script src="jss/jquery-2.2.4.min.js"></script>

        <!-- OTHER JS --> 
        <script src="jss/superfish.js"></script>
        <script src="jss/bootstrap.min.js"></script>
        <script src="jss/retina.min.js"></script>
        <script src="assets/validate.js"></script>
        <script src="jss/jquery.placeholder.js"></script>
        <script src="jss/functions.js"></script>
        <script src="jss/classie.js"></script>
        <script src="jss/uisearch.js"></script>

    </body>
</html>