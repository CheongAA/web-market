<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 디테일</title>
</head>
<body>
	<div class="row m-4">
		<div class="col">
			<div class="row mb-5">
				<div class="col-sm-5 pl-0 mr-5">
					<img class="w-100 h-100 mb-3 product-img" alt=""
						src="${product.product_thumbnailImg}">
					<c:if test="${product.discount_id != 0}">
						<div class="product-img-text bg-warning text-center p-3">
							<p class="h4 text-white font-weight-light">SAVE</p>
							<p class="h3 text-white font-weight-bold">
								${product.discount.discount_rate}%</p>

						</div>
					</c:if>
				</div>
				<div class="col-sm-6">
					<input type="hidden" id="product_id" value="${product.product_id}" />
					<input type="hidden" id="nomal_price"
						value="${product.product_price}" /> <input type="hidden"
						id="discount_rate" value="${product.discount.discount_rate}" /> <input
						type="hidden" id="discount_id" value="${product.discount_id}" />

					<h2>[${product.brand.brand_name}] ${product.product_name}</h2>
					<p class="text-muted">${product.product_desc}</p>
					<div class="row">
						<table class="table table-borderless mt-3">
							<tbody>
								<tr>
									<th style="width: 40%">가격(1팩)</th>
									<td><c:if
											test="${product.discount_id != 0}">
											<span class="text-muted h5 font-weight-light"
									style="text-decoration: line-through">${product.product_price}</span>
										</c:if> <span class="h5 font-weight-light" id="product_price"></span></td>
								</tr>
								<tr>
									<th style="width: 40%">카테고리</th>
									<td>${product.category.category_name}</td>
								</tr>
								<tr>
									<th>판매단위</th>
									<td>1팩</td>
								</tr>
								<tr>
									<th scope="row">중량/용량</th>
									<td>${product.product_volume}g</td>
								</tr>
								<tr>
									<th scope="row">구매수량</th>
									<td><input class="form-control" id="product_count"
										type="number" min="1" max="${product.product_quantity}"
										value="1" /></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="row">
						<p class="">총 상품금액 :</p>
						<h3 id="product_total_price" class="">원</h3>
					</div>
					<div class="row">
						<button type="button" class="col-sm-6 btn btn-outline-info py-3"
							id="cart_btn">SHOPPING BAG</button>
						<button type="button" class="col-sm-6 btn btn-info py-3"
							id="buy_btn">BUY NOW</button>
					</div>
					<div class="row  mt-4">
						<button class="col btn btn-light text-center">
							<p class="float-left">
								앱에서 첫 구매 시 15% 할인 <br> 그리고 다양한 추가 할인 혜택들
							</p>
							<i class="fas fa-arrow-right float-right pt-3"></i>
						</button>
					</div>
				</div>
			</div>
			<div class="row pt-5">
				<ul class="col nav nav-tabs">
					<li class="nav-item"><a class="nav-link active h4 px-5"
						href="#desc">상품설명</a></li>
					<li class="nav-item"><a class="nav-link h4 px-5" href="#image">상품이미지</a></li>
					<li class="nav-item"><a class="nav-link h4 px-5"
						href="#desc_detail">상세정보</a></li>
					<li class="nav-item"><a class="nav-link h4 px-5"
						href="#review">고객후기</a></li>
					<li class="nav-item"><a class="nav-link h4 px-5" href="#qna">상품문의</a></li>
				</ul>
			</div>
			<div class="row pt-5" id="desc">
				<img alt="" src=""> 상품설명이미지
			</div>
			<div class="row pt-5">
				<ul class="col nav nav-tabs">
					<li class="nav-item"><a class="nav-link h4 px-5" href="#desc">상품설명</a>
					</li>
					<li class="nav-item"><a class="nav-link active h4 px-5"
						href="#image">상품이미지</a></li>
					<li class="nav-item"><a class="nav-link h4 px-5"
						href="#desc_detail">상세정보</a></li>
					<li class="nav-item"><a class="nav-link h4 px-5"
						href="#review">고객후기</a></li>
					<li class="nav-item"><a class="nav-link h4 px-5" href="#qna">상품문의</a></li>
				</ul>
			</div>
			<div class="row pt-5" id="image">
				<img alt="" src=""> 상품이미지
			</div>
			<div class="row pt-5">
				<ul class="col nav nav-tabs">
					<li class="nav-item"><a class="nav-link h4 px-5" href="#desc">상품설명</a>
					</li>
					<li class="nav-item"><a class="nav-link  h4 px-5"
						href="#image">상품이미지</a></li>
					<li class="nav-item"><a class="nav-link active h4 px-5"
						href="#desc_detail">상세정보</a></li>
					<li class="nav-item"><a class="nav-link h4 px-5"
						href="#review">고객후기</a></li>
					<li class="nav-item"><a class="nav-link h4 px-5" href="#qna">상품문의</a></li>
				</ul>
			</div>
			<div class="row pt-5" id="esc_detail">
				<table class="col table table-borderless mt-3">
					<thead>
						<tr>
							<th style="width: 40%">판매단위</th>
							<td>1팩</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">중량/용량</th>
							<td>옵션별 상이</td>
						</tr>
						<tr>
							<th scope="row">원산지</th>
							<td>Larry</td>
						</tr>
						<tr>
							<th scope="row">유통기한</th>
							<td>Larry</td>
						</tr>
						<tr>
							<th scope="row">안내사항</th>
							<td>Larry</td>
						</tr>
					</tbody>
				</table>
				<table class="col table table-borderless mt-3">
					<thead>
						<tr>
							<th style="width: 40%">판매단위</th>
							<td>1팩</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">중량/용량</th>
							<td>옵션별 상이</td>
						</tr>
						<tr>
							<th scope="row">원산지</th>
							<td>Larry</td>
						</tr>
						<tr>
							<th scope="row">유통기한</th>
							<td>Larry</td>
						</tr>
						<tr>
							<th scope="row">안내사항</th>
							<td>Larry</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="row pt-5">
				<ul class="col nav nav-tabs">
					<li class="nav-item"><a class="nav-link h4 px-5" href="#desc">상품설명</a>
					</li>
					<li class="nav-item"><a class="nav-link h4 px-5" href="#image">상품이미지</a></li>
					<li class="nav-item"><a class="nav-link h4 px-5"
						href="#desc_detail">상세정보</a></li>
					<li class="nav-item"><a class="nav-link active h4 px-5"
						href="#review">고객후기</a></li>
					<li class="nav-item"><a class="nav-link h4 px-5" href="#qna">상품문의</a></li>
				</ul>
			</div>
			<div class="row pt-5" id="review">
				<img alt="" src=""> 고객후기
			</div>
			<div class="row pt-5">
				<ul class="col nav nav-tabs">
					<li class="nav-item"><a class="nav-link h4 px-5" href="#desc">상품설명</a>
					</li>
					<li class="nav-item"><a class="nav-link h4 px-5" href="#image">상품이미지</a></li>
					<li class="nav-item"><a class="nav-link h4 px-5"
						href="#desc_detail">상세정보</a></li>
					<li class="nav-item"><a class="nav-link h4 px-5"
						href="#review">고객후기</a></li>
					<li class="nav-item"><a class="nav-link active h4 px-5"
						href="#qna">상품문의</a></li>
				</ul>
			</div>
			<div class="row pt-5" id="qna">
				<img alt="" src=""> 상품문의
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var isDiscount = $("#discount_id").val();
		var rate = parseInt($("#discount_rate").val()) / 100;
		var price = parseInt($("#nomal_price").val());

		if (isDiscount == 1) {
			$("#product_price").text(price-(rate * price));
		} else {
			$("#product_price").text(price);
		}

		$(document).ready(calTotalPrice);

		$("#product_count").on("change", calTotalPrice);
		$("#buy_btn").on("click", getOrderPage);
		$("#cart_btn").on("click", addCart);

		function calTotalPrice() {
			var price = parseInt($("#product_price").text());
			var count = $("#product_count").val();

			$("#product_total_price").text(price * count + "원");
		}

		function getOrderPage() {
			location.href = "/order/" + $("#product_id").val() + "/"
					+ $("#product_count").val();
		}

		function addCart() {
			var form = {
				product_id : parseInt($("#product_id").val()),
				product_count : parseInt($("#product_count").val())
			}
			$.ajax({
				url : "/cart",
				type : "POST",
				data : form,
				success : function(data) {
					alert("장바구니 완료")
				}
			});
		}
	</script>
</body>
</html>