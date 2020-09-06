<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자:: 문의</title>
</head>
<body>
	<jsp:include page="../admin_header.jsp" flush="false" />
	<div class="row mt-5">
		<div class="col-12 bg-light p-5">
			<h3>Q 문의</h3>
			<table class="table table-bordered bg-white">
				<tbody>
					<tr>
						<th style="width: 10%" scope="row" class="table-secondary">분류</th>
						<td style="width: 20%">${question.questionCategory.question_category_title }</td>
						<th style="width: 10%" class="table-secondary">제목</th>
						<td>${question.question_title}</td>
					</tr>
					<tr>
						<th scope="row" class="table-secondary">작성일</th>
						<td style="width: 10%"><fmt:formatDate
								value="${question.question_created}" pattern="yyyy-MM-dd" /></td>
						<th style="width: 10%" class="table-secondary">주문</th>
						<td><c:choose>
								<c:when test="${question.order_id eq 0}">
												주문에 관한 문의가 아닙니다.
											</c:when>
								<c:otherwise>
									<a
										href="${pageContext.request.contextPath}/admin/order/${question.order_id}">${question.order_id}</a>
								</c:otherwise>
							</c:choose></td>
					</tr>
					<tr>
						<th scope="row" class="table-secondary">상품명</th>
						<td style="width: 10%"><c:choose>
								<c:when test="${question.product_id eq 0}">
												상품에 관한 문의가 아닙니다.
											</c:when>
								<c:otherwise>
									<a
										href="${pageContext.request.contextPath}/admin/product/${question.product.product_id}">${question.product.product_name}</a>
								</c:otherwise>
							</c:choose></td>
						<th style="width: 10%" class="table-secondary">핸드폰</th>
						<td>${question.question_phone}</td>
					</tr>
					<tr>
						<td colspan="4">${question.question_content}</td>
					</tr>
				</tbody>
			</table>
		</div>

		<div class="col-12 bg-light p-5 mt-5">
			<h3>A 답변</h3>
			<c:choose>
				<c:when test="${question.answer_id eq 0}">
					<h5 class="text-center">답변을 작성해주세요.</h5>
					<a class="btn btn-primary float-right"
						href="${pageContext.request.contextPath}/admin/answer/add/${question.question_id}">등록</a>
				</c:when>
				<c:otherwise>
					<table class="table table-bordered bg-white">
						<tbody>
							<tr>
								<th scope="row" style="width: 10%" class="table-secondary">분류</th>
								<td>${question.questionCategory.question_category_title}</td>
							</tr>
							<tr>
								<th scope="row" style="width: 10%" class="table-secondary">제목</th>
								<td>${question.answer.answer_title}</td>
							</tr>
							<tr>
								<th scope="row" style="width: 10%" class="table-secondary">작성일</th>
								<td><fmt:formatDate
										value="${question.answer.answer_created}" pattern="yyyy-MM-dd" />
							</tr>
							<tr>
								<td colspan="4">${question.answer.answer_content}</td>
							</tr>
						</tbody>
					</table>
					<a class="btn btn-danger float-right"
						href="${pageContext.request.contextPath}/admin/answer/delete/${question.answer_id}">삭제</a>
					<a class="btn btn-warning float-right mr-1"
						href="${pageContext.request.contextPath}/admin/answer/update">수정</a>
				</c:otherwise>
			</c:choose>
		</div>
		<a class="btn btn-primary m-5 ml-auto"
			href="${pageContext.request.contextPath}/admin/question">목록</a>
	</div>
</body>
</html>