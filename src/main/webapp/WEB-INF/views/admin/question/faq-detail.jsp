<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자:: FAQ</title>
</head>
<body>
	<jsp:include page="../admin_header.jsp" flush="false" />
	<div class="row mt-5">
		<div class="col-12 bg-light p-5 mt-5">
			<h3>FAQ</h3>
			<table class="table table-bordered bg-white">
				<tbody>
					<tr>
						<th scope="row" style="width: 10%" class="table-secondary">분류</th>
						<td>${answer.questionCategory.question_category_title}</td>
					</tr>
					<tr>
						<th scope="row" style="width: 10%" class="table-secondary">제목</th>
						<td>${answer.answer_title}</td>
					</tr>
					<tr>
						<th scope="row" style="width: 10%" class="table-secondary">작성일</th>
						<td><fmt:formatDate value="${answer.answer_created}"
								pattern="yyyy-MM-dd" />
					</tr>
					<tr>
						<td colspan="4">${answer.answer_content}</td>
					</tr>
				</tbody>
			</table>
			<a class="btn btn-danger float-right"
				href="${pageContext.request.contextPath}/admin/answer/delete/${answer.answer_id}">삭제</a>
			<a class="btn btn-warning float-right mr-1"
				href="${pageContext.request.contextPath}/admin/answer/update/${answer.answer_id}">수정</a>
		</div>
		<a class="btn btn-primary m-5 ml-auto"
			href="${pageContext.request.contextPath}/admin/faq">목록</a>
	</div>
</body>
</html>