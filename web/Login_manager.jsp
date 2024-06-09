<%-- 
    Document   : Login_manager
    Created on : Jun 4, 2024, 8:12:23 PM
    Author     : 84979
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
                            .login-box {
                 position: absolute;
                 top: 50%;
                 left: 50%;
                 width: 450px;
                 padding: 40px;
                 margin: 20px auto;
                 transform: translate(-50%, -55%);
                 background: rgba(0,0,0,.9);
                 box-sizing: border-box;
                 box-shadow: 0 15px 25px rgba(0,0,0,.6);
                 border-radius: 10px;
               }

               .login-box p:first-child {
                 margin: 0 0 30px;
                 padding: 0;
                 color: #fff;
                 text-align: center;
                 font-size: 1.5rem;
                 font-weight: bold;
                 letter-spacing: 1px;
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
                 color: #99FF99;
                 font-size: 12px;
               }

               .login-box form a {
                 position: relative;
                 display: inline-block;
                 padding: 10px 20px;
                 font-weight: bold;
                 color: #fff;
                 font-size: 16px;
                 text-decoration: none;
                 text-transform: uppercase;
                 overflow: hidden;
                 transition: .5s;
                 margin-top: 40px;
                 letter-spacing: 3px
               }

               .login-box a:hover {
                 background: #fff;
                 color: #272727;
                 border-radius: 5px;
               }

               .login-box a span {
                 position: absolute;
                 display: block;
               }
              button {
        width: 10em;
        position: relative;
        height: 3.5em;
        border: 3px ridge #149CEA;
        outline: none;
        background-color: transparent;
        color: white;
        transition: 1s;
        border-radius: 0.3em;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
      }

      button::after {
        content: "";
        position: absolute;
        top: -10px;
        left: 3%;
        width: 95%;
        height: 40%;
        background-color: #212121;
        transition: 0.5s;
        transform-origin: center;
      }

      button::before {
        content: "";
        transform-origin: center;
        position: absolute;
        top: 80%;
        left: 3%;
        width: 95%;
        height: 40%;
        background-color: #212121;
        transition: 0.5s;
      }

      button:hover::before, button:hover::after {
        transform: scale(0)
      }

      button:hover {
        box-shadow: inset 0px 0px 25px #1479EA;
      }
               .login-box p:last-child {
                 color: #aaa;
                 font-size: 14px;
               }

               .login-box a.a2 {
                 color: #fff;
                 text-decoration: none;
               }

               .login-box a.a2:hover {
                 background: transparent;
                 color: #aaa;
                 border-radius: 5px;
               }
    </style>
    </head>
    
    <body>
                <div class="login-box">
  <p>Login</p>
<form action="LoginManager" method="post" >  
    <div class="user-box">
      <input required name="username" type="text">
      <label>Username</label>
    </div>
    <div class="user-box">
      <input required name="password" type="password">
      <label>Password</label>
    </div>
    <button type="submit">
    Login
</button>
  </form>
</div>
         <div class="button-group align-items-center justify-content-center color-ruby">
                                    ${mess}
                                    ${status}
                                    ${messaget}
                           </div>
    </body>
</html>
