<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지</title>
</head>
<body>
	<div class="row">
		<jsp:include page="mypage_header.jsp" flush="false" />
		<div class="col py-5 ml-5">
			<h3>주문상세</h3>
			<p>
				주문일:
				<fmt:formatDate value="${order.order_created}" pattern="yyyy/M/dd" />
				주문번호: ${order.order_id}
			</p>

			<div class="row justify-content-center mt-5  p-5 border border-dark">
				<h4 class="mt-3">주문상품</h4>
				<c:forEach var="orderDetail" items="${order.orderDetail}">
					<div class="row m-5 p-3 border-top border-bottom w-100">
						<img alt="" src="${orderDetail.product.product_thumbnailImg}"
							class="col-sm-3">
						<div class="col-sm-5">

							<p>
								<a
									href="${pageContext.request.contextPath}/product/${orderDetail.product.product_id}"
									class="text-dark">${orderDetail.product.product_name}</a>
							</p>
							<p>
								<fmt:formatNumber pattern="###,###,###"
									value="${orderDetail.product.product_price}" />
								원 / ${orderDetail.product_count}개
							</p>
						</div>
					</div>
				</c:forEach>
				<h4>받는사람 정보</h4>
				<div class="row mb-5 border-top border-bottom w-100">
					<table class="table table-borderless">
						<thead>
							<tr class="border-bottom">
								<th scope="col">받는사람</th>
								<th scope="col">연락처</th>
								<th scope="col">받는주소</th>
								<th scope="col">배송요청사항</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>${order.recipient_name}</td>
								<td>${order.recipient_phone}</td>
								<td>${order.recipient_address}</td>
								<td>${order.order_request}</td>
							</tr>
						</tbody>
					</table>
				</div>
				<h4>결제정보</h4>
				<div class="row mb-5 border-top border-bottom w-100">
					<table class="table table-borderless">
						<thead>
							<tr class="border-bottom">
								<th scope="col">결제수단</th>
								<th scope="col">총 상품 가격</th>
								<th scope="col">할인가격</th>
								<th scope="col">배송비</th>
								<th scope="col">총 결제 가격</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>${order.order_payment_method}</td>
								<td>${order.order_products_price}</td>
								<td>${order.order_discount_price}</td>
								<td>${order.order_delivery_price}</td>
								<td>${order.order_total_price}</td>
							</tr>
						</tbody>
					</table>
				</div>
				<a class="btn btn-danger mx-1"
					href="${pageContext.request.contextPath}/user/order">주문취소</a> <a
					class="btn btn-primary mx-1"
					href="${pageContext.request.contextPath}/user/order">주문목록</a>
			</div>
		</div>

	</div>
</body>
</html>