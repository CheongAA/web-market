<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자:: 상품 할인</title>
</head>
<body>
	<jsp:include page="../admin_header.jsp" flush="false" />
	<div class="row mt-5">
		<h3 class="w-100 text-center pb-5 mb-5">할인 이벤트 등록</h3>
		<form class="m-auto"
			action="${pageContext.request.contextPath}/admin/discount"
			method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="discount_name">이벤트명</label> <input type="text"
					class="form-control" id="discount_name" name="discount_name">
			</div>
			<div class="form-group">
				<label for="discount_name">간단설명</label> <input type="text"
					class="form-control" id="discount_desc" name="discount_desc">
			</div>
			<div class="form-group">
				<label for="discount_name">본문설명</label> <input type="text"
					class="form-control" id="discount_explanation"
					name="discount_explanation">
			</div>
			<div class="form-group">
				<label for="discount_name">썸네일이미지</label> <input type="file"
					class="form-control" id="discount_thumbnailImg"
					name="discount_thumbnailImg">
			</div>
			<div class="form-group">
				<label for="discount_name">본문이미지</label> <input type="file"
					class="form-control" id="discount_mainImg" name="discount_mainImg">
			</div>
			<div class="form-group">
				<label for="discount_rate">할인율</label> <input type="number"
					class="form-control" id="discount_rate" name="discount_rate"
					min="1" max="99" required="required">
			</div>
			<div class="form-group">
				<label>할인시작일</label> <input type="date" name="discount_start"
					class="form-control" placeholder="" required="required">
			</div>
			<div class="form-group">
				<label>할인종료일</label> <input type="date" name="discount_end"
					class="form-control" placeholder="" required="required">
			</div>
			<div class="form-group">
				<label>이벤트 품목(다중선택가능)</label> <label
					class="form-check form-check-inline"> <input
					class="form-check-input" id="products_radio" type="radio"
					name="event_products" checked> <span
					class="form-check-label"> 상품별</span>
				</label><label class="form-check form-check-inline"> <input
					class="form-check-input" id="brands_radio" type="radio"
					name="event_products"> <span class="form-check-label">
						브랜드별</span>
				</label> <label class="form-check form-check-inline"> <input
					class="form-check-input" id="categories_radio" type="radio"
					name="event_products"> <span class="form-check-label">
						카테고리별</span>
				</label>
				<div id="products_list" style="display: none;">
					<select name="product[]" class="form-control" multiple>
						<c:forEach var="product" items="${products}">
							<option value="${product.product_id}">[${product.brand.brand_name}]
								${product.product_name}</option>
						</c:forEach>
					</select>
				</div>
				<div id="brands_list" style="display: none;">
					<select name="product[]" class="form-control" multiple>
						<c:forEach var="brand" items="${brands}">
							<option value="${brand.brand_id}">${brand.brand_name}</option>
						</c:forEach>
					</select>
				</div>
				<div id="categories_list" style="display: none;">
					<select name="product[]" class="form-control" multiple>
						<c:forEach var="category" items="${categories}">
							<option value="${category.category_code}">${category.category_name}</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<div class="form-group">
				<button type="submit" class="btn btn-dark btn-block">등록</button>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#products_radio").prop("checked",true);
			$("#brands_radio").prop("checked",false);
			$("#categories_radio").prop("checked",false);
			
			$("#products_radio").trigger("change");
		})

		$("input[name=event_products]").change(function() {
			var radioValue = $(this).attr('id');
			if (radioValue == "products_radio") {
				$("#products_list").show();
				$("#brands_list").hide();
				$("#categories_list").hide();

			} else if (radioValue == "brands_radio") {
				$("#brands_list").show();
				$("#products_list").hide();
				$("#categories_list").hide();

			} else if (radioValue == "categories_radio") {
				$("#categories_list").show();
				$("#products_list").hide();
				$("#brands_list").hide();
			}
		});
	</script>
</body>
</html>