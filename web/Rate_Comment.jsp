<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback for Mentor</title>
<style>

body {
    background-color: #f4f4f9;
    font-family: Arial, sans-serif;
    color: #333;
    margin: 0;
    padding: 0;
}

header {
    background-color: #4CAF50;
    color: #fff;
    padding: 15px 20px;
    text-align: center;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.container {
    max-width: 800px;
    margin: 30px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.breadcrumb {
    display: flex;
    align-items: center;
    font-size: 0.9em;
    color: #555;
    margin-bottom: 20px;
}

.breadcrumb a {
    color: #4CAF50;
    text-decoration: none;
    margin-right: 5px;
}

.breadcrumb span {
    margin: 0 5px;
}

.page-title {
    font-size: 1.8em;
    color: #333;
    text-align: center;
    margin-bottom: 20px;
    font-weight: bold;
}

.rate-comment-mentor {
    margin-bottom: 20px;
}

.mentor-info {
    display: flex;
    align-items: center;
    padding: 15px;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    background-color: #f9f9f9;
}

.mentor-avatar {
    width: 120px;
    height: 120px;
    border-radius: 50%;
    object-fit: cover;
    margin-right: 20px;
}

.mentor-details {
    flex: 1;
}

.mentor-details h3 {
    margin: 0;
    font-size: 1.6em;
    color: #333;
}

.mentor-details p {
    margin: 5px 0;
    color: #666;
}

.tags {
    margin-top: 10px;
}

.tag {
    display: inline-block;
    background-color: #4CAF50;
    color: #fff;
    padding: 6px 12px;
    border-radius: 20px;
    font-size: 0.9em;
    margin: 4px;
}

.rating {
    display: flex;
    align-items: center;
    margin-bottom: 20px;
}

.rating div {
    margin-right: 15px;
    font-weight: bold;
    color: #333;
}

input[type="radio"] {
    display: none;
}

label {
    cursor: pointer;
    margin: 0 2px;
}

svg {
    fill: #ddd; 
    width: 30px;
    height: 30px;
    transition: fill 0.2s ease-in-out;
}

input[type="radio"]:hover ~ label svg,
input[type="radio"]:hover ~ label ~ label svg,
input[type="radio"]:hover ~ label ~ label ~ label svg,
input[type="radio"]:hover ~ label ~ label ~ label ~ label svg,
input[type="radio"]:hover ~ label ~ label ~ label ~ label ~ label svg,
input[type="radio"]:hover ~ label ~ label ~ label ~ label ~ label ~ label svg,
input[type="radio"]:hover ~ label ~ label ~ label ~ label ~ label ~ label ~ label svg,
input[type="radio"]:hover ~ label ~ label ~ label ~ label ~ label ~ label ~ label ~ label svg,
input[type="radio"]:hover ~ label ~ label ~ label ~ label ~ label ~ label ~ label ~ label ~ label svg {
    fill: #FFC107; 
}

input[type="radio"]:checked ~ label svg,
input[type="radio"]:checked ~ label ~ label svg,
input[type="radio"]:checked ~ label ~ label ~ label svg,
input[type="radio"]:checked ~ label ~ label ~ label ~ label svg,
input[type="radio"]:checked ~ label ~ label ~ label ~ label ~ label svg,
input[type="radio"]:checked ~ label ~ label ~ label ~ label ~ label ~ label svg,
input[type="radio"]:checked ~ label ~ label ~ label ~ label ~ label ~ label ~ label svg,
input[type="radio"]:checked ~ label ~ label ~ label ~ label ~ label ~ label ~ label ~ label svg,
input[type="radio"]:checked ~ label ~ label ~ label ~ label ~ label ~ label ~ label ~ label ~ label svg {
    fill: #FFD700; 
}

input[type="radio"]:checked ~ label:hover ~ label svg,
input[type="radio"]:checked ~ label:hover ~ label ~ label svg,
input[type="radio"]:checked ~ label:hover ~ label ~ label ~ label svg,
input[type="radio"]:checked ~ label:hover ~ label ~ label ~ label ~ label svg,
input[type="radio"]:checked ~ label:hover ~ label ~ label ~ label ~ label ~ label svg,
input[type="radio"]:checked ~ label:hover ~ label ~ label ~ label ~ label ~ label ~ label svg,
input[type="radio"]:checked ~ label:hover ~ label ~ label ~ label ~ label ~ label ~ label ~ label svg,
input[type="radio"]:checked ~ label:hover ~ label ~ label ~ label ~ label ~ label ~ label ~ label ~ label svg,
input[type="radio"]:checked ~ label:hover ~ label ~ label ~ label ~ label ~ label ~ label ~ label ~ label ~ label svg {
    fill: #FFC107; 
}


textarea {
    width: 100%;
    height: 100px;
    padding: 10px;
    border-radius: 5px;
    border: 1px solid #ccc;
    margin-top: 10px;
    resize: none;
    font-size: 1em;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.submit-btn {
    display: inline-block;
    background-color: #4CAF50;
    color: #fff;
    padding: 12px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1.1em;
    margin-top: 15px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.submit-btn:hover {
    background-color: #45a049;
}

</style>
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <div class="container">
            <div class="breadcrumb">
                <a href="home.jsp">
                    <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 448 512">
                        <path d="M9.4 272.5L192 448.4c4.8 4.8 11.2 7.6 17.6 7.6 6.5 0 12.8-2.7 17.6-7.6l176-176c4.8-4.8 7.6-11.2 7.6-17.6s-2.8-12.8-7.6-17.6L227.4 24.8C222.6 20 215.2 17.4 208 17.4c-6.4 0-12.8 2.6-17.6 7.4L9.4 256.9c-4.8 4.8-7.6 11.2-7.6 17.6s2.8 12.8 7.6 17.6z"/>
                    </svg>
                </a>
                <span> > </span>
                <span>Feedback</span>
            </div>
            <h1 class="page-title">Feedback for ${mentor.getFullName()}</h1>
            <div class="rate-comment-mentor">
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
            <form action="feedback" method="post">
                <div class="rating">
                    <div>Rating</div>
                    <input type="radio" id="star1" name="rate" value="1" />
                    <label title="Bad" for="star1">
                        <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512">
                            <path d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"/>
                        </svg>
                    </label>
                    <input value="2" name="rate" id="star2" type="radio" />
                    <label title="Okay" for="star2">
                        <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512">
                            <path d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"/>
                        </svg>
                    </label>
                    <input value="3" name="rate" id="star3" type="radio" />
                    <label title="Good" for="star3">
                        <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512">
                            <path d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"/>
                        </svg>
                    </label>
                    <input value="4" name="rate" id="star4" type="radio" />
                    <label title="Great!" for="star4">
                        <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512">
                            <path d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"/>
                        </svg>
                    </label>
                                      <input value="5" name="rate" id="star5" type="radio" />
                    <label title="Excellent!" for="star5">
                        <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512">
                            <path d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"/>
                        </svg>
                    </label>
                </div>
                <input type="hidden" name="rating" id="rating" value="${feedbackObj.star}">
                <input type="hidden" name="mentorname" id="mentorname" value="${mentorName}">
                <input type="hidden" name="requestId" value="${requestId}">
                <c:if test="${feedbackObj != null}">
                    <input type="hidden" name="isContainFb" value="yes">
                </c:if>
                <div class="comment-box">
                    <textarea name="comment" placeholder="Enter your comment...">${feedbackObj.comment}</textarea>
                    <button type="submit" class="submit-btn">Submit</button>
                </div>
            </form>
        </div>
                <script>
                    document.addEventListener('DOMContentLoaded', () => {
    const stars = document.querySelectorAll('.rating input[type="radio"]');
    
    stars.forEach(star => {
        star.addEventListener('change', () => {
            const ratingValue = parseInt(star.value);
            const labels = document.querySelectorAll('.rating label');
            labels.forEach((label, index) => {
                if (index + 1 <= ratingValue) {
                    label.querySelector('svg').style.fill = '#FFD700';  
                } else {
                    label.querySelector('svg').style.fill = '#ddd';  
                }
            });
        });
    });
    
    const labels = document.querySelectorAll('.rating label');
    
    labels.forEach(label => {
        label.addEventListener('mouseover', () => {
            const ratingValue = parseInt(label.getAttribute('for').replace('star', ''));
            labels.forEach((l, index) => {
                if (index + 1 <= ratingValue) {
                    l.querySelector('svg').style.fill = '#FFC107';  
                } else {
                    l.querySelector('svg').style.fill = '#ddd';  
                }
            });
        });
        
        label.addEventListener('mouseout', () => {
            const ratingValue = document.querySelector('input[type="radio"]:checked')?.value || 0;
            const checkedValue = parseInt(ratingValue);
            labels.forEach((l, index) => {
                if (index + 1 <= checkedValue) {
                    l.querySelector('svg').style.fill = '#FFD700';  
                } else {
                    l.querySelector('svg').style.fill = '#ddd';  
                }
            });
        });
    });
});

                </script>
    </body>
</html>

