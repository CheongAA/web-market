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
			<h3 class="mb-3">문의 상세</h3>
			<ul>
				<li><small> 거래 협의의 증거로 사용될 수 있는 상품 문의글이나 답변글을 삭제할 수 있도록 하면 매매 거래후 판매자와 구매자간에 분쟁이 발생할 수 있습니다.</small></li>
				<li><small> 이러한 분쟁을 미연에 방지할 수 있도록 하기 위하여 상품 문의글 및 답변글의 <span class="text-danger">수정이나 삭제가 불가능</span> 하도록 한 것이니 불편하시더라도 이해를 부탁드립니다.</small></li>
			</ul>
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