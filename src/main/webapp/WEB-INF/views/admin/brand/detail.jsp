<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<jsp:include page="../admin_header.jsp" flush="false" />
	<div class="row mt-5">
		<h3 class="w-100">브랜드조회 / 수정 / 삭제</h3>
		<div class="">
			<p>"${brand.brand_id}"</p>
			<p>"${brand.brand_name}"</p>
			<p>"${brand.brand_desc}"</p>
			<a
				href="${pageContext.request.contextPath}/admin/brand/update/${brand.brand_id}">수정</a>
			<a
				href="${pageContext.request.contextPath}/admin/brand/delete/${brand.brand_id}">삭제</a>
		</div>
	</div>
</body>
</html>