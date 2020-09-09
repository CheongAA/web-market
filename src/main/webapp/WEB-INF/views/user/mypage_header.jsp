<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div
		class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse mt-5">
		<div class="sidebar-sticky pt-3">
			<h5
				class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
				나의 쇼핑</h5>
			<ul class="nav flex-column">
				<li class="nav-item"><a class="nav-link active"
					href="${pageContext.request.contextPath}/user/order"> 주문조회 </a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/user/canceledOrder">
						취소/반품/교환 주문조회 </a></li>
			</ul>
			<h5
				class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
				나의 정보</h5>
			<ul class="nav flex-column">
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/user/check"> 정보수정 </a></li>
			</ul>
			<h5
				class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
				나의 후기</h5>
			<ul class="nav flex-column">
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/user/reviewable"> 후기등록 및 조회
				</a></li>
			</ul>
			<h5
				class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
				나의 문의</h5>
			<ul class="nav flex-column">
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/user/question"> 문의조회 </a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/user/question/add">
						1:1 문의등록 </a></li>
			</ul>
		</div>
	</div>

</body>
</html>