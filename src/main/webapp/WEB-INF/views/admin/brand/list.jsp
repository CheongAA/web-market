<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자:: 입점관리</title>
</head>
<body>
	<jsp:include page="../admin_header.jsp" flush="false" />
	<div class="row mt-5">
		<h3 class="w-100">입점관리</h3>
		<table class="table table-hover mt-3">
			<thead>
				<tr>
					<th scope="col"></th>
					<th scope="col">브랜드명</th>
					<th scope="col">입점일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="brand" items="${brands}" varStatus="status">
					<tr class="rows" id="${brand.brand_id}">
						<td>${status.count}</td>
						<td>${brand.brand_name}</td>
						<td>
							<fmt:formatDate value="${brand.brand_created}" pattern="yyyy-MM-dd" />
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
	<script type="text/javascript">
		$(".rows").click(function() {
			location.href = "/admin/brand/" + $(this).attr('id');
		});
	</script>
</body>
</html>