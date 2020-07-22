<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<html>
<head>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<tiles:insertAttribute name="header" />
		</div>
		<div class="row content">
			<main role="main" class="col">
				<hr/>
				<div class="row text-center p-3">
					<div class="col-sm-2 py-3">
						<h3>김청아님</h3>
					</div>
					<div class="col">
						<h3>배송전</h3>
						<h5>0</h5>
					</div>
					<div class="col">
						<h3>배송중</h3>
						<h5>0</h5>
					</div>
					<div class="col">
						<h3>적립금</h3>
						<h5>0원</h5>
					</div>
					<div class="col">
						<h3>쿠폰</h3>
						<h5>2</h5>
					</div>
				</div>
				<hr/>
				<div class="row m-4 ">
					<div class="col-sm-2 px-0 text-center">
						<hr />
						<h5>MY 쇼핑</h5>
						<p class="m-0">
							<a class="" href="/mypage/order">주문목록/배송조회</a>
						</p>
						<p>
							<a>취소/반품/교환/환불내역</a>
						</p>
						<hr />
						<h5>MY 혜택</h5>
						<p class="m-0">
							<a>할인쿠폰</a>
						</p>
						<p>
							<a>적립금</a>
						</p>
						<hr />
						<h5>MY 활동</h5>
						<p class="m-0">
							<a>문의하기</a>
						</p>
						<p class="m-0">
							<a>문의내역 확인</a>
						</p>
						<p class="m-0">
							<a>구매후기</a>
						</p>
						<p>
							<a>장바구니 리스트</a>
						</p>
						<hr />
						<h5>MY 정보</h5>
						<p class="m-0">
							<a>개인정보확인</a>/수정
						</p>
						<p class="m-0">
							<a>배송지 관리</a>
						</p>
						<p class="m-0">
							<a>고객의 소리</a>
						</p>
						<p>
							<a>사이트문의</a>
						</p>
						<hr />
					</div>
					<div class="col-sm-9 pt-3">
						<tiles:insertAttribute name="mypage-content" />
					</div>
				</div>
			</main>
		</div>
		<div class="row">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
</body>
</html>