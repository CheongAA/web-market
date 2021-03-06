<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MARKET:: 이벤트</title>
</head>
<body>
	<div class="row pt-5">
		<img class="mw-100" src="${discount.discount_thumbnailImg}" alt="${discount.discount_name }" />
		<div class="col-sm-12 p-3 bg-light">
			<h3 class="col-sm-12 mb-3">${discount.discount_name }</h3>
			<p class="col-sm-12">${discount.discount_explanation}</p>
			<small class="m-3"> <fmt:formatDate pattern="MM/dd" value="${discount.discount_start}" /> ( <fmt:formatDate pattern="E" value="${discount.discount_start}" /> ) ~ <fmt:formatDate pattern="MM/dd" value="${discount.discount_end}" /> ( <fmt:formatDate pattern="E" value="${discount.discount_end}" /> )
			</small>
		</div>
		<div class="row my-3 py-3">
			<c:forEach var="product" items="${products}">
				<c:if test="${product.on_sale == 1}">
					<input type="hidden" id="discount_rate" value="${product.discount.discount_rate}" />
					<input type="hidden" id="product_price" value="${product.product_price}" />
					<div class="col-lg-3 mb-5">
						<a href="${pageContext.request.contextPath}/product/${product.product_id}" class="text-decoration-none">
							<img class="mw-100 mb-3 product-img p-3" alt="" src="${product.product_img}">
							<c:if test="${product.discount_id != 0 and product.discount.discount_apply != 0 and product.discount.discount_state != 0}">
								<div class="product-img-text bg-warning text-center p-3 m-3">
									<p class="h5 text-white font-weight-light">SAVE</p>
									<p class="h4 text-white font-weight-bold">${product.discount.discount_rate}%</p>

								</div>
							</c:if>
							<span class="d-block text-dark h4 mb-3 pl-3">[<c:out value="${product.brand.brand_name}" />] <c:out value="${product.product_name}" />
							</span>
							<c:choose>
								<c:when test="${product.discount_id != 0 and product.discount.discount_apply != 0 and product.discount.discount_state != 0}">
									<span class="text-muted h5 font-weight-light pl-3" id="product_price" style="text-decoration: line-through"><fmt:formatNumber pattern="###,###,###" value="${product.product_price}" />원</span>
									<span class="market-color h5 pl-3" id="discount_price"><i class="fas fa-arrow-right"></i> <c:set var="price" value="${product.product_price-(product.product_price * product.discount.discount_rate)/100}" /> <fmt:formatNumber pattern="###,###,###" value="${price}" />원 </span>
								</c:when>
								<c:otherwise>
									<span class="d-block market-color h5 pl-3"><fmt:formatNumber pattern="###,###,###" value="${product.product_price}" />원</span>
								</c:otherwise>
							</c:choose>
							<span class="d-block text-dark font-weight-light mt-2 pl-3"><c:out value="${product.product_desc}" /></span>
						</a>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>
</body>
</html>