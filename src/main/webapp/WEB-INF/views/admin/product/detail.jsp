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
		<h3 class="w-100">상품조회 / 수정 / 삭제</h3>
		<div class="">
			<p>"${product.brand_id}"</p>
			<p>"${product.product_name}"</p>
		</div>
	</div>
	<h3 class="w-100">상품 할인</h3>
	<table class="table mt-3">
		<thead>
			<tr>
				<th scope="col">이벤트명</th>
				<th scope="col">할인율</th>
				<th scope="col">할인시작</th>
				<th scope="col">할인종료</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<c:set var="start">
					<fmt:formatDate value="${product.discount.discount_start}"
						pattern="yyyy-MM-dd" />
				</c:set>
				<c:set var="end">
					<fmt:formatDate value="${product.discount.discount_end}"
						pattern="yyyy-MM-dd" />
				</c:set>
				<td>${product.discount.discount_name}</td>
				<td>${product.discount.discount_rate}</td>
				<td>${start}</td>
				<td>${end}</td>
			</tr>
		</tbody>
	</table>
	<div class="w-100">
		<a href="${pageContext.request.contextPath}/admin/product"
			class="btn btn-dark float-right mx-5">목록</a> <a
			href="${pageContext.request.contextPath}/admin/product/delete/${product.product_id}"
			class="btn btn-danger float-right px-5">삭제</a> <a
			href="${pageContext.request.contextPath}/admin/product/update/${product.product_id}"
			class="btn btn-warning float-right px-5 mr-1">수정</a>
	</div>
</body>
</html>