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
	<div class="row my-5">
		<div class="jumbotron col-sm-12 text-center py-5" style="background: url(${brand.brand_img }) no-repeat; background-size: cover;">
			<h1 class="display-4 font-weight-bold text-white">${brand.brand_name}</h1>
		</div>
		<div class="col-sm-12 bg-light p-5">
			<p class="lead">${brand.brand_desc }<p>
		</div>
	</div>
	<hr/>
	<div class="row m-auto px-3">
		<c:choose>
			<c:when test="${empty products}">
				<h5 class="col-sm-12 text-center my-5 ">더 나은 구성을 위한 상품 준비 중입니다.<br>조금만 기다려주세요!</h5>
			</c:when>
			<c:otherwise>
				<c:forEach var="product" items="${products}">
					<c:if test="${product.on_sale == 1}">
						<input type="hidden" id="discount_rate"
							value="${product.discount.discount_rate}" />
						<input type="hidden" id="product_price"
							value="${product.product_price}" />
						<div class="col-sm-4 mb-5">
							<a
								href="${pageContext.request.contextPath}/product/${product.product_id}"
								class="text-decoration-none"> <img
								class="w-100 h-75 mb-3 product-img" alt=""
								src="${product.product_img}"> <c:if
									test="${product.discount_id != 0 and product.discount.discount_apply != 0 and product.discount.discount_state != 0}">
									<div class="product-img-text bg-warning text-center p-3">
										<p class="h4 text-white font-weight-light">SAVE</p>
										<p class="h3 text-white font-weight-bold">
											${product.discount.discount_rate}%</p>

									</div>
								</c:if> <span class="d-block text-dark h3 mb-3">[<c:out
										value="${product.brand.brand_name}" />] <c:out
										value="${product.product_name}" />
							</span> <c:choose>
									<c:when
										test="${product.discount_id != 0 and product.discount.discount_apply != 0 and product.discount.discount_state != 0}">
										<span class="text-muted h5 font-weight-light"
											id="product_price" style="text-decoration: line-through"><fmt:formatNumber
												pattern="###,###,###" value="${product.product_price}" />원</span>
										<span class="market-color h5" id="discount_price"><i
											class="fas fa-arrow-right"></i> <c:set var="price"
												value="${product.product_price-(product.product_price * product.discount.discount_rate)/100}" />
											<fmt:formatNumber pattern="###,###,###" value="${price}" />원
										</span>
									</c:when>
									<c:otherwise>
										<span class="d-block market-color h5"><fmt:formatNumber
												pattern="###,###,###" value="${product.product_price}" />원</span>
									</c:otherwise>
								</c:choose> <span class="d-block text-dark font-weight-light mt-2"><c:out
										value="${product.product_desc}" /></span>
							</a>
						</div>
					</c:if>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>