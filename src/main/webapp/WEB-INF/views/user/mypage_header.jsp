<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="col-lg-2 pt-5">
	<nav class="navbar navbar-expand-lg navbar-light bg-light text-center">
		<button class=navbar-toggler " type="button" data-toggle="collapse"
			data-target="#navbarTogglerDemo03"
			aria-controls="navbarTogglerDemo03" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarTogglerDemo03">
			<ul class="nav flex-column">
				<li class="nav-item"><h5>나의 주문</h5></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/user/order">주문조회</a></li>
				<li class="nav-item mb-5"><a class="nav-link"
					href="${pageContext.request.contextPath}/user/canceledOrder">취소/반품/교환</a></li>
				<li class="nav-item"><h5>나의 정보</h5></li>
				<li class="nav-item mb-5"><a class="nav-link"
					href="${pageContext.request.contextPath}/user/check">정보수정</a></li>
				<li class="nav-item"><h5>나의 후기</h5></li>
				<li class="nav-item mb-5"><a class="nav-link"
					href="${pageContext.request.contextPath}/user/reviewable">후기등록
						및 조회</a></li>
				<li class="nav-item"><h5>나의 문의</h5></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/user/question">문의 조회</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/user/question/add">1:1
						문의등록</a></li>
			</ul>
		</div>
	</nav>
	</div>
</body>
</html>