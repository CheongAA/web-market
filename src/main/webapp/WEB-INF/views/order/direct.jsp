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

	<div class="row m-1">
		<div class="col-sm-12 text-center m-3">
			<h2>주문/결제</h2>
		</div>
		<div class="col-sm-12 my-5 border border-dark py-3">
			<div class="row">
				<h5 class="col-6">상품정보</h5>
				<h5 class="col-3">수량</h5>
				<h5 class="col-3">금액</h5>
			</div>
			<c:forEach var="cart" items="${carts}">
				<input type="hidden" value="${cart.cart_id}" class="cart_id" />
				<input type="hidden" value="${cart.product_id}" class="product_id" />
				<input type="hidden" value="${cart.product_count}" class="product_count" />
				<c:set var="total_products" value="${total_products + (cart.product.product_price * cart.product_count)}" />
				<div class="row border-top border-dark py-2">
					<img alt="${cart.product.product_name }" src="${cart.product.product_img }" class="col-2">
					<div class="col-4 my-auto">
						<span class="product_name d-block">${cart.product.product_name}</span>
						<c:choose>
							<c:when test="${cart.product.discount_id != 0 and cart.product.discount.discount_apply != 0  and cart.product.discount.discount_state != 0}">
								<c:set var="discount" value="${(cart.product.product_price * cart.product.discount.discount_rate)/100}" />
								<c:set var="total_discounts" value="${total_discounts + (discount * cart.product_count)}" />

								<c:set var="price" value="${cart.product.product_price - (discount)}" />
								<c:set var="total" value="${price * cart.product_count}" />
								<span style="text-decoration: line-through">${cart.product.product_price}</span>
								<span class="product_price"><fmt:formatNumber pattern="0" value="${price}" /></span>원
									</c:when>
							<c:otherwise>
								<span class="product_price">${cart.product.product_price}</span>원									
									<c:set var="total" value="${cart.product.product_price * cart.product_count}" />
							</c:otherwise>
						</c:choose>
					</div>
					<div class="col-3 my-auto" id="product_count">${cart.product_count}</div>
					<div class="col-3 my-auto">
						<span> <fmt:formatNumber pattern="0" value="${total}" /></span>원
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="col-sm-12 my-5 border border-dark py-3">
			<h4 class="col-sm-12 py-3 border-bottom">구매자 정보</h4>
			<div class="row m-3">
				<div class="col-3">
					<h5>이름</h5>
				</div>
				<div class="col-9" id="buyer_name">${user.user_name}</div>
			</div>
			<div class="row m-3">
				<div class="col-3">
					<h5>이메일</h5>
				</div>
				<div class="col-9" id="buyer_email">${user.user_email}</div>
			</div>
			<div class="row m-3">
				<div class="col-3">
					<h5>휴대폰 번호</h5>
				</div>
				<div class="col-9">
					<input class="form-control" name="buyer_phone" value="${user.user_phone}" id="buyer_phone" />
					<small id="buyer_phone_check" class="form-text text-danger"></small>
				</div>
			</div>
		</div>
		<div class="col-sm-12 my-5 border border-dark py-3">
			<h4 class="col-sm-12">
				받는사람 정보
				<a href="/user/address" class="btn btn-secondary btn-sm ml-5" id="address_btn">배송지 설정</a>
			</h4>
			<small class="d-block border-bottom m-3">기본배송지가 설정되어있지 않다면 가장 처음 등록된 배송지가 선택됩니다.</small>
			<div class="row m-3">
				<div class="col-4">
					<h5>이름</h5>
				</div>
				<div class="col-8" id="recipient_name">${address.address_recipient}</div>
			</div>
			<div class="row m-3">
				<div class="col-4">
					<h5>우편번호</h5>
				</div>
				<div class="col-8" id="recipient_zip">${address.address_zip}</div>
			</div>
			<div class="row m-3">
				<div class="col-4">
					<h5>배송주소</h5>
				</div>
				<div class="col-8" id="recipient_address">${address.address_detail}${address.address_detail2}</div>
			</div>
			<div class="row m-3">
				<div class="col-4">
					<h5>연락처</h5>
				</div>
				<div class="col-8" id="recipient_phone">${address.address_phone}</div>
			</div>
			<div class="row m-3">
				<div class="col-4">
					<h5>배송 요청사항</h5>
				</div>
				<div class="col-8">
					<input class="form-control" id="order_request" type="text" maxlength="15" />
				</div>
			</div>
		</div>

		<div class="col-sm-12 my-5 border border-dark py-3">
			<h4 class="col-sm-12 border-bottom py-3">결제금액</h4>
			<div class="row text-center mb-2">
				<div class="col-2">총 상품</div>
				<div class="col-1"></div>
				<div class="col-2">할인</div>
				<div class="col-1"></div>
				<div class="col-2">배송비</div>
				<div class="col-1"></div>
				<div class="col-2">결제금액</div>
			</div>
			<div class="row text-center">
				<div class="col-2">
					<h5 id="order_products_price">
						<fmt:formatNumber pattern="0" value="${total_products}" />
					</h5>
				</div>
				<h5 class="col-1">-</h5>
				<div class="col-2">
					<h5 id="order_discount_price">
						<fmt:formatNumber pattern="0" value="${total_discounts}" />
					</h5>
				</div>
				<h5 class="col-1">+</h5>
				<div class="col-2">
					<h5 id="order_delivery_price">
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
					</h5>
				</div>
				<h5 class="col-1">=</h5>
				<div class="col-2">
					<h5 id="order_total_price">
						<fmt:formatNumber pattern="0" value="${total_products-total_discounts + delivery}" />
					</h5>
				</div>
			</div>
		</div>
		<div class="col-sm-12 my-5 border-bottom border-dark py-3">
			<h4 class="col-sm-12 border-bottom border-dark py-3">결제수단</h4>
			<small class="text-danger">테스트 결제로 100원이 결제됩니다.</small>
			<table class="table table-borderless mt-3">
				<tbody>
					<tr>
						<th style="width: 40%">일반결제</th>
						<td>
							<input class="form-check-input" type="radio" name="order_payment_method" id="order_payment_method" checked value="일반결제">
							<label class="form-check-label" for="nomal-pay">신용카드</label>
						</td>
					</tr>
					<tr>
						<th scope="row">네이버페이</th>
						<td>
							<input class="form-check-input" type="radio" name="order_payment_method" id="order_payment_method" value="네이버페이" disabled>
						</td>
					</tr>
					<tr>
						<th scope="row">계좌이체</th>
						<td>
							<input class="form-check-input" type="radio" name="order_payment_method" id="order_payment_method" value="네이버페이" disabled>
						</td>
					</tr>
					<tr>
						<th scope="row">휴대폰</th>
						<td>
							<input class="form-check-input" type="radio" name="order_payment_method" id="order_payment_method" value="네이버페이" disabled>
						</td>
					</tr>
					<tr>
						<th scope="row">무통장입금</th>
						<td>
							<input class="form-check-input" type="radio" name="order_payment_method" id="order_payment_method" value="네이버페이" disabled>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<button class="btn btn-secondary btn-lg btn-block" type="button" onclick="checkForm()">결제하기</button>
	</div>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

	<script>
		$("#address_btn").on('click', getAddressList);
		$("#buyer_phone").on('change', checkPhone);

		var buyer_phone_flag = false;
		checkPhone();
		//배송지 설정 화면 팝업
		function getAddressList() {
			window
					.open(this.href, '_blank',
							'width=400px,height=600px,toolbars=no,scrollbars=no,resizable=no');
			return false;
		}

		//구매자 핸드폰 번호 유효성 검사
		function checkPhone() {
			var phoneE = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
			var $input = $("#buyer_phone");
			var $small = $("#buyer_phone_check");

			if (!phoneE.test($input.val())) {
				buyer_phone_flag = false;
				$small.text("-를 포함한  핸드폰 번호를 입력해주세요.");
				$input.removeClass('is-valid');
				$input.addClass('is-invalid');
			} else {
				buyer_phone_flag = true;
				$small.text("");
				$input.removeClass('is-invalid');
				$input.addClass('is-valid');
			}
		}

		function checkForm() {
			checkPhone();
			if (buyer_phone_flag == false) {
				alert("핸드폰 번호를 확인해주세요");
			} else {
				pay();
			}
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