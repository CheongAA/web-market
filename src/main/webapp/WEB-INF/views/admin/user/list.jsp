<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<table class="table mt-3">
			<thead>
				<tr>
					<th scope="col"></th>
					<th scope="col">고객ID</th>
					<th scope="col">고객명</th>
					<th scope="col">가입일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${users}" varStatus="status">
					<tr>
						<td><c:out value="${status.count} " /></td>
						<td><a
							href="${pageContext.request.contextPath}/admin/user/${user.user_id}">
								${user.user_identification}</a></td>
						<td>${user.user_name }</td>
						<td><fmt:formatDate value="${user.user_created}"
								pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
</body>
</html>