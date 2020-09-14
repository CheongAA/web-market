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
		<h3 class="w-100 text-center border-bottom pb-5">답변 등록하기</h3>
		<c:if test="${question != null }">
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
		</c:if>

		<div class="col-12 mt-5">
			<form action="/admin/answer" method="post">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<th scope="row" style="width: 10%" class="table-secondary">제목
								*</th>
							<td><c:if test="${questionCategories != null}">
									<select class="mb-2" name="question_category_id"
										class="form-control">
										<c:forEach var="questionCategory"
											items="${questionCategories}">
											<option value="${questionCategory.question_category_id}">${questionCategory.question_category_title}</option>
										</c:forEach>
									</select>
								</c:if> <c:choose>
									<c:when test="${question eq null }">
										<input type="text" name="answer_title"
											class="form-control col-sm-5" required>
										<input type="hidden" name="question_id"
											value="0">
									</c:when>
									<c:otherwise>
										<input type="hidden" name="question_id"
											value="${question.question_id}">
										<input type="text" name="answer_title"
											class="form-control col-sm-5"
											value="Re: ${question.question_title} " readonly required>
									</c:otherwise>
								</c:choose></td>
						</tr>
						<tr>
							<th scope="row" class="table-secondary">내용 *</th>
							<td colspan="3" rowspan="10"><textarea class="form-control"
									rows="20" cols="100" name="answer_content" required></textarea></td>
						</tr>
					</tbody>
				</table>
				<button type="submit" class="btn btn-primary float-right">저장</button>
			</form>
		</div>
	</div>
</body>
</html>