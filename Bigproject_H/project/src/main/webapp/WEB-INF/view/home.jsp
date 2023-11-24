<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="common/head.jspf" %>
    <link href="/project/css/login.css" rel="stylesheet">
    <html lang="en">
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script> 
<body>
</head>

<body style="background: linear-gradient(to right, #FFD3E5, #FF88B9);">
    <%@ include file="common/top.jspf" %>
    <div class="container" style="margin-top:80px">
        <div class="row">
            <%@ include file="common/aside.jspf" %> 
            <!-- ================ 내가 작성할 부분 =================== -->
            <div class="container" style="margin-top: 250px;">
                <div class="login-wrapper">
                    <h2>Login <button type="button" class="btn btn-outline-#8A2BE2">회원가입</button></h2>
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
            <!-- ================ 내가 작성할 부분 =================== -->
        </div>
    </div>
    <%@ include file="common/bottom.jspf" %>
</body>
</html>
