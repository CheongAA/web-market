<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<h3>구매후기</h3>
			<div class="row mt-5">
				<a
					class="border-top border-left border-right bg-white h5 p-3 m-0 text-dark text-decoration-none col-6"
					href="${pageContext.request.contextPath}/user/reviewable">작성
					가능한 구매목록</a> <a
					class="border bg-light h5 p-3 m-0 text-dark text-decoration-none col-6"
					href="${pageContext.request.contextPath}/user/review">내가 쓴 구매후기</a>
			</div>
			<div class="row justify-content-center mt-5">
				<c:choose>
					<c:when test="${empty orders}">
						<h6 class="py-5 my-5 font-weight-bold">목록이 없습니다.</h6>
					</c:when>
					<c:otherwise>
						<div class="col-sm-12 p-2 my-2">
							<c:forEach var="order" items="${orders}">
								<c:if
									test="${order.order_state_id ==3 or order.order_state_id ==9}">
									<c:forEach var="orderDetail" items="${order.orderDetail}">
										<c:if test="${orderDetail.review_id == 0 }">
											<div class="row border-bottom">
												<div class="col-sm-8 p-3 m-2">

													<div class="row m-3">
														<img alt=""
															src="${orderDetail.product.product_thumbnailImg}"
															class="col-4 w-25 h-75 mr-3">
														<div class="col-5 mt-5">
															<h5>
																<a
																	href="${pageContext.request.contextPath}/product/${orderDetail.product.product_id}"
																	class="text-dark">${orderDetail.product.product_name}</a>
															</h5>
															<p>
																<fmt:formatNumber pattern="###,###,###"
																	value="${orderDetail.product_price}" />
																원 / ${orderDetail.product_count}개
															</p>
															<p>
																<fmt:formatDate value="${order.order_created}"
																	pattern="yyyy/M/dd" />
															</p>
														</div>
													</div>
												</div>
												<div class="col-sm-3 text-center my-auto p-2">
													<a class="btn btn-sm btn-outline-primary btn-block"
														href="${pageContext.request.contextPath}/user/review/add/${orderDetail.order_detail_id}">후기쓰기</a>
												</div>
											</div>
										</c:if>
									</c:forEach>
								</c:if>
							</c:forEach>
						</div>
					</c:otherwise>
				</c:choose>

			</div>
		</div>

	</div>
</body>
</html>