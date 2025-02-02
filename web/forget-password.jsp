<%-- 
    Document   : forget-password
    Created on : May 18, 2024, 12:57:13 PM
    Author     : 84979
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
<html lang="en" dir="ltr">

<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <title>FMASTER</title>

             <jsp:include page="style/linkcss.jsp" />

</head>

<body>
   <main class="main-content">

      <div class="admin">
         <div class="container-fluid">
            <div class="row justify-content-center">
               <div class="col-xxl-3 col-xl-4 col-md-6 col-sm-8">
                  <div class="edit-profile">
                     <div class="edit-profile__logos">
                        <a href="login.jsp">
                        </a>
                     </div>
                     <div class="card border-0">
                        <div class="card-header">
                           <div class="edit-profile__title">
                              <h6>Forgot Password?</h6>
                           </div>
                        </div>
                        <div class="card-body">
                           <div class="edit-profile__body">
                               <p style="text-align: center; font-size: 13px">------If you've forgotten your password, enter your account and email----</p>
                              <form action="forgotPassword" method="post">
                                  <div class="form-group mb-20">
                                 <label for="usernames">Username</label>
                                 <input type="text" class="form-control"  placeholder="minh12313" name="username" required>
                              </div>
                              <div class="form-group mb-20">
                                 <label for="email">Email Adress</label>
                                 <input type="text" class="form-control" id="email" placeholder="name@example.com" name="email" required>
                              </div>
                                  	<%
		  			if(request.getAttribute("messages")!=null)
		  			{
		  				out.print("<p class='text-danger ml-1'>"+request.getAttribute("messages")+"</p>");
		  			}
		  
		  %>
                             <div class="text-center">
    <input class="btn btn-primary btn-default btn-squared text-capitalize lh-normal px-md-50 py-15 signIn-createBtn mx-auto" type="submit" value="Send Reset"/>
</div>

                              </form>
                           </div>
                        </div><!-- End: .card-body -->
                     </div><!-- End: .card -->
                  </div><!-- End: .edit-profile -->
               </div><!-- End: .col-xl-5 -->
            </div>
         </div>
      </div><!-- End: .admin-element  -->

   </main>
   <div id="overlayer">
      <div class="loader-overlay">
         <div class="dm-spin-dots spin-lg">
            <span class="spin-dot badge-dot dot-primary"></span>
            <span class="spin-dot badge-dot dot-primary"></span>
            <span class="spin-dot badge-dot dot-primary"></span>
            <span class="spin-dot badge-dot dot-primary"></span>
         </div>
      </div>
   </div>
   <div class="enable-dark-mode dark-trigger">
      <ul>
         <li>
            <a href="#">
               <i class="uil uil-moon"></i>
            </a>
         </li>
      </ul>
   </div>
            <jsp:include page="style/linkJS.jsp" />

</body>

</html>
