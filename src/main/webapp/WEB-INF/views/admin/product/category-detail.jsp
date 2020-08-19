<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<jsp:include page="../admin_header.jsp" flush="false" />
	<div class="row mt-5">
		<h3 class="w-100 mb-3">카테고리조회</h3>
		<div class="jumbotron w-100 text-center">
			<small>카테고리 코드 : ${category.category_code}</small>
			<h1 class="display-4">${category.category_name}</h1>
		</div>
	</div>
	<div class="row m-auto px-3">
		<c:forEach var="product" items="${products}">
				<div class="col-sm-4">
					<a href="/product/${product.product_id}"
						class="text-decoration-none"> <img
						class="w-100 h-75 mb-3 product-img" alt=""
						src="${product.product_thumbnailImg}"> <c:if
							test="${product.discount_id != 0}">
							<div class="product-img-text bg-warning text-center p-3">
								<p class="h4 text-white font-weight-light">SAVE</p>
								<p class="h3 text-white font-weight-bold">
									${product.discount.discount_rate}%</p>

							</div>
						</c:if> <span class="d-block text-dark h3 mb-3">[<c:out
								value="${product.brand.brand_name}" />] <c:out
								value="${product.product_name}" />
					</span> <c:choose>
							<c:when test="${product.discount_id != 0}">
								<span class="text-muted h5 font-weight-light"
									style="text-decoration: line-through"><c:out
										value="${product.product_price}원" /></span>
								<span class="market-color h5"><i
									class="fas fa-arrow-right"></i> <c:out
										value="${product.product_price}원" /></span>
							</c:when>
							<c:otherwise>
								<span class="d-block market-color h5"><c:out
										value="${product.product_price}원" /></span>
							</c:otherwise>
						</c:choose> <span class="d-block text-dark font-weight-light mt-2"><c:out
								value="${product.product_desc}" /></span>
							<span class="d-block text-dark font-weight-light mt-2"> 판매여부: ${product.on_sale}</span>
				</a>
				</div>
		</c:forEach>
	</div>
	<div class="w-100 my-5">
		<a href="${pageContext.request.contextPath}/admin/category"
			class="btn btn-dark float-right mx-5">목록</a> <a
			href="${pageContext.request.contextPath}/admin/category/delete/${category.category_code}"
			class="btn btn-danger float-right px-5">삭제</a> <a
			href="${pageContext.request.contextPath}/admin/category/update/${category.category_code}"
			class="btn btn-warning float-right px-5 mr-1">수정</a>
	</div>
</body>
</html>