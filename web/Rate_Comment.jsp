<%-- 
    Document   : Rate_Comment
    Created on : Jun 3, 2024, 8:22:10 PM
    Author     : 84979
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="style/manstyle.css" rel="stylesheet">

        <style>
            .contents{
                margin-top: 40px;
                padding: 0 0 0 0 !important;
            }
            .uil-eye{
                transform: translateY(-5px);
            }
            .rating{
                float: left;
                margin-bottom: 30px;
            }
            .ct {
                background-color: #f2f2f2;
                justify-content: center;
                transform: translate(15%,15%);
                box-shadow: 1px 2px 3px #000;
                max-width: 1200px;
                height: auto;
                display: flex;
                flex-direction: column;
                align-items: center;
                gap: 20px;
            }
            .rating{
                float: left;
            }
            .mentor-info,
            .rating,
            .comment-box {
                width: 300px;
                text-align: center;
            }

            .comment-box {
                display: flex;
                flex-direction: column;
                gap: 10px;
            }

            .comment-box textarea {
                padding: 10px;
                resize: vertical;
            }

            .comment-box button {
                padding: 8px 16px;
                align-self: center;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <div class="ct">
            <div class="rate-comment-mentor" style="
                 background-color: #fff;
                 margin-top: 12px;
                 ">
                <div class="mentor-info">
                    <img src="./imgcv/${mentor.avatar}" alt="Mentor Avatar" class="mentor-avatar">
                    <div class="mentor-details">
                        <h3>${mentor.getFullName()}</h3>
                        <p>Company</p>
                        <p>${mentor.getFullName()} is one of our most experienced mentors.</p>
                        <div class="tags">
                            <c:forEach items="${mentor.listSkills}" var="skill">
                                <span class="tag">${skill.skillName}</span>
                            </c:forEach>

                        </div>
                    </div>
                </div>
            </div>
            <form  action="feedback" method="post"> 
                <div class="rating" style="margin-right: 20rem;">
                    <div>Rating</div>
                    <input type="radio" id="star5" name="rate" value="5" />
                    <label title="Excellent!" for="star5">
                        <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512">
                        <path
                            d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
                            ></path>
                        </svg>
                    </label>
                    <input value="4" name="rate" id="star4" type="radio" />
                    <label title="Great!" for="star4">
                        <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512">
                        <path
                            d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
                            ></path>
                        </svg>
                    </label>
                    <input value="3" name="rate" id="star3" type="radio" />
                    <label title="Good" for="star3">
                        <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512">
                        <path
                            d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
                            ></path>
                        </svg>
                    </label>
                    <input value="2" name="rate" id="star2" type="radio" />
                    <label title="Okay" for="star2">
                        <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512">
                        <path
                            d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
                            ></path>
                        </svg>
                    </label>
                    <input value="1" name="rate" id="star1" type="radio" />
                    <label title="Bad" for="star1">
                        <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512">
                        <path
                            d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
                            ></path>
                        </svg>
                    </label>
                </div>
                <input type="hidden" name="rating" id="rating" value="0">
                <input type="hidden" name="mentorname" id="mentorname" value="${mentorName}">
                <input type="hidden" name="requestId" value="${requestId}">
                <div class="comment-box">
                    <textarea name="comment" placeholder="Enter your comment..."></textarea>
                    <button type="submit" class="submit-btn">OK</button>

                </div>
            </form>
            <!-- Corrected form tag -->
        </div>
    </body>
</html>
