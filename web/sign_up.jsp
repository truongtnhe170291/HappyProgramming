<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en" dir="ltr">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>FMASTER</title>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
            <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
        <jsp:include page="style/linkcss.jsp" />
        <style>
            .error-message {
                color: red;
                display: none;
                margin-top: 5px;
            }
            #role{
                display: none;
            }
            .main-content{
                margin-top: -70px;
            }
        </style>
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
                                    <a href="homes.jsp">

                                    </a>
                                </div>
                                <div class="card border-0">
                                    <div class="card-header">
                                        <div class="edit-profile__title">
                                            <h6>Sign Up</h6>
                                        </div>
                                    </div>
                                    <form id="signupForm" action="signup" method="Post">
                                        <div class="card-body">
                                            <div class="edit-profile__body">
                                                <div class="form-group mb-20">
                                                    <label for="username">Username</label>
                                                    <input type="text" class="form-control" id="username" name="username" placeholder="Username" maxlength="30" minlength="3" required>
                                                    <div class="error-message" id="usernameError"></div>
                                                </div>
                                                <div class="form-group mb-20">
                                                    <label for="email">Email</label>
                                                    <input type="text" class="form-control" id="email" name="email" placeholder="name@example.com" maxlength="30" required>
                                                    <div class="error-message" id="emailError"></div>
                                                </div>
                                                <div class="form-group mb-15">
                                                    <label for="password-field">Password</label>
                                                    <div class="position-relative">
                                                        <input id="password-field" type="password" class="form-control" name="password" placeholder="Password" maxlength="30" required>
                                                        <div class="uil uil-eye-slash text-lighten fs-15 field-icon toggle-password2"></div>
                                                    </div>
                                                    <div class="error-message" id="passwordError"></div>
                                                </div>
                                                <div class="form-group mb-15">
                                                    <label for="confirm-password-field">Confirm Password</label>
                                                    <div class="position-relative">
                                                        <input id="confirm-password-field" type="password" class="form-control" name="confirm_password" maxlength="30" placeholder="Confirm Password" required>
                                                        <div class="uil uil-eye-slash text-lighten fs-15 field-icon toggle-password2"></div>
                                                    </div>
                                                    <div class="error-message" id="confirmPasswordError"></div>
                                                </div>
                                                <div class="form-group mb-20">
                                                    <label for="fullname">Full Name</label>
                                                    <input type="text" class="form-control" id="fullname" name="fullname" placeholder="BUI THI A" maxlength="30" required>
                                                    <div class="error-message" id="fullnameError"></div>
                                                </div>
                                                <div class="form-group mb-20">
                                                    <label for="tel">Phone Number</label>
                                                    <input type="tel" class="form-control" id="tel" name="tel" minlength="10" maxlength="10" required>
                                                    <div class="error-message" id="telError"></div>
                                                </div>
                                                <div class="form-group mb-20">
                                                    <label for="Dob">Date of Birth:</label>
                                                    <input type="date" class="form-control" id="Dob" name="Dob" required>
                                                    <span class="error-message" id="error-message"></span>
                                                </div>
                                                <div class="form-group mb-20">
                                                    <label for="sex">Sex:</label>
                                                    <select name="sex" id="sex">
                                                        <option value="male">Male</option>
                                                        <option value="female">Female</option>
                                                    </select>
                                                    <div class="error-message" id="sexError"></div>
                                                </div>
                                                <div class="form-group mb-20">
                                                    <label for="Address">Address</label>
                                                    <input type="text" class="form-control" id="Address" name="Address" required>
                                                    <div class="error-message" id="addressError"></div>
                                                </div>
                                                <div class="form-group mb-20">
                                                    <label for="role">Role</label>
                                                    <input type="number" class="form-control hide-role" id="role" name="role" readonly >
                                                    <input type="text" class="form-control hide-role" id="roleDisplay" readonly >

                                                </div>
                                            </div>
                                            <div class="admin__button-group button-group d-flex pt-1 justify-content-md-start justify-content-center">
                                                <input  id="submitBtn" class="btn btn-primary btn-default w-100 btn-squared text-capitalize lh-normal px-50 signIn-createBtn" type="submit" value="Create Account">
                                            </div>
                                        </div>
                                        <%
                                            String errorMessage = (String) request.getAttribute("error");
                                            if (errorMessage != null) {
                                        %>
                                        <script type="text/javascript">
                alert('<%= errorMessage %>');
                                        </script>
                                        <%
                                            }
                                        %>
                                    </form>


                                    <div class="admin-topbar">
                                        <p class="mb-0">
                                            Don't have an account?
                                            <a href="login" class="color-primary">
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
          document.addEventListener('DOMContentLoaded', function() {
    const signupForm = document.getElementById('signupForm');
    const mentorBtn = document.querySelector(".btn-mentor");
    const menteeBtn = document.querySelector(".btn-mentee");
    const roleInput = document.getElementById("role");
    const roleDisplay = document.getElementById("roleDisplay");
    const mainContent = document.querySelector('.main-content');
    const mentorButton = document.querySelector('.btn-17:nth-of-type(1)');
    const menteeButton = document.querySelector('.btn-17:nth-of-type(2)');

    signupForm.addEventListener('submit', function (event) {
        event.preventDefault();
        clearErrors();

        let valid = true;
        if (!validateUsername()) valid = false;
        if (!validateEmail()) valid = false;
        if (!validatePassword()) valid = false;
        if (!validateConfirmPassword()) valid = false;
        if (!validateFullName()) valid = false;
        if (!validatePhoneNumber()) valid = false;
        if (!validateDOB()) valid = false;
        if (!validateSex()) valid = false;
        if (!validateAddress()) valid = false;

        if (valid) {
            this.submit();
        }
    });

    function clearErrors() {
        document.querySelectorAll('.error-message').forEach(function (element) {
            element.innerHTML = '';
        });
    }

    function validateUsername() {
        const username = document.getElementById('username').value;
        if (!username) {
            document.getElementById('usernameError').innerText = 'Username is required.';
            return false;
        }
        return true;
    }

    function validateEmail() {
        const email = document.getElementById('email').value;
        const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
        if (!email) {
            document.getElementById('emailError').innerText = 'Email is required.';
            return false;
        } else if (!emailPattern.test(email)) {
            document.getElementById('emailError').innerText = 'Invalid email format.';
            return false;
        }
        return true;
    }

    function validatePassword() {
        const password = document.getElementById('password-field').value;
        if (!password) {
            document.getElementById('passwordError').innerText = 'Password is required.';
            return false;
        }
        return true;
    }

    function validateConfirmPassword() {
        const password = document.getElementById('password-field').value;
        const confirmPassword = document.getElementById('confirm-password-field').value;
        if (password !== confirmPassword) {
            showToast("Confirm password not the same as password!");
            return false;
        }
        return true;
    }

    function validateFullName() {
        const fullname = document.getElementById('fullname').value;
        if (!fullname) {
                        showToast("Full name is required.");

            document.getElementById('fullnameError').innerText = 'Full name is required.';
            return false;
        } else if (/\d/.test(fullname)) {
            showToast("Full name must not contain numbers");
            document.getElementById('fullnameError').innerText = 'Full name must not contain numbers.';
            return false;
        }
        return true;
    }

    function validatePhoneNumber() {
        const tel = document.getElementById('tel').value;
        if (!tel) {
                                    showToast("Phone number is required.");

            document.getElementById('telError').innerText = 'Phone number is required.';
            return false;
        } else if (!/^\d+$/.test(tel)) {
                                                showToast("Phone number must contain only digits.");

            document.getElementById('telError').innerText = 'Phone number must contain only digits.';
            return false;
        }
        return true;
    }

    function validateDOB() {
        const dob = document.getElementById('Dob').value;
        if (!dob) {
            document.getElementById('error-message').innerText = 'Date of birth is required.';
            return false;
        }
        return true;
    }

    function validateSex() {
        const sex = document.getElementById('sex').value;
        if (!sex) {
            document.getElementById('sexError').innerText = 'Sex is required.';
            return false;
        }
        return true;
    }

    function validateAddress() {
        const address = document.getElementById('Address').value;
        if (!address) {
            showToast('Address is required.');
            document.getElementById('addressError').innerText = 'Address is required.';
            return false;
        }
        return true;
    }

    function showToast(message) {
        Toastify({
            text: message,
            duration: 3000,
            close: true,
            gravity: "top",
            position: "right",
            backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)",
        }).showToast();
    }

    // Real-time validation
    document.getElementById('tel').addEventListener('input', validatePhoneNumber);
    document.getElementById('fullname').addEventListener('input', validateFullName);
    document.getElementById('confirm-password-field').addEventListener('input', validateConfirmPassword);

    // Date of Birth validation
    document.getElementById('submitBtn').addEventListener('click', function (event) {
        const dobInput = document.getElementById('Dob');
        const dobValue = new Date(dobInput.value);
        const today = new Date();
        const age = today.getFullYear() - dobValue.getFullYear();
        const monthDiff = today.getMonth() - dobValue.getMonth();
        const dayDiff = today.getDate() - dobValue.getDate();
        const errorMessage = document.getElementById('error-message');

        if (age < 6 || (age === 6 && (monthDiff < 0 || (monthDiff === 0 && dayDiff < 0)))) {
            errorMessage.style.display = 'block';
            errorMessage.innerText = 'You must be at least 6 years old.';
            dobInput.setCustomValidity('You must be at least 6 years old.');
            dobInput.reportValidity();
            dobInput.focus();
            event.preventDefault();
        } else {
            errorMessage.style.display = 'none';
            dobInput.setCustomValidity('');
        }
    });

    // Role selection
    mentorBtn.addEventListener("click", function () {
        roleInput.value = 2;
        roleDisplay.value = "Mentor";
    });

    menteeBtn.addEventListener("click", function () {
        roleInput.value = 1;
        roleDisplay.value = "Mentee";
    });

    // Main content display
    mainContent.style.display = 'none';

    mentorButton.addEventListener('click', function () {
        mainContent.style.display = 'block';
        mentorButton.style.display = 'block';
        menteeButton.style.display = 'none';
        mentorButton.classList.add('merge');
    });

    menteeButton.addEventListener('click', function () {
        mainContent.style.display = 'block';
        menteeButton.style.display = 'block';
        mentorButton.style.display = 'none';
        menteeButton.classList.add('merge');
    });
});
        </script>

        <jsp:include page="style/linkJS.jsp" />

    </body>

</html>