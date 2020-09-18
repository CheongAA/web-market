<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<div class="bg-light p-5">
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
							<td style="width: 10%">
								<fmt:formatDate value="${question.question_created}" pattern="yyyy-MM-dd" />
							</td>
							<th style="width: 10%" class="table-secondary">주문</th>
							<td></td>
						</tr>
						<tr>
							<th scope="row" class="table-secondary">상품명</th>
							<td style="width: 10%">${question.product.product_name}</td>
							<th style="width: 10%" class="table-secondary">핸드폰</th>
							<td>${question.question_phone}</td>
						</tr>
						<tr>
							<td colspan="4">${question.question_content}</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="bg-light p-5 mt-5">
				<h3>A 답변</h3>
				<c:choose>
					<c:when test="${question.answer_id eq 0}">
						<h5>상담사가 빠르게 확인 후 답변드리도록 하겠습니다.</h5>

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
									<td>
										<fmt:formatDate value="${question.answer.answer_created}" pattern="yyyy-MM-dd" />
								</tr>
								<tr>
									<td colspan="4">${question.answer.answer_content}</td>
								</tr>
							</tbody>
						</table>
					</c:otherwise>
				</c:choose>
			</div>
			<a class="btn btn-primary m-5 float-right" href="${pageContext.request.contextPath}/user/question">목록</a>
		</div>
	</div>
</body>
</html>