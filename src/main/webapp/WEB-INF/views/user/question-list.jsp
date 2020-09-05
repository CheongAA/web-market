<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<table class="table">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">분류</th>
							<th scope="col">제목</th>
							<th scope="col">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty questions}">
								<tr>
									<td colspan="4" rowspan="4">
										<h6 class="py-5 my-5 font-weight-bold">문의 내역이 존재하지 않습니다.</h6>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="question" items="${questions}"
									varStatus="status">
									<tr>
										<td><c:out value="${status.count} " /></td>
										<td></td>
										<td><a>${question.question_title}</a></td>
										<td><fmt:formatDate value="${question.question_created}"
												pattern="yyyy-MM-dd" /></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>

	</div>
</body>
</html>