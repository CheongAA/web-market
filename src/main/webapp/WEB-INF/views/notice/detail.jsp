<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row pt-5">
		<div class="pb-4 mb-2">
			<span class="h2">공지사항</span><span class="p-2 pb-0">마켓의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</span>
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
					<td style="width: 20%">
						<fmt:formatDate value="${notice.notice_created}" pattern="yyyy-MM-dd" />
					</td>
					<th style="width: 10%" class="table-secondary">조회수</th>
					<td>${notice.notice_view}</td>
				</tr>
				<tr>
					<td colspan="4">${notice.notice_content}</td>
				</tr>
			</tbody>
		</table>
		<div class="w-100">
			<a href="${pageContext.request.contextPath}/notice" class="btn btn-dark btn-lg float-right ">목록</a>
		</div>
	</div>
</body>
</html>