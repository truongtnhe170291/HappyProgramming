<%-- 
    Document   : changpass
    Created on : May 16, 2024, 4:21:37 PM
    Author     : DIEN MAY XANH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change pass</title>
        <style>
            .login-box {
                position: absolute;
                top: 50%;
                left: 50%;
                width: 400px;
                padding: 40px;
                transform: translate(-50%, -50%);
                background: rgba(24, 20, 20, 0.987);
                box-sizing: border-box;
                box-shadow: 0 15px 25px rgba(0,0,0,.6);
                border-radius: 10px;
            }

            .login-box .user-box {
                position: relative;
            }

            .login-box .user-box input {
                width: 100%;
                padding: 10px 0;
                font-size: 16px;
                color: #fff;
                margin-bottom: 30px;
                border: none;
                border-bottom: 1px solid #fff;
                outline: none;
                background: transparent;
            }

            .login-box .user-box label {
                position: absolute;
                top: 0;
                left: 0;
                padding: 10px 0;
                font-size: 16px;
                color: #fff;
                pointer-events: none;
                transition: .5s;
            }

            .login-box .user-box input:focus ~ label,
            .login-box .user-box input:valid ~ label {
                top: -20px;
                left: 0;
                color: #bdb8b8;
                font-size: 12px;
            }

            .login-box form a {
                position: relative;
                display: inline-block;
                padding: 10px 20px;
                color: #ffffff;
                font-size: 16px;
                text-decoration: none;
                text-transform: uppercase;
                overflow: hidden;
                transition: .5s;
                margin-top: 40px;
                letter-spacing: 4px
            }

            .login-box a:hover {
                background: #03f40f;
                color: #fff;
                border-radius: 5px;
                box-shadow: 0 0 5px #03f40f,
                    0 0 25px #03f40f,
                    0 0 50px #03f40f,
                    0 0 100px #03f40f;
            }

            .login-box a span {
                position: absolute;
                display: block;
            }

            @keyframes btn-anim1 {
                0% {
                    left: -100%;
                }

                50%,100% {
                    left: 100%;
                }
            }

            .login-box a span:nth-child(1) {
                bottom: 2px;
                left: -100%;
                width: 100%;
                height: 2px;
                background: linear-gradient(90deg, transparent, #03f40f);
                animation: btn-anim1 2s linear infinite;
            }
        </style>
    </head>
    <body>

        <div class="login-box">

            <form>
                <div class="user-box">
                    <input type="text" name="" required="">
                    <label>Old Password</label>
                </div>
                <div class="user-box">
                    <input type="text" name="" required="">
                    <label>New Password</label>
                </div>
                <div class="user-box">
                    <input type="password" name="" required="">
                    <label>Confirm New Password</label>
                </div><center>
                    <a href="#">
                        SEND
                        <span></span>
                    </a></center>
            </form>
        </div>



</body>
</html>
