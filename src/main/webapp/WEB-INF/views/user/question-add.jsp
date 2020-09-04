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
			<h3>문의</h3>
			<div class="row mt-5">
				<form action="">
					<table class="table table-bordered">
						<tbody>
							<tr>
								<th scope="row" style="width: 30%" class="table-secondary">분류</th>
								<td colspan=""><select class="d-block m-1">
										<c:forEach var="questionCategorie"
											items="${questionCategories}">
											<option>${questionCategorie.question_category_title}</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<th scope="row" style="width: 30%" class="table-secondary">제목</th>
								<td colspan=""><input type="text"></td>
							</tr>
							<tr>
								<th scope="row" class="table-secondary">주문번호</th>
								<td colspan="3"><input type="text">
								<button class="btn btn-sm btn-primary">주문조회</button></td>
							</tr>
							<tr>
								<th scope="row" class="table-secondary">문자메시지</th>
								<td colspan="3"><input type="text"><input
									type="checkbox">답변수신을 문자메시지로 받겠습니다.</td>
							</tr>
							<tr>
								<th scope="row" class="table-secondary">내용</th>
								<td colspan="3" rowspan="10"><textarea rows="20" cols="100"></textarea></td>
							</tr>
						</tbody>
					</table>
					<button>저장</button>
				</form>
			</div>
		</div>

	</div>
</body>
</html>