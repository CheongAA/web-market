<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자:: 상품조회/수정/삭제</title>
</head>
<body>
	<jsp:include page="../admin_header.jsp" flush="false" />
	<div class="row mt-5">
		<h3 class="w-100">상품조회 / 수정 / 삭제</h3>
		<ul class="list-group">
		<c:forEach var="product" items="${products}" varStatus="status">
			<li class="list-group-item "><a><c:out value="${status.count}" />. <c:out value="${product.product_name}" /></a></li>
		</c:forEach>
		</ul>
	</div>
</body>
</html>