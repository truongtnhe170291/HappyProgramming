<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>500 - Internal Server Error</title>
    <link rel="icon" type="image/png" sizes="16x16" href="img/favicon.png">

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .error-container {
            text-align: center;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .error-code {
            font-size: 3rem;
            font-weight: bold;
            color: #d9534f;
        }
        .error-message {
            font-size: 1.5rem;
            color: #333;
            margin-top: 10px;
        }
        .back-to-home {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #0074d9;
            color: #ffffff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .back-to-home:hover {
            background-color: #005ea6;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <div class="error-message">Oops! Something went wrong on our server.</div>
        <a href="homeMentee" class="back-to-home">Back to Home</a>
    </div>
</body>
</html>
