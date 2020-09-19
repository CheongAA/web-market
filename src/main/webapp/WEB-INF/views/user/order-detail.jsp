<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<div class="col-sm-8 py-5 ml-5">
			<h3>주문상세</h3>
			<p>
				주문일:
				<fmt:formatDate value="${order.order_created}" pattern="yyyy/M/dd" />
				주문번호: ${order.order_id}
			</p>

			<div class="row justify-content-center mt-5  p-5 border border-dark">
				<h4 class="mt-3">주문상품</h4>
				<div class="row mb-5 border-top border-bottom w-100 text-center">
					<c:forEach var="orderDetail" items="${order.orderDetail}">
						<div class="row">
							<img alt="" src="${orderDetail.product.product_img}" class="col-3 m-2">
							<p class="col-5 pt-3">
								<a href="${pageContext.request.contextPath}/product/${orderDetail.product.product_id}" class="text-dark">${orderDetail.product.product_name}</a>
								<br />
								<fmt:formatNumber pattern="###,###,###" value="${orderDetail.product_price}" />
								원 / ${orderDetail.product_count}개
							</p>
							<p class="col-3 pt-3">${order.orderState.order_state_title}</p>
						</div>
					</c:forEach>
				</div>
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
				<c:if test="${order.order_state_id eq 1}">
					<button type="button" class="btn btn-danger mx-1" id="cancel_btn" data-toggle="modal" data-target="#cart_modal">주문취소</button>

					<!-- Modal -->
					<div class="modal fade" id="cart_modal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="staticBackdropLabel">주문취소</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<ul class="text-danger">
										<li>주문취소 시 관리자 승인 후 취소 처리됩니다.</li>
									</ul>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
									<a type="button" class="btn btn-danger" href="${pageContext.request.contextPath}/user/order/cancel/${order.order_id}">주문취소</a>
								</div>
							</div>
						</div>
					</div>
				</c:if>
				<c:if test="${order.order_state_id eq 2}">
					<button type="button" class="btn btn-danger mx-1" id="cancel_btn" data-toggle="modal" data-target="#cart_modal">반품신청</button>

					<!-- Modal -->
					<div class="modal fade" id="cart_modal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="staticBackdropLabel">반품신청</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<ul>
										<li class="text-danger">환불은 상품을 받은 날로부터 3일 이내에 신청해주세요.</li>
										<li>신선식품의 경우 재판매가 불가한 상품의 특성상 단순변심, 주문 실수, 개인 기호에 따른 교환 및 반품은 어렵습니다.</li>
										<li>반품하실 제품은 3일 이내에 MARKET 주소로 보내주세요.</li>
										<li>반품은 관리자의 승인 후 환불처리 됩니다.</li>
										<li>상품에 문제가 있는 것이 아닌 경우 배송비는 고객님 부담입니다.</li>
									</ul>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
									<a type="button" class="btn btn-danger" href="${pageContext.request.contextPath}/user/order/return/${order.order_id}">반품신청(준비중)</a>
								</div>
							</div>
						</div>
					</div>

					<button type="button" class="btn btn-warning mx-1" id="change_btn" data-toggle="modal" data-target="#change_modal">교환신청(준비중)</button>

					<!-- Modal -->
					<div class="modal fade" id="change_modal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="staticBackdropLabel">교환신청</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<ul>
										<li class="text-danger">교환은 상품을 받은 날로부터 3일 이내에 신청해주세요.</li>
										<li>신선식품의 경우 재판매가 불가한 상품의 특성상 단순변심, 주문 실수, 개인 기호에 따른 교환 및 반품은 어렵습니다.</li>
										<li>교환하실 제품은 3일 이내에 MARKET 주소로 보내주세요.</li>
										<li>교환제품은 배송 밷으신 제품이 MARKET에 도착하면 출고됩니다.</li>
										<li>상품에 문제가 있는 것이 아닌 경우 배송비는 고객님 부담입니다.</li>
									</ul>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
									<a type="button" class="btn btn-danger" href="${pageContext.request.contextPath}/user/order/change/${order.order_id}">교환신청</a>
								</div>
							</div>
						</div>
					</div>
					<a href="${pageContext.request.contextPath}/user/order/confirm/${order.order_id}" class="btn btn-primary mx-3">주문확정</a>
				</c:if>
				<a class="btn btn-secondary mx-1" href="${pageContext.request.contextPath}/user/order">주문목록</a>
			</div>
		</div>

	</div>
</body>
</html>