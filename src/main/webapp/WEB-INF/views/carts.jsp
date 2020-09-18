<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- custom CSS -->
<title>MARKET:: 장바구니</title>
</head>
<body>
	<div class="m-5">
		<div class="row text-center mb-5">
			<h2 class="w-100">장바구니</h2>
			<p class="w-100 text-muted">주문하실 상품명 및 수량을 정확하게 확인해 주세요.</p>
		</div>
		<form action="/order" method="post">
			<table class="table text-center">
				<thead>
					<tr>
						<th><input type="checkbox" id="total_check_input" />전체선택</th>
						<th class="w-50">상품정보</th>
						<th>수량</th>
						<th class="w-25">금액</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty carts}">
							<tr>
								<td colspan="4" rowspan="4">
									<h6 class="py-5 my-5 font-weight-bold">장바구니에 담긴 상품이 없습니다.</h6>
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="cart" items="${carts}">
								<tr>
									<c:choose>
										<c:when test="${cart.product.on_sale == 0}">
											<td class="text-center">
												<input type="checkbox" class="soldout_products" value="${cart.cart_id}" disabled />
											</td>
											<td>
												<div class="col-sm-12">
													<img alt="" src="${cart.product.product_img}" class="w-25">${cart.product.product_name}
													/ <span>${cart.product.product_price}</span>원
												</div>
											</td>
											<td></td>
											<td>품절</td>
										</c:when>
										<c:otherwise>
											<td class="text-center">
												<input type="checkbox" class="product_check_input" value="${cart.cart_id}" />
											</td>
											<td>
												<div class="col-sm-12">
													<img alt="" src="${cart.product.product_img}" class="w-25">
													<a href="${pageContext.request.contextPath}/product/${cart.product.product_id}" class="text-dark">${cart.product.product_name}</a>
													/

													<c:choose>
														<c:when test="${cart.product.discount_id != 0 and cart.product.discount.discount_apply != 0 and cart.product.discount.discount_state != 0}">
															<c:set var="discount" value="${(cart.product.product_price * cart.product.discount.discount_rate)/100}" />
															<c:set var="price" value="${cart.product.product_price - (discount)}" />
															<c:set var="total" value="${price * cart.product_count}" />


															<span style="text-decoration: line-through" id="${cart.product.product_id}_price">${cart.product.product_price}</span>
															<span> <fmt:formatNumber pattern="0" value="${price}" />원
															</span>

															<input type="hidden" value="${discount * cart.product_count}" id="${cart.cart_id}_discounts">
														</c:when>
														<c:otherwise>
															<c:set var="total" value="${cart.product.product_price * cart.product_count}" />
															<span>${cart.product.product_price}</span>원
																										<input type="hidden" value="0" id="${cart.cart_id}_discounts">
														</c:otherwise>
													</c:choose>
													<input type="hidden" value="${cart.product.product_price * cart.product_count}" id="${cart.cart_id}_products">
												</div>
											</td>
											<td>
												<input class="form-control" id="${cart.cart_id}" type="number" min="1" max="${cart.product.product_quantity}" value="${cart.product_count}" />
											</td>
											<td>
												<span class="product_total_price"><fmt:formatNumber pattern="0" value="${total}" /></span>원
											</td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>

				</tbody>
			</table>
			<hr />
			<div class="row my-5">
				<button type="button" class="btn btn-outline-secondary p-3" id="delete_btn">선택 삭제</button>
				<button type="button" class="btn btn-outline-secondary p-3" id="soldout_btn">품절 상품 삭제</button>
			</div>
			<div class="row my-5 border">
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
								<h1 id="products_price">0</h1>
							</td>
							<td>
								<h1>-</h1>
							</td>
							<td>
								<h1 id="discount_price">0</h1>
							</td>
							<td>
								<h1>+</h1>
							</td>
							<td>
								<h1 id="delivery_price">0</h1>
							</td>
							<td>
								<h1>=</h1>
							</td>
							<td>
								<h1 id="total_price">0</h1>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="row w-100 mt-3">
				<button type="button" class="btn btn-secondary btn-lg py-3 px-5 mx-auto" id="order_btn">주문하기</button>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$("input[type='checkbox']").prop('checked', false);
		}

		);
		$("input[type='number']").on("change", function(e) {
			const id = e.target.id;
			const value = e.target.value;

			console.log(value);
			$.ajax({
				url : "/cart/update",
				type : "post",
				contentType : 'application/json;charset=UTF-8',
				data : JSON.stringify({
					cart_id : parseInt(id),
					product_count : parseInt(value)

				}),
				success : function(data) {
					window.location.href = "/carts";
				}
			});
		});

		function deleteCart(selector) {
			var list = $(selector);
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
					window.location.href = "/carts";
				}
			});
		}

		$("#soldout_btn").on("click", function() {
			deleteCart(".soldout_products");
		});

		$("#delete_btn").on("click", function() {
			deleteCart("input:checked.product_check_input");
		});

		$("#order_btn").on("click", function() {
			var carts = $("input:checked.product_check_input")
			if (carts.length != 0) {
				var query = ""
				for (var i = 0; i < carts.length; i++) {
					query += "cart[]=" + parseInt(carts[i].value) + "&";
				}

				window.location.href = "/order/?" + encodeURI(query);
			} else {
				alert("주문할 상품을 선택해주세요.");
			}

		});

		var products = 0;
		var discounts = 0;

		$("#total_check_input").on(
				"change",
				function() {
					if ($(this).prop('checked')) {
						products = 0;
						discounts = 0;
						$("input[type='checkbox'].product_check_input").prop(
								'checked', true).trigger('change');
					} else {
						$("input[type='checkbox'].product_check_input").prop(
								'checked', false).trigger('change');
					}
				});

		$("input[type='checkbox'].product_check_input").on(
				"change",
				function(e) {
					const target = e.target.value;
					if ($(this).prop('checked')) {
						products += parseInt($("#" + target + "_products")
								.val());
						discounts += parseInt($("#" + target + "_discounts")
								.val());
					} else {
						$("#total_check_input").prop('checked', false)
						products -= parseInt($("#" + target + "_products")
								.val());
						discounts -= parseInt($("#" + target + "_discounts")
								.val());
					}
					var delivery = 0;

					if (products - discounts < 50000 && products != 0) {
						delivery = 2500;
					}

					$("#products_price").text(products);
					$("#discount_price").text(discounts);
					$("#delivery_price").text(delivery);
					$("#total_price").text(products - discounts + delivery);
				});
	</script>
</body>
</html>