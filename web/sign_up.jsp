<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en" dir="ltr">

<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <title>Test</title>
          <jsp:include page="style/linkcss.jsp" />

</head>

<body>
  
    <div class="centers ">
        <button class="btn-17 btn-mentor">
  <span class="text-container">
    <span class="text ">Mentor</span>
  </span>
</button>
     <button class="btn-17 btn-mentee">
  <span class="text-container ">
    <span class="text " >Mentee</span>
  </span>
</button>
</div>
    
   <main class="main-content">

      <div class="admin">
         <div class="container-fluid">
            <div class="row justify-content-center">
               <div class="col-xxl-3 col-xl-4 col-md-6 col-sm-8">
                  <div class="edit-profile">
                     <div class="edit-profile__logos">
                        <a href="index.jsp">
                 
                        </a>
                     </div>
                     <div class="card border-0">
                        <div class="card-header">
                           <div class="edit-profile__title">
                              <h6>Sign Up</h6>
                           </div>
                        </div>
                         <form action="signup" method="Post"> 
                          
                        <div class="card-body">
                           <div class="edit-profile__body">

    <div class="edit-profile__body">
      
        <div class="form-group mb-20">
            <label for="username">username</label>
            <input type="text" class="form-control" id="username" name="username" placeholder="Username">
        </div>
        <div class="form-group mb-20">
            <label for="email">Email</label>
            <input type="text" class="form-control" id="email" name="email" placeholder="name@example.com">
        </div>
        <div class="form-group mb-15">
            <label for="password-field">password</label>
            <div class="position-relative">
                <input id="password-field" type="password" class="form-control" name="password" placeholder="Password">
                <div class="uil uil-eye-slash text-lighten fs-15 field-icon toggle-password2"></div>
            </div>
        </div>
        <div class="form-group mb-15">
            <label for="password-field">confirm password</label>
            <div class="position-relative">
                <input id="password-field" type="password" class="form-control" name="confirm_password" placeholder="confirm_Password">
                <div class="uil uil-eye-slash text-lighten fs-15 field-icon toggle-password2"></div>
            </div>
        </div>
        <div class="form-group mb-20">
            <label>fullname</label>
            <input type="text" class="form-control" id="username" name="fullname" placeholder="BUI THI A">
        </div>
        <div class="form-group mb-20">
            <label>phone number</label>
            <input type="tel" class="form-control" id="tel" name="tel">
        </div>
        <div class="form-group mb-20">
            <label>Date Of Birth</label>
            <input type="date" class="form-control" id="Dob" name="Dob">
        </div>
        <div class="form-group mb-20">
            <label>sex:</label>
            <select name="sex">
                <option value="male">male</option>
                <option value="female">female</option>
            </select>
        </div>
         <div class="form-group mb-20">
            <label>Address</label>
            <input type="text" class="form-control" id="Address" name="Address">
        </div>
            <div class="form-group mb-20">
               <label>Role</label>
               <input type="number" class="form-control hide-role" id="role" name="role" readonly>
            </div>
        </div>
        <div class="admin__button-group button-group d-flex pt-1 justify-content-md-start justify-content-center">
            <input class="btn btn-primary btn-default w-100 btn-squared text-capitalize lh-normal px-50 signIn-createBtn " type="submit" value="Create Account"/>
        </div>
    </div>
</div>
                              ${error}
</form>
                        </div><!-- End: .card-body -->

 
                        <div class="admin-topbar">
                           <p class="mb-0">
                              Don't have an account?
                              <a href="login.jsp" class="color-primary">
                                 Sign In
                              </a>
                           </p>
                        </div><!-- End: .admin-topbar  -->
                     </div><!-- End: .card -->
                  </div><!-- End: .edit-profile -->
               </div><!-- End: .col-xl-5 -->
            </div>
         </div>

 
   </main>
   <div class="enable-dark-mode dark-trigger">
      <ul>
         <li>
            <a href="#">
               <i class="uil uil-moon"></i>
            </a>
         </li>
      </ul>
   </div>
   
 <script>
    const mainContent = document.querySelector('.main-content');
    const mentorButton = document.querySelector('.btn-17:nth-of-type(1)');
    const menteeButton = document.querySelector('.btn-17:nth-of-type(2)');
     document.addEventListener("DOMContentLoaded", function() {
      const mentorBtn = document.querySelector(".btn-mentor");
      const menteeBtn = document.querySelector(".btn-mentee");
      const roleInput = document.getElementById("role");

      mentorBtn.addEventListener("click", function() {
         roleInput.value = 2; // Thiết lập giá trị Role thành 2 khi nhấp vào nút Mentor
      });

      menteeBtn.addEventListener("click", function() {
         roleInput.value = 1; // Thiết lập giá trị Role thành 1 khi nhấp vào nút Mentee
      });
   });
    mainContent.style.display = 'none';

    mentorButton.addEventListener('click', function() {
        mainContent.style.display = 'block';
        mentorButton.style.display = 'block';
        menteeButton.style.display = 'none';
        mentorButton.classList.add('merge');
    });

    menteeButton.addEventListener('click', function() {
        mainContent.style.display = 'block';
        menteeButton.style.display = 'block';
        mentorButton.style.display = 'none';
        menteeButton.classList.add('merge');
        
        
    });
</script>

           <jsp:include page="style/linkJS.jsp" />

</body>

</html>