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
			<h3>주문조회</h3>
			<div class="row justify-content-center mt-5">
				<c:choose>
					<c:when test="${empty orders}">
						<h6 class="py-5 my-5 font-weight-bold">목록이 없습니다.</h6>
					</c:when>
					<c:otherwise>
						<c:forEach var="order" items="${orders}">
							<div class="col-sm-12 border p-2 my-2">
								<div class="row border-bottom m-0">
									<h5 class="font-weight-light">
										주문일
										<fmt:formatDate value="${order.order_created}"
											pattern="yyyy/M/dd" />
									</h5>
								</div>
								<div class="row">
									<div class="col-sm-8 p-3 m-2">
										<c:forEach var="orderDetail" items="${order.orderDetail}">
											<div class="row m-3">
												<img alt=""
													src="${orderDetail.product.product_thumbnailImg}"
													class="w-25 h-75 mr-3">
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
											</div>
										</c:forEach>
									</div>
									<div class="col-sm-3 text-center my-auto p-2">
										<h5>${order.orderState.order_state_title}</h5>
										<a class="btn btn-sm btn-outline-primary btn-block"
											href="${pageContext.request.contextPath}/user/order/${order.order_id}">주문조회</a>
										<a class="btn btn-sm btn-outline-primary btn-block">교환신청</a> <a
											class="btn btn-sm btn-outline-primary btn-block">반품신청</a> <a
											class="btn btn-sm btn-outline-primary btn-block">후기쓰기</a>
									</div>
								</div>
							</div>

						</c:forEach>
					</c:otherwise>
				</c:choose>

			</div>
		</div>

	</div>
</body>
</html>