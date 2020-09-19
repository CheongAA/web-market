<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>관리자:: 주문</title>
</head>
<body>
	<jsp:include page="../admin_header.jsp" flush="false" />
	<div class="row mt-5 p-5 border border-dark">
		<h3 class="w-100 mb-3 text-center">주문상세</h3>
		<p class="ml-auto">
			주문일:
			<fmt:formatDate value="${order.order_created}" pattern="yyyy/M/dd" />
			- 주문번호:
			<span id="orderId">${order.order_id}</span>
		</p>
		<div class="row justify-content-center">
			<div class="row m-1 p-1 border-top border-bottom w-100">
				<div class="col m-2">
					<table class="table table-borderless">
						<thead>
							<tr class="border-bottom">
								<th scope="col">상품번호</th>
								<th scope="col">상품명</th>
								<th scope="col">상품가격</th>
								<th scope="col">주문수량</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="orderDetail" items="${order.orderDetail}">
								<tr>
									<td>${orderDetail.product.product_id}</td>
									<td>
										<a href="${pageContext.request.contextPath}/admin/product/${orderDetail.product.product_id}" class="text-dark">${orderDetail.product.product_name}</a>
									</td>
									<td>
										<fmt:formatNumber pattern="###,###,###" value="${orderDetail.product_price}" />
									</td>
									<td>${orderDetail.product_count}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<h4 class="mt-5">받는사람 정보</h4>
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
			<h4 class="mt-5">결제정보</h4>
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
			<div class="row my-5  w-100 ">
				<table class="table table-borderless text-center">
					<tbody>
						<tr>
							<th scope="col">등록된 운송장</th>
							<td scope="col">
								<c:choose>
									<c:when test="${order.order_tracking_number == null}">
									등록된 운송장 번호가 없습니다.
									</c:when>
									<c:otherwise>
										${order.order_tracking_number}
									</c:otherwise>
								</c:choose>
							</td>

							<th scope="col">주문상태</th>
							<td scope="col">${order.orderState.order_state_title }</td>
						</tr>
						<tr>
							<th scope="col">운송장번호</th>
							<td scope="col">
								<input id="tracking" type="text" placeholder="운송장 번호" />
								<button class="btn btn-outline-primary btn-sm" id="tracking_btn">등록</button>
								<small class="text-danger d-block">운송장 등록 후 꼭 주문상태를 변경해주세요!</small>
							</td>

							<th scope="col">주문상태변경</th>
							<td scope="col">
								<select id="orderState">
									<c:forEach var="orderState" items="${orderStates }">
										<option value="${orderState.order_state_id }">${orderState.order_state_title }</option>
									</c:forEach>
								</select>
								<button class="btn btn-outline-primary btn-sm" id="updateOrder_btn">등록</button>
							</td>
						</tr>
						<tr>

						</tr>
					</tbody>
				</table>
			</div>
			<a class="btn btn-primary mx-1" href="${pageContext.request.contextPath}/admin/order">주문목록</a>
		</div>
	</div>
	<script type="text/javascript">
		$("#tracking_btn").click(function() {
			var orderId = $("#orderId").text();
			var trackingNum = parseInt($("#tracking").val());

			$.ajax({
				url : "/admin/order/updateTracking",
				type : "get",
				data : {
					orderId : orderId,
					orderTrackingNumber : trackingNum

				},
				success : function(data) {
					alert("운송장 번호가 등록되었습니다.");
					window.location.reload(true);
				}
			});
		});

		$("#updateOrder_btn").click(function() {
			var orderId = $("#orderId").text();
			var orderStateId = $("#orderState option:selected").val();

			$.ajax({
				url : "/admin/order/updateState",
				type : "get",
				data : {
					orderId : orderId,
					orderStateId : orderStateId

				},
				success : function(data) {
					alert("주문 상태가 변경되었습니다.");
					window.location.reload(true);
				}
			});
		});
	</script>
</body>
</html>