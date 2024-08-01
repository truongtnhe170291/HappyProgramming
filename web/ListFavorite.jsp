<%-- 
    Document   : ListFavoriteMentors
    Created on : Jul 30, 2024, 5:38:04 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"><script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/7005da8e68.js" crossorigin="anonymous"></script>
        <title>Mentor Search</title>

        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
        <script src="https://kit.fontawesome.com/7005da8e68.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 20px;
                background-color: #f0f0f0;
                min-height: 100%;
            }
            .container{
                padding-bottom: 200px;
            }
            .search-container {
                max-width: 800px;
                margin: 0 auto;
                background-color: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }
            .filters {
                display: flex;
                flex-wrap: wrap;
                gap: 10px;
                margin-bottom: 20px;
            }
            .filters input,
            .filters select {
                padding: 8px;
                border: 1px solid #ddd;
                border-radius: 4px;
                flex-grow: 1;
            }
            .mentor-grid {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
                gap: 20px;
            }
            .mentor-card {
                background-color: white;
                border: 1px solid #ddd;
                border-radius: 8px;
                padding: 15px;
                text-align: center;
                text-decoration: none;
                color: black;
                display: flex;
                flex-direction: column;
                justify-content: space-between; /* Ensures that the content is spaced out evenly */
            }

            .mentor-image {
                width: 100px;
                height: 100px;
                background-color: #ddd;
                margin: 0 auto 10px;
                border-radius: 50%;
                overflow: hidden;
            }
            .mentor-image img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }
            .star-rating {
                color: #ddd;
                font-size: 20px;
                position: relative;
                display: inline-block;
            }
            .star-rating .filled {
                color: gold;
                overflow: hidden;
                position: absolute;
                top: 0;
                left: 0;
            }

            .mentor-skills {
                margin-top: auto; /* Pushes the skills section to the bottom */
                font-size: 14px;
            }
            @media (max-width: 600px) {
                .mentor-grid {
                    grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
                }
            }
        </style>
        <!--fav toast-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastify-js/1.11.2/toastify.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastify-js/1.11.2/toastify-js.min.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var notification = "<%= request.getSession().getAttribute("notification") %>";
                if (notification && notification !== "null" && notification.trim() !== "") {
                    Toastify({
                        text: notification,
                        duration: 3000,
                        close: true,
                        gravity: "top", // `top` or `bottom`
                        position: "right", // `left`, `center` or `right`
                        backgroundColor: "#4CAF50",
                        stopOnFocus: true // Prevents dismissing of toast on hover
                    }).showToast();

                    // Clear notification after showing
            <% request.getSession().removeAttribute("notification"); %>
                }
            });
        </script>

    </head>
    <body>
        <jsp:include page="header.jsp" />
        <div class="container">
            <h1>Favorite Mentors</h1>
            <div class="mentor-grid">
                <c:forEach items="${requestScope.mentorlist}" var="mentor">
                    <div class="mentor-details">

                        <a
                            href="MentorProfileServlet?cvId=${mentor.cv_id}"
                            class="mentor-card"
                            >
                            <div class="mentor-image">
                                <img src="./imgcv/${mentor.avatar}" alt="${mentor.full_name}" />
                            </div>
                            <h4>${mentor.full_name}</h4>
                            <div class="star-rating">
                                ☆☆☆☆☆
                                <div class="filled" style="width: ${mentor.starAVG * 20}%">
                                    ★★★★★
                                </div>
                            </div>
                            <div class="mentor-skills">
                                <p>
                                    Learn:
                                    <c:forEach
                                        items="${mentor.listSkills}"
                                        var="skill"
                                        varStatus="loop"
                                        >
                                        ${skill.skillName}<c:if test="${!loop.last}">, </c:if>
                                    </c:forEach>
                                </p>
                                <p>price/slot : ${mentor.rate}</p>
                            </div>
                            <form action="Favorites" method="post">
                                <input type="text" name="mentorUsername" value="${mentor.mentorName}" hidden>
                                <button type="submit" class="btn btn-warning">
                                    <i class="fa fa-heart"></i> Unfavorite
                                </button>
                            </form>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>

    </body>
</html>