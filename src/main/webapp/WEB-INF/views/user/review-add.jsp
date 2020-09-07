<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<h3>구매후기 쓰기</h3>
			<div class="row justify-content-center mt-5">
				<div class="row border-bottom">
					<div class="col-sm-8 p-3 m-2">
						<div class="row m-3">
							<img alt="" src="${product.product_thumbnailImg}"
								class="col-4 w-25 h-75 mr-3">
							<div class="col-5 mt-5">
								<h5>${product.product_name}</a>
								</h5>
								<p>
									<fmt:formatNumber pattern="###,###,###"
										value="${product_price}" />원 
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<form>
				<table class="table table-bordered">
					<tbody>
						<tr>
							<th scope="row" style="width: 10%" class="table-secondary">제목
								*</th>
							<td><select class="mb-2" name="question_category_id"
								class="form-control">
									<c:forEach var="questionCategorie"
										items="${questionCategories}">
										<option value="${questionCategorie.question_category_id}">${questionCategorie.question_category_title}</option>
									</c:forEach>
							</select><input type="text" name="question_title"
								class="form-control col-sm-5" required></td>
						</tr>
						<tr>
							<th scope="row" class="table-secondary">주문번호</th>
							<td class="form-inline"><input type="text"
								class="form-control col-sm-5 mr-3" name="order_id" readonly>
								<button type="button" class="btn btn-sm btn-secondary"
									data-toggle="modal" data-target="#orderlist">주문조회</button></td>
						</tr>
						<tr>
							<th scope="row" class="table-secondary">핸드폰번호</th>
							<td class="form-inline"><input type="text"
								class="form-control col-sm-5 mr-3" name="question_phone">
								번호를 입력하면 문자메시지로 답변이 전송됩니다.</td>
						</tr>
						<tr>
							<th scope="row" class="table-secondary">내용 *</th>
							<td colspan="3" rowspan="10"><textarea class="form-control"
									rows="20" cols="100" name="question_content" required></textarea></td>
						</tr>
					</tbody>
				</table>
				<button type="submit" class="btn btn-primary float-right">저장</button>
			</form>
		</div>

	</div>
</body>
</html>