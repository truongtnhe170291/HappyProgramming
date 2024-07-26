<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404 - Page Not Found</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        .flex {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            background-color: #f0f0f0;
        }
        .error-container {
            display: flex;
            align-items: center;
            font-size: 6rem;
            font-weight: bold;
            color: #0074d9;
        }
        .magnifier {
            font-size: 4rem;
            color: #0074d9;
            margin-left: 10px;
        }
        .text-2xl {
            font-size: 2rem;
            font-weight: medium;
            color: #333;
            margin-top: 20px;
        }
        .back-to-home {
            display: inline-block;
            padding: 10px 20px;
            background-color: #0074d9;
            color: #ffffff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            margin-top: 20px;
        }
        .back-to-home:hover {
            background-color: #005ea6;
        }
    </style>
</head>
<body>
    <div class="flex">
        <div class="error-container">
            <span>404</span>
            <i class="fas fa-search magnifier"></i>
        </div>
        <p class="text-2xl">Oops...page not found!</p>
        <a href="homeMentee" class="back-to-home">Back to Home</a>
    </div>
</body>
</html>