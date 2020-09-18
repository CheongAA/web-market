<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			<h3>구매후기 수정</h3>
			<div class="row justify-content-center mt-5">
				<form action="/user/review/update" method="post">
					<div class="col-12 border mb-5">
						<div class="col-sm-12 p-3 m-2">
							<div class="row m-3">
								<img alt="" src="${orderDetail.product.product_img}" class="col-4 w-25 h-75 mr-3">
								<div class="col-5 mt-5">
									<h5>
										<a href="${pageContext.request.contextPath}/product/${orderDetail.product.product_id}" class="text-dark">${orderDetail.product.product_name}</a>
									</h5>
									<p>
										<fmt:formatNumber pattern="###,###,###" value="${orderDetail.product_price}" />
										원 / ${orderDetail.product_count}개
									</p>
									<p>
										<fmt:formatDate value="${order.order_created}" pattern="yyyy/M/dd" />
									</p>
								</div>
							</div>
						</div>
						<input type="hidden" name="review_id" value="${review.review_id}">
						<table class="table">
							<tbody>
								<tr>
									<th scope="row" style="width: 10%">제목 *</th>
									<td>
										<input type="text" name="review_title" class="form-control col-sm-5" value="${review.review_title }" required>
									</td>
								</tr>
								<tr>
									<th scope="row">평점 *</th>
									<td class="form-inline">
										<select class="form-control" name="review_star">
											<c:forEach begin="1" end="5" varStatus="status">
												<c:choose>
													<c:when test="${review.review_star == status.count}">
														<option value="${status.count}" selected>${status.count}</option>
													</c:when>
													<c:otherwise>
														<option value="${status.count}">${status.count}</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row">사진</th>
									<td class="form-inline">
										<input type="file" class="form-control col-sm-5 mr-3" name="review_img">
									</td>
								</tr>
								<tr>
									<th scope="row">내용 *</th>
									<td colspan="3" rowspan="10">
										<textarea class="form-control" rows="20" cols="100" name="review_content" required>${review.review_content}</textarea>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-12 text-center">
						<button type="submit" class="btn btn-primary btn-lg col-4">등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>