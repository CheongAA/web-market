<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자:: 고객조회</title>
</head>
<body>
	<jsp:include page="../admin_header.jsp" flush="false" />
	<div class="row mt-5">
		<h3 class="w-100">고객조회</h3>
		<ul class="list-group">
		<c:forEach var="user" items="${users}" varStatus="status">
			<li class="list-group-item "><a href="${pageContext.request.contextPath}/admin/user/${user.user_id}"><c:out value="${status.count} " />. <c:out value="ID: ${user.user_identification}, Name: ${user.user_name}" /></a></li>
		</c:forEach>
		</ul>
	</div>
</body>
</html>