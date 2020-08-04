<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- custom CSS -->
<title>장바구니</title>
</head>
<body>
	<div class="m-5">
		<div class="row text-center mb-5">
			<h2 class="w-100">장바구니</h2>
			<p class="w-100 text-muted">주문하실 상품명 및 수량을 정확하게 확인해 주세요.</p>
		</div>
		<form action="/order" method="post">
			<table class="table text-center">
				<thead>
					<tr>
						<th><input type="checkbox" />전체선택</th>
						<th class="w-50">상품정보</th>
						<th>수량</th>
						<th>금액</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty products}">
							<tr>
								<td colspan="4" rowspan="4">
									<h6 class="py-5 my-5 font-weight-bold">장바구니에 담긴 상품이 없습니다.</h6>
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="product" items="${products}">
								<tr>
									<td><input type="checkbox" /></td>
									<td>
										<div>
											[${product.brand.brand_name}] ${product.product_name} ${product.product_price }
										</div>
									</td>
									<td>수정해야됨</td>
									<td class="product_total_price"></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<hr />
			<div class="row my-5">
				<button type="button" class="btn btn-outline-secondary p-3"
					id="cart_btn">선택 삭제</button>
				<button type="button" class="btn btn-outline-secondary p-3"
					id="buy_btn">품절 상품 삭제</button>
			</div>
			<div class="row my-5 py-5 mx-auto ">
				<div class="col-sm-2 border border-secondary text-center p-5">
					<p class="text-muted">상품금액</p>
					<h5 class="m-3 font-weight-bold">2222</h5>
				</div>
				<h1 class="col m-5 font-weight-bold text-muted text-center">-</h1>
				<div class="col-sm-2 border border-secondary text-center p-5">
					<p class="text-muted">상품할인금액</p>
					<h5 class="m-3 font-weight-bold">2222</h5>
				</div>
				<h1 class="col m-5 font-weight-bold text-muted text-center">+</h1>
				<div class="col-sm-2 border border-secondary text-center p-5">
					<p class="text-muted">배송비</p>
					<h5 class="m-3 font-weight-bold">2222</h5>
				</div>
				<h1 class="col m-5 font-weight-bold text-muted text-center">=</h1>
				<div class="col-sm-2 border border-secondary text-center p-5">
					<p class="text-muted">결제예정금액</p>
					<h5 class="m-3 font-weight-bold">2222</h5>
				</div>
			</div>
			<div class="row w-100 mt-3">
				<button type="button"
					class="btn btn-secondary btn-lg py-3 px-5 mx-auto" id="cart_btn">주문하기</button>
			</div>
		</form>
	</div>
</body>
</html>