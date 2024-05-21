<%-- 
    Document   : blog_skill
    Created on : May 20, 2024, 8:28:55 PM
    Author     : 84979
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="author" content="INSPIRO" />
        <meta name="description" content="Themeforest Template Polo, html template">
        <link rel="icon" type="image/png" href="images/favicon.png">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Document title -->
        <title>Fmaster</title>
        <!-- Stylesheets & Fonts -->
        <link href="css/plugins.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>
        <!-- Body Inner -->
        <div class="body-inner">
            <!-- Header -->
            <jsp:include page="header.jsp" />
            <!-- end: Header -->
            <!-- Content -->
            <section id="page-content">
                <div class="container">
                    <!-- post content -->
                    <!-- Portfolio Filter -->
                    <nav class="grid-filter gf-outline" data-layout="#blog">
                        <ul>
                            <li class="active"><a href="#" data-category="*">Show All</a></li>
                            <li><a href="#" data-category=".bc-general">General</a></li>
                            <li><a href="#" data-category=".bc-music">Music</a></li>
                            <li><a href="#" data-category=".bc-economics">Economics</a></li>
                            <li><a href="#" data-category=".bc-medical">medical</a></li>
                            <li><a href="#" data-category=".bc-sport">Sport</a></li>
                            <li><a href="#" data-category=".bc-science">Science</a></li>
                        </ul>
                        <div class="grid-active-title">Show All</div>
                    </nav>
                    <!-- end: Portfolio Filter -->
                    <!-- Blog -->
                    <div id="blog" class="grid-layout post-3-columns m-b-30" data-item="post-item">

                        <c:forEach items="${requestScope.listSkill}" var="skill">
                            <a href="showmentor?id=${skill.skillID}">
                                <div class="post-item border bc-general bc-music bc-economics">
                                    <div class="post-item-wrap">
                                        <div class="post-image">
                                                <img alt="" src="img/${skill.img}">
                                            <span class="post-meta-category"><a href=""></a></span>
                                        </div>
                                        <div class="post-item-description">
                                            <h2><a href="showmentor?id=${skill.skillID}">${skill.skillName}</a></h2>
                                            <p>${skill.description}</p>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </c:forEach>                   <!-- Post item-->



                        <!-- end: Post item-->
                    </div>
                    <!-- end: Blog -->
                    <!-- Pagination -->
                    <ul class="pagination">
                        <li class="page-item"><a class="page-link" href="#"><i class="fa fa-angle-left"></i></a></li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item active"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                        <li class="page-item"><a class="page-link" href="#">5</a></li>
                        <li class="page-item"><a class="page-link" href="#"><i class="fa fa-angle-right"></i></a></li>
                    </ul>
                </div>
                <!-- end: post content -->
            </section>
            <!-- end: Content -->

        </div>
        <!-- end: Body Inner -->
        <!-- Scroll top -->
        <a id="scrollTop"><i class="icon-chevron-up"></i><i class="icon-chevron-up"></i></a>
        <!--Plugins-->
        <script src="js/jquery.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/functions.js"></script>
    </body>

</html>
