<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MARKET:: 이벤트</title>
</head>
<body>
	<div class="row pt-5">
		<div class="col">
			<c:forEach var="discount" items="${discounts}" varStatus="status">
				<c:if test="${discount.discount_apply !=0 }">
					<c:choose>
						<c:when test="${discount.discount_state !=0 }">
							<a class="text-decoration-none text-dark" href="${pageContext.request.contextPath}/discount/${discount.discount_id}">
								<img class="mw-100" src="${discount.discount_thumbnailImg}" alt="${discount.discount_name }" />
							</a>
						</c:when>
						<c:otherwise>
							<button class="p-0 m-0" onclick="alert('진행중인 이벤트가 아닙니다.')">
								<img class="mw-100" src="${discount.discount_thumbnailImg}" alt="${discount.discount_name }" />
							</button>
						</c:otherwise>
					</c:choose>
				</c:if>
			</c:forEach>
		</div>
	</div>
	<nav class="col-sm-12 m-3" aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<c:if test="${pageMaker.prev}">
				<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/discount?page=${pageMaker.startPage-1 }">
						<i class="fa fa-chevron-left"></i>
					</a></li>
			</c:if>
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" var="pageNum">
				<c:choose>
					<c:when test="${pageNum eq pageMaker.cri.page}">
						<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/discount?page=${pageNum }">
								<i class="fa">${pageNum }</i>
							</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/discount?page=${pageNum }">
								<i class="fa">${pageNum }</i>
							</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
				<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/discount?page=${pageMaker.endPage+1 }">
						<i class="fa fa-chevron-right"></i>
					</a></li>
			</c:if>
		</ul>
	</nav>
</body>
</html>