<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자:: 브랜드 수정</title>

</head>
<body>
	<jsp:include page="../admin_header.jsp" flush="false" />
	<div class="row mt-5">
		<h3 class="col-sm-12 border-bottom p-5">브랜드 수정</h3>
		<div class="col-sm-12 p-5">
			<form action="${pageContext.request.contextPath}/admin/brand/update" method="post" enctype="multipart/form-data">
				<input type="hidden" name="brand_id" value="${brand.brand_id }">
				<div class="col-12 border mb-5">
					<table class="table">
						<tbody>
							<tr>
								<th class="w-25" scope="row">브랜드명</th>
								<td class="form-inline">
									<input type="text" class="form-control" id="brand_name" name="brand_name" required="required" value="${brand.brand_name }">
								</td>
							</tr>
							<tr>
								<th scope="row">브랜드 대표이미지(2000px * 400px)</th>
								<td>
									<input type="file" class="form-control-file" id="brand_img" name="file" accept="image/*">
									<div class="select_brand_img mt-3">
										<input type="hidden" name="brand_img" value="${brand.brand_img}" />
										<img class="w-75 mb-2" src="${brand.brand_img}" id="origin_brand_img">
										<img class="w-75" id="select_brand_img">
									</div>
							</tr>
							<tr>
								<th scope="row">간단설명</th>
								<td>
									<textarea class="form-control" id="brand_desc" name="brand_desc" rows="3" required="required">${brand.brand_desc }</textarea>
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
		$("#brand_img")
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
										$("#select_brand_img").css("display",
												"block");
										$("#select_brand_img").attr("src",
												data.target.result).width(200);
									}

								}
								reader.readAsDataURL(this.files[0]);
							}
						});

		function hideImg() {
			$("#brand_img").val("");
			$("#origin_brand_img").css("display", "block");
			$("#select_brand_img").css("display", "none");
		}
	</script>
</body>
</html>