<%-- 
    Document   : Mentorskill
    Created on : Jul 29, 2024, 9:50:11 PM
    Author     : DIEN MAY XANH
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Mentor Search</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 20px;
                background-color: #f0f0f0;
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
                margin-top: auto;
                font-size: 14px;
            }
            @media (max-width: 600px) {
                .mentor-grid {
                    grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
                }
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <div class="search-container">
            <form action="listmentor" method="GET">
                <div class="filters">
                    <input type="text" name="searchTermName" placeholder="Mentor Name" />
                   
                    <input type="text" placeholder="Skill" name="searchTerm" />
                    
                    <button type="submit" >Search</button>
                </div>
            </form>
            <div class="mentor-grid">
                <c:forEach items="${requestScope.mentorlist}" var="mentor">
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
                        </div>
                    </a>
                </c:forEach>
            </div>
        </div>
    </body>
</html>