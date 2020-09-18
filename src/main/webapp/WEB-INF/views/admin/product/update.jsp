<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<h3 class="col-sm-12 border-bottom p-5">상품수정</h3>
		<div class="col-sm-12 p-5">
			<form action="${pageContext.request.contextPath}/admin/product/update" method="post" enctype="multipart/form-data">
				<input type="hidden" name="product_id" value="${product.product_id }">
				<input type="hidden" value="${product.category.category_code2}" id="category_code">
				<input type="hidden" value="${product.category.category_code }" id="category_code2">
				<div class="col-12 border mb-5">
					<table class="table">
						<tbody>
							<tr>
								<th scope="row" style="width: 20%">대분류</th>
								<td>
									<select class="form-control" id="category1" onchange="changeCategory1(this.value)">
									</select>
								</td>

							</tr>
							<tr>
								<th scope="row">중분류</th>
								<td>
									<select class="form-control" id="category2" name="category_code">
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">브랜드명</th>
								<td class="form-inline">
									<select class="form-control" id="exampleFormControlSelect1" name="brand_id">
										<c:forEach var="brand" items="${brands}">
											<c:choose>
												<c:when test="${brand.brand_name eq product.brand.brand_name }">
													<option value="${brand.brand_id}" selected>${brand.brand_name}</option>
												</c:when>
												<c:otherwise>
													<option value="${brand.brand_id}">${brand.brand_name}</option>
												</c:otherwise>
											</c:choose>

										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">상품명</th>
								<td class="form-inline">
									<input type="text" class="form-control" name="product_name" value="${product.product_name }" required="required">
								</td>
							</tr>

							<tr>
								<th scope="row">상품대표이미지(700px * 800px)</th>
								<td>
									<input type="file" class="form-control-file" id="product_img" name="img" accept="image/*">
									<div class="mt-3">
										<input type="hidden" name="product_img" value="${product.product_img}" />
										<img class="w-25 mb-2" src="${product.product_img}" id="origin_product_img">
										<img class="w-25" id="select_product_img">
									</div>

									<div class="mt-3">
										<img src="" id="select_product_img">
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">상품설명이미지(800px * 2000px)</th>
								<td>
									<input type="file" class="form-control-file" id="product_descImage" name="descImg" accept="image/*">
									<div class="mt-3">
										<input type="hidden" name="product_descImg" value="${product.product_descImg}" />
										<img class="w-25 h-25 mb-2" src="${product.product_descImg}" id="origin_product_descImg">
										<img class="w-25 h-25" id="select_product_descImg">
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">가격</th>
								<td>
									<input type="text" class="form-control" name="product_price" value="${product.product_price }" required="required">
								</td>
							</tr>
							<tr>
								<th scope="row">재고</th>
								<td>
									<input type="text" class="form-control" name="product_quantity" value="${product.product_quantity }" required="required">
								</td>
							</tr>
							<tr>
								<th scope="row">재료</th>
								<td>
									<input type="text" class="form-control" name="product_material" value="${product.product_material }" required="required">
								</td>
							</tr>
							<tr>
								<th scope="row">용량</th>
								<td>
									<input type="text" class="form-control" name="product_volume" value="${product.product_volume }" required="required">
								</td>
							</tr>
							<tr>
								<th scope="row">간단설명</th>
								<td>
									<textarea class="form-control" name="product_desc" rows="3" required="required">${product.product_desc }</textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col-12 text-center">
					<button type="submit" class="btn btn-dark btn-lg col-4">등록</button>
				</div>
			</form>
		</div>
	</div>
	<script>
		$("#product_img")
				.on(
						'change',
						function() {
							if (this.files && this.files[0]) {

								var ext = $(this).val().split(".").pop()
										.toLowerCase();

								var fileSize = this.files[0].size;
								var maxSize = 2000 * 2000;

								var _URL = window.URL || window.webkitURL;
								var img = new Image();
								img.src = _URL.createObjectURL(this.files[0]);

								var reader = new FileReader;
								reader.onload = function(data) {
									//확장자 체크
									if ($.inArray(ext, [ "gif", "jpg", "jpeg",
											"png", "bmp" ]) == -1) {
										alert("gif, jpg, jpeg, png, bmp 파일만 업로드 해주세요.");
										$("#product_img").val("");

										$("#origin_product_img").css("display",
												"block");
										$("#select_product_img").css("display",
												"none");
									} else if (fileSize > maxSize) {
										alert("파일용량을 초과하였습니다.");
										$("#product_img").val("");
										$("#origin_product_img").css("display",
												"block");
										$("#select_product_img").css("display",
												"none");
									} else if (img.width != 700
											|| img.height != 800) {
										alert("이미지 가로 700px, 세로 800px로 맞춰서 올려주세요.");
										$("#product_img").val("");
										$("#origin_product_img").css("display",
												"block");
										$("#select_product_img").css("display",
												"none");
									} else {
										$("#select_product_img").css("display",
												"block");
										$("#select_product_img").attr("src",
												data.target.result).width(200);
									}

								}
								reader.readAsDataURL(this.files[0]);
							}
						});

		$("#product_descImage")
				.on(
						'change',
						function() {
							if (this.files && this.files[0]) {

								var ext = $(this).val().split(".").pop()
										.toLowerCase();

								var fileSize = this.files[0].size;
								var maxSize = 2000 * 2000;

								var _URL = window.URL || window.webkitURL;
								var img = new Image();
								img.src = _URL.createObjectURL(this.files[0]);

								var reader = new FileReader;
								reader.onload = function(data) {
									//확장자 체크
									if ($.inArray(ext, [ "gif", "jpg", "jpeg",
											"png", "bmp" ]) == -1) {
										alert("gif, jpg, jpeg, png, bmp 파일만 업로드 해주세요.");
										$("#product_descImage").val("");
										$("#origin_product_descImg").css(
												"display", "block");
										$("#select_product_descImg").css(
												"display", "none");
									} else if (fileSize > maxSize) {
										alert("파일용량을 초과하였습니다.");
										$("#product_descImage").val("");
										$("#origin_product_descImg").css(
												"display", "block");
										$("#select_product_descImg").css(
												"display", "none");
									} else if (img.width != 800
											|| img.height != 2000) {
										alert("이미지 가로 800px, 세로 2000px로 맞춰서 올려주세요.");
										$("#product_descImage").val("");
										$("#origin_product_descImg").css(
												"display", "block");
										$("#select_product_descImg").css(
												"display", "none");
									} else {
										$("#select_product_descImg").css(
												"display", "block");
										$("#select_product_descImg").attr(
												"src", data.target.result)
												.width(200);
									}

								}
								reader.readAsDataURL(this.files[0]);
							}
						});

		var jsonData = JSON.parse('${categories}');

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

		//기존 카테고리 값
		var category_code = $("#category_code").val();

		for (var i = 0; i < cate1Arr.length; i++) {
			var newNode = document.createElement("option");
			newNode.value = cate1Arr[i].categoryCode;
			newNode.innerHTML = cate1Arr[i].categoryName;
			if (category_code == cate1Arr[i].categoryCode) {
				newNode.selected = "true";
			}
			cate1Select.appendChild(newNode);
		}

		changeCategory1(category_code);

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
					if (category_code2 == cate2Arr[i].categoryCode) {
						newNode.selected = "true";
					}
					cate2Select.appendChild(newNode);
				}
			}
		}
	</script>
</body>
</html>