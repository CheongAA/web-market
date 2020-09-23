<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자:: 이벤트</title>
</head>
<body>
	<jsp:include page="../admin_header.jsp" flush="false" />
	<div class="row mt-5">
		<h3 class="w-100">이벤트</h3>
		<table class="table table-hover text-center mt-3">
			<thead>
				<tr>
					<th scope="col"></th>
					<th scope="col">이벤트명</th>
					<th scope="col">할인율</th>
					<th scope="col">시작일</th>
					<th scope="col">종료일</th>
					<th scope="col">진행중 날짜</th>
					<th scope="col">할인적용(사이트 노출)</th>
					<th scope="col">할인적용 변경</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="discount" items="${discounts}" >
					<tr class="rows" id="${discount.discount_id}">
						<td>${discount.discount_id}</td>
						<td>${discount.discount_name}</td>
						<td>${discount.discount_rate}%</td>
						<td>
							<c:set var="start">
								<fmt:formatDate pattern="yyyy/MM/dd" value="${discount.discount_start}" />
							</c:set>${start }</td>
						<td>
							<c:set var="end">
								<fmt:formatDate pattern="yyyy/MM/dd" value="${discount.discount_end}" />
							</c:set>${end }</td>
						<c:set var="today">
							<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy/MM/dd" />
						</c:set>
						<td>
							<c:choose>
								<c:when test="${discount.discount_state !=0}">
									<h5 class="text-primary">O</h5>
								</c:when>
								<c:otherwise>
									<h5 class="text-danger">X</h5>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${discount.discount_apply !=0}">
									<h5 class="text-primary">O</h5>
								</c:when>
								<c:otherwise>
									<h5 class="text-danger">X</h5>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<a class="btn btn-sm btn-outline-success" href="${pageContext.request.contextPath}/admin/discountApply/${discount.discount_id}"> 변경</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<nav class="col-sm-12 m-3" aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<c:if test="${pageMaker.prev}">
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/discount?page=${pageMaker.startPage-1 }">
							<i class="fa fa-chevron-left"></i>
						</a></li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" var="pageNum">
					<c:choose>
						<c:when test="${pageNum eq pageMaker.cri.page}">
							<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/admin/discount?page=${pageNum }">
									<i class="fa">${pageNum }</i>
								</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/discount?page=${pageNum }">
									<i class="fa">${pageNum }</i>
								</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/discount?page=${pageMaker.endPage+1 }">
							<i class="fa fa-chevron-right"></i>
						</a></li>
				</c:if>
			</ul>
		</nav>
	</div>
	<script type="text/javascript">
		$(".rows").click(function() {
			location.href = "/admin/discount/" + $(this).attr('id');
		});
	</script>
</body>
</html>
