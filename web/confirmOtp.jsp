<html>
<head>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

<style type="text/css">
.form-gap {
    padding-top: 70px;
}
</style>
 <script>
        let timer;
        function startCountdown(duration, display) {
            let time = duration;
            display.textContent = time;
            timer = setInterval(function () {
                time--;
                display.textContent = time;

                if (time <= 0) {
                    clearInterval(timer);
                    document.getElementById('otp-button').value = 'Reset send OTP';
                    document.getElementById('otp-button').onclick = sendNewOTP;
                }
            }, 1000);
        }

        function sendNewOTP() {
            document.getElementById('register-form').action = 'sendnew'; 
            document.getElementById('register-form').submit();
        }

        window.onload = function () {
            let duration = 40; 
            let display = document.querySelector('#time');
            startCountdown(duration, display);
        };
    </script>
</head>

<body>
	<div class="form-gap"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="text-center">
							
							<h2 class="text-center">Enter OTP</h2>
									<%
		  			if(request.getAttribute("messages")!=null)
		  			{
		  				out.print("<p class='text-danger ml-1'>"+request.getAttribute("messages")+"</p>");
		  			}
		  
		  %>
	
							<div class="panel-body">

								<form id="register-form" action="SucessOtp" role="form" autocomplete="off"
									class="form" method="post">

									<div class="form-group">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-envelope color-blue"></i></span> <input
												id="opt" name="otp" placeholder="Enter OTP"
												class="form-control" type="text" required="required">
										</div>
									</div>
                                                                                                        <div class="form-group">
                                                  <p>Time remaining: <span id="time">30</span> seconds</p>
                                              </div>
									<div class="form-group">
										<input id="otp-button" name="recover-submit"
											class="btn btn-lg btn-primary btn-block"
											value="Reset Password" type="submit">
									</div>
                                                                    

									<input type="hidden" class="hide" name="token" id="token"
										value="">
								</form>
                                                                  <a href="homes.jsp"> <input name="recover-submit" class="btn btn-lg btn-primary btn-block" value="Back To Home" type="submit"></a>

                                                           <div class="form-group">
                ${message}
            </div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>