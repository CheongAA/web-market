<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<h3 class="w-100 mb-3">주문조회</h3>
		<select>
			<option>전체주문</option>
		</select>
		<table class="table table-hover mt-3">
			<thead>
				<tr>
					<th scope="col"></th>
					<th scope="col">주문번호</th>
					<th scope="col">주문날짜</th>
					<th scope="col">결제금액</th>
					<th scope="col">주문수단</th>
					<th scope="col">배송상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="order" items="${orders}" varStatus="status">
					<tr class="rows" id="${order.order_id}">
						<td class="h5">${status.count }</td>
						<td>${order.order_id}</td>
						<td>
							<fmt:formatDate value="${order.order_created}" pattern="yyyy-MM-dd" />
						</td>
						<td>
							<fmt:formatNumber value="${order.order_total_price}" pattern="###,###,###" />
						</td>
						<td>${order.order_payment_method}</td>
						<td>${order.orderState.order_state_title}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<nav aria-label="Page navigation example" class="d-block mx-auto">
			<ul class="pagination">
				<li class="page-item"><a class="page-link" href="#" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
					</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#" aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
					</a></li>
			</ul>
		</nav>
	</div>
	<script type="text/javascript">
		$(".rows").click(function() {
			location.href = "/admin/order/" + $(this).attr('id');
		});
	</script>
</body>
</html>