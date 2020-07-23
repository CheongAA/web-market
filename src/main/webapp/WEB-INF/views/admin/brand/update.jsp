<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<h3 class="w-100 text-center border-bottom pb-5">브랜드 수정</h3>
		<form class="m-auto"
			action="${pageContext.request.contextPath}/admin/brand/update"
			method="post">
			<input type="hidden" name="brand_id" value="${brand.brand_id}" />
			<div class="form-group">
				<label for="brand_name">브랜드명</label> <input type="text"
					class="form-control" id="brand_name" name="brand_name"
					placeholder="" required="required" value="${brand.brand_name}">
			</div>

			<div class="form-group">
				<label for="brand_desc">브랜드 설명</label>
				<textarea class="form-control" id="brand_desc" name="brand_desc"
					rows="3" required="required"> <c:out
						value="${brand.brand_desc}" /> </textarea>
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-dark btn-block">등록</button>
			</div>
		</form>
	</div>
</body>
</html>