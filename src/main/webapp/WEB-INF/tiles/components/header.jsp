<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<header class="py-3">
	<div class="row justify-content-between">
		<div class="col-auto mr-auto"></div>
		<div class="col-auto">
			<nav class="nav d-flex">
				<c:if test="${user == null}">
					<a class="p-2 text-muted border-right" href="${pageContext.request.contextPath}/login">로그인</a>
					<a class="p-2 text-muted border-right" href="${pageContext.request.contextPath}/signup">회원가입</a>
				</c:if>
				<c:if test="${user.user_level == 1}">
					<a class="p-2 text-muted border-right" href="${pageContext.request.contextPath}/admin/order">관리자 화면</a>
					<a class="p-2 text-muted border-right" href="${pageContext.request.contextPath}/logout">로그아웃</a>
				</c:if>
				<c:if test="${user.user_level == 0}">
					<a class="p-2 text-muted border-right" href="${pageContext.request.contextPath}/user/order">마이페이지</a>
					<a class="p-2 text-muted border-right" href="${pageContext.request.contextPath}/logout">로그아웃</a>
				</c:if>
				<a class="p-2 text-muted border-right" href="${pageContext.request.contextPath}/brand">브랜드</a>
				<div class="btn-group">
					<a type="button" class="p-2 text-muted " data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						고객센터 <i class="fas fa-caret-down"></i>
					</a>
					<div class="dropdown-menu">
						<a class="dropdown-item p-3 text-muted" href="${pageContext.request.contextPath}/notice">공지사항</a>
						<a class="dropdown-item p-3 text-muted" href="${pageContext.request.contextPath}/faq">자주하는 질문</a>
						<a class="dropdown-item p-3 text-muted" href="${pageContext.request.contextPath}/user/question">1:1 문의</a>
					</div>
				</div>
			</nav>
		</div>
	</div>
	<div class="row py-3">
		<div class="col text-center">
			<a class="market-color display-3 font-weight-bold text-decoration-none" href="/">MARKET </a>
		</div>
	</div>
	<nav class="navbar navbar-expand-lg navbar-light">
		<button class="navbar-toggler ml-auto" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse justify-content-center" id="navbarNavAltMarkup">
			<ul class="navbar-nav h4">
				<li class="nav-item dropdown mx-2"><a class="nav-link dropdown-toggle font-weight-bold" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<i class="fas fa-align-justify"></i> 전체 카테고리
					</a>
					<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink" id="header_category"></div></li>
				<li class="nav-item mx-2"><a class="nav-link text-muted font-weight-bold align-self-center text-nowrap ${activeNew}" href="${pageContext.request.contextPath}/products/new">신상품</a></li>
				<li class="nav-item mx-2"><a class="nav-link text-muted font-weight-bold align-self-center text-nowrap ${activeBest}" href="${pageContext.request.contextPath}/products/best">베스트</a></li>
				<li class="nav-item mx-2"><a class="nav-link text-muted font-weight-bold align-self-center text-nowrap ${activeDiscount}" href="${pageContext.request.contextPath}/products/discount">알뜰쇼핑</a></li>
				<li class="nav-item mx-2"><a class="nav-link text-muted font-weight-bold align-self-center text-nowrap ${activeEvent}" href="${pageContext.request.contextPath}/discount/">이벤트</a></li>
				<li class="nav-item mx-2 text-nowrap">
					<form class="form-inline my-lg-0" action="${pageContext.request.contextPath}/product/search" method="get">
						<input class="form-control mr-sm-2 main-header-input" type="text" name="term">
						<button class="btn my-2 my-sm-0" type="submit">
							<i class="fa fa-search h5 text-muted font-weight-bold" aria-hidden="true"></i>
						</button>
					</form>
				</li>
				<li class="nav-item mx-2"><a class="nav-link h3 text-muted font-weight-bold align-self-center text-decoration-none" href="${pageContext.request.contextPath}/carts">
						<i class="fas fa-shopping-cart"></i>
						<c:if test="${carts != null}">
							<span class="badge badge-pill badge-secondary font-weight-light">${fn:length(carts)}</span>
						</c:if>
					</a></li>
			</ul>
		</div>
	</nav>
</header>