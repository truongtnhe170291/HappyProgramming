<%-- 
    Document   : newPassword
    Created on : May 18, 2024, 1:11:14 PM
    Author     : 84979
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>FMASTER</title>
<link
	href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'
	rel='stylesheet'>
<link
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css'
	rel='stylesheet'>
<script type='text/javascript'
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
            <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
<style>
.placeicon {
	font-family: fontawesome
}

.custom-control-label::before {
	background-color: #dee2e6;
	border: #dee2e6
}
body{
    background-color: #fff !important;
}
.bg-e{
    background-color: #ccc !important;
}
</style>
<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.css">
</head>

	
        <body>
	<div>
		<!-- Container containing all contents -->
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12 col-md-9 col-lg-7 col-xl-6 mt-5 bg-e">
					<!-- White Container -->
					<div class="container bg-white rounded mt-2 mb-2 px-0">
						<!-- Main Heading -->
						<div class="row justify-content-center align-items-center pt-3">
							<h1>
								<strong>Reset Password</strong>
							</h1>
						</div>
						<div class="pt-3 pb-3">
							<form class="form-horizontal" action="NewPassword" method="post">
								<!-- User Name Input -->
								<div class="form-group row justify-content-center px-3">
									<div class="col-9 px-0">
										<input type="text" name="password" placeholder="&#xf084; &nbsp; New Password"
											class="form-control border-info placeicon">
									</div>
								</div>
								<!-- Password Input -->
								<div class="form-group row justify-content-center px-3">
									<div class="col-9 px-0">
										<input type="password" name="confPassword"
											placeholder="&#xf084; &nbsp; Confirm New Password"
											class="form-control border-info placeicon">
									</div>
								</div>
							
								<!-- Log in Button -->
								<div id="submitbutton_reset" class="form-group row justify-content-center">
									<div class="col-3 px-3 mt-3">
										<input  type="submit" value="Reset"
											class="btn btn-block btn-info">
									</div>
								</div>
                                                                <div class="form-group row justify-content-center px-3">
									
								</div>
                                                                
							</form>
						</div>
						<!-- Alternative Login -->
						<div class="mx-0 px-0 bg-light">
							
							<!-- Horizontal Line -->
							<div class="px-4 pt-5">
								<hr>
							</div>
							<!-- Register Now -->
							<div class="pt-2">
								<div class="row justify-content-center">
									<h5>
										Don't have an Account?<span><a href="#"
											class="text-danger"> Register Now!</a></span>
									</h5>
								</div>
								<div
									class="row justify-content-center align-items-center pt-4 pb-5">
									<div class="col-4">
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
                                                                    <script>
                               document.addEventListener('DOMContentLoaded', () => {
const status =  `${statust}`;
console.log(status);
document.getElementById('submitbutton_reset').addEventListener('click', function(e){
    e.preventDefault();
        showToastMessage('confirm password not the same new password');
      
});
    function showToastMessage(message) {
                Toastify({
                text: message,
                        duration: 5000,
                        gravity: "top",
                        position: "right",
                        backgroundColor: "#ff7b5a"
                }).showToast();
                }
            });                                             </script>
	<script type='text/javascript'
		src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
	
</body>
</html>
