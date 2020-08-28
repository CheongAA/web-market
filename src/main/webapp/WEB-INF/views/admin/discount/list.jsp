<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자:: 이벤트</title>
</head>
<body>
	<jsp:include page="../admin_header.jsp" flush="false" />
	<div class="row mt-5">
		<h3 class="w-100">이벤트</h3>
		<table class="table mt-3">
			<thead>
				<tr>
					<th scope="col"></th>
					<th scope="col">이벤트명</th>
					<th scope="col">할인율</th>
					<th scope="col">시작일</th>
					<th scope="col">종료일</th>
					<th scope="col">상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="discount" items="${discounts}" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td><a href="${pageContext.request.contextPath}/admin/discount/${discount.discount_id}">${discount.discount_name}</a></td>
						<td>${discount.discount_rate}%</td>
						<td><c:set var="start">
								<fmt:formatDate pattern="yyyy/MM/dd"
									value="${discount.discount_start}" />
							</c:set>${start }</td>
						<td><c:set var="end">
								<fmt:formatDate pattern="yyyy/MM/dd"
									value="${discount.discount_end}" />
							</c:set>${end }</td>
						<c:set var="today">
							<fmt:formatDate value="<%=new java.util.Date()%>"
								pattern="yyyy/MM/dd" />
						</c:set>
						<td><c:choose>
								<c:when test="${today ge start and today le end}">
									<p class="text-primary">O</p>
								</c:when>
								<c:otherwise>
									<p class="text-danger">X</p>
								</c:otherwise>
							</c:choose></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="w-100">
		<a class="float-right btn btn-primary"
			href="${pageContext.request.contextPath}/admin/discount">할인등록</a>
	</div>
</body>
</html>
