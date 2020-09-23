<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자:: 공지 관리</title>
</head>
<body>
	<jsp:include page="../admin_header.jsp" flush="false" />
	<div class="row mt-5">
		<h3 class="w-100">공지관리</h3>
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col"></th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
					<th scope="col">조회수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<c:forEach var="notice" items="${notices}" >
						<tr class="rows" id="${notice.notice_id}">
							<td>${notice.notice_id}</td>
							<td>${notice.notice_title}</td>
							<td>${notice.notice_writer}</td>
							<td>
								<fmt:formatDate value="${notice.notice_created}" pattern="yyyy-MM-dd" />
							</td>
							<td>${notice.notice_view}</td>
						</tr>
					</c:forEach>
			</tbody>
		</table>
		<nav class="col-sm-12 m-3" aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<c:if test="${pageMaker.prev}">
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/notice?page=${pageMaker.startPage-1 }">
							<i class="fa fa-chevron-left"></i>
						</a></li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" var="pageNum">
					<c:choose>
						<c:when test="${pageNum eq pageMaker.cri.page}">
							<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/admin/notice?page=${pageNum }">
									<i class="fa">${pageNum }</i>
								</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/notice?page=${pageNum }">
									<i class="fa">${pageNum }</i>
								</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/notice?page=${pageMaker.endPage+1 }">
							<i class="fa fa-chevron-right"></i>
						</a></li>
				</c:if>
			</ul>
		</nav>
	</div>
	<script type="text/javascript">
		$(".rows").click(function() {
			location.href = "/admin/notice/" + $(this).attr('id');
		});
	</script>
</body>
</html>