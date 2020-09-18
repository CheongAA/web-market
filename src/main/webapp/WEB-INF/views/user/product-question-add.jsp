<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>MARKET:: 상품문의</title>
</head>
<body>
	<div class="row">
		<div class="col py-5">
			<div>
				<h5>PRODUCT Q&A</h5>
				<ul>
					<li>상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</li>
					<li>배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이페이지 내 <a href="${pageContext.request.contextPath}/user/question/add">1:1 문의</a>에 남겨주세요.
					</li>
				</ul>
			</div>
			<div class="mt-5">
				<form action="/user/question" method="post">
					<input type="hidden" name="question_category_id" value="${category.question_category_id}">
					<input type="hidden" name="product_id" value="${product.product_id}">
					<table class="table table-bordered">
						<tbody>
							<tr>
								<th scope="row" style="width: 10%" class="table-secondary">제목 *</th>
								<td>
									<input type="text" class="form-control col-sm-5" value="${category.question_category_title}" readonly>
									<input type="text" name="question_title" class="form-control col-sm-5" required>
								</td>
							</tr>
							<tr>
								<th scope="row" class="table-secondary">상품명 *</th>
								<td class="form-inline">
									<input type="text" class="form-control col-sm-5 mr-3" value="${product.product_name }" readonly>
								</td>
							</tr>
							<tr>
								<th scope="row" class="table-secondary">핸드폰번호</th>
								<td class="form-inline">
									<input type="text" class="form-control col-sm-5 mr-3" name="question_phone">
									번호를 입력하면 문자메시지로 답변이 전송됩니다.
								</td>
							</tr>
							<tr>
								<th scope="row" class="table-secondary">내용 *</th>
								<td colspan="3" rowspan="10">
									<textarea class="form-control" rows="20" cols="100" name="question_content" required></textarea>
								</td>
							</tr>
						</tbody>
					</table>
					<button type="submit" class="btn btn-primary btn-lg float-right">저장</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>