<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				<span class="h2">공지사항</span><span class="p-2 pb-0">마켓의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</span>
			</div>
			<div class="row">
				<table class="table table-borderless table-hover text-center" style="table-layout: fixed">
					<thead>
						<tr class="border-bottom">
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="notice" items="${notices}" varStatus="status">
							<tr class="rows border-bottom" id="${notice.notice_id}">
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
			</div>
		</div>
		<nav class="col-sm-12 m-3" aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<c:if test="${pageMaker.prev}">
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/notice?page=${pageMaker.startPage-1 }">
							<i class="fa fa-chevron-left"></i>
						</a>
					</li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" var="pageNum">
					<c:choose>
						<c:when test="${pageNum eq pageMaker.cri.page}">
							<li class="page-item active">
								<a class="page-link" href="${pageContext.request.contextPath}/notice?page=${pageNum }">
									<i class="fa">${pageNum }</i>
								</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
								<a class="page-link" href="${pageContext.request.contextPath}/notice?page=${pageNum }">
									<i class="fa">${pageNum }</i>
								</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/notice?page=${pageMaker.endPage+1 }">
							<i class="fa fa-chevron-right"></i>
						</a>
					</li>
				</c:if>
			</ul>
		</nav>
	</div>
	<script type="text/javascript">
		$(".rows").click(function() {
			location.href = "/notice/" + $(this).attr('id');
		});
	</script>
</body>
</html>