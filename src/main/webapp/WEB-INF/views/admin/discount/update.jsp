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
	<div class="row mt-5">
		<h3 class="col-sm-12 border-bottom p-5">할인 이벤트 수정</h3>
		<div class="col-sm-12 p-5">
			<form
				action="${pageContext.request.contextPath}/admin/discount/update"
				method="post" enctype="multipart/form-data">
				<input type="hidden" name="discount_id" value="${discount.discount_id }">
				<div class="col-12 border mb-5">
					<table class="table">
						<tbody>
							<tr>
								<th scope="row" class="w-25">이벤트명</th>
								<td class="form-inline"><input type="text"
									class="form-control" id="discount_name" name="discount_name"
									value="${discount.discount_name }"></td>
							</tr>
							<tr>
								<th scope="row">간단설명</th>
								<td class="form-inline"><input type="text"
									class="form-control" id="discount_desc" name="discount_desc"
									value="${discount.discount_desc }"></td>
							</tr>
							<tr>
								<th scope="row">할인율 (%)</th>
								<td><input type="number" class="form-control"
									id="discount_rate" name="discount_rate" min="1" max="99"
									required="required" value="${discount.discount_rate }"></td>
							</tr>
							<tr>
								<th scope="row">이벤트 이미지 (2000px * 400px)</th>
								<td><input type="file" class="form-control-file"
									id="discount_thumbnailImg" name="file" accept="image/*">
									<div class="mt-3">
										<input type="hidden" name="discount_thumbnailImg"
											value="${discount.discount_thumbnailImg}" /> <img
											class="w-75 mb-2" src="${discount.discount_thumbnailImg}"
											id="origin_discount_img"> <img class="w-75"
											id="select_discount_img">
									</div></td>
							</tr>
							<c:set var="start">
								<fmt:formatDate value="${discount.discount_start}"
									pattern="yyyy-MM-dd" />
							</c:set>

							<c:set var="end">
								<fmt:formatDate value="${discount.discount_end}"
									pattern="yyyy-MM-dd" />
							</c:set>
							<tr>
								<th scope="row">할인시작일</th>
								<td><input type="date" name="discount_start"
									class="form-control" placeholder="" required="required"
									value="${start }"></td>
							</tr>
							<tr>
								<th scope="row">할인종료일</th>
								<td><input type="date" name="discount_end"
									class="form-control" placeholder="" required="required"
									value="${end }"></td>
							</tr>
							<tr>
								<th scope="row">이벤트 품목 (다중선택 가능)</th>
								<td><select class="form-control" id="select_product_list"
									multiple>
										<c:forEach var="product" items="${products}">
											<c:if
												test="${product.discount_id == 0 or product.discount_id == discount.discount_id}">
												<option value="${product.product_id}">[${product.brand.brand_name}]${product.product_name}</option>
											</c:if>
										</c:forEach>
								</select>
									<button type="button" class="btn btn-block btn-secondary my-2"
										id="select_product_btn">선택</button></td>
							</tr>
							<tr>
								<th scope="row">선택된 상품</th>
								<td><div id="select_product" class="d-block">
										<c:forEach var="product" items="${products}">
											<c:if
												test="${product.discount_id == discount.discount_id}">
												<input type="hidden" value="${product.product_id}" name="product[]"/>
												<p>[${product.brand.brand_name}]${product.product_name}</p>
											</c:if>
										</c:forEach>
									</div></td>
							</tr>
							<tr>
								<th scope="row">본문설명</th>
								<td><textarea class="form-control"
										id="discount_explanation" name="discount_explanation"
										rows="10" required="required">${discount.discount_explanation}</textarea></td>
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
	<script type="text/javascript">
		$("#discount_thumbnailImg")
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
										hideImg();
									} else if (fileSize > maxSize) {
										alert("파일용량을 초과하였습니다.");
										hideImg();
									} else if (img.width != 2000
											|| img.height != 400) {
										alert("이미지 가로 2000px, 세로 400px로 맞춰서 올려주세요.");
										hideImg();
									} else {
										$("#select_discount_img").css(
												"display", "block");
										$("#select_discount_img").attr("src",
												data.target.result).width(200);
									}

								}
								reader.readAsDataURL(this.files[0]);
							}
						});

		function hideImg() {
			$("#discount_thumbnailImg").val("");
			$("#origin_discount_img").css("display", "block");
			$("#select_discount_img").css("display", "none");
		}
		
		$("#select_product_btn").on("click",function(){
			$("#select_product").empty();
			var products = $("#select_product_list option:selected");
			
			for (var i = 0; i < products.length; i++) {
				var newNode = document.createElement("p");
				newNode.innerHTML = products[i].innerHTML;
				$("#select_product").append(newNode);
				
				var hiddenNode = document.createElement("input");
				hiddenNode.setAttribute("type", "hidden");
				hiddenNode.setAttribute("name", "product[]");
				hiddenNode.setAttribute("value", parseInt(products[i].value));
				$("#select_product").append(hiddenNode);
			}
		})
	</script>
</body>
</html>