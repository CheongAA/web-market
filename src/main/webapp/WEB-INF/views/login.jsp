<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- custom CSS -->
<link href="/resources/css/login.css" rel="stylesheet">
<title>로그인</title>
</head>
<body>
	<form action="/login" method="post" class="form-signin pt-5 mt-5">
		<div class="text-center mb-4">
			<h1 class="h3 mb-3 font-weight-normal">MARKET</h1>
		</div>

		<div class="form-label-group">
			<input type="text" name="user_identification" id="inputId"
				class="form-control" placeholder="Id" value="${cookie.id.value}"
				autocomplete="new-password" required autofocus> <label
				for="inputId">Id</label>
		</div>

		<div class="form-label-group">
			<input type="password" name="user_password" id="inputPassword"
				class="form-control" placeholder="Password"
				autocomplete="new-password" required> <label
				for="inputPassword">Password</label>
		</div>
		<c:if test="${msg == false}">
			<p class="text-danger">아이디와 비밀번호를 확인해주세요.</p>
		</c:if>
		<div class="checkbox mb-3">
			<label> <input type="checkbox" value="1" name="rememberId" id="rememberId">
			<input type="hidden" value="0" name="rememberId">
				아이디 저장 
				<c:if test="${not empty cookie.id}">
					<script>
						$("#rememberId").prop("checked",true);
					</script>
				</c:if>
			</label>
		</div>
		<button class="btn btn-lg btn-dark btn-block" type="submit">로그인</button>
		<a class="btn btn-lg btn-dark btn-block"
			href="${pageContext.request.contextPath}/signup">회원가입</a>
	</form>
</body>
</html>