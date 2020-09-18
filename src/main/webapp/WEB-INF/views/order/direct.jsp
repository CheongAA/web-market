<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- custom CSS -->
<title>주문</title>
</head>
<body>
	<c:set var="total_products" value="0" />
	<c:set var="total_discounts" value="0" />

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
					<c:forEach var="cart" items="${carts}">
						<input type="hidden" value="${cart.cart_id}" class="cart_id" />
						<input type="hidden" value="${cart.product_id}" class="product_id" />
						<input type="hidden" value="${cart.product_count}" class="product_count" />
						<tr>
							<c:set var="total_products" value="${total_products + (cart.product.product_price * cart.product_count)}" />
							<td>
								<div class="col-sm-10">
									<img alt="${cart.product.product_name }" src="${cart.product.product_img }" class="col-sm-3 mx-3">
									<span class="product_name">${cart.product.product_name}</span>/
									<c:choose>
										<c:when test="${cart.product.discount_id != 0 and cart.product.discount.discount_apply != 0  and cart.product.discount.discount_state != 0}">
											<c:set var="discount" value="${(cart.product.product_price * cart.product.discount.discount_rate)/100}" />
											<c:set var="total_discounts" value="${total_discounts + (discount * cart.product_count)}" />

											<c:set var="price" value="${cart.product.product_price - (discount)}" />
											<c:set var="total" value="${price * cart.product_count}" />\
										<span style="text-decoration: line-through">${cart.product.product_price}</span>
											<span class="product_price"><fmt:formatNumber pattern="0" value="${price}" /></span>원
									</c:when>
										<c:otherwise>
											<span class="product_price">${cart.product.product_price}</span>원									
									<c:set var="total" value="${cart.product.product_price * cart.product_count}" />
										</c:otherwise>
									</c:choose>
								</div>
							</td>
							<td class="align-middle" id="product_count">${cart.product_count}</td>
							<td class="align-middle">
								<span> <fmt:formatNumber pattern="0" value="${total}" /></span>원
							</td>
						</tr>
					</c:forEach>
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
							<td>
								<input class="form-control" name="buyer_name" value="${user.user_name}" id="buyer_name" />
							</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">이메일</th>
							<td>
								<input class="form-control" name="buyer_email" value="${user.user_email}" id="buyer_email" />
							</td>
						</tr>
						<tr>
							<th scope="row">휴대폰 번호</th>
							<td>
								<input class="form-control" name="buyer_phone" value="${user.user_phone}" id="buyer_phone" />
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="row my-5">
				<div class="w-100 border-bottom border-dark py-3">
					<h4 class="float-left mr-3">받는사람 정보</h4>
					<a href="/user/address" class="btn btn-secondary btn-sm mx-auto" id="address_btn"> 배송지 추가</a>
				</div>

				<table class="table table-borderless mt-3">
					<thead>
					<tbody>
						<c:forEach var="address" items="${addresses}">
							<c:if test="${address.address_default == 1}">
								<tr>
									<th style="width: 20%">이름</th>
									<td>
										<input name="recipient_name" class="form-control" value="${address.address_recipient}" id="recipient_name" readonly />
									</td>
								</tr>
								<tr>
									<th scope="row">우편번호</th>
									<td>
										<input name="recipient_zip" class="form-control" value="${address.address_zip}" id="recipient_zip" readonly />
									</td>
								</tr>
								<tr>
									<th scope="row">배송주소</th>
									<td>
										<input name="recipient_address" class="form-control" value="${address.address_detail} ${address.address_detail2}" id="recipient_address" readonly />
									</td>
								</tr>
								<tr>
									<th scope="row">연락처</th>
									<td>
										<input name="recipient_phone" class="form-control" value="${address.address_phone}" id="recipient_phone" readonly />
									</td>
								</tr>
								<tr>
									<th scope="row">배송 요청사항</th>
									<td>
										<input class="form-control" name="order_request" id="order_request" />
									</td>
								</tr>
							</c:if>
						</c:forEach>
				</table>
			</div>
			<div class="row my-5">
				<h4 class="w-100 border-bottom border-dark py-3">결제금액</h4>
				<table class="table table-borderless mt-3">
					<thead>
						<tr class="text-center">
							<th scope="col">총 상품금액</th>
							<th scope="col"></th>
							<th scope="col">할인금액</th>
							<th scope="col"></th>
							<th scope="col">배송비</th>
							<th scope="col"></th>
							<th scope="col">결제예정금액</th>
						</tr>
					</thead>
					<tbody>
						<tr class="text-center">
							<td>
								<h1 id="order_products_price">
									<fmt:formatNumber pattern="0" value="${total_products}" />
								</h1>
							</td>
							<td>
								<h1>-</h1>
							</td>
							<td>
								<h1 id="order_discount_price">
									<fmt:formatNumber pattern="0" value="${total_discounts}" />
								</h1>
							</td>
							<td>
								<h1>+</h1>
							</td>
							<td>
								<h1 id="order_delivery_price">
									<c:choose>
										<c:when test="${total > 50000}">
											<c:set var="delivery" value="0" />
											0
										</c:when>
										<c:otherwise>
											<c:set var="delivery" value="2500" />
											2500
										</c:otherwise>
									</c:choose>
								</h1>
							</td>
							<td>
								<h1>=</h1>
							</td>
							<td>
								<h1 id="order_total_price">
									<fmt:formatNumber pattern="0" value="${total_products-total_discounts + delivery}" />
								</h1>
							</td>
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
							<td>
								<input class="form-check-input" type="radio" name="order_payment_method" id="order_payment_method" checked value="일반결제">
								<label class="form-check-label" for="nomal-pay">신용카드</label>
							</td>
						</tr>
						<tr>
							<th scope="row">네이버페이 결제</th>
							<td>
								<input class="form-check-input" type="radio" name="order_payment_method" id="order_payment_method" value="네이버페이">
								<label class="form-check-label" for="naver-pay">사진</label>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<button class="btn btn-secondary btn-lg" type="button" onclick="pay()">결제하기</button>
		</form>
	</div>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

	<script>
		$("#address_btn").on('click', getAddressList);

		function getAddressList() {
			window
					.open(this.href, '_blank',
							'width=400px,height=600px,toolbars=no,scrollbars=no,resizable=no');
			return false;
		}

		function getOrderDetailJson() {
			var orderDetailList = new Array();

			var id = $(".product_id");
			var count = $(".product_count");
			var price = $(".product_price");

			for (var i = 0; i < id.length; i++) {
				var data = new Object();
				data.product_id = id[i].value;
				data.product_count = count[i].value;
				data.product_price = price[i].innerHTML;
				orderDetailList.push(data);
			}

			return JSON.stringify({
				order : {
					buyer_name : $("#buyer_name").val(),
					buyer_email : $("#buyer_email").val(),
					buyer_phone : $("#buyer_phone").val(),
					recipient_name : $("#recipient_name").val(),
					recipient_zip : $("#recipient_zip").val(),
					recipient_address : $("#recipient_address").val(),
					recipient_phone : $("#recipient_phone").val(),
					order_request : $("#order_request").val(),
					order_payment_method : $("#order_payment_method").val(),
					order_state_id : 1,
					order_products_price : parseInt($("#order_products_price")
							.text(), 10),
					order_discount_price : parseInt($("#order_discount_price")
							.text(), 10),
					order_delivery_price : parseInt($("#order_delivery_price")
							.text(), 10),
					order_total_price : parseInt(
							$("#order_total_price").text(), 10)
				},
				orderDetail : orderDetailList

			});
		}

		function deleteCart() {
			var list = $(".cart_id");
			var carts = new Array();

			for (var i = 0; i < list.length; i++) {
				carts.push(parseInt(list[i].value));
			}

			$.ajax({
				url : "/cart/delete",
				type : "post",
				contentType : 'application/json;charset=UTF-8',
				data : JSON.stringify(carts),
				success : function(data) {
				}
			});
		}

		function pay() {
			IMP.init('imp39837562');
			IMP.request_pay({
				pg : 'inicis', // version 1.1.0부터 지원.
				pay_method : $("#order_payment_method").text(),
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : $(".product_name").text(),
				amount : 100,
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
						contentType : 'application/json;charset=UTF-8',
						data : getOrderDetailJson(),
						success : function(data) {
							deleteCart();
							window.location.href = "/order/complete";
						}
					});

				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
					alert(msg);
				}
			});
		}
	</script>
	</ body>
</html>