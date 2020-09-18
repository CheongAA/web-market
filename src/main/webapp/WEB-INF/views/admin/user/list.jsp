<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<table class="table table-hover text-center mt-3">
			<thead>
				<tr>
					<th></th>
					<th>고객ID</th>
					<th>고객명</th>
					<th>가입일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${users}" varStatus="status">
					<tr class="rows" id="${user.user_id }">
						<td>${status.count}</td>
						<td>${user.user_identification}</td>
						<td>${user.user_name }</td>
						<td>
							<fmt:formatDate value="${user.user_created}" pattern="yyyy-MM-dd" />
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script type="text/javascript">
		$(".rows").click(function() {
			location.href = "/admin/user/" + $(this).attr('id');
		});
	</script>
</body>
</html>