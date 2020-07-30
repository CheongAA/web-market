<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자:: 상품수정</title>

</head>
<body>
	<jsp:include page="../admin_header.jsp" flush="false" />
	<div class="row mt-5">
		<h3 class="w-100 text-center border-bottom pb-5">상품추가</h3>
		<form class="m-auto"
			action="${pageContext.request.contextPath}/admin/product/update"
			method="post">
			<div class="form-group">
				<input type="hidden" name="product_id" value="${product.product_id}" /> 
				<label
					for="product_name">상품명</label> <input type="text"
					class="form-control" id="product_name" name="product_name"
					placeholder="" required="required" value="${product.product_name}">
			</div>
			<div class="form-group">
				<label for="category1">대분류</label> <select class="form-control"
					id="category1" onchange="changeCategory1(this.value)">
				</select>
			</div>
			<div class="form-group">
				<label for="category2">중분류</label> <select class="form-control"
					id="category2" name="category_code">
				</select>
			</div>
			<div class="form-group">
				<label for="exampleFormControlSelect1">브랜드명</label> <select
					class="form-control" id="exampleFormControlSelect1" name="brand_id">
					<c:forEach var="brand" items="${brands}">
						<option value="${brand.brand_id}"><c:out
								value="${brand.brand_name}" /></option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<label for="product_image">상품설명이미지</label> <input type="file"
					class="form-control-file" id="exampleFormControlFile1">
			</div>
			<div class="form-group">
				<label for="product_image">상품이미지</label> <input type="file"
					class="form-control-file" id="exampleFormControlFile1">
			</div>
			<div class="form-group">
				<label for="product_name">가격</label> <input type="text"
					class="form-control" id="product_price" name="product_price"
					placeholder="" required="required" value="${product.product_price}">
			</div>
			<div class="form-group">
				<label for="product_name">상품수량</label> <input type="text"
					class="form-control" id="product_q" name="product_quantity"
					placeholder="" required="required"
					value="${product.product_quantity}">
			</div>
			<div class="form-group">
				<label for="product_name">재료</label> <input type="text"
					class="form-control" id="product_name" name="product_material"
					placeholder="" required="required"
					value="${product.product_material}">
			</div>
			<div class="form-group">
				<label for="product_name">용량</label> <input type="text"
					class="form-control" id="product_name" name="product_volume"
					placeholder="" required="required"
					value="${product.product_volume}">
			</div>

			<div class="form-group">
				<label for="product_desc">상품설명</label>
				<textarea class="form-control" id="product_desc" name="product_desc"
					rows="3" required="required"><c:out
						value="${product.product_desc}" /></textarea>
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-dark btn-block">등록</button>
			</div>
		</form>
	</div>
	<script>
		var jsonData = JSON.parse('${categories}');
		console.log(jsonData);

		var cate1Arr = new Array();
		var cate1Obj = new Object();

		var cate2Arr = new Array();
		var cate2Obj = new Object();

		// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
		for (var i = 0; i < jsonData.length; i++) {
			if (jsonData[i].category_depth == 1) {
				cate1Obj = new Object(); //초기화
				cate1Obj.categoryCode = jsonData[i].category_code;
				cate1Obj.categoryName = jsonData[i].category_name;
				cate1Arr.push(cate1Obj);
			} else if (jsonData[i].category_depth == 2) {
				cate2Obj = new Object(); //초기화
				cate2Obj.categoryCode = jsonData[i].category_code;
				cate2Obj.categoryCode2 = jsonData[i].category_code2;
				cate2Obj.categoryName = jsonData[i].category_name;
				cate2Arr.push(cate2Obj);
			}
		}
		// 1차 분류 셀렉트 박스에 데이터 삽입
		var cate1Select = document.getElementById("category1");

		for (var i = 0; i < cate1Arr.length; i++) {
			var newNode = document.createElement("option");
			newNode.value = cate1Arr[i].categoryCode;
			newNode.innerHTML = cate1Arr[i].categoryName;
			cate1Select.appendChild(newNode);
		}

		changeCategory1(cate1Arr[0].categoryCode);

		function changeCategory1(category1) {
			//기존 카테고리 중분류 삭제
			var cate2Select = document.getElementById("category2");
			var cate2Length = cate2Select.options.length;

			for (i = 0; i < cate2Length;) {
				cate2Select.options[i] = null;
				cate2Length = cate2Select.options.length;
			}

			//카테고리 중분류 추가

			for (var i = 0; i < cate2Arr.length; i++) {
				if (cate2Arr[i].categoryCode2 == category1) {

					var newNode = document.createElement("option");
					newNode.value = cate2Arr[i].categoryCode;
					newNode.innerHTML = cate2Arr[i].categoryName;
					cate2Select.appendChild(newNode);
				}
			}
		}
	</script>
</body>
</html>