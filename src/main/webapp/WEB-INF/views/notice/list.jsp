<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Brand</title>
</head>
<body>
	<div class="row pt-5">
		<jsp:include page="notice_header.jsp" flush="false" />
		<div class="col">
			<div class="row pb-4 mb-2">
				<span class="h2">공지사항</span><span class="p-2 pb-0">마켓의 새로운
					소식들과 유용한 정보들을 한곳에서 확인하세요.</span>
			</div>
			<div class="row">
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
							<c:forEach var="notice" items="${notices}" varStatus="status">
								<tr>
									<td><c:out value="${status.count} " /></td>
									<td><a
										href="${pageContext.request.contextPath}/notice/${notice.notice_id}">
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
		</div>

	</div>
</body>
</html>