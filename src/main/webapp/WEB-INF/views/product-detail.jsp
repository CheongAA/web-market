<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MARKET:: ${product.product_name}</title>
</head>
<body>
	<div class="row m-4">
		<div class="col">
			<div class="row mb-5 pb-5">
				<div class="col-sm-5 pl-0 mr-5">
					<img class="w-100 h-100 mb-3 product-img" alt=""
						src="${product.product_thumbnailImg}">
					<c:if
						test="${product.discount_id != 0 and product.discount.discount_apply != 0 and product.discount.discount_state != 0}">
						<div class="product-img-text bg-warning text-center p-3">
							<p class="h4 text-white font-weight-light">SAVE</p>
							<p class="h3 text-white font-weight-bold">
								${product.discount.discount_rate}%</p>

						</div>
					</c:if>
				</div>
				<div class="col-sm-6">
					<input type="hidden" id="product_id" value="${product.product_id}" />
					<h2>[${product.brand.brand_name}] ${product.product_name}</h2>
					<p class="text-muted">${product.product_desc}</p>
					<div class="row">
						<table class="table table-borderless mt-3">
							<tbody>
								<tr>
									<th style="width: 40%">가격(1팩)</th>
									<td><c:choose>
											<c:when
												test="${product.discount_id != 0 and product.discount.discount_apply != 0 and product.discount.discount_state != 0}">
												<c:set var="price"
													value="${product.product_price - ((product.product_price * product.discount.discount_rate)/100)}" />
												<span class="text-muted h5 font-weight-light"
													style="text-decoration: line-through">${product.product_price}</span>
												<span class="h5 font-weight-light" id="product_price"><fmt:formatNumber
														pattern="0" value="${price}" /></span>원
											</c:when>
											<c:otherwise>
												<span class="h5 font-weight-light" id="product_price">${product.product_price}</span>원
											</c:otherwise>
										</c:choose></td>
								</tr>
								<tr>
									<th style="width: 40%">분류</th>
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
					<div class="row justify-content-end mt-5">
						<p class="">총 상품금액 :</p>
						<h4 id="product_total_price" class="">원</h4>
					</div>
					<div class="row justify-content-end">
						<button type="button"
							class="col-sm-3 btn btn-outline-dark py-3 mx-2" id="cart_btn"
							data-toggle="modal" data-target="#cart_modal">장바구니</button>
						<button type="button" class="col-sm-3 btn btn-dark py-3"
							id="buy_btn">바로구매</button>

						<!-- Modal -->
						<div class="modal fade" id="cart_modal" data-backdrop="static"
							data-keyboard="false" tabindex="-1"
							aria-labelledby="staticBackdropLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="staticBackdropLabel">장바구니</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">장바구니가 추가되었습니다.</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">계속 쇼핑하기</button>
										<a type="button" class="btn btn-primary"
											href="${pageContext.request.contextPath}/carts">장바구니로 이동</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row  mt-4">
						<a class="col btn btn-light text-center py-4"
							href="${pageContext.request.contextPath}/discount/"> <span
							class="text-center"> 진행중인 이벤트를 확인해보세요 </span> <i
							class="fas fa-seedling"></i>
						</a>
					</div>
				</div>
			</div>
			<div class="row mt-5">
				<a
					class="border-top border-left border-right bg-white h5 p-3 m-0 text-dark text-decoration-none col-3"
					href="#desc">상품설명</a> <a
					class="border bg-light h5 p-3 m-0 text-dark text-decoration-none col-3"
					href="#image">상품이미지</a> <a
					class="border bg-light h5 p-3 m-0 text-dark text-decoration-none col-3"
					href="#review">고객후기</a> <a
					class="border bg-light h5 p-3 m-0 text-dark text-decoration-none col-3"
					href="#qna">상품문의</a>
			</div>
			<div class="row pt-5" id="desc">
				<img alt="" src=""> 상품설명이미지
			</div>
			<div class="row mt-5">
				<a
					class="border bg-light h5 p-3 m-0 text-dark text-decoration-none col-3"
					href="#desc">상품설명</a> <a
					class="border-top border-left border-right bg-white h5 p-3 m-0 text-dark text-decoration-none col-3"
					href="#image">상품이미지</a><a
					class="border bg-light h5 p-3 m-0 text-dark text-decoration-none col-3"
					href="#review">고객후기</a> <a
					class="border bg-light h5 p-3 m-0 text-dark text-decoration-none col-3"
					href="#qna">상품문의</a>
			</div>
			<div class="row pt-5" id="image">
				<img alt="" src=""> 상품이미지
			</div>
			<div class="row mt-5">
				<a
					class="border bg-light h5 p-3 m-0 text-dark text-decoration-none col-3"
					href="#desc">상품설명</a> <a
					class="border bg-light h5 p-3 m-0 text-dark text-decoration-none col-3"
					href="#image">상품이미지</a><a
					class="border-top border-left border-right bg-white h5 p-3 m-0 text-dark text-decoration-none col-3"
					href="#review">고객후기</a> <a
					class="border bg-light h5 p-3 m-0 text-dark text-decoration-none col-3"
					href="#qna">상품문의</a>
			</div>
			<div class="row pt-5" id="review">
				<div class="m-3">
					<h5>PRODUCT REVIEW</h5>
					<ul>
						<li><small>상품에 대한 후기를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은
								사전동의 없이 담당 게시판으로 이동될 수 있습니다.</small></li>
					</ul>
				</div>
				<table class="table table-hover text-center border-bottom">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col" style="width: 40%">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty reviews}">
								<tr>
									<td colspan="5" rowspan="5">
										<h6 class="py-5 my-5 font-weight-bold text-center">후기가
											존재하지 않습니다.</h6>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="review" items="${reviews }" varStatus="status">
									<tr class="reviews" id="${review.review_id}">
										<td>${status.count}</td>
										<td>${review.review_title}</td>
										<td>${review.user.user_name }</td>
										<td><fmt:formatDate value="${review.review_created}"
												pattern="yyyy-MM-dd" /></td>
										<td>${review.review_view }</td>
									</tr>
									<tr>
										<td colspan="5" class="p-5 text-left" style="display: none;"
											id="review_content_${review.review_id}">
											<span class="ml-2">${review.review_content}</span></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<div class="w-100">
					<a class="btn btn-secondary m-5 float-right "
						href="${pageContext.request.contextPath}/user/reviewable">후기작성</a>
				</div>
				<nav aria-label="Page navigation example" class="d-block mx-auto">
					<ul class="pagination">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</div>
			<div class="row mt-5">
				<a
					class="border bg-light h5 p-3 m-0 text-dark text-decoration-none col-3"
					href="#desc">상품설명</a> <a
					class="border bg-light h5 p-3 m-0 text-dark text-decoration-none col-3"
					href="#image">상품이미지</a> <a
					class="border bg-light h5 p-3 m-0 text-dark text-decoration-none col-3"
					href="#review">고객후기</a> <a
					class="border-top border-left border-right bg-white h5 p-3 m-0 text-dark text-decoration-none col-3"
					href="#qna">상품문의</a>
			</div>
			<div class="row pt-5" id="qna">
				<div class="m-3">
					<h5>PRODUCT Q&A</h5>
					<ul>
						<li><small>상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은
								사전동의 없이 담당 게시판으로 이동될 수 있습니다.</small></li>
						<li><small>배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이페이지 내
								1:1 문의에 남겨주세요.</small></li>
					</ul>
				</div>
				<table class="table table-hover text-center border-bottom">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col" style="width: 40%">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty questions}">
								<tr>
									<td colspan="4" rowspan="4">
										<h6 class="py-5 my-5 font-weight-bold text-center">문의 내역이
											존재하지 않습니다.</h6>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="question" items="${questions}"
									varStatus="status">
									<tr class="questions" id="${question.question_id}">
										<td>${status.count}</td>
										<td>${question.question_title}</td>
										<td>${question.user.user_name}</td>
										<td><fmt:formatDate value="${question.question_created}"
												pattern="yyyy-MM-dd" /></td>
									</tr>
									<tr>
										<td colspan="4" class="p-5 text-left" style="display: none;"
											id="question_content_${status.count}"><span class="ml-2">${question.question_content}</span></td>
									</tr>
									<c:if test="${question.answer_id != 0 }">
										<tr class="answers" id="${question.answer_id}">
											<td><span class="badge badge-warning">Re</span></td>
											<td>${question.answer.answer_title }</td>
											<td>MARKET</td>
											<td><fmt:formatDate
													value="${question.answer.answer_created}"
													pattern="yyyy-MM-dd" /></td>
										</tr>
										<tr>
											<td colspan="4" class="p-5 text-left" style="display: none;"
												id="answer_content_${question.answer_id}"><i
												class="fas fa-font market-color"> ></i><span class="ml-2">${question.answer.answer_content}</span></td>
										</tr>
									</c:if>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<div class="w-100">
					<a class="btn btn-secondary m-5 float-right "
						href="${pageContext.request.contextPath}/user/productQuestionAdd/${product.product_id}">상품문의</a>
				</div>
				<nav aria-label="Page navigation example" class="d-block mx-auto">
					<ul class="pagination">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(calTotalPrice);

		$("#product_count").on("change", calTotalPrice);

		$("#cart_btn").click(function() {
			addCart('cart');
		});

		$("#buy_btn").click(function() {
			addCart('buy');
		});

		function calTotalPrice() {
			var price = parseInt($("#product_price").text());
			var count = $("#product_count").val();

			$("#product_total_price").text(price * count + "원");
		}

		function addCart(btn) {
			var form = {
				product_id : parseInt($("#product_id").val()),
				product_count : parseInt($("#product_count").val())
			}
			$.ajax({
				url : "/cart",
				type : "POST",
				data : form,
				success : function(data) {
					if (btn == 'buy') {
						location.href = "/carts";
					}
				}
			});
		}
		
		$(".reviews").click(function() {
			var td = $("#review_content_" + $(this).attr("id"));

			if (td.css("display") != "table-cell") {
				$("[id^=review_content_]").css("display", "none");
				td.css("display", "table-cell");
			} else {
				td.css("display", "none");
			}
		});

		$(".questions").click(function() {
			var td = $("#question_content_" + $(this).children("td").html());

			if (td.css("display") != "table-cell") {
				$("[id^=question_content_]").css("display", "none");
				$("[id^=answer_content_]").css("display", "none");
				td.css("display", "table-cell");
			} else {
				td.css("display", "none");
			}
		});

		$(".answers").click(function() {
			var td = $("#answer_content_" + $(this).attr("id"));

			if (td.css("display") != "table-cell") {
				$("[id^=answer_content_]").css("display", "none");
				$("[id^=question_content_]").css("display", "none");
				td.css("display", "table-cell");
			} else {
				td.css("display", "none");
			}
		});
	</script>
</body>
</html>