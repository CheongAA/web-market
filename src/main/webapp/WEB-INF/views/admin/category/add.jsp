<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자:: 카테고리</title>
</head>
<body>
	<jsp:include page="../admin_header.jsp" flush="false" />
	<div class="row mt-5">
		<h3 class="w-100">카테고리</h3>
		<div class="col">
			<table class="table mt-3">
				<thead>
					<tr>
						<th scope="col">분류</th>
						<th scope="col">카테고리명</th>
						<th scope="col"></th>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="category" items="${categories}" varStatus="status">
						<tr>
							<td>${category.category_code}</td>
							<td>
								<a href="${pageContext.request.contextPath}/admin/category/${category.category_code}"> ${category.category_name}</a>
							</td>
							<td>
								<a href="${pageContext.request.contextPath}/admin/category/delete/${category.category_code}" class="btn btn-danger btn-sm"> - </a>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col">
			<form class="m-auto" action="${pageContext.request.contextPath}/admin/category" method="post">
				<div class="form-group">
					<label class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="category_depth" value="1" checked required>
						<span class="form-check-label"> 대분류</span>
					</label>
					<label class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="category_depth" value="2" required>
						<span class="form-check-label"> 중분류</span>
					</label>
				</div>
				<div class="form-group" id="large">
					<label for="category1">대분류</label>
					<select class="form-control" name="category_code2" id="largeSelect">
						<option id="code2" selected disabled value="">선택</option>
						<c:forEach var="largeCtg" items="${categories}">
							<c:if test="${largeCtg.category_depth == 1 }">
								<option id="code2" value="${largeCtg.category_code }">${largeCtg.category_name }</option>
							</c:if>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label for="category_name">카테고리명</label>
					<input type="text" class="form-control" id="category_name" name="category_name">
				</div>
				<div class="form-group">
					<label for="category_code">코드</label>
					<input type="number" class="form-control" id="category_code" name="category_code" min="1" max="10000" required="required">
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-dark btn-block">등록</button>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		function checkDepth() {
			if ($("input:radio[name=category_depth]:checked").val() == 1) {
				$("#large").hide();
				$("#code2").attr("disabled", true);
			} else {
				$("#large").show();
				$("#code2").attr("disabled", false);
			}
		}

		$(document).ready(function() {
			checkDepth();
		})

		$("input:radio").click(function() {
			checkDepth();
		});
	</script>
</body>
</html>
