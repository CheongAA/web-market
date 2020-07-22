<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<header class="py-3">
		<div class="row justify-content-between">
			<div class="col-auto mr-auto">
				<a class="p-2 text-muted" href="#">택배배송</a>
			</div>
			<div class="col-auto">
				<nav class="nav d-flex">
					<c:if test="${user == null}">
						<a class="p-2 text-muted" href="/login">로그인</a> 
						<a class="p-2 text-muted" href="/signup">회원가입</a>
					</c:if>
					<c:if test="${user.user_level == 1}">
						<a class="p-2 text-muted" href="/admin/">관리자 화면</a>
					</c:if>
					<c:if test="${user != null}">
						<a class="p-2 text-muted " href="/mypage/order">마이페이지</a> 
						<a class="p-2 text-muted" href="/logout">로그아웃</a>
					</c:if>
				</nav>
			</div>
		</div>
		<div class="row py-3">
			<div class="col text-center">
				<a class="market-color display-3 font-weight-bold text-decoration-none"
					href="/">MARKET </a>
			</div>
		</div>
		<nav class="row nav text-center">
			<div class="btn-group border-right">
				<a type="button"
					class="col h5 text-muted font-weight-bold align-self-center"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-align-justify"></i> 전체 카테고리
				</a>
				<div class="dropdown-menu dropdown-menu-right">
					<a
						class=" dropdown-item p-2 text-center text-muted text-decoration-none"
						href="/products/1">국물요리</a> <a
						class=" dropdown-item p-2 text-center text-muted text-decoration-none"
						href="/products/2">밑반찬</a> <a
						class=" dropdown-item p-2 text-center text-muted text-decoration-none"
						href="/products/3">샐러드</a> <a
						class=" dropdown-item p-2 text-center text-muted text-decoration-none"
						href="/products/4">간편식</a> <a
						class=" dropdown-item p-2 text-center text-muted text-decoration-none"
						href="/products/5">메인요리</a>
				</div>
			</div>
			<a
				class="col h5 text-muted font-weight-bold align-self-center border-right"
				href="#">신상품</a> <a
				class="col h5 text-muted font-weight-bold align-self-center border-right"
				href="#">베스트</a> <a
				class="col h5 text-muted font-weight-bold align-self-center border-right"
				href="#">알뜰쇼핑</a> <a
				class="col h5 text-muted font-weight-bold align-self-center border-right"
				href="#">이벤트</a>
			<form class="form-inline my-lg-0 main-header-input-box">
				<input class="form-control mr-sm-2 main-header-input" type="search"
					placeholder="" aria-label="Search">
				<button class="btn my-2 my-sm-0" type="submit">
					<i class="fa fa-search h5 text-muted font-weight-bold"
						aria-hidden="true"></i>
				</button>
			</form>
			<a class="col h3 text-muted font-weight-bold align-self-center"
				href="#"><i class="fas fa-shopping-cart"></i></a>
		</nav>
	</header>
</body>
</html>