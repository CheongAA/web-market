<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자:: 할인</title>
</head>
<body>
	<jsp:include page="../admin_header.jsp" flush="false" />
	<div class="row mt-5">
		<h3 class="w-100">할인</h3>
		<table class="table mt-3">
			<thead>
				<tr>
					<th scope="col"></th>
					<th scope="col">이벤트명</th>
					<th scope="col">할인율</th>
					<th scope="col">할인시작일</th>
					<th scope="col">할인종료일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="discount" items="${discounts}" varStatus="status">
					<tr>
						<td><c:out value="${status.count} " /></td>
						<td>${discount.discount_name}</td>
						<td>${discount.discount_rate}</td>
						<td>${discount.discount_start}</td>
						<td>${discount.discount_end}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="w-100">
		<a class="float-right btn btn-primary" href="${pageContext.request.contextPath}/admin/discount">할인등록</a>
	</div>
</body>
</html>
