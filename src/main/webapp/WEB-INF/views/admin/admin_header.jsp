<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<nav class="row nav bg-secondary py-3 ">
		<div class="col btn-group border-right justify-content-md-center">
			<a type="button" class="h5 text-white font-weight-bold align-self-center" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 주문 </a>
			<div class="dropdown-menu ">
				<a class=" dropdown-item p-2 text-center text-muted text-decoration-none" href="${pageContext.request.contextPath}/admin/order">주문관리</a>
			</div>
		</div>
		<div class="col btn-group border-right justify-content-md-center">
			<a type="button" class="h5 text-white font-weight-bold align-self-center" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 상품 </a>
			<div class="dropdown-menu ">

				<a class=" dropdown-item p-2 text-center text-muted text-decoration-none" href="${pageContext.request.contextPath}/admin/product/add">상품등록</a>
				<a class=" dropdown-item p-2 text-center text-muted text-decoration-none" href="${pageContext.request.contextPath}/admin/product/">상품관리</a>
				<hr />
				<a class=" dropdown-item p-2 text-center text-muted text-decoration-none" href="${pageContext.request.contextPath}/admin/category">카테고리 관리</a>
			</div>
		</div>
		<div class="col btn-group border-right justify-content-md-center">
			<a type="button" class="h5 text-white font-weight-bold align-self-center" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 브랜드 </a>
			<div class="dropdown-menu ">
				<a class=" dropdown-item p-2 text-center text-muted text-decoration-none" href="${pageContext.request.contextPath}/admin/brand/add">브랜드 등록</a>
				<a class=" dropdown-item p-2 text-center text-muted text-decoration-none" href="${pageContext.request.contextPath}/admin/brand/">브랜드 관리</a>
			</div>
		</div>
		<div class="col btn-group border-right justify-content-md-center">
			<a type="button" class="h5 text-white font-weight-bold align-self-center" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 문의 </a>
			<div class="dropdown-menu ">
				<a class=" dropdown-item p-2 text-center text-muted text-decoration-none" href="${pageContext.request.contextPath}/admin/question">문의관리</a>
				<hr />
				<a class=" dropdown-item p-2 text-center text-muted text-decoration-none" href="${pageContext.request.contextPath}/admin/faq/">FAQ관리</a>
			</div>
		</div>
		<div class="col btn-group border-right justify-content-md-center">
			<a type="button" class="h5 text-white font-weight-bold align-self-center" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 공지/이벤트</a>
			<div class="dropdown-menu ">
				<a class=" dropdown-item p-2 text-center text-muted text-decoration-none" href="${pageContext.request.contextPath}/admin/notice/add">공지등록</a>
				<a class=" dropdown-item p-2 text-center text-muted text-decoration-none" href="${pageContext.request.contextPath}/admin/notice/">공지관리</a>
				<hr />
				<a class=" dropdown-item p-2 text-center text-muted text-decoration-none" href="${pageContext.request.contextPath}/admin/discount/add">이벤트등록</a>
				<a class=" dropdown-item p-2 text-center text-muted text-decoration-none" href="${pageContext.request.contextPath}/admin/discount">이벤트관리</a>
			</div>
		</div>
		<div class="col btn-group border-right justify-content-md-center">
			<a type="button" class="h5 text-white font-weight-bold align-self-center" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 고객 / 후기 </a>
			<div class="dropdown-menu ">
				<a class=" dropdown-item p-2 text-center text-muted text-decoration-none" href="${pageContext.request.contextPath}/admin/user">고객조회</a>
				<hr />
				<a class=" dropdown-item p-2 text-center text-muted text-decoration-none" href="${pageContext.request.contextPath}/admin/review">후기관리</a>
			</div>
		</div>
	</nav>
</body>
</html>