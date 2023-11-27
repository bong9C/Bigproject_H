<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../common/head.jspf" %>
    <style>
        th, td { text-align: center; }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
        <div class="container-fluid">
            <img src="/sample/img/ck-logo.png" height="60" class="rounded-3 mx-2">
            <div class="p-2 bg-dark justify-content-center rounded">
                <img src="https://picsum.photos/1500/200" width="100%">
            </div>
        </div>
    </nav>

    <div class="container" style="margin-top: 250px;">
        <div class="row">
            <div class="col-4"></div>
            <div class="col-4">
                <h3><strong>사용자 등록</strong></h3>
                <hr>
                <form action="/sample/user/register" method="post">
                    <table class="table table-borderless">
                        <tr>
                            <td style="width:35%;"><label class="col-form-label">사용자 ID</label></td>
                            <td style="width:65%;"><input type="text" name="uid" class="form-control"></td>
                        </tr>
                        <!-- (이하 생략) -->
                    </table>
                </form>
            </div>
            <div class="col-4"></div>
        </div>
    </div>

    <%@ include file="../common/bottom.jspf" %>

    <!-- JavaScript 코드 추가 -->
    <script>
        function redirectToLogin() {
            window.location.href = "/project/login.jsp"; // 로그인 페이지로 이동
        }
    </script>
</body>
</html>
