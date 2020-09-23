<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<h3 class="w-100">문의</h3>
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
					<c:forEach var="question" items="${questions}" >
						<tr class="questions" id="${question.question_id }">
							<td>${question.question_id }
							</td>
							<td>${question.questionCategory.question_category_title}</td>
							<td>${question.question_title}</td>
							<td>
								<fmt:formatDate value="${question.question_created}" pattern="yyyy-MM-dd" />
							</td>
							<td>
								<c:choose>
									<c:when test="${question.answer_id eq 0}">
										<h5 class="text-danger">X</h5>
									</c:when>
									<c:otherwise>
										<h5 class="text-primary">O</h5>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
			</tbody>
		</table>
	</div>
	<nav class="col-sm-12 my-3" aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<c:if test="${pageMaker.prev}">
				<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/question?page=${pageMaker.startPage-1 }">
						<i class="fa fa-chevron-left"></i>
					</a></li>
			</c:if>
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" var="pageNum">
				<c:choose>
					<c:when test="${pageNum eq pageMaker.cri.page}">
						<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/admin/question?page=${pageNum }">
								<i class="fa">${pageNum }</i>
							</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/question?page=${pageNum }">
								<i class="fa">${pageNum }</i>
							</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
				<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/question?page=${pageMaker.endPage+1 }">
						<i class="fa fa-chevron-right"></i>
					</a></li>
			</c:if>
		</ul>
	</nav>
	<script type="text/javascript">
		$(".questions").click(function() {
			location.href = "/admin/question/" + $(this).attr('id');
		});
	</script>
</body>
</html>