<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>MARKET:: 오늘도 신선한 하루</title>
</head>
<body>
	<div id="carouselExampleControls" class="row carousel slide mb-3" data-ride="carousel">
		<div class="carousel-inner">
			<c:forEach var="discount" items="${discounts}" varStatus="status">
				<c:choose>
					<c:when test="${status.count eq 1}">
						<div class="carousel-item active">
							<a class="text-decoration-none text-dark" href="${pageContext.request.contextPath}/discount/${discount.discount_id}">
								<img class="mw-100" src="${discount.discount_thumbnailImg}" alt="${discount.discount_name }" />
							</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="carousel-item">
							<a class="text-decoration-none text-dark" href="${pageContext.request.contextPath}/discount/${discount.discount_id}">
								<img class="mw-100" src="${discount.discount_thumbnailImg}" alt="${discount.discount_name }" />
							</a>
						</div>
					</c:otherwise>
				</c:choose>

			</c:forEach>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a>
		<a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">Next</span>
		</a>
	</div>
	<div class="row mt-1 pt-1">
		<div class="col-md-4 mb-3">
			<h1 class=" font-weight-light text-center mt-5 pt-5">WHAT'S NEW?</h1>
		</div>
		<c:forEach var="product" items="${products}" end="4">
			<c:if test="${product.on_sale == 1}">
				<div class="col-md-4 pb-4 h-100">
					<a href="${pageContext.request.contextPath}/product/${product.product_id}" class="text-decoration-none">
						<img class="w-100 h-75 mb-3 product-img" alt="" src="${product.product_img}">
						<c:if test="${product.discount_id != 0 and product.discount.discount_apply != 0 and product.discount.discount_state != 0}">
							<div class="product-img-text bg-warning text-center p-3">
								<p class="h4 text-white font-weight-light">SAVE</p>
								<p class="h3 text-white font-weight-bold">${product.discount.discount_rate}%</p>

							</div>
						</c:if>
						<span class="d-block text-dark h3 mb-3"> [ <c:out value="${product.brand.brand_name}" /> ] <c:out value="${product.product_name}" />
						</span>
						<c:choose>
							<c:when test="${product.product_quantity <= 0 }">
								<span class="d-block market-color h5">품절</span>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${product.discount_id != 0 and product.discount.discount_apply != 0 and product.discount.discount_state != 0}">
										<span class="text-muted h5 font-weight-light" id="product_price" style="text-decoration: line-through"><fmt:formatNumber pattern="###,###,###" value="${product.product_price}" />원</span>
										<span class="market-color h5" id="discount_price"><i class="fas fa-arrow-right"></i> <c:set var="price" value="${product.product_price-(product.product_price * product.discount.discount_rate)/100}" /> <fmt:formatNumber pattern="###,###,###" value="${price}" />원 </span>
									</c:when>
									<c:otherwise>
										<span class="d-block market-color h5"><fmt:formatNumber pattern="###,###,###" value="${product.product_price}" />원</span>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
						<span class="d-block text-dark font-weight-light mt-2"> <c:out value="${product.product_desc}" />
						</span>
					</a>
				</div>
			</c:if>
		</c:forEach>
	</div>
</body>
</html>
