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
		<h3 class="col-sm-12 m-3">후기조회</h3>
		<table class="table table-bordered m-2">
			<tbody>
				<tr>
					<th scope="row" style="width: 10%" class="table-secondary">제목</th>
					<td colspan="3">${review.review_title }</td>
				</tr>
				<tr>
					<th scope="row" class="table-secondary">작성자</th>
					<td style="width: 20%">
						<a href="${pageContext.request.contextPath}/admin/user/${review.user_id}">${review.user.user_identification}</a>
					</td>
					<th style="width: 10%" class="table-secondary">상품</th>
					<td>
						<a href="${pageContext.request.contextPath}/admin/product/${review.product_id}">${review.product.product_name}</a>
					</td>
				</tr>
				<tr>
					<th scope="row" class="table-secondary">작성일</th>
					<td style="width: 20%">
						<fmt:formatDate value="${review.review_created}" pattern="yyyy-MM-dd" />
					</td>
					<th style="width: 10%" class="table-secondary">조회수</th>
					<td>${review.review_view}</td>
				</tr>
				<tr>
					<td colspan="4" class="text-center">
						<img alt="후기사진" src="${review.review_img }" class="w-50 d-block mb-3 mx-auto">
						${review.review_content}
					</td>
				</tr>
			</tbody>
		</table>
		<div class="col-sm-12">
			<a href="${pageContext.request.contextPath}/admin/review" class="btn btn-dark float-right mx-5">목록</a>
			<button type="button" class="btn btn-danger float-right px-5" id="cancel_btn" data-toggle="modal" data-target="#cart_modal">삭제</button>

			<!-- Modal -->
			<div class="modal fade" id="cart_modal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="staticBackdropLabel">후기 삭제</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<ul class="text-danger">
								<li>후기 삭제 시 데이터는 즉시 삭제됩니다.</li>
								<li>삭제 후에는 후기를 <strong>복원할 수 없으니</strong> 이 점 유의바랍니다.
								</li>
							</ul>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							<a type="button" class="btn btn-danger" href="${pageContext.request.contextPath}/admin/review/delete/${review.review_id}">삭제하기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>