<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- custom CSS -->
<title>주문</title>
</head>
<body>
	<div class="m-5">
		<div class="row text-center">
			<h2 class="w-100">주문서</h2>
			<small class="w-100">주문하실 상품명 및 수량을 정확하게 확인해 주세요.</small>
		</div>
		<div class="row p-5">
			<h4>상품 정보</h4>
			<hr />
			<table class="table text-center">
				<thead>
					<tr>
						<th class="w-75">상품정보</th>
						<th>상품금액</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${product.product_name}</td>
						<td>${product.product_price}</td>
					</tr>
				</tbody>
			</table>
		</div>

		<form action="/order/${product.product_id}" method="post">
			<div class="form-row p-5">
				<h4 class="w-100">주문자 정보</h4>
				<div class="row w-100">
					<div class="col-4 form-group">
						<label class="w-100">보내는분*</label>
					</div>
					<div class="col-8 form-group">
						<input type="text" class="form-control">
					</div>
				</div>
				<div class="row">
					<div class="col-4 form-group">
						<label class="w-100">보내는분*</label>
					</div>
					<div class="col-8 form-group">
						<input type="text" class="form-control">
					</div>
				</div>
				<div class="row">
					<div class="col-4 form-group">
						<label class="w-100">보내는분*</label>
					</div>
					<div class="col-8 form-group">
						<input type="text" class="form-control">
					</div>
				</div>
			</div>
			<div class="form-row p-5">
				<h4>배송 정보</h4>
			</div>
			<div class="form-row p-5">
				<h4>결제 수단</h4>
			</div>
			<div class="form-row p-5">
				<h4>개인정보 수집/제공*</h4>
			</div>
			<div class="form-group w-100 text-center">
				<button type="submit" class="btn btn-dark btn-lg">결제하기</button>
			</div>
		</form>
	</div>
</body>
</html>