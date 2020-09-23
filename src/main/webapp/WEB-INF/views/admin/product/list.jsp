<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자:: 상품 관리</title>
</head>
<body>
	<jsp:include page="../admin_header.jsp" flush="false" />
	<div class="row mt-5">
		<h3 class="w-100">상품관리</h3>
		<table class="table table-hover mt-3 text-center">
			<thead>
				<tr>
					<th scope="col"></th>
					<th scope="col">상품명</th>
					<th scope="col">브랜드명</th>
					<th scope="col">할인</th>
					<th scope="col">판매중</th>
					<th scope="col">판매중 변경</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="product" items="${products}">
					<tr class="rows" id="${product.product_id}">
						<td>${product.product_id}</td>
						<td>${product.product_name}</td>
						<td>${product.brand.brand_name}</td>
						<td>
							<c:choose>
								<c:when test="${product.discount_id != 0}">
									<h5 class="text-primary">O</h5>
								</c:when>
								<c:otherwise>
									<h5 class="text-danger">X</h5>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${product.on_sale == 1}">
									<h5 class="text-primary">O</h5>
								</c:when>
								<c:otherwise>
									<h5 class="text-danger">X</h5>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<a class="btn btn-sm btn-outline-success" href="${pageContext.request.contextPath}/admin/sale/${product.product_id}"> 변경</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<nav class="col-sm-12 my-3" aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<c:if test="${pageMaker.prev}">
				<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/product?page=${pageMaker.startPage-1 }">
						<i class="fa fa-chevron-left"></i>
					</a></li>
			</c:if>
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" var="pageNum">
				<c:choose>
					<c:when test="${pageNum eq pageMaker.cri.page}">
						<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/admin/product?page=${pageNum }">
								<i class="fa">${pageNum }</i>
							</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/product?page=${pageNum }">
								<i class="fa">${pageNum }</i>
							</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
				<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/product?page=${pageMaker.endPage+1 }">
						<i class="fa fa-chevron-right"></i>
					</a></li>
			</c:if>
		</ul>
	</nav>
	<script type="text/javascript">
		$(".rows").click(function() {
			location.href = "/admin/product/" + $(this).attr('id');
		});
	</script>
</body>
</html>