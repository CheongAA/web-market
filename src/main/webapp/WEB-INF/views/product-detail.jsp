<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
					<img class="w-100 h-100 mb-3 product-img" alt="" src="${product.product_img}">
					<c:if test="${product.discount_id != 0 and product.discount.discount_apply != 0 and product.discount.discount_state != 0}">
						<div class="product-img-text bg-warning text-center p-3">
							<p class="h4 text-white font-weight-light">SAVE</p>
							<p class="h3 text-white font-weight-bold">${product.discount.discount_rate}%</p>

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
									<td>
										<c:choose>
											<c:when test="${product.discount_id != 0 and product.discount.discount_apply != 0 and product.discount.discount_state != 0}">
												<c:set var="price" value="${product.product_price - ((product.product_price * product.discount.discount_rate)/100)}" />
												<span class="text-muted h5 font-weight-light" style="text-decoration: line-through">${product.product_price}</span>
												<span class="h5 font-weight-light" id="product_price"><fmt:formatNumber pattern="0" value="${price}" /></span>원
											</c:when>
											<c:otherwise>
												<span class="h5 font-weight-light" id="product_price">${product.product_price}</span>원
											</c:otherwise>
										</c:choose>
									</td>
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
									<td>
										<input class="form-control" id="product_count" type="number" min="1" max="${product.product_quantity}" value="1" />
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="row justify-content-end mt-5">
						<p class="">총 상품금액 :</p>
						<h4 id="product_total_price" class="">원</h4>
					</div>
					<div class="row justify-content-end">
						<c:choose>
							<c:when test="${product.product_quantity <= 0}">
								<span> 품절 </span>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${not empty user }">
										<button type="button" class="col-sm-3 btn btn-outline-dark py-3 mx-2" id="cart_btn" data-toggle="modal" data-target="#cart_modal">장바구니</button>
									</c:when>
									<c:otherwise>
										<a class="col-sm-3 btn btn-outline-dark py-3 mx-2" href="${pageContext.request.contextPath}/carts">장바구니</a>
									</c:otherwise>
								</c:choose>

								<button type="button" class="col-sm-3 btn btn-dark py-3" id="buy_btn">바로구매</button>

								<!-- Modal -->
								<div class="modal fade" id="cart_modal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="staticBackdropLabel">장바구니</h5>
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">장바구니가 추가되었습니다.</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary" data-dismiss="modal">계속 쇼핑하기</button>
												<a class="btn btn-primary" href="${pageContext.request.contextPath}/carts">장바구니로 이동</a>
											</div>
										</div>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="row  mt-4">
						<a class="col btn btn-light text-center py-4" href="${pageContext.request.contextPath}/discount/">
							<span class="text-center"> 진행중인 이벤트를 확인해보세요 </span> <i class="fas fa-seedling"></i>
						</a>
					</div>
				</div>
			</div>
			<div class="row mt-5">
				<a class="border-top border-left border-right bg-white h5 p-3 m-0 text-dark text-decoration-none col-4" href="#desc">상품설명</a>
				<a class="border bg-light h5 p-3 m-0 text-dark text-decoration-none col-4" href="#review">고객후기(${ReviewPageMaker.totalCount})</a>
				<a class="border bg-light h5 p-3 m-0 text-dark text-decoration-none col-4" href="#qna">상품문의(${QuestionPageMaker.totalCount})</a>
			</div>
			<div class="row pt-5" id="desc">
				<div class="col-sm-12 text-center">
					<img alt="상품설명" src="${product.product_descImg }">
				</div>
			</div>
			<div class="row mt-5">
				<a class="border bg-light h5 p-3 m-0 text-dark text-decoration-none col-4" href="#desc">상품설명</a>
				<a class="border-top border-left border-right bg-white h5 p-3 m-0 text-dark text-decoration-none col-4" href="#review">고객후기(${ReviewPageMaker.totalCount})</a>
				<a class="border bg-light h5 p-3 m-0 text-dark text-decoration-none col-4" href="#qna">상품문의(${QuestionPageMaker.totalCount})</a>
			</div>
			<div class="row pt-5" id="review">
				<div class="m-3">
					<h5>PRODUCT REVIEW</h5>
					<ul>
						<li><small>상품에 대한 후기를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</small></li>
					</ul>
				</div>
				<table class="table table-hover text-center border-bottom">
					<thead>
						<tr>
							<th scope="col" style="width: 40%">제목</th>
							<th scope="col">평점</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody id="review_tr">

					</tbody>
				</table>
				<div class="col-sm-12">
					<a class="btn btn-secondary m-5 float-right " href="${pageContext.request.contextPath}/user/reviewable">후기작성</a>
				</div>
				<nav class="col-sm-12" aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<c:if test="${ReviewPageMaker.prev}">
							<li class="page-item"><button class="page-link" onclick="getReviews(${ReviewPageMaker.startPage-1 })">
									<i class="fa fa-chevron-left"></i>
								</button></li>
						</c:if>
						<c:forEach begin="${ReviewPageMaker.startPage}" end="${ReviewPageMaker.endPage }" var="pageNum">
							<li id="reviewPage_${pageNum }" class="page-item"><button class="page-link" onclick="getReviews(${pageNum})">
									<i class="fa">${pageNum }</i>
								</button></li>
						</c:forEach>
						<c:if test="${ReviewPageMaker.next && ReviewPageMaker.endPage >0 }">
							<li class="page-item"><button class="page-link" onclick="getReviews(${ReviewPageMaker.endPage+1 })">
									<i class="fa fa-chevron-right"></i>
								</button></li>
						</c:if>
					</ul>
				</nav>
			</div>
			<div class="row mt-5">
				<a class="border bg-light h5 p-3 m-0 text-dark text-decoration-none col-4" href="#desc">상품설명</a>
				<a class="border bg-light h5 p-3 m-0 text-dark text-decoration-none col-4" href="#review">고객후기(${ReviewPageMaker.totalCount})</a>
				<a class="border-top border-left border-right bg-white h5 p-3 m-0 text-dark text-decoration-none col-4" href="#qna">상품문의(${QuestionPageMaker.totalCount})</a>
			</div>
			<div class="row pt-5" id="qna">
				<div class="m-3">
					<h5>PRODUCT Q&A</h5>
					<ul>
						<li><small>상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</small></li>
						<li><small>배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이페이지 내 1:1 문의에 남겨주세요.</small></li>
					</ul>
				</div>
				<table class="table table-hover text-center border-bottom">
					<thead>
						<tr>
							<th scope="col" style="width: 40%">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
						</tr>
					</thead>
					<tbody id="question_tr">
					</tbody>
				</table>
				<div class="col-sm-12">
					<a class="btn btn-secondary m-5 float-right " href="${pageContext.request.contextPath}/user/productQuestionAdd/${product.product_id}">상품문의</a>
				</div>
				<nav class="col-sm-12" aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<c:if test="${QuestionPageMaker.prev}">
							<li class="page-item"><button class="page-link" onclick="getQuestions(${QuestionPageMaker.startPage-1 })">
									<i class="fa fa-chevron-left"></i>
								</button></li>
						</c:if>
						<c:forEach begin="${QuestionPageMaker.startPage}" end="${QuestionPageMaker.endPage }" var="pageNum">
							<li id="questionPage_${pageNum }" class="page-item"><button class="page-link" onclick="getQuestions(${pageNum})">
									<i class="fa">${pageNum }</i>
								</button></li>
						</c:forEach>
						<c:if test="${QuestionPageMaker.next && QuestionPageMaker.endPage >0 }">
							<li class="page-item"><button class="page-link" onclick="getQuestions(${QuestionPageMaker.endPage+1 })">
									<i class="fa fa-chevron-right"></i>
								</button></li>
						</c:if>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	
	function showTr(type,id){
		var td = $("#"+type+"_content_" + id);
		if (td.css("display") != "table-cell") {
			$("[id^="+type+"_content_]").css("display", "none");
			td.css("display", "table-cell");

			if(type == "review"){
				$.ajax({
					url : "/review/addView/" + id,
					type : "get"
				});
			}
		} else {
			td.css("display", "none");
		}
	}
	
	function getReviews(pageNum){
		$("#review_tr").empty();
		
		$("[id^=reviewPage_]").removeClass("active");
		$("#reviewPage_"+pageNum).addClass("active");
		
		$.ajax({
			url : "/product/review",
			type : "get",
			contentType : 'application/json;charset=UTF-8',
			data : {
				product_id : $("#product_id").val(),
				page : pageNum
			},
			success : function(data) {
				if (data.length == 0) {
					var $tr = $('<tr><td colspan="5" rowspan="5"><h6 class="py-5 my-5 font-weight-bold text-center">후기가 존재하지 않습니다.</h6></td></tr>');
					$tr.appendTo($("#review_tr"));
				} else {
					for (var i = 0; i <data.length; i++) {
						var $tr = $('<tr id='+data[i].review_id+'></tr>');
						$tr.on('click',function(){
							showTr("review",$(this).attr('id'));
						});
						var $td_title;
						var $tr_content;
						
						if(data[i].review_img){
							$td_title = $('<td>'+data[i].review_title+'<i class="fas fa-camera"></i></td>');
							$tr_content = $('<tr><td colspan="6" class="p-5 text-left px-auto" style="display: none;" id="review_content_'+data[i].review_id+'">'+
							'<img src='+data[i].review_img+' class="col-3"><span class="col-7">'+data[i].review_content+'</span></td></tr>');
						}else{
							$td_title = $('<td>'+data[i].review_title+'</td>');
							$tr_content = $('<tr><td colspan="6" class="p-5 text-left px-auto" style="display: none;" id="review_content_'+data[i].review_id+'"><span class="col-7">'+
							data[i].review_content+'</span></td></tr>');
						}
						
						var $td_star = $('<td>'+data[i].review_star+'</td>');
						var $td_user = $('<td>'+data[i].user.user_name+'</td>');
						var $td_created = $('<td>'+getFormatDate(new Date(data[i].review_created))+'</td>');
						var $td_view = $('<td>'+data[i].review_view+'</td>');
						

						$td_title.appendTo($tr);
						$td_star.appendTo($tr);
						$td_user.appendTo($tr);
						$td_created.appendTo($tr);
						$td_view.appendTo($tr);
						
						$tr.appendTo($("#review_tr"));
						$tr_content.appendTo($("#review_tr"));
					}
				}
			}
		});
	}
	
	function getQuestions(pageNum){
		$("#question_tr").empty();
		
		$("[id^=questionPage_]").removeClass("active");
		$("#questionPage_"+pageNum).addClass("active");
		
		$.ajax({
			url : "/product/question",
			type : "get",
			contentType : 'application/json;charset=UTF-8',
			data : {
				product_id : $("#product_id").val(),
				page : pageNum
			},
			success : function(data) {
				if (data.length == 0) {
					var $tr = $('<tr><td colspan="3" rowspan="4"><h6 class="py-5 my-5 font-weight-bold text-center">문의 내역이 존재하지 않습니다.</h6></td></tr>');
					$tr.appendTo($("#question_tr"));
				} else {
					for (var i = 0; i <data.length; i++) {
						//문의 내역
						var $tr = $('<tr id='+data[i].question_id+'></tr>');
						$tr.on('click',function(){
							showTr("question",$(this).attr('id'));
						});
						var $td_title = $('<td>'+data[i].question_title+'</td>');
						var $tr_content = $('<tr><td colspan="3" class="p-5 text-left" style="display: none;" id="question_content_'+data[i].question_id+'"><span class="ml-2">'+
								data[i].question_content+'</span></td></tr>');
						
						var $td_user = $('<td>'+data[i].user.user_name+'</td>');
						var $td_created = $('<td>'+getFormatDate(new Date(data[i].question_created))+'</td>');
						

						$td_title.appendTo($tr);
						$td_user.appendTo($tr);
						$td_created.appendTo($tr);
						
						$tr.appendTo($("#question_tr"));
						$tr_content.appendTo($("#question_tr"));
						
						
						if(data[i].answer_id != 0){
							//답변 내역
							var $tr_answer = $('<tr id='+data[i].answer_id+'></tr>');
							$tr_answer.on('click',function(){
								showTr("answer",$(this).attr('id'));
							});
							var $td_answer_title = $('<td><span class="badge badge-warning mx-2"><i class="fas fa-arrow-right"></i></span>'+data[i].answer.answer_title+'</td>');
							var $tr_answer_content = $('<tr><td colspan="3" class="p-5 text-left" style="display: none;" id="answer_content_'+data[i].answer_id+'"><span class="ml-2">'+
									data[i].answer.answer_content+'</span></td></tr>');
							
							var $td_answer_user = $('<td>MARKET</td>');
							var $td_answer_created = $('<td>'+getFormatDate(new Date(data[i].answer.answer_created))+'</td>');
							

							$td_answer_title.appendTo($tr_answer);
							$td_answer_user.appendTo($tr_answer);
							$td_answer_created.appendTo($tr_answer);
							
							$tr_answer.appendTo($("#question_tr"));
							$tr_answer_content.appendTo($("#question_tr"));
						}
						
					}
				}
			}
		});
	}
	
		$(document).ready(function(){
			calTotalPrice();
			getReviews(1);
			getQuestions(1);
		});


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
		
		function getFormatDate(date){
		    var year = date.getFullYear();             
		    var month = (1 + date.getMonth());          
		    month = month >= 10 ? month : '0' + month;  
		    var day = date.getDate();                  
		    day = day >= 10 ? day : '0' + day;         
		    return  year + '/' + month + '/' + day;      
		}

	</script>
</body>
</html>