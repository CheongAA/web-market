<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<jsp:include page="../admin_header.jsp" flush="false" />
	<div class="row mt-5">
		<h3 class="w-100 mb-3">이벤트</h3>
		<img class="mw-100" src="${discount.discount_thumbnailImg}" alt="${discount.discount_name }" />
		<div class="col-sm-12 bg-light p-5 mt-3">
			<small>이벤트 코드 : ${discount.discount_id}</small>
			<h1 class="display-4">${discount.discount_name}</h1>
			<h1 class="display-4">${discount.discount_rate}%</h1>
			<p class="lead">${discount.discount_desc}</p>
			<p class="lead">${discount.discount_explanation}</p>
		</div>
	</div>
	<div class="row m-auto px-3">
		<table class="table table-hover mt-3 text-center">
			<thead>
				<tr>
					<th scope="col"></th>
					<th scope="col">상품명</th>
					<th scope="col">할인</th>
					<th scope="col">판매중</th>
					<th scope="col">판매중 변경</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="product" items="${products}" varStatus="status">
					<tr class="rows" id="${product.product_id}">
						<td>${status.count}</td>
						<td>${product.product_name}</td>
						<td>
							<c:choose>
								<c:when test="${product.discount_id != 0}">
									<h5 class="text-primary">O</h5>
								</c:when>
								<c:otherwise>
									<h5 class="text-danger">X</h5>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${product.on_sale == 1}">
									<h5 class="text-primary">O</h5>
								</c:when>
								<c:otherwise>
									<h5 class="text-danger">X</h5>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<a class="btn btn-sm btn-outline-success" href="${pageContext.request.contextPath}/admin/sale/${product.product_id}"> 변경</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="col-sm-12 my-5">
		<a href="${pageContext.request.contextPath}/admin/discount" class="btn btn-dark float-right mx-5">목록</a>
		<button type="button" class="btn btn-danger float-right px-5" id="cancel_btn" data-toggle="modal" data-target="#cart_modal">삭제</button>

		<!-- Modal -->
		<div class="modal fade" id="cart_modal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">이벤트 삭제</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<ul class="text-danger">
							<li>이벤트 삭제 시 할인 상품의 할인 적용이 사라집니다.</li>
							<li>삭제 후에는 다시 <strong>복원할 수 없으니</strong> 이 점 유의바랍니다.
							</li>
						</ul>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
						<a type="button" class="btn btn-danger" href="${pageContext.request.contextPath}/admin/discount/delete/${discount.discount_id}">삭제하기</a>
					</div>
				</div>
			</div>
		</div>
		<a href="${pageContext.request.contextPath}/admin/discount/update/${discount.discount_id}" class="btn btn-warning float-right px-5 mr-1">수정</a>
	</div>
	<script type="text/javascript">
		$(".rows").click(function() {
			location.href = "/admin/product/" + $(this).attr('id');
		});
	</script>
</body>
</html>