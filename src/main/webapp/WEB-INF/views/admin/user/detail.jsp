<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<jsp:include page="../admin_header.jsp" flush="false" />
	<div class="row mt-5">
		<h3 class="col-sm-12 m-3">고객조회</h3>
		<div class="col-sm-6">
			<table class="table">
				<tbody>
					<tr>
						<th style="width: 40%">고객번호</th>
						<td>${user.user_id}</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>${user.user_identification}</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${user.user_name}</td>
					</tr>
					<tr>
						<th style="width: 40%">가입일</th>
						<td><fmt:formatDate value="${user.user_created}"
								pattern="yyyy-MM-dd" /></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="col-sm-6">
			<table class="table">
				<tbody>
					<tr>
						<th style="width: 40%">이메일</th>
						<td>${user.user_email}</td>
					</tr>
					<tr>
						<th>생일</th>
						<td>${user.user_birth}</td>
					</tr>
					<tr>
						<th>성별</th>
						<td>${user.user_gender}</td>
					</tr>
					<tr>
						<th style="width: 40%">핸드폰번호</th>
						<td>${user.user_phone }</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="col-sm-12">
		<a href="${pageContext.request.contextPath}/admin/user"
			class="btn btn-dark float-right mx-5">목록</a>
	</div>
</body>
</html>