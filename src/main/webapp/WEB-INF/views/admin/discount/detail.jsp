<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<jsp:include page="../admin_header.jsp" flush="false" />
	<div class="row mt-5">
		<h3 class="w-100 mb-3">이벤트</h3>
		<div class="jumbotron w-100 text-center" style="background: url(${discount.discount_thumbnailImg }) no-repeat; background-size: cover;">
			<small>이벤트 코드 : ${discount.discount_id}</small>
			<h1 class="display-4">${discount.discount_name}</h1>
			<p class="lead">${discount.discount_desc}</p>
			<p class="lead">${discount.discount_explanation}</p>
		</div>
	</div>
	<div class="row m-auto px-3">
		<table class="table table-hover mt-3 text-center">
			<thead>
				<tr>
					<th scope="col"></th>
					<th scope="col">상품명</th>
					<th scope="col">할인</th>
					<th scope="col">판매중</th>
					<th scope="col">판매중 변경</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="product" items="${products}" varStatus="status">
					<tr class="rows" id="${product.product_id}">
						<td>${status.count}</td>
						<td>${product.product_name}</td>
						<td><c:choose>
								<c:when test="${product.discount_id != 0}">
									<h5 class="text-primary">O</h5>
								</c:when>
								<c:otherwise>
									<h5 class="text-danger">X</h5>
								</c:otherwise>
							</c:choose></td>
						<td><c:choose>
								<c:when test="${product.on_sale == 1}">
									<h5 class="text-primary">O</h5>
								</c:when>
								<c:otherwise>
									<h5 class="text-danger">X</h5>
								</c:otherwise>
							</c:choose></td>
						<td><a class="btn btn-sm btn-outline-success"
							href="${pageContext.request.contextPath}/admin/sale/${product.product_id}">
								변경</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="w-100 my-5">
		<a href="${pageContext.request.contextPath}/admin/discount"
			class="btn btn-dark float-right mx-5">목록</a> <a
			href="${pageContext.request.contextPath}/admin/discount/delete/${discount.discount_id}"
			class="btn btn-danger float-right px-5">삭제</a> <a
			href="${pageContext.request.contextPath}/admin/discount/update/${discount.discount_id}"
			class="btn btn-warning float-right px-5 mr-1">수정</a>
	</div>
	<script type="text/javascript">
		$(".rows").click(function() {
			location.href = "/admin/product/" + $(this).attr('id');
		});
	</script>
</body>
</html>