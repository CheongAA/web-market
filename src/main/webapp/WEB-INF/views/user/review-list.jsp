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
			<h3>구매후기</h3>
			<div class="row mt-5">
				<a class="border bg-light h5 p-3 m-0 text-dark text-decoration-none col-6" href="${pageContext.request.contextPath}/user/reviewable">작성 가능한 구매목록</a>
				<a class="border-top border-left border-right bg-white h5 p-3 m-0 text-dark text-decoration-none col-6" href="${pageContext.request.contextPath}/user/reviewlist">내가 쓴 구매후기</a>
			</div>
			<div class="row justify-content-center mt-5">
				<c:choose>
					<c:when test="${empty reviews}">
						<h6 class="py-5 my-5 font-weight-bold">목록이 없습니다.</h6>
					</c:when>
					<c:otherwise>
						<div class="col-sm-12 p-2 my-2">
							<c:forEach var="review" items="${reviews}" varStatus="status">
								<div class="row border-bottom reviews" id="${review.review_id }">
									<p class="col-sm-1 mt-3 ">${status.count}</p>
									<p class="col-sm-2 mt-3 ">
										<a href="${pageContext.request.contextPath}/product/${review.product_id}" class="text-dark align-middle">${review.product.product_name}</a>
									</p>
									<p class="col-sm-5 mt-3">${review.review_title}[${review.review_star}점]
										<fmt:formatDate value="${review.review_created}" pattern="yyyy-MM-dd" />
									</p>
									<div class="col-sm-2 text-center my-auto p-2">
										<a class="btn btn-sm btn-outline-warning" href="${pageContext.request.contextPath}/user/review/update/${review.review_id}">수정</a>
										<a class="btn btn-sm btn-outline-danger" href="${pageContext.request.contextPath}/user/review/delete/${review.review_id}">삭제</a>
									</div>
								</div>
								<div class="row border-bottom m-1" id="review_content_${review.review_id}" style="display: none;">
									<img alt="" src="${review.review_img}">
									<p>${review.review_content}</p>
									<p>${review.review_view}</p>
								</div>
							</c:forEach>
						</div>
					</c:otherwise>
				</c:choose>

			</div>
		</div>

	</div>
	<script type="text/javascript">
		$(".reviews").hover(function() {
			$(this).css("background-color", "#F2F2F2");
			$(this).css("cursor", "Pointer");
		}, function() {
			$(this).css("background-color", "transparent");
			$(this).css("cursor", "Default");
		});

		$(".reviews").click(function() {
			var td = $("#review_content_" + $(this).attr("id"));

			if (td.css("display") != "block") {
				$("[id^=content_]").css("display", "none");
				td.css("display", "block");
			} else {
				td.css("display", "none");
			}
		});
	</script>
</body>
</html>