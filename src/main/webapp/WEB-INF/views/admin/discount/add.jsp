<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<h3 class="col-sm-12 border-bottom p-5">할인 이벤트 등록</h3>
		<div class="col-sm-12 p-5">
			<form action="${pageContext.request.contextPath}/admin/discount" method="post" enctype="multipart/form-data">
				<div class="col-12 border mb-5">
					<table class="table">
						<tbody>
							<tr>
								<th scope="row" class="w-25">이벤트명</th>
								<td class="form-inline">
									<input type="text" class="form-control w-100" id="discount_name"  name="discount_name" maxlength="10" placeholder="10자 이하로 입력해주세요"  required>
								</td>
							</tr>
							<tr>
								<th scope="row">간단설명</th>
								<td class="form-inline">
									<input type="text" class="form-control w-100" id="discount_desc" name="discount_desc" maxlength="50" placeholder="50자 이하로 입력해주세요"  required>
								</td>
							</tr>
							<tr>
								<th scope="row">할인율 (%)</th>
								<td>
									<input type="number" class="form-control" id="discount_rate" name="discount_rate" min="1" max="99" required>
								</td>
							</tr>
							<tr>
								<th scope="row">이벤트 이미지 (2000px * 400px)</th>
								<td>
									<input type="file" class="form-control-file" id="discount_thumbnailImg" name="file" accept="image/*" required>
									<div class="mt-3">
										<img class="w-75" id="select_discount_img">
									</div>
								</td>
							</tr>
							<c:set var="today">
								<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd" />
							</c:set>
							<tr>
								<th scope="row">할인시작일</th>
								<td>
									<input type="date" name="discount_start" class="form-control" id="discount_start" min="${today}" required >
								</td>
							</tr>
							<tr>
								<th scope="row">할인종료일</th>
								<td>
									<input type="date" name="discount_end" class="form-control" id="discount_end" required>
								</td>
							</tr>
							<tr>
								<th scope="row">이벤트 품목</th>
								<td>
									<select class="form-control" id="select_product_list" multiple>
										<c:forEach var="product" items="${products}">
											<c:if test="${product.discount_id == 0 }">
												<option value="${product.product_id}">[${product.brand.brand_name}]${product.product_name}</option>
											</c:if>
										</c:forEach>
									</select>
									<small class="text-success">상품 다중선택이 가능합니다.</small>
								</td>
							</tr>
							<tr>
								<th scope="row">선택된 상품</th>
								<td>
									<div id="select_product" class="d-block"></div>
								</td>
							</tr>
							<tr>
								<th scope="row">본문설명</th>
								<td>
									<textarea class="form-control" id="discount_explanation" name="discount_explanation" rows="10" maxlength="200" placeholder="200자 이하로 입력해주세요"  required></textarea>
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
	<script type="text/javascript">
		//이벤트 종료일 MIN 설정
		$("#discount_start").on('change',function(){
			$("#discount_end").prop('min',$("#discount_start").val());
		})
		
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
			$("#select_discount_img").css("display", "none");
		}
		
		$("#select_product_list").on('change',function() {
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