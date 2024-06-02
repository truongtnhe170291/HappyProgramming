<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enter OTP</title>
     <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Optional JavaScript -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
     <style>
        body {

            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: 'Arial', sans-serif;
        }
        .panel-body {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }
        .input-group-text {
            background-color: #f1f1f1;
            border: 1px solid #ced4da;
            border-right: 0;
            border-top-left-radius: 0.25rem;
            border-bottom-left-radius: 0.25rem;
        }
        .form-control {
            border-left: 0;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            transition: background-color 0.3s, border-color 0.3s;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .btn-warning {
            background-color: #ffc107;
            border-color: #ffc107;
        }
        .form-group p {
            margin: 0;
        }
    </style>
    
</head>
<body>
    <div class="panel-body">
        <form id="register-form" action="ValidateOtp" role="form" autocomplete="off" class="form" method="post">
            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
                    <input id="otp" name="otp" placeholder="Enter OTP" class="form-control" type="text" >
                </div>
            </div>
            <div class="form-group">
                <input id="otp-button" name="recover-submit" class="btn btn-lg btn-primary btn-block" value="Confirm" type="submit">
                <br/>
            </div>
            
            <input type="hidden" class="hide" name="token" id="token" value="">
        </form>
      <a href="homes.jsp"> <input id="otp-button" name="recover-submit" class="btn btn-lg btn-primary btn-block" value="Back To Home" type="submit"></a>
     
    </div>
</body>
</html>
