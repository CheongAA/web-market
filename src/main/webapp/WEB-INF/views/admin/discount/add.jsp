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
		<h3 class="col-sm-12 border-bottom p-5">할인 이벤트 등록</h3>
		<div class="col-sm-12 p-5">
			<form action="${pageContext.request.contextPath}/admin/discount"
				method="post" enctype="multipart/form-data">
				<div class="col-12 border mb-5">
					<table class="table">
						<tbody>
							<tr>
								<th scope="row">이벤트명</th>
								<td class="form-inline"><input type="text"
									class="form-control" id="discount_name" name="discount_name"></td>
							</tr>
							<tr>
								<th scope="row">간단설명</th>
								<td class="form-inline"><input type="text"
									class="form-control" id="discount_desc" name="discount_desc"></td>
							</tr>
							<tr>
								<th scope="row">할인율 (%)</th>
								<td><input type="number" class="form-control"
									id="discount_rate" name="discount_rate" min="1" max="99"
									required="required"></td>
							</tr>
							<tr>
								<th scope="row">이벤트 이미지</th>
								<td><input type="file" class="form-control"
									id="discount_thumbnailImg" name="discount_thumbnailImg">
									<div class="select_product_img mt-3">
										<img src="">
									</div></td>
							</tr>
							<tr>
								<th scope="row">할인시작일</th>
								<td><input type="date" name="discount_start"
									class="form-control" placeholder="" required="required"></td>
							</tr>
							<tr>
								<th scope="row">할인종료일</th>
								<td><input type="date" name="discount_end"
									class="form-control" placeholder="" required="required">
								</td>
							</tr>
							<tr>
								<th scope="row">이벤트 품목 (다중선택 가능)</th>
								<td><select name="product[]" class="form-control" multiple>
										<c:forEach var="product" items="${products}">
											<option value="${product.product_id}">[${product.brand.brand_name}]
												${product.product_name}</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<th scope="row">본문설명</th>
								<td><textarea class="form-control"
										id="discount_explanation" name="discount_explanation"
										rows="10" required="required"></textarea></td>
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