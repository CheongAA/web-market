<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자:: 카테고리명 수정</title>

</head>
<body>
	<jsp:include page="../admin_header.jsp" flush="false" />
	<div class="row mt-5">
		<h3 class="w-100 text-center border-bottom pb-5">카테고리명 수정</h3>
		<form class="m-auto" action="${pageContext.request.contextPath}/admin/category/update" method="post">
			<input type="hidden" name="category_code" value="${category.category_code}" />
			<div class="form-group">
				<label for="category_name">카테고리명</label>
				<input type="text" class="form-control" id="category_name" name="category_name"  maxlength="10" required="required" value="${category.category_name}">
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-dark btn-block">등록</button>
			</div>
		</form>
	</div>
</body>
</html>