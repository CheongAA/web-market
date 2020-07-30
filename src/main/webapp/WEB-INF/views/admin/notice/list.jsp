<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자:: 공지 조회 /수정/삭제</title>
</head>
<body>
	<jsp:include page="../admin_header.jsp" flush="false" />
	<div class="row mt-5">
		<h3 class="w-100">공지조회 / 수정 / 삭제</h3>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<c:forEach var="notice" items="${notices}" varStatus="status">
								<tr>
									<td><c:out value="${status.count} " /></td>
									<td><a
										href="${pageContext.request.contextPath}/admin/notice/${notice.notice_id}">
											${notice.notice_title}</a></td>
									<td>${notice.notice_writer}</td>		
									<td><fmt:formatDate value="${notice.notice_created}"
											pattern="yyyy-MM-dd" /></td>
									<td>${notice.notice_view}</td>		
								</tr>
							</c:forEach>
					</tbody>
				</table>
	</div>
</body>
</html>