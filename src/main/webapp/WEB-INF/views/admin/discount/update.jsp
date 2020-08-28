<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자:: 할인 이벤트 수정</title>

</head>
<body>
	<jsp:include page="../admin_header.jsp" flush="false" />
	<div class="row pt-5">
		<div class="pb-4 mb-2">
			<span class="h2">할인 이벤트 수정</span>
		</div>
		<form class="w-100"
			action="${pageContext.request.contextPath}/admin/discount/update/${discount.discount_id}"
			method="post">
			<div class="form-group">
				<label for="discount_name">이벤트명</label> <input type="text"
					class="form-control" id="discount_name" name="discount_name" value="${discount.discount_name}">
			</div>
			<div class="form-group">
				<label for="discount_name">간단설명</label> <input type="text"
					class="form-control" id="discount_desc" name="discount_desc" value="${discount.discount_desc}">
			</div>
			<div class="form-group">
				<label for="discount_name">본문설명</label> <input type="text"
					class="form-control" id="discount_explanation"
					name="discount_explanation" value="${discount.discount_explanation}">
			</div>
			<div class="form-group">
				<label for="discount_name">썸네일이미지</label> <input type="file"
					class="form-control" id="discount_thumbnailImg"
					name="discount_thumbnailImg" value="${discount.discount_thumbnailImg}">
			</div>
			<div class="form-group">
				<label for="discount_name">본문이미지</label> <input type="file"
					class="form-control" id="discount_mainImg" name="discount_mainImg" value="${discount.discount_mainImg}">
			</div>
			<div class="form-group">
				<label for="discount_rate">할인율</label> <input type="number"
					class="form-control" id="discount_rate" name="discount_rate"
					min="1" max="99" required="required" value="${discount.discount_rate}">
			</div>
			<div class="form-group">
				<label>할인시작일</label> <input type="date" name="discount_start"
					class="form-control" placeholder="" required="required" value="${discount.discount_start}">
			</div>
			<div class="form-group">
				<label>할인종료일</label> <input type="date" name="discount_end"
					class="form-control" placeholder="" required="required" value="${discount.discount_end}">
			</div>
			<div class="form-group">
				<label>이벤트 품목(다중선택가능)</label> <select name="product[]"
					class="form-control" multiple>
					<c:forEach var="product" items="${products}">
						<option value="${product.product_id}">[${product.brand.brand_name}]
							${product.product_name}</option>
					</c:forEach>
				</select >
			</div>

			<div class="form-group">
				<button type="submit" class="btn btn-dark btn-block">등록</button>
			</div>
		</form>
	</div>
</body>
</html>