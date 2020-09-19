<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자:: 후기조회</title>
</head>
<body>
	<jsp:include page="../admin_header.jsp" flush="false" />
	<div class="row mt-5">
		<h3 class="w-100">후기조회</h3>
		<table class="table table-hover text-center mt-3">
			<thead>
				<tr>
					<th></th>
					<th>상품명</th>
					<th>제목</th>
					<th>고객ID</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="review" items="${reviews}" varStatus="status">
					<tr class="rows" id="${review.review_id }">
						<td>${status.count}</td>
						<td>${review.product.product_name}</td>
						<td>${review.review_title}</td>
						<td>${review.user.user_identification}</td>
						<td>${review.review_view}</td>
						<td>
							<fmt:formatDate value="${review.review_created}" pattern="yyyy-MM-dd" />
						</td>
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
			location.href = "/admin/review/" + $(this).attr('id');
		});
	</script>
</body>
</html>