<!doctype html>
<html lang="en" dir="ltr">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>FMASTER</title>
        <style>
            .formc{
                transform: translateY(-100px);
            }
            #backh{
                width: 200px;
                transform: translateX(150px);
            }
            #message{
                text-align: center;
                width: 70%;
                margin-left: auto;
                margin-right: auto;
            }
        </style>
        <jsp:include page="style/linkcss.jsp" />

    </head>

    <body>

        <main class="main-content">

            <div class="admin">
                <div class="container-fluid">
                    <div class="row justify-content-center">
                        <div class="col-xxl-3 col-xl-4 col-md-6 col-sm-8 formc">
                            <div class="edit-profile">
                                <div class="edit-profile__logos">

                                </div>
                                <div class="card border-0">
                                    <div class="card-header">
                                        <div class="edit-profile__title">
                                            <h6>Sign in</h6>
                                        </div>
                                    </div>
                                    <form action="login" method="post" >
                                        <div class="card-body">
                                            <div class="edit-profile__body">
                                                <div class="form-group mb-25">
                                                    <label for="username">Username</label>
                                                    <input type="text" class="form-control" id="username" placeholder="Username" name="username">
                                                </div>
                                                <div class="form-group mb-15">
                                                    <label for="password-field">password</label>
                                                    <div class="position-relative">
                                                        <input id="password-field" type="password" class="form-control" name="password" placeholder="Password">
                                                        <div class="uil uil-eye-slash text-lighten fs-15 field-icon toggle-password2">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="admin-condition">
                                                    <div class="checkbox-theme-default custom-checkbox ">
                                                        <input class="checkbox" type="checkbox" id="check-1">
                                                        <label for="check-1">
                                                            <span class="checkbox-text">Keep me logged in</span>
                                                        </label>
                                                    </div>
                                                    <a href="forgotPassword">forget password?</a>
                                                </div>
                                                <div class="admin__button-group button-group d-flex pt-1 justify-content-md-start justify-content-center">
                                                    <input class="btn btn-primary btn-default w-100 btn-squared text-capitalize lh-normal px-50 signIn-createBtn " type='submit' value=" sign in"/>

                                                </div>
                                            </div>
                                        </div>

                                    </form>
                                    <div id="backh" class="admin__button-group button-group d-flex pt-1 justify-content-md-start justify-content-center">
                                        <a href="homeMentee">  <input class="btn btn-primary btn-default w-100 btn-squared text-capitalize lh-normal px-50 signIn-createBtn " type='submit' value="Back To Home"/> </a>

                                    </div>
                                    <br/>
                                    <div class="button-group align-items-center justify-content-center color-ruby" id="message">
                                        ${mess}
                                        ${status}
                                        ${messaget}
                                    </div>
                                    <div class="admin-topbar d-flex flex-column g-3">
                                        <p class="mb-0 p-3">
                                            Don't have an account?
                                            <a href="signup" class="color-primary">
                                                Sign up
                                            </a>
                                        </p>
                                    </div><!-- End: .admin-topbar  -->
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