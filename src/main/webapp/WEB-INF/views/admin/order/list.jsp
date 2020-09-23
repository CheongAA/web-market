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
				<c:forEach var="order" items="${orders}" >
					<tr class="rows" id="${order.order_id}">
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
	</div>
	<nav class="col-sm-12 my-3" aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<c:if test="${pageMaker.prev}">
				<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/order?page=${pageMaker.startPage-1 }">
						<i class="fa fa-chevron-left"></i>
					</a></li>
			</c:if>
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" var="pageNum">
				<c:choose>
					<c:when test="${pageNum eq pageMaker.cri.page}">
						<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/admin/order?page=${pageNum }">
								<i class="fa">${pageNum }</i>
							</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/order?page=${pageNum }">
								<i class="fa">${pageNum }</i>
							</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
				<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/order?page=${pageMaker.endPage+1 }">
						<i class="fa fa-chevron-right"></i>
					</a></li>
			</c:if>
		</ul>
	</nav>
	<script type="text/javascript">
		$(".rows").click(function() {
			location.href = "/admin/order/" + $(this).attr('id');
		});
	</script>
</body>
</html>