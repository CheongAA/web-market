<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<header class="py-3">
	<div class="row justify-content-between">
		<div class="col-auto mr-auto">
			<a class="p-2 text-muted" href="#">택배배송</a>
		</div>
		<div class="col-auto">
			<nav class="nav d-flex">
				<c:if test="${user == null}">
					<a class="p-2 text-muted border-right" href="/login">로그인</a>
					<a class="p-2 text-muted border-right" href="/signup">회원가입</a>
				</c:if>
				<c:if test="${user.user_level == 1}">
					<a class="p-2 text-muted border-right" href="/admin/">관리자 화면</a>
					<a class="p-2 text-muted border-right" href="/logout">로그아웃</a>
				</c:if>
				<c:if test="${user.user_level == 0}">
					<a class="p-2 text-muted border-right" href="/user">마이페이지</a>
					<a class="p-2 text-muted border-right" href="/logout">로그아웃</a>
				</c:if>

				<div class="btn-group">
					<a type="button" class="p-2 text-muted" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> 고객센터 <i
						class="fas fa-caret-down"></i>
					</a>
					<div class="dropdown-menu">
						<a class="dropdown-item p-3 text-muted" href="/notice">공지사항</a> <a
							class="dropdown-item p-3 text-muted" href="/logout">자주하는 질문</a> <a
							class="dropdown-item p-3 text-muted" href="/logout">1:1 문의</a>
					</div>
				</div>
			</nav>
		</div>
	</div>
	<div class="row py-3">
		<div class="col text-center">
			<a
				class="market-color display-3 font-weight-bold text-decoration-none"
				href="/">MARKET </a>
		</div>
	</div>
	<nav class="row text-center h5">
		<div class="btn-group border-right">
			<a type="button"
				class="col text-muted font-weight-bold align-self-center"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<i class="fas fa-align-justify"></i> 전체 카테고리
			</a>
			<div class="dropdown-menu dropdown-menu-right">
				<a
					class=" dropdown-item p-2 text-center text-muted text-decoration-none"
					href="/products/100">국물요리</a> <a
					class=" dropdown-item p-2 text-center text-muted text-decoration-none"
					href="/products/200">반찬</a> <a
					class=" dropdown-item p-2 text-center text-muted text-decoration-none"
					href="/products/300">샐러드</a> <a
					class=" dropdown-item p-2 text-center text-muted text-decoration-none"
					href="/products/400">간편식</a> <a
					class=" dropdown-item p-2 text-center text-muted text-decoration-none"
					href="/products/500">음료</a>
			</div>
		</div>
		<a
			class="col text-muted font-weight-bold align-self-center border-right ${activeNew}"
			href="/products/new">신상품</a> <a
			class="col text-muted font-weight-bold align-self-center border-right ${activeBest}"
			href="/products/best">베스트</a> <a
			class="col text-muted font-weight-bold align-self-center border-right ${activeDiscount}"
			href="/products/discount">알뜰쇼핑</a> <a
			class="col text-muted font-weight-bold align-self-center ${activeEvent}"
			href="/notice">이벤트</a>
		<form class="form-inline my-lg-0 main-header-input-box">
			<input class="form-control mr-sm-2 main-header-input" type="search"
				placeholder="" aria-label="Search">
			<button class="btn my-2 my-sm-0" type="submit">
				<i class="fa fa-search h5 text-muted font-weight-bold"
					aria-hidden="true"></i>
			</button>
		</form>
		<a class="col h3 text-muted font-weight-bold align-self-center text-decoration-none"
			href="/carts"><i class="fas fa-shopping-cart"></i> <c:if
				test="${carts != null}">
				<span class="badge badge-pill badge-secondary font-weight-light">${fn:length(carts)}</span>
			</c:if> </a>
	</nav>
</header>