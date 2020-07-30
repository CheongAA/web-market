<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자:: 상품 조회 /수정/삭제/ 판매/ 할인</title>
</head>
<body>
	<jsp:include page="../admin_header.jsp" flush="false" />
	<div class="row mt-5">
		<h3 class="w-100">상품조회 / 수정 / 삭제/ 판매/ 할인</h3>
		<table class="table mt-3">
			<thead>
				<tr>
					<th scope="col"></th>
					<th scope="col">상품명</th>
					<th scope="col">브랜드명</th>
					<th scope="col">판매</th>
					<th scope="col">할인</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="product" items="${products}" varStatus="status">
					<tr>
						<td><c:out value="${status.count} " /></td>
						<td><a
							href="${pageContext.request.contextPath}/admin/product/${product.product_id}">
								${product.product_name}</a></td>
						<td>${product.brand.brand_name}</td>
						<td><c:choose>
								<c:when test="${product.on_sale == 1}">
									O
								</c:when>
								<c:otherwise>
									X
								</c:otherwise>
							</c:choose> <a
							href="${pageContext.request.contextPath}/admin/sale/${product.product_id}">
								판매</a></td>
						<td><c:choose>
								<c:when test="${product.discount_id != 0}">
									O
								</c:when>
								<c:otherwise>
									X
								</c:otherwise>
							</c:choose> <a>
								할인</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>