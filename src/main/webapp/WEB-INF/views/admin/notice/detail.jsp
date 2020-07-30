<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<jsp:include page="../admin_header.jsp" flush="false" />
	<div class="row pt-5">
		<div class="pb-4 mb-2">
			<span class="h2">공지사항</span>
		</div>
		<table class="table table-bordered">
			<tbody>
				<tr>
					<th scope="row" style="width: 10%" class="table-secondary">제목</th>
					<td colspan="3">${notice.notice_title }</td>
				</tr>
				<tr>
					<th scope="row" class="table-secondary">작성자</th>
					<td colspan="3">${notice.notice_writer}</td>
				</tr>
				<tr>
					<th scope="row" class="table-secondary">작성일</th>
					<td style="width: 20%"><fmt:formatDate
							value="${notice.notice_created}" pattern="yyyy-MM-dd" /></td>
					<th style="width: 10%" class="table-secondary">조회수</th>
					<td>${notice.notice_view}</td>
				</tr>
				<tr>
					<td colspan="4">${notice.notice_content}</td>
				</tr>
			</tbody>
		</table>
		<div class="w-100">
			<a href="${pageContext.request.contextPath}/admin/notice"
				class="btn btn-dark float-right mx-5">목록</a> <a
				href="${pageContext.request.contextPath}/admin/notice/delete/${notice.notice_id}"
				class="btn btn-danger float-right px-5">삭제</a> <a
				href="${pageContext.request.contextPath}/admin/notice/update/${notice.notice_id}"
				class="btn btn-warning float-right px-5 mr-1">수정</a>
		</div>
	</div>
</body>
</html>