<%-- 
    Document   : blog_skill
    Created on : May 20, 2024, 8:28:55 PM
    Author     : 84979
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">


<style>
    .search-form {
        display: flex;
        align-items: center;
    }

    .search-form img {
        margin-right: 10px; /* Adjust as needed */
    }
    .svg{
        margin-bottom: 40px
    }
    .search-form input {
        margin-bottom: 40px; /* Adjust as needed */
    }
 
    .bu1 {
    display: inline-block;
    font-weight: 400;
    color: #fff;
    text-align: center;
    vertical-align: middle;
    cursor: pointer;
    background-color: #007bff;
    border: 1px solid #007bff;
    padding: .375rem .75rem;
    font-size: 1rem;
    line-height: 1.5;
    border-radius: .25rem;
    transition: color .15s ease-in-out, background-color .15s ease-in-out, border-color .15s ease-in-out, box-shadow .15s ease-in-out;
    margin-bottom: 40px;
}

.bu1:hover {
    color: #fff;
    background-color: #0069d9;
    border-color: #0062cc;
}

.bu1:focus, .bu1.focus {
    color: #fff;
    background-color: #0069d9;
    border-color: #0062cc;
    box-shadow: 0 0 0 0.2rem rgba(38, 143, 255, 0.5);
}

   
    
</style>

    <head>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="author" content="INSPIRO" />
        <meta name="description">
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
                    <form action="SearchSkill" method="post" class="search-form">
                        <img src="img/svg/search.svg" alt="search" class="svg">
                        <input class="form-control me-sm-2 box-shadow-none" type="search" name="searchTerm" placeholder="Search..." aria-label="Search">
                        <button type="submit" class="bu1">Search</button>
                    </form>


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
                    </nav> 
                    <!-- end: Portfolio Filter -->
                    <!-- Blog -->
                    <div id="blog" class="grid-layout post-3-columns m-b-30" data-item="post-item">
                        <c:forEach items="${requestScope.listSkill}" var="skill" varStatus="status">
                            <a href="showmentor?id=${skill.skillID}">
                                <div class="post-item border bc-general bc-music bc-economics">
                                    <div class="post-item-wrap">
                                        <div class="post-image">
                                            <img alt="" src="./img/${skill.img}">
                                            <span class="post-meta-category"><a href=""></a></span>
                                        </div>
                                        <div class="post-item-description">
                                            <h2><a href="showmentor?id=${skill.skillID}">${status.index + 1}. ${skill.skillName}</a></h2>
                                            <p>${skill.description}</p>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </c:forEach>


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
