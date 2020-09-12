<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자:: 문의</title>
</head>
<body>
	<jsp:include page="../admin_header.jsp" flush="false" />
	<div class="row mt-5">
		<h3 class="w-100">문의 </h3>
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">분류</th>
							<th scope="col">제목</th>
							<th scope="col">작성일</th>
							<th scope="col">답변여부</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<c:forEach var="question" items="${questions}" varStatus="status">
								<tr class="questions" id="${question.question_id }">
									<td><c:out value="${status.count} " /></td>
									<td>${question.questionCategory.question_category_title}</td>
									<td>${question.question_title}</td>		
									<td><fmt:formatDate value="${question.question_created}"
											pattern="yyyy-MM-dd" /></td>
									<td><c:choose>
											<c:when test="${question.answer_id eq 0}">
												<h5 class="text-danger">X</h5>
											</c:when>
											<c:otherwise>
												<h5 class="text-primary">O</h5>
											</c:otherwise>
										</c:choose></td>		
								</tr>
							</c:forEach>
					</tbody>
				</table>
	</div>
	<script type="text/javascript">
	$(".questions").click(function() {
		   location.href = "/admin/question/"+$(this).attr('id');
		});
	</script>
</body>
</html>