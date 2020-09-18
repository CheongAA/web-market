<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<h3 class="col-sm-12 m-3">상품조회</h3>
		<div class="col-sm-4">
			<img class="w-100 h-100 mb-3 product-img" alt="" src="${product.product_img}">
			<c:if test="${product.discount_id != 0 and product.discount.discount_apply != 0 and product.discount.discount_state != 0}">
				<div class="product-img-text bg-warning text-center p-3">
					<p class="h4 text-white font-weight-light">SAVE</p>
					<p class="h3 text-white font-weight-bold">${product.discount.discount_rate}%</p>

				</div>
			</c:if>
		</div>
		<div class="col-sm-4">
			<table class="table">
				<tbody>
					<tr>
						<th style="width: 40%">상품번호</th>
						<td>${product.product_id}</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${product.product_name }</td>
					</tr>
					<tr>
						<th>브랜드</th>
						<td>${product.brand.brand_name}</td>
					</tr>
					<tr>
						<th>원가</th>
						<td>${product.product_price}</td>
					</tr>
					<tr>
						<th>할인가</th>
						<td>
							<c:choose>
								<c:when test="${product.discount_id != 0 and product.discount.discount_apply != 0 and product.discount.discount_state != 0}">
									<c:set var="price" value="${product.product_price - ((product.product_price * product.discount.discount_rate)/100)}" />
									<span class="text-muted h5 font-weight-light" style="text-decoration: line-through">${product.product_price}</span>
									<span class="h5 font-weight-light" id="product_price"><fmt:formatNumber pattern="0" value="${price}" /></span>원
											</c:when>
								<c:otherwise>
									X
											</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th style="width: 40%">등록일</th>
						<td>
							<fmt:formatDate value="${product.product_created}" pattern="yyyy-MM-dd" />
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="col-sm-4">
			<table class="table">
				<tbody>
					<tr>
						<th style="width: 40%">판매중</th>
						<td>
							<c:choose>
								<c:when test="${product.on_sale == 1}">
									<small class="text-primary">O</small>
								</c:when>
								<c:otherwise>
									<small class="text-danger">X</small>
								</c:otherwise>
							</c:choose>
							<a class="btn btn-sm btn-outline-success" href="${pageContext.request.contextPath}/admin/sale/${product.product_id}"> 변경</a>
						</td>

					</tr>
					<tr>
						<th>카테고리</th>
						<td>${product.category.category_name }</td>
					</tr>
					<tr>
						<th>재고</th>
						<td>${product.product_quantity}</td>
					</tr>
					<tr>
						<th>판매량</th>
						<td>${product.product_sales_quantity}</td>
					</tr>
					<tr>
						<th>재료</th>
						<td>${product.product_material}</td>
					</tr>
					<tr>
						<th>설명</th>
						<td rowspan="2">${product.product_desc}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row mt-5">
		<div class="col-sm-12 text-center">
			<img src=${product.product_descImg } />
		</div>
	</div>
	<div class="row mt-5">
		<h3 class="col-sm-12">상품 할인</h3>
		<table class="table mt-3">
			<thead>
				<tr>
					<th scope="col">이벤트명</th>
					<th scope="col">할인율</th>
					<th scope="col">할인시작</th>
					<th scope="col">할인종료</th>
					<th scope="col">진행중</th>
					<th scope="col">노출</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${product.discount_id != 0 }">
					<tr>
						<td>${product.discount.discount_name}</td>
						<td>${product.discount.discount_rate}%</td>
						<td>
							<fmt:formatDate value="${product.discount.discount_start}" pattern="yyyy-MM-dd" />
						</td>
						<td>
							<fmt:formatDate value="${product.discount.discount_end}" pattern="yyyy-MM-dd" />
						</td>
						<td>
							<c:choose>
								<c:when test="${product.discount.discount_state == 1}">
									<p class="text-primary">O</p>
								</c:when>
								<c:otherwise>
									<p class="text-danger">X</p>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${product.discount.discount_apply == 1}">
									<p class="text-primary">O</p>
								</c:when>
								<c:otherwise>
									<p class="text-danger">X</p>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>

	<div class="col-sm-12 m-5">
		<a href="${pageContext.request.contextPath}/admin/product" class="btn btn-dark float-right mx-5">목록</a>
		<a href="${pageContext.request.contextPath}/admin/product/delete/${product.product_id}" class="btn btn-danger float-right px-5">삭제</a>
		<a href="${pageContext.request.contextPath}/admin/product/update/${product.product_id}" class="btn btn-warning float-right px-5 mr-1">수정</a>
	</div>
</body>
</html>