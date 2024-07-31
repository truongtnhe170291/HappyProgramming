<%-- 
    Document   : ListFavoriteMentors
    Created on : Jul 30, 2024, 5:38:04 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/7005da8e68.js" crossorigin="anonymous"></script>
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
        <style>
            .mentor-list{
                height: fit-content;
            }
            .mentor-details{
                border: solid 1px;
            }
        </style>

    </head>
    <body>
        <jsp:include page="header.jsp" />
        <div class="container">
            <h1>Favorite Mentors</h1>
            <div class="mentor-list">
                <div class="col-sm-4">
                    <div class="mentor-details">
                        
                    </div>
                </div>

            </div>

            <h1>Favorite Skills</h1>
        </div>
    </body>
</html>