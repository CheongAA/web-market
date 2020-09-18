<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자:: FAQ 관리</title>
</head>
<body>
	<jsp:include page="../admin_header.jsp" flush="false" />
	<div class="row mt-5">
		<h3 class="col-sm-12">FAQ 관리</h3>
		<table class="table table-hover text-center">
			<thead>
				<tr>
					<th></th>
					<th>카테고리</th>
					<th>제목</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="answer" items="${answers}" varStatus="status">
					<c:if test="${answer.question_category_id != 0}">
						<tr class="rows" id="${answer.answer_id}">
							<td>${status.count}</td>
							<td>${answer.questionCategory.question_category_title}</td>
							<td>${answer.answer_title}</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
		<div class="col-sm-12 my-5">
			<a href="${pageContext.request.contextPath}/admin/answer/add/0" class="btn btn-primary float-right px-5 mr-1">등록</a>
		</div>
	</div>
	<script type="text/javascript">
		$(".rows").click(function() {
			location.href = "/admin/faq/" + $(this).attr('id');
		});
	</script>
</body>
</html>