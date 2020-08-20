<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>배송지</title>
</head>
<body>
	<div class="ml-2 mt-2">
		<a href="${pageContext.request.contextPath}/user/address" class="h5"><i
			class="fas fa-arrow-left"></i></a>
		<h5 class="text-center">배송지 수정</h5>
	</div>
	<div class="p-3">
		<form action="/user/address/update" method="post">
			<input type="hidden" name="address_id" value="${address.address_id}" />
			<input type="hidden" name="user_id" value="${address.user_id}" />
			<div class="form-group">
				<label>이름</label> <input type="text" name="address_recipient"
					id="address_recipient" class="form-control" required="required"
					value="${address.address_recipient}">
			</div>
			<div class="form-group">
				<label>연락처</label> <input type="text" name="address_phone"
					id="address_phone" class="form-control" required="required"
					value="${address.address_phone}">
			</div>
			<div class="form-row">
				<label class="w-100">주소</label>
				<div class="col-8 form-group">
					<input type="text" name="address_zip" id="zip" class="form-control"
						readonly="readonly" value="${address.address_zip}">
				</div>
				<div class="col-4 form-group">
					<button type="button" class="btn btn-outline-secondary btn-block"
						id="search_zip_btn">우편번호</button>
				</div>
			</div>
			<div class="form-group">
				<input type="text" name="address_detail" id="address"
					class="form-control" readonly="readonly"
					value="${address.address_detail}">
			</div>
			<div class="form-group">
				<input type="text" name="address_detail2" id="address2"
					class="form-control" value="${address.address_detail2}">
			</div>
			<div class="form-check">
				<c:choose>
					<c:when test="${address.address_default == 1 }">
						<input class="form-check-input" type="checkbox"
							name="address_default" value="1" checked>
					</c:when>
					<c:otherwise>
						<input class="form-check-input" type="checkbox"
							name="address_default" value="1">
					</c:otherwise>
				</c:choose>
				<label class="form-check-label">기본배송지</label>
			</div>

			<div class="form-group mt-1">
				<button type="submit" class="btn btn-primary btn-block">저장</button>
			</div>
		</form>
		<a
			href="${pageContext.request.contextPath}/user/address/delete/${address.address_id}"
			class="btn btn-danger btn-block">삭제</a>
	</div>
	<!-- 다음주소 -->
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- script-->
	<script src="${pageContext.request.contextPath}/resources/js/signup.js"></script>
</body>
</html>