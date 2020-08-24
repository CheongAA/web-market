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
		<div class="row text-center mb-5">
			<h2 class="w-100">주문/결제</h2>
		</div>
		<div class="row my-5">
			<h4>상품 정보</h4>
			<table class="table text-center">
				<thead>
					<tr>
						<th class="w-75">상품정보</th>
						<th>수량</th>
						<th>금액</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${product.product_name}<small id="product_price">${product.product_price }</small>
						</td>
						<td id="count">${count}</td>
						<td class="product_total_price"></td>
					</tr>
				</tbody>
			</table>
		</div>
		<form action="/order" method="post">
			<div class="row my-5">
				<h4 class="w-100 border-bottom border-dark py-3">구매자 정보</h4>
				<table class="col table table-borderless mt-3">
					<thead>
						<tr>
							<th style="width: 20%">이름</th>
							<td><input name="buyer_name" value="${user.user_name}"
								id="buyer_name" /></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">이메일</th>
							<td><input name="buyer_email" value="${user.user_email}"
								id="buyer_email" /></td>
						</tr>
						<tr>
							<th scope="row">휴대폰 번호</th>
							<td><input name="buyer_phone" value="${user.user_phone}"
								id="buyer_phone" /></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="row my-5">
				<div class="w-100 border-bottom border-dark py-3">
					<h4 class="float-left mr-3">받는사람 정보</h4>
					<a href="/user/address" class="btn btn-secondary btn-sm mx-auto"
						id="address_btn"> 배송지 추가</a>
				</div>

				<table class="table table-borderless mt-3">
					<thead>
					<tbody>
						<c:forEach var="address" items="${addresses}">
							<c:if test="${address.address_default == 1}">
								<tr>
									<th style="width: 20%">이름</th>
									<td><input name="recipient_name"
										value="${address.address_recipient}" id="recipient_name" /></td>
								</tr>
								<tr>
									<th scope="row">우편번호</th>
									<td><input name="recipient_zip"
										value="${address.address_zip}" id="recipient_zip" /></td>
								</tr>
								<tr>
									<th scope="row">배송주소</th>
									<td><input name="recipient_address"
										value="${address.address_detail} ${address.address_detail2}"
										id="recipient_address" /></td>
								</tr>
								<tr>
									<th scope="row">연락처</th>
									<td><input name="recipient_phone"
										value="${address.address_phone}" id="recipient_phone" /></td>
								</tr>
								<tr>
									<th scope="row">배송 요청사항</th>
									<td><input name="order_request" id="order_request"/></td>
								</tr>
							</c:if>
						</c:forEach>
				</table>
			</div>
			<div class="row my-5">
				<h4 class="w-100 border-bottom border-dark py-3">결제금액</h4>
				<table class="table table-borderless mt-3">
					<thead>
						<tr>
							<th scope="col">상품금액</th>
							<th scope="col">상품할인금액</th>
							<th scope="col">배송비</th>
							<th scope="col">결제예정금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="product_total_price" id="order_total_price"></td>
							<td>- 0</td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="row my-5">
				<h4 class="w-100 border-bottom border-dark py-3">결제수단</h4>
				<table class="col table table-borderless mt-3">
					<tbody>
						<tr>
							<th style="width: 20%">일반결제</th>
							<td><input class="form-check-input" type="radio" name="payment_method"
								id="payment_method" checked value="일반결제"> <label
								class="form-check-label" for="nomal-pay">신용카드</label></td>
						</tr>
						<tr>
							<th scope="row">네이버페이 결제</th>
							<td><input class="form-check-input" type="radio" name="payment_method"
								id="payment_method" value="네이버페이"> <label
								class="form-check-label" for="naver-pay">사진</label></td>
						</tr>
					</tbody>
				</table>
			</div>
			<button class="btn btn-secondary btn-lg" type="button"
				onclick="pay()">결제하기</button>
		</form>
	</div>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

	<script>
		var total;
		$(document).ready(
				function() {
					total = parseInt($("#product_price").text())
							* parseInt($("#count").text());
					$(".product_total_price").text(total);
				})

		$("#address_btn").on('click', getAddressList);

		function getAddressList() {
			window
					.open(this.href, '_blank',
							'width=400px,height=600px,toolbars=no,scrollbars=no,resizable=no');
			return false;
		}
		function pay() {
			IMP.init('imp39837562');
			IMP.request_pay({
				pg : 'inicis', // version 1.1.0부터 지원.
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : '주문명:결제테스트',
				amount : 1, //판매 가격
				buyer_email : $("#buyer_email").text(),
				buyer_name : $("#buyer_name").text(),
				buyer_tel : $("#recipient_phone").text(),
				buyer_addr : $("#recipient_address").text(),
				buyer_postcode : $("#recipient_zip").text(),
			}, function(rsp) {
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
					
					$.ajax({
						url : "/order/complete",
						type : "post",
						dataType:'json',
						contentType:'application/json;charset=UTF-8',
						data : {
							buyer_name : $("#buyer_name").val(),
							buyer_email : $("#buyer_email").val(),
							buyer_phone : $("#buyer_phone").val(),
							recipient_name : $("#recipient_name").val(),
							recipient_zip : $("#recipient_zip").val(),
							recipient_address : $("#recipient_address").val(),
							recipient_phone : $("#recipient_phone").val(),
							order_request : $("#order_request").val(),
							payment_method : $("#payment_method").val(),
							order_total_price : parseInt($("#order_total_price").text(), 10)
							
						},
						success : function(data) {
							console.log("dd");
						}
					});
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
			});
		}
	</script>
</body>
</html>