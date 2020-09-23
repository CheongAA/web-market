<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MARKET:: 오늘도 신선한 하루</title>
</head>
<body>
	<div class="w-100 my-5">
		<c:forEach var="category" items="${categories}">
			<c:choose>
				<c:when test="${category.category_depth == 1}">
					<h3 class="mx-5 mb-3 font-weight-bold text-muted">
						<i class="fas fa-utensils"></i> ${category.category_name}
					</h3>
					<a class="code ml-5 mr-3 h5 text-dark" href="/products/${category.category_code }" id="${category.category_code}">전체보기</a>
				</c:when>
				<c:otherwise>
					<a class="code mr-3 h5 text-dark" href="/products/${category.category_code}" id="${category.category_code}">${category.category_name}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${not empty activeNew}">
			<h3 class="mx-5 mb-3 font-weight-bold text-muted">
				<i class="fas fa-pizza-slice"></i> 신상품
			</h3>
			<h5 class="mx-5 mb-3 font-weight-light text-muted">MARKET의 다양한 신상품을 만나보세요!</h5>
		</c:if>
		<c:if test="${not empty activeBest}">
			<h3 class="mx-5 mb-3 font-weight-bold text-muted">
				<i class="fas fa-carrot"></i> 베스트
			</h3>
			<h5 class="mx-5 mb-3 font-weight-light text-muted">MARKET의 인기상품들을 한눈에 만나보세요!</h5>
		</c:if>
		<c:if test="${not empty activeDiscount}">
			<h3 class="mx-5 mb-3 font-weight-bold text-muted">
				<i class="fas fa-fish"></i> 알뜰상품
			</h3>
			<h5 class="mx-5 mb-3 font-weight-light text-muted">MARKET의 할인 상품들을 빠르게 만나보세요!</h5>
		</c:if>
	</div>
	<div class="row m-auto px-3">
		<c:forEach var="product" items="${products}">
			<c:if test="${product.on_sale == 1}">
				<input type="hidden" id="discount_rate" value="${product.discount.discount_rate}" />
				<input type="hidden" id="product_price" value="${product.product_price}" />
				<input type="hidden" id="currentCategory" value="${currentCategory}" />
				<div class="col-lg-3 mb-5">
					<a href="${pageContext.request.contextPath}/product/${product.product_id}" class="text-decoration-none">
						<img class="w-100 h-75 mb-3 product-img" alt="" src="${product.product_img}">
						<c:if test="${product.discount_id != 0 and product.discount.discount_apply != 0 and product.discount.discount_state != 0}">
							<div class="product-img-text bg-warning text-center p-3">
								<p class="h4 text-white font-weight-light">SAVE</p>
								<p class="h3 text-white font-weight-bold">${product.discount.discount_rate}%</p>

							</div>
						</c:if>
						<span class="d-block text-dark h3 mb-3 text-nowrap">[<c:out value="${product.brand.brand_name}" />] <c:out value="${product.product_name}" />
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
						<span class="d-block text-dark font-weight-light mt-2"><c:out value="${product.product_desc}" /></span>
					</a>
				</div>
			</c:if>
		</c:forEach>

		<c:if test="${not empty pageMaker}">
			<nav class="col-sm-12" aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<c:if test="${pageMaker.prev}">
						<li class="page-item">
							<c:choose>
								<c:when test="${empty activeDiscount}">
									<a class="page-link" href="${pageContext.request.contextPath}/products/${currentCategory}?page=${pageMaker.startPage-1 }">
										<i class="fa fa-chevron-left"></i>
									</a>
								</c:when>
								<c:otherwise>
									<a class="page-link" href="${pageContext.request.contextPath}/products/discount?page=${pageMaker.startPage-1 }">
										<i class="fa fa-chevron-left"></i>
									</a>
								</c:otherwise>
							</c:choose>

						</li>
					</c:if>
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" var="pageNum">
						<c:choose>
							<c:when test="${pageNum eq pageMaker.cri.page}">
								<li class="page-item active">
									<c:choose>
										<c:when test="${empty activeDiscount}">
											<a class="page-link" href="${pageContext.request.contextPath}/products/${currentCategory}?page=${pageNum }">
												<i class="fa">${pageNum }</i>
											</a>
										</c:when>
										<c:otherwise>
											<a class="page-link" href="${pageContext.request.contextPath}/products/discount?page=${pageNum }">
												<i class="fa">${pageNum }</i>
											</a>
										</c:otherwise>
									</c:choose>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<c:choose>
										<c:when test="${empty activeDiscount}">
											<a class="page-link" href="${pageContext.request.contextPath}/products/${currentCategory}?page=${pageNum }">
												<i class="fa">${pageNum }</i>
											</a>
										</c:when>
										<c:otherwise>
											<a class="page-link" href="${pageContext.request.contextPath}/products/discount?page=${pageNum }">
												<i class="fa">${pageNum }</i>
											</a>
										</c:otherwise>
									</c:choose>
								</li>
							</c:otherwise>
						</c:choose>

					</c:forEach>
					<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
						<li class="page-item">
							<a class="page-link" href="${pageContext.request.contextPath}/products/${currentCategory}?page=${pageMaker.endPage+1 }">
								<i class="fa fa-chevron-right"></i>
							</a>
						</li>
					</c:if>
				</ul>
			</nav>
		</c:if>
	</div>
	<script type="text/javascript">
		var categories = $(".code");

		for (var i = 0; i < categories.length; i++) {
			if ($("#currentCategory").val() == categories[i].id) {
				$("#" + categories[i].id).addClass("font-weight-bold");
			}
		}
	</script>
</body>
</html>