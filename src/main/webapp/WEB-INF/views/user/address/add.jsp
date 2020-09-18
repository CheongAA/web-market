<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<a href="${pageContext.request.contextPath}/user/address" class="h5">
			<i class="fas fa-arrow-left"></i>
		</a>
		<h5 class="text-center">배송지 추가</h5>
	</div>
	<div class="p-5">
		<form action="/user/address" method="post">
			<input type="hidden" name="user_id" value="${user.user_id}" />
			<div class="form-group">
				<label>이름</label>
				<input type="text" name="address_recipient" id="address_recipient" class="form-control" required="required">
			</div>
			<div class="form-group">
				<label>연락처</label>
				<input type="text" name="address_phone" id="address_phone" class="form-control" required="required">
			</div>
			<div class="form-row">
				<label class="w-100">주소</label>
				<div class="col-8 form-group">
					<input type="text" name="address_zip" id="zip" class="form-control" readonly="readonly">
				</div>
				<div class="col-4 form-group">
					<button type="button" class="btn btn-outline-secondary btn-block" id="search_zip_btn">우편번호</button>
				</div>
			</div>
			<div class="form-group">
				<input type="text" name="address_detail" id="address" class="form-control" readonly="readonly">
				<small id="guide" class="form-text text-muted"></small>
			</div>
			<div class="form-group">
				<input type="text" name="address_detail2" id="address2" class="form-control">
				<small class="form-text text-danger" id="validation_address2"></small>
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary btn-block">추가</button>
			</div>
		</form>
	</div>
	<!-- 다음주소 -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- script-->
	<script src="${pageContext.request.contextPath}/resources/js/signup.js"></script>
</body>
</html>