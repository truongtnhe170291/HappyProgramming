<%-- 
    Document   : courseListSkillDetail
    Created on : May 21, 2024, 3:39:50 PM
    Author     : 84979
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if IE 9 ]><html class="ie ie9" lang="en"> <![endif]-->
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">



        <!-- CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/superfish.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="fontello/css/fontello.css" rel="stylesheet">
        <style>
            body {
                font-family: Arial, sans-serif;
            }

            .col-item {
                background: #fff;
                border: 1px solid #e1e1e1;
                border-radius: 5px;
                overflow: hidden;
                margin: 15px 0;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
                transition: transform 0.3s ease;
            }

            .col-item:hover {
                transform: translateY(-5px);
            }

            .ribbon_course {
                width: 100px;
                height: 30px;
                background: #f44336;
                position: absolute;
                top: 10px;
                left: -10px;
                text-align: center;
                line-height: 30px;
                color: #fff;
                font-size: 14px;
                transform: rotate(-45deg);
            }

            .photo img {
                width: 100%;
                height: auto;
                border-bottom: 1px solid #e1e1e1;
            }

            .cat_row {
                background: #f7f7f7;
                padding: 10px;
                border-top: 1px solid #e1e1e1;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .cat_row a {
                color: #007bff;
                text-decoration: none;
            }

            .info {
                padding: 15px;
            }

            .info h4 {
                font-size: 20px;
                margin-bottom: 10px;
                color: #333;
            }

            .info p {
                font-size: 14px;
                color: #666;
                margin-bottom: 10px;
            }

            .rating i {
                color: #ff9800;
                margin-right: 2px;
            }

            .price {
                font-size: 18px;
                font-weight: bold;
                color: #f44336;
            }

            .separator {
                border-top: 1px solid #e1e1e1;
                padding-top: 10px;
                margin-top: 10px;
                display: flex;
                justify-content: space-between;
            }

            .btn-add a, .btn-details a {
                color: #fff;
                text-decoration: none;
                display: inline-block;
                padding: 10px 20px;
                border-radius: 25px;
                transition: background 0.3s ease;
            }

            .btn-add a {
                background: #4caf50;
            }

            .btn-add a:hover {
                background: #45a049;
            }

            .btn-details a {
                background: #007bff;
            }

            .btn-details a:hover {
                background: #0069d9;
            }

        </style>

    </head>

    <body>
        <jsp:include page="header.jsp"/>


        <section id="main_content">
            <div class="container">

                <section class="background-grey">
                    <div class="container">
                        <div class="heading-text heading-section text-center">
                            <h2>MEET OUR TEAM</h2>
                            <p>Lorem ipsum dolor sit amet, consecte adipiscing elit. Suspendisse condimentum porttitor cursumus.
                            </p>
                        </div>
                        <div class="row team-members">
                            <div class="row team-members">
                                <c:forEach items="${requestScope.mentors}" var="member">
                                    <div class="col-lg-3">
                                        <div class="team-member">
                                            <div class="team-image">
                                                <a href="MentorProfileServlet?mentorName=${member.getMentorName()}">
                                                    <img src="${member.getAvatar()}" alt="${member.mentorName}">
                                                </a>

                                            </div>
                                            <div class="team-desc">
                                                <h3>
                                                    <a href="MentorProfileServlet?mentorName=${member.getMentorName()}">${member.getFull_name()}</a>
                                                </h3>
                                                <p>
                                                    <c:forEach items="${member.listSkills}" var="skill">
                                                    <p>${skill.skillName}</p>
                                                </c:forEach>
                                                </p>
                                                <div class="align-center">
                                                    <a class="btn btn-xs btn-slide btn-light" href="#">
                                                        <i class="fab fa-facebook-f"></i>
                                                        <span>Facebook</span>
                                                    </a>
                                                    <a class="btn btn-xs btn-slide btn-light" href="#" data-width="100">
                                                        <i class="fab fa-twitter"></i>
                                                        <span>Twitter</span>
                                                    </a>
                                                    <a class="btn btn-xs btn-slide btn-light" href="#" data-width="118">
                                                        <i class="fab fa-instagram"></i>
                                                        <span>Instagram</span>
                                                    </a>
                                                    <a class="btn btn-xs btn-slide btn-light" href="#" data-width="80">
                                                        <i class="icon-mail"></i>
                                                        <span>Mail</span>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

                        </div>


                    </div>
            </div>
        </section>
    </div><!-- End row -->
    <hr>
    <div class="row">
        <div class="col-md-12 text-center">
            <ul class="pagination">
                <li><a href="#">&laquo;</a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&raquo;</a></li>
            </ul>
        </div>
    </div>

</div><!-- End container -->
</section><!-- End main_content -->


<div id="toTop">Back to top</div>

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
<script>new UISearch(document.getElementById('sb-search'));</script>


</body>
</html>
