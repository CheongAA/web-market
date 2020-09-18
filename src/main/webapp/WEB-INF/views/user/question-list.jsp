<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지</title>
</head>
<body>
	<div class="row">
		<jsp:include page="mypage_header.jsp" flush="false" />
		<div class="col py-5 ml-5">
			<h3>문의조회</h3>
			<div class="row mt-5">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">분류</th>
							<th scope="col">제목</th>
							<th scope="col">작성일</th>
							<th scope="col">답변</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty questions}">
								<tr>
									<td colspan="5" rowspan="5">
										<h6 class="py-5 my-5 font-weight-bold text-center">문의 내역이 존재하지 않습니다.</h6>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="question" items="${questions}" varStatus="status">
									<tr class="questions" id="${question.question_id}">
										<td>${status.count}</td>
										<td>${question.questionCategory.question_category_title}</td>
										<td>
											<a>${question.question_title}</a>
										</td>
										<td>
											<fmt:formatDate value="${question.question_created}" pattern="yyyy-MM-dd" />
										</td>
										<td>
											<c:choose>
												<c:when test="${question.answer_id eq 0}">
												X
											</c:when>
												<c:otherwise>
												O
											</c:otherwise>
											</c:choose>
										</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(".questions").click(function() {
			location.href = "/user/question/" + $(this).attr('id');
		});
	</script>
</body>
</html>