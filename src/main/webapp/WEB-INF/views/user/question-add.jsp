<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지</title>
</head>
<body>
	<div class="row">
		<jsp:include page="mypage_header.jsp" flush="false" />
		<div class="col py-5 ml-5">
			<h3 class="mb-5">문의</h3>
			<form action="/user/question" method="post">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<th scope="row" style="width: 20%" class="table-secondary">제목 *</th>
							<td>
								<select class="mb-2" name="question_category_id" class="form-control">
									<c:forEach var="questionCategorie" items="${questionCategories}">
										<option value="${questionCategorie.question_category_id}">${questionCategorie.question_category_title}</option>
									</c:forEach>
								</select>
								<input type="text" name="question_title" class="form-control" maxlength="20" placeholder="20자 이하로 입력해주세요" required>
							</td>
						</tr>
						<tr>
							<th scope="row" class="table-secondary">주문번호</th>
							<td class="form-inline">
								<input type="text" class="form-control col-sm-5 mr-3" name="order_id" readonly>
								<button type="button" class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#orderlist">주문조회</button>
							</td>
						</tr>
						<tr>
							<th scope="row" class="table-secondary">핸드폰번호</th>
							<td class="form-inline">
								<input type="text" class="form-control col-sm-5 mr-3" name="question_phone" id="question_phone">
								<small id="question_phone_check" class="form-text text-danger"></small> 번호를 입력하면 문자메시지로 답변이 전송됩니다. <br/>(부정확한 번호를 입력 시 문자가 전송되지 않을 수 있습니다.)
							</td>
						</tr>
						<tr>
							<th scope="row" class="table-secondary">내용 *</th>
							<td colspan="3" rowspan="10">
								<textarea class="form-control" rows="20" cols="100" name="question_content" maxlength="500" placeholder="500자 이하로 입력해주세요" required></textarea>
							</td>
						</tr>
					</tbody>
				</table>

				<!-- Modal -->
				<div class="modal fade" id="orderlist" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-scrollable">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="staticBackdropLabel">주문조회</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<small>문의하실 주문번호를 선택하세요.</small>
								<table class="table table-bordered">
									<thead>
										<tr>
											<th>주문번호</th>
											<th>주문일자</th>
											<th>상품명</th>
											<th>주문금액</th>
											<th>선택</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="order" items="${orders}">
											<tr>
												<td>${order.order_id}</td>
												<td>
													<fmt:formatDate value="${order.order_created}" pattern="yyyy/M/dd" />
												</td>
												<td>
													<c:choose>
														<c:when test="${fn:length(order.orderDetail) >1}">
														${order.orderDetail[0].product.product_name} 및 ${fn:length(order.orderDetail)-1}개의 상품
														</c:when>
														<c:otherwise>
														${order.orderDetail[0].product.product_name}
														</c:otherwise>
													</c:choose>
												</td>
												<td>${order.order_total_price }</td>
												<td>
													<input type="radio" name="checkOrder" value="${order.order_id}">
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary btn-sm" id="orderClose_btn" data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
				<button type="submit" class="btn btn-secondary btn-block">저장</button>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		checkPhone();
		$("#question_phone").on('change', checkPhone);

		function checkPhone() {
			var phoneE = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
			var $input = $("#question_phone");
			var $small = $("#question_phone_check");

			if (!phoneE.test($input.val())) {
				phone_flag = false;
				$small.text("-를 포함한  핸드폰 번호를 입력해주세요.");
				$input.removeClass('is-valid');
				$input.addClass('is-invalid');
			} else {
				phone_flag = true;
				$small.text("");
				$input.removeClass('is-invalid');
				$input.addClass('is-valid');
			}
		}

		$("input[name='checkOrder']").click(
				function() {
					$("input[name='order_id']").val(
							$("input[name='checkOrder']:checked").val());
					$('#orderClose_btn').click();

				})
	</script>
</body>
</html>