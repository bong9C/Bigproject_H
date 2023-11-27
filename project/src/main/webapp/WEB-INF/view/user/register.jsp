<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="/project/css/register.css" rel="stylesheet">
    <title>회원가입 Page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="styles.css"> 
</head>
<body>
    <div class="container" style="margin-top: 1px">
        <div class="row">
            <div class="image-container" style="position: relative;">
                <!-- Background Image -->
                <img src="/project/img/CCC.jpg" alt="CCC" class="background-image">
                <img src="/project/img/book1.png" alt="book1" style="position: absolute; top: 100px; left: 190px; width: 1000px; height: 800px; z-index: 1;">
                <!-- Signup Form -->
                <div class="register-container" style="width: 350px; margin-top: 500px; padding: 40px; box-sizing: border-box; position: absolute; top: 50%; left: 39%; transform: translate(-50%, -50%); z-index: 2;">
                    <img src="/project/img/HH.png" alt="HH" style="width: 350px; margin-top: 500px; padding: 40px; box-sizing: border-box; position: absolute; top: -35%; left: 150%; transform: translate(-50%, -50%); z-index: 2;">> 
                    <div class="register-wrapper">
                        <div class="container">
                            <h2>회원가입</h2>
                            <form method="post" action="/project/user/register" id="signup-form">
                                <input type="text" name="uid" placeholder="ID">
                                <input type="text" name="pwd" placeholder="비밀번호">
                                <input type="text" name="pwd2" placeholder="비밀번호 확인">
                                <input type="text" name="uname" placeholder="이름">
                                <input type="text" name="nickname" placeholder="별명">
                                <input type="text" name="email" placeholder="Email">
                                <input type="submit" value="가입하기">
                            </form>
                        </div>
                    </div>
                </div>
                
                <!-- Include Login Form -->
              
            </div>
        </div>
    </div>
    <%@ include file="../common/bottom.jspf" %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
