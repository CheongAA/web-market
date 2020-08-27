<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자:: 주문</title>
</head>
<body>
	<jsp:include page="../admin_header.jsp" flush="false" />
	<div class="row mt-5">
		<h3 class="w-100">주문조회</h3>
		<table class="table mt-3">
			<thead>
				<tr>
					<th scope="col">주문번호</th>
					<th scope="col">주문날짜</th>
					<th scope="col">결제금액</th>
					<th scope="col">주문수단</th>
					<th scope="col">배송상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="order" items="${orders}">
					<tr>

						<td><a
							href="${pageContext.request.contextPath}/admin/order/${order.order_id}">${order.order_id}</a></td>
						<td><fmt:formatDate value="${order.order_created}"
								pattern="yyyy-MM-dd" /></td>
						<td><fmt:formatNumber value="${order.order_total_price}"
								pattern="###,###,###" /></td>
						<td>${order.order_payment_method}</td>
						<td>${order.order_state}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
</body>
</html>