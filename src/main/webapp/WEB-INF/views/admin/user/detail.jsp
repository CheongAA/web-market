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
		<h3 class="w-100">고객조회</h3>
		<div class="">
			<p>"${user.user_id}"</p>
			<p>"${user.user_identification}"</p>
			<p>"${user.user_name}"</p>
		</div>
	</div>
	<div class="w-100">
		<a href="${pageContext.request.contextPath}/admin/user"
			class="btn btn-dark float-right mx-5">목록</a>
	</div>
</body>
</html>