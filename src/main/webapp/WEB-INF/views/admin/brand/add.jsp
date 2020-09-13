<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자:: 브랜드 추가</title>

</head>
<body>
	<jsp:include page="../admin_header.jsp" flush="false" />

	<div class="row mt-5">
		<h3 class="col-sm-12 border-bottom p-5">브랜드 추가</h3>
		<div class="col-sm-12 p-5">
			<form action="${pageContext.request.contextPath}/admin/brand/add"
				method="post" enctype="multipart/form-data">
				<div class="col-12 border mb-5">
					<table class="table">
						<tbody>
							<tr>
								<th scope="row">브랜드명</th>
								<td class="form-inline"><input type="text"
									class="form-control" id="brand_name" name="brand_name"
									placeholder="" required="required"></td>
							</tr>
							<tr>
								<th scope="row">브랜드 대표이미지</th>
								<td><input type="file" class="form-control-file"
									id="product_img" name="file">
									<div class="select_product_img mt-3">
										<img src="">
									</div></td>
							</tr>
							<tr>
								<th scope="row">간단설명</th>
								<td><textarea class="form-control" id="brand_desc"
										name="brand_desc" rows="3" required="required"></textarea></td>
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
</body>
</html>