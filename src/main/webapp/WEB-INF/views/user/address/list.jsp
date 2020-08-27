<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>배송지</title>
</head>
<body>
	<h5 class="text-center m-3">배송지</h5>
	<c:forEach var="address" items="${addresses}">
		<div class="border m-3 p-3">
			<h5>${address.address_recipient}</h5>
			<c:if test="${address.address_default == 1}">
				<span class="badge badge-pill badge-primary">기본배송지</span>
			</c:if>
			<h6>${address.address_zip}</h6>
			<h6>${address.address_detail}${address.address_detail2}</h6>
			<h6>${address.address_phone}</h6>
			<a class="btn btn-sm btn-outline-primary"
				href="/user/address/${address.address_id}">수정</a>
		</div>
	</c:forEach>
	<div class="float-right m-3">
		<a class="btn btn-primary"
			href="${pageContext.request.contextPath}/user/address/add">배송지 추가</a>
	</div>

	<script type="text/javascript">
		window.addEventListener("beforeunload", function(event) {
			window.opener.location.reload();
			window.close();
		});
	</script>
</body>
</html>