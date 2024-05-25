<!DOCTYPE html>
<html lang="en">
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <head>
        <meta charset="utf-8">
        <title>Fmaster</title>
        <meta name="viewport"
              content="width=device-width, height=device-height, initial-scale=1, maximum-scale=1, user-scalable=no">

        <!-- Favicons-->
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
        <link rel="apple-touch-icon" type="image/x-icon" href="img/apple-touch-icon-57x57-precomposed.png">
        <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72"
              href="img/apple-touch-icon-72x72-precomposed.png">
        <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114"
              href="img/apple-touch-icon-114x114-precomposed.png">
        <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144"
              href="img/apple-touch-icon-144x144-precomposed.png">

        <!-- GOOGLE WEB FONT -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Raleway:400,500,600,700,800"
              rel="stylesheet">

        <!-- CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/superfish.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="fontello/css/fontello.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
              crossorigin="anonymous">




        <style>
            .course {
                display: flex;
                justify-content: space-between;
            }

            .ac {
                transform: translateY(-24px);
            }

        </style>
    </head>

    <body>

        <jsp:include page="header.jsp" />

        <section id="main_content">

            <div class="container">

                <ol class="breadcrumb">
                    <li class="active">Active page</li>
                </ol>

                <div class="row">
                    <aside class="col-md-4">
                        <div class=" box_style_1 profile">
                            <p class="text-center"><img style="max-height: 200px; max-width: 200px; border-radius: 50%"
                                                        src="./img/${mentor.avatar}" alt="Teacher" class="img-circle styled"></p>
                            <ul>
                                <li>Name <strong class="pull-right">
                                        <c:out value="${mentor.fullName}" />
                                    </strong> </li>
                                <li>Email <strong class="pull-right">
                                        <c:out value="${mentor.gmail}" />
                                    </strong></li>
                                <li>Telephone<strong class="pull-right">
                                        <c:out value="${mentor.phone}" />
                                    </strong></li>
                                <li>Address<strong class="pull-right">
                                        <c:out value="${mentor.address}" />
                                    </strong></li>
                                <li>Gender <strong class="pull-right">${mentor.sex? "Male" : "Female"}</strong></li>

                                <li>Price <strong class="pull-right">
                                        <c:out value="${mentor.rate}" />
                                    </strong></li>
                            </ul>
                        </div>
                    </aside>
                    <div class="col-md-8">


                        <ul class="nav nav-tabs" id="mytabs">
                            <li class="active"><a href="#profile_teacher" data-toggle="tab">Profile</a></li>
                            <li><a href="#courses" data-toggle="tab">Feedback</a></li>
                        </ul>

                        <div class="tab-content">

                            <div class="tab-pane active" id="profile_teacher">
                                <h3 style="margin-top: 15px">About me</h3>
                                <p><strong> Profession: </strong>
                                    <c:out value="${mentor.profession}" />
                                </p>
                                <p><strong> profession Introduction: </strong>
                                    <c:out value="${mentor.professionIntro}" />
                                </p>
                                <h4>My Achievement </h4>
                                <p>
                                    <c:out value="${mentor.achievementDescription}" />
                                </p>
                                <h4>Service Description </h4>
                                <p>
                                    <c:out value="${mentor.service_description}" />
                                </p>
                                <h4>My Skill </h4>

                                <c:forEach items="${mentor.listSkills}" var="skill">
                                    <p>${skill.skillName}</p>
                                </c:forEach>
                                <div class="row">
                                    <div class="col-md-6">
                                        <ul class="list_3">

                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane in" id="courses">
                                <h3 style="margin-top: 15px">Rate & Comment</h3>

                                <table width="100%" style="border-collapse: collapse; width: 100%;">
                                    <c:forEach items="${mentor.feedBacks}" var="feedback">
                                        <tr style="border-bottom: 1px solid #ddd;">
                                            <td style="padding: 10px; width: 10%;">
                                                <div class="user-avatar" style="text-align: center;">
                                                    <img class="avatar" src="img/${feedback.avatar}" alt="User Avatar" style="border-radius: 50%; width: 50px; height: 50px;">
                                                </div>
                                            </td>
                                            <td style="padding: 10px; width: 20%;">
                                                <p style="margin: 0; font-weight: bold;">
                                                    <c:out value="${feedback.menteeName}" />
                                                </p>
                                            </td>
                                            <td style="justify-content: center">
                                                <div id="te" class="rating">
                                                    <div class="star-rating" data-rating="${feedback.star}"></div>
                                                </div>
                                                <div class="rating" data-rating="${feedback.star}"> </div>
                                            </td>
                                            <td style="padding: 10px; width: 50%; text-align: end">
                                                <div class="comment" style="font-style: italic;">
                                                    <p style="margin: 0;">${feedback.comment}</p>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
        </section>




        <script src="jss/bootstrap.min.js"></script>
        <script src="jss/classie.js"></script>
        <script src="jss/uisearch.js"></script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const ratings = document.querySelectorAll('.rating');
                console.log(ratings);
                ratings.forEach(rating => {
                    const starValue = parseFloat(rating.getAttribute('data-rating'));
                    const fullStars = Math.floor(starValue);

                    for (let i = 0; i < fullStars; i++) {
                        rating.innerHTML += '<i class="fas fa-star"></i>';
                    }

                    const emptyStars = 5 - Math.ceil(starValue);
                    for (let i = 0; i < emptyStars; i++) {
                        rating.innerHTML += '<i class="far fa-star"></i>';
                    }
                });
            });
        </script>

    </body>

</html>