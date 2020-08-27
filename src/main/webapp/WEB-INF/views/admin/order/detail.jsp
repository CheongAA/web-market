<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			- 주문번호: ${order.order_id}
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
									<td><a
										href="${pageContext.request.contextPath}/admin/product/${orderDetail.product.product_id}"
										class="text-dark">${orderDetail.product.product_name}</a></td>
									<td><c:choose>
											<c:when test="${orderDetail.product.discount_id != 0}">
												<c:set var="price"
													value="${orderDetail.product.product_price - ((orderDetail.product.product_price * orderDetail.product.discount.discount_rate)/100)}" />
												<span style="text-decoration: line-through">${orderDetail.product.product_price}</span>
												<span> <fmt:formatNumber pattern="0" value="${price}" />
												</span>
											</c:when>
											<c:otherwise>
												<fmt:formatNumber pattern="###,###,###"
													value="${orderDetail.product.product_price}" />
											</c:otherwise>
										</c:choose></td>
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
							<th scope="col">운송장번호</th>
							<td scope="col"><input value="" type="number"
								placeholder="운송장 번호" />
								<button class="btn btn-outline-primary btn-sm">등록</button></td>

							<th scope="col">주문상태변경</th>
							<td scope="col"><select name="job">
									<option value="취소신청">취소신청</option>
									<option value="취소완료">취소완료</option>
									<option value="반품신청">반품신청</option>
									<option value="반품완료">반품완료</option>
									<option value="배송중">배송중</option>
									<option value="배송완료">배송완료</option>
							</select>
								<button class="btn btn-outline-primary btn-sm">등록</button></td>
						</tr>
						<tr>

						</tr>
					</tbody>
				</table>
			</div>
			<a class="btn btn-primary mx-1"
				href="${pageContext.request.contextPath}/admin/order">주문목록</a>
		</div>
	</div>
</body>
</html>