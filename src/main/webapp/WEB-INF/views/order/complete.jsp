<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- custom CSS -->
<title>주문</title>
</head>
<body>
	<div class="m-5">
		<div class="row text-center mb-5">
			<h2 class="w-100">주문완료</h2>
			<div class="col-sm-12 border p-5 my-5">
				<h3 class="my-2">${user.user_name}님의주문이 완료되었습니다!</h3>
				<small>자세한 주문 사항은 마이페이지 내 주문조회에서 확인하실 수 있습니다.</small>
				<div class="text-center mt-5">
					<a href="${pageContext.request.contextPath}/user/order" class="btn btn-secondary">주문목록</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>