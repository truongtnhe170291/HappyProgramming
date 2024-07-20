<%-- 
    Document   : blog_skill
    Created on : May 20, 2024, 8:28:55 PM
    Author     : 84979
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">


<style>
    .search-form {
        display: flex;
        align-items: center;
    }
.Img_allform{
 height: 80% !important;
    background-size: contain;
    background-clip: initial;

}
.post-image{
       height: 300px;
}
.post-item-wrap{
   height: 500px;
   max-height: 600px;
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

   
    .pagination {
    display: flex !important;
    justify-content: right !important;
    margin-top: 20px !important;
    margin-right: 20px !important;
    margin-bottom: 20px !important;
}

.pagination .page-item {
    list-style: none !important;
}

.pagination .page-link {
    padding: 8px 16px !important;
    text-decoration: none !important;
    color: #007bff !important;
    background-color: #fff !important;
    border: 1px solid #ddd !important;
}

.pagination .page-item.active .page-link {
    background-color: #007bff !important;
    color: white !important;
    border: 1px solid #007bff !important;
}

.pagination .prev {
    border-top-left-radius: 8px !important;
    border-bottom-left-radius: 8px !important;
}

.pagination .next {
    border-top-right-radius: 8px !important;
    border-bottom-right-radius: 8px !important;
}

.pagination .page-link:hover {
    background-color: #f8f9fa !important;
}

.pagination .page-link:focus {
    box-shadow: none !important;
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
    <form action="skill" method="get" class="search-form">
        <img src="img/svg/search.svg" alt="search" class="svg">
        <input class="form-control me-sm-2 box-shadow-none" type="search" name="searchTerm" placeholder="Search..." aria-label="Search" value="${searchTerm}">
        <button type="submit" class="bu1">Search</button>
    </form>

    <!-- Blog -->
    <div id="blog" class="grid-layout post-3-columns m-b-30" data-item="post-item">
        <c:forEach items="${requestScope.listSkill}" var="skill" varStatus="status">
            <a href="showmentor?id=${skill.skillID}">
                <div class="post-item border bc-general bc-music bc-economics">
                    <div class="post-item-wrap">
                        <div class="post-image">
                            <img class="Img_allform" alt="" src="./img/${skill.img}">
                            <span class="post-meta-category"><a href=""></a></span>
                        </div>
                        <div class="post-item-description">
                            <h2><a href="showmentor?id=${skill.skillID}">${status.index + 1}. ${skill.skillName}</a></h2>
                            
                            <p><c:choose>
                            <c:when test="${fn:length(skill.description) > 50}">
                                ${fn:substring(skill.description, 0, 50)} ...
                            </c:when>
                            <c:otherwise>
                                ${skill.description}
                            </c:otherwise>
                        </c:choose></p>
                        </div>
                    </div>
                </div>
            </a>
        </c:forEach>
    </div>
    <!-- end: Blog -->

    <!-- Pagination -->
    <ul class="pagination">
    <c:if test="${currentPage > 1}">
        <li class="page-item prev">
            <a class="page-link" href="skill?page=${currentPage - 1}&searchTerm=${searchTerm}">
                <i class="fa fa-angle-left"></i>
            </a>
        </li>
    </c:if>
    <c:forEach begin="1" end="${totalPages}" varStatus="loop">
        <c:choose>
            <c:when test="${loop.index == currentPage}">
                <li class="page-item active">
                    <span class="page-link">${loop.index}</span>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="skill?page=${loop.index}&searchTerm=${searchTerm}">
                        ${loop.index}
                    </a>
                </li>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:if test="${currentPage < totalPages}">
        <li class="page-item next">
            <a class="page-link" href="skill?page=${currentPage + 1}&searchTerm=${searchTerm}">
                <i class="fa fa-angle-right"></i>
            </a>
        </li>
    </c:if>
</ul>


        <!-- end: Body Inner -->
        <!-- Scroll top -->
        <a id="scrollTop"><i class="icon-chevron-up"></i><i class="icon-chevron-up"></i></a>
        <!--Plugins-->
        <script src="js/jquery.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/functions.js"></script>
    </body>

</html>
