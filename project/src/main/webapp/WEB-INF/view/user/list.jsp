<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<%@ include file="../common/head.jspf" %>
	<style>
		th, td	{ text-align: center; }
		.disabled-link	{ pointer-events: none; }
	</style>
	<script>
		function updateFunc(custid) {
			console.log('updateFunc()');
			$.ajax({
				type: 'GET',
				url: '/sample/user/update/' + custid,
				success: function(result) {
					let user = JSON.parse(result);
					$('#custid').val(user.custid);
					$('#uname').val(user.uname);
					$('#nickname').val(user.nickname);
					$('#email').val(user.email);
					$('#updateModal').modal('show');
				}
			});
		}
		function deleteFunc(custid) {
			$('#delcustid').val(custid);
			$('#deleteModal').modal('show');
		}
	</script>
</head>
<body>
	<%@ include file="../common/top.jspf" %>
	<div class="container" style="margin-top:80px">
		<div class="row">
			<%@ include file="../common/aside.jspf" %> 
			<!-- ================ Main =================== -->
			<div class="col-9">
				<h3><strong>사용자 목록</strong></h3>
				<hr>
				<table class="table table-hover">
					<tr>
						<th style="width: 14%">번호</th>
						<th style="width: 15%">custid</th>
						<th style="width: 14%">이름</th>
						<th style="width: 15%">별명</th>
						<th style="width: 14%">이메일</th>
						<th style="width: 14%">가입일</th>
						<th style="width: 14%">액션</th>
					</tr>
				<c:forEach var="user" items="${userList}" varStatus="loop">
					<tr>
						<td>${loop.count}</td>
						<td>${user.custid}</td>
						<td>${user.uname}</td>
						<td>${user.nickname}</td>
						<td>${user.email}</td>
						<td>${user.regDate}</td>
						<td>
							<!-- 본인만이 수정 권한이 있음 -->
							<c:if test="${sesscustid eq user.custid}">
								<a href="javascript:updateFunc('${user.custid}')"><i class="fa-solid fa-user-pen me-2"></i></a>
							</c:if>
							<c:if test="${sesscustid ne user.custid}">
								<a href="#" class="disabled-link"><i class="fa-solid fa-user-pen me-2"></i></a>
							</c:if>
							<!-- 관리자만이 삭제 권한이 있음 -->
							<c:if test="${sesscustid eq 'admin'}">
								<a href="javascript:deleteFunc('${user.custid}')"><i class="fa-solid fa-user-minus"></i></a>
							</c:if>
							<c:if test="${sesscustid ne 'admin'}">
								<a href="#" class="disabled-link"><i class="fa-solid fa-user-minus"></i></a>
							</c:if>
						</td>
					</tr>
				</c:forEach>	
				</table>
				<ul class="pagination mt-3 justify-content-center">
				<c:forEach var="page" items="${pageList}">
					<li class="page-item ${(currentUserPage eq page) ? 'active' : ''}">
						<a class="page-link" href="/sample/user/list/${page}">${page}</a>
					</li>
				</c:forEach>
				</ul>				
			</div>
			<input type="hidden" id="delcustid">
			<!-- ================ Main =================== -->
		</div>
	</div>
	<%@ include file="../common/bottom.jspf" %>
	<div class="modal" id="updateModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">사용자 수정</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form action="/sample/user/update" method="post">
                        <table class="table table-borderless">
                            <tr>
                                <td style="width:35%"><label class="col-form-label">사용자 ID</label></td>
                                <td style="width:65%"><input type="text" id="custid" class="form-control" disabled></td>
                            </tr>
                            <tr>
                                <td><label class="col-form-label">패스워드</label></td>
                                <td><input type="password" name="pwd" class="form-control"></td>
                            </tr>
                            <tr>
                                <td><label class="col-form-label">패스워드 확인</label></td>
                                <td><input type="password" name="pwd2" class="form-control"></td>
                            </tr>
                            <tr>
                                <td><label class="col-form-label">이름</label></td>
                                <td><input type="text" name="uname" id="uname" class="form-control"></td>
                            </tr>
                            <tr>
                                <td><label class="col-form-label">별명</label></td>
                                <td><input type="text" name="nickname" id="nickname" class="form-control"></td>
                            </tr>
                            <tr>
                                <td><label class="col-form-label">이메일</label></td>
                                <td><input type="text" name="email" id="email" class="form-control"></td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: center;">
                                    <input class="btn btn-pink" type="submit" value="수정">
                                    <input class="btn btn-pink ms-1" type="reset" value="취소">
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="modal" id="deleteModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">사용자 삭제</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <strong>삭제하시겠습니까?</strong>
                    <div class="text-center mt-5">
                        <button class="btn btn-danger" onclick="location.href='/sample/user/delete/'+$('#delcustid').val()">삭제</button>
                        <button class="btn btn-secondary ms-1" data-bs-dismiss="modal">취소</button>
                    </div>
                </div>
            </div>
        </div>
    </div>	
</body>
</html>