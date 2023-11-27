<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="common/head.jspf" %>
    <link href="/project/css/login.css" rel="stylesheet">
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <%@ include file="common/top.jspf" %>
    <style>
        .image-container {
            position: relative;
            display: inline-block;
        }

        .image-container img {
            width: 1800px;
            height: 800px;
            z-index: 1;
            margin-left: -19px; /* 수정된 부분: 왼쪽으로 0.5cm 늘림 */
        }

        .image-container .login-container {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 2;
        }

        .image-container .login-wrapper {
            max-width: 400px;
            margin: 0 auto;
        }

        .image-container .container {
            max-width: 100%;
        }

        .login-wrapper h2,
        .login-wrapper input,
        .login-wrapper label,
        .login-wrapper form {
            /* Add your desired styles */
        }
    </style>
</head>
<body>

    <div class="container" style="margin-top:1px">
        <div class="row">
            <%@ include file="common/aside.jspf" %> 
            
            <div class="image-container">
                <img src="/project/img/fall1.jpg" alt="fall">
                <img src="/project/img/book1.png" alt="book1" style="position: absolute; top: 130px; left: 310px; z-index: 1; width: 700px; height: 500px;">

                <div class="login-container">
                    <div class="login-wrapper">
                        <div class="container">
                            <h2>Login <button type="button" class="btn btn-outline-black" onclick="redirectToRegistration()">회원가입</button></h2>
                            <form method="post" action="서버의url" id="login-form">
                                <input type="text" name="userName" placeholder="Email">
                                <input type="password" name="userPassword" placeholder="Password">
                                <label for="remember-check">
                                    <input type="checkbox" id="remember-check">아이디 저장하기
                                </label>
                                <input type="submit" value="Login">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="common/bottom.jspf" %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        function redirectToRegistration() {
            window.location.href = "/sample/user/register";
        }
    </script>
</body>
</html>
