<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
							<div class="row mx-5 my-3">
								<div class="jumbotron jumbotron-fluid w-100">
									<div class="container pl-5 ">
										<a class="text-decoration-none text-dark"
											href="${pageContext.request.contextPath}/discount/${discount.discount_id}">
											<h1 class="display-5 pb-2">${discount.discount_name}</h1>
											<p>${discount.discount_desc}</p>
											<p>
												<fmt:formatDate pattern="MM/dd"
													value="${discount.discount_start}" />
												(
												<fmt:formatDate pattern="E"
													value="${discount.discount_start}" />
												) ~
												<fmt:formatDate pattern="MM/dd"
													value="${discount.discount_end}" />
												(
												<fmt:formatDate pattern="E" value="${discount.discount_end}" />
												)
											</p>

										</a>
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="row mx-5 my-3">
								<div class="jumbotron jumbotron-fluid w-100">
									<div class="container pl-5 ">
										<h1 class="display-5 pb-2" >${discount.discount_name} - 종료</h1>
										<p>${discount.discount_desc}</p>
										<p>
											<fmt:formatDate pattern="MM/dd"
												value="${discount.discount_start}" />
											(
											<fmt:formatDate pattern="E"
												value="${discount.discount_start}" />
											) ~
											<fmt:formatDate pattern="MM/dd"
												value="${discount.discount_end}" />
											(
											<fmt:formatDate pattern="E" value="${discount.discount_end}" />
											)
										</p>
									</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</c:if>

			</c:forEach>
		</div>
	</div>
</body>
</html>