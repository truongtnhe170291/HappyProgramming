<%-- 
Document   : ChangePasswords
Created on : May 21, 2024, 4:14:32 PM
Author     : 84979
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fmaster</title>
        <style>
            .login-box {
                margin: 12px 12px;
                position: absolute;
                top: 50%;
                left: 50%;
                width: 600px;
                padding: 40px;
                transform: translate(-50%, -50%);
                background: rgba(245, 245, 245, 0.987);
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
                color: rgba(24, 20, 20, 0.987);
                ;
                margin-bottom: 30px;
                border: none;
                border-bottom: 1px solid rgba(24, 20, 20, 0.987);
                outline: none;
                background: transparent;
            }

            .login-box .user-box label {
                position: absolute;
                top: 0;
                left: 0;
                padding: 10px 0;
                font-size: 16px;
                color: rgba(24, 20, 20, 0.987);
                ;
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

            .login-box form button {
                background: none;
                position: relative;
                display: inline-block;
                padding: 10px 20px;
                font-size: 16px;
                color: rgba(24, 20, 20, 0.987);
                ;
                text-decoration: none;
                text-transform: uppercase;
                overflow: hidden;
                transition: .5s;
                margin-top: 40px;
                letter-spacing: 4px
            }

            .login-box button:hover {
                background: #03f40f;
                color: rgba(24, 20, 20, 0.987);
                ;
                border-radius: 5px;
                box-shadow: 0 0 5px #03f40f,
                    0 0 25px #03f40f,
                    0 0 50px #03f40f,
                    0 0 100px #03f40f;
            }

            .login-box button span {
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
            a{
                text-decoration: none;
                font-weight: bold;
                color:rgba(24, 20, 20, 0.987);
            }
            .login-box button span:nth-child(2) {
                bottom: 2px;
                left: -100%;
                width: 100%;
                height: 2px;
                background: linear-gradient(90deg, transparent, #03f40f);
                animation: btn-anim1 2s linear infinite;
            }
            .author_anh{
                width: 100%;
                text-align: center;
            }
            .anh{
                border-radius: 50%;
                width: 300px;
                height: 300px;
                background-size: contain;
                background-repeat: no-repeat;
                background-position: center;
            }
            .fullname{
                width: 100%;
                text-align: center;
                font-size: 30px;
                color:rgba(24, 20, 20, 0.987);
                ;

            }
            .label{
                font-size: 24px;
                color:rgba(24, 20, 20, 0.987);
                ;
                text-align: center;
                margin-bottom: 10px;
            }
            .title{
                font-size: 40px;
                color:rgba(24, 20, 20, 0.987);
                ;
                text-align: center;
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body>

        <div class="login-box">

            <form action="changepass" method="post">
                <div class="title">Change Password</div>
                <div class="label">------Please enter your user name and password------</div>
                <div class="user-box">
                    <input type="text" name="opass" required>
                    <label>Old Password</label>
                </div>
                <div class="user-box">
                    <input type="text" name="pass" required>
                    <label>New Password</label>
                </div>
                <div class="user-box">
                    <input type="password" name="rpass" required>
                    <label>confirm New Password</label>
                </div><center>
                    <h4 style="color: red">${requestScope.msg}</h4>
                    <button>
                        change password
                        <span></span>
                    </button>
                    <br/>
                    <button>
                        <a href="homeMentee">
                            to home
                            <span></span>
                        </a>
                        <span></span>
                    </button>

                </center>
            </form>

        </div>
    </body>
</html> 