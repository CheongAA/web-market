<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자:: 입점 조회 /수정/삭제</title>
</head>
<body>
	<jsp:include page="../admin_header.jsp" flush="false" />
	<div class="row mt-5">
		<h3 class="w-100">입점조회 / 수정 / 삭제</h3>
		<table class="table mt-3">
			<thead>
				<tr>
					<th scope="col"></th>
					<th scope="col">브랜드명</th>
					<th scope="col">입점일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="brand" items="${brands}" varStatus="status">
					<tr>
						<td><c:out value="${status.count} " /></td>
						<td><a href="${pageContext.request.contextPath}/admin/brand/${brand.brand_id}">
								${brand.brand_name}</a>
						</td>
						<td><fmt:formatDate value="${brand.brand_created}"
									pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
</body>
</html>