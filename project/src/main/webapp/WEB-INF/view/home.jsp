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
</head>
<body style="background: linear-gradient(to right, #DEB887, #FFDEAD);">
    <%@ include file="common/top.jspf" %>
    <div class="container" style="margin-top:1px">
        <div class="row">
            <%@ include file="common/aside.jspf" %> 
            <img src="/project/img/book1.png" alt="book1" style="float: left;">
            <!-- ================ 내가 작성할 부분 =================== -->         
            <style>
                .login-container {
                    position: relative;
                }

                .login-wrapper {
                    max-width: 400px; /* 원하는 최대 폭 설정 */
                    margin: 0 auto; /* 가운데 정렬을 위한 마진 설정 */
                    position: absolute;
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%);
                }

                .container {
                    max-width: 100%; /* 부모 요소의 최대 폭을 100%로 설정 */
                }

                /* 기존 로그인 폼 스타일 유지 */
                .login-wrapper h2,
                .login-wrapper input,
                .login-wrapper label,
                .login-wrapper form {
                    /* 원하는 스타일 설정 */
                }
            </style>
            <div class="login-container">
                <div class="login-wrapper">
                    <div class="container" style="margin-top: -500px;">
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
            <!-- ================ 내가 작성할 부분 =================== -->
        </div>
    </div>
    <%@ include file="common/bottom.jspf" %>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- JavaScript 코드 추가 -->
    <script>
        function redirectToRegistration() {
            window.location.href = "/sample/user/register"; // 사용자 등록 페이지로 이동
        }
    </script>
</body>
</html>
