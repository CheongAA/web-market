<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자:: 상품 할인</title>
</head>
<body>
	<jsp:include page="../admin_header.jsp" flush="false" />
	<div class="row mt-5">
		<form class="m-auto"
			action="${pageContext.request.contextPath}/admin/discount"
			method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="discount_name">이벤트명(옵션)</label> <input type="text"
					class="form-control" id="discount_name" name="discount_name">
			</div>
			<div class="form-group">
				<label for="discount_rate">할인율</label> <input type="number"
					class="form-control" id="discount_rate" name="discount_rate"
					min="1" max="99" required="required">
			</div>
			<div class="form-group">
				<label>할인시작일</label> <input type="date" name="discount_start"
					class="form-control" placeholder="" required="required">
			</div>
			<div class="form-group">
				<label>할인종료일</label> <input type="date" name="discount_end"
					class="form-control" placeholder="" required="required">
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-dark btn-block">등록</button>
			</div>
		</form>
	</div>
</body>
</html>