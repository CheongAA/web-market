<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<h3 class="mb-5 text-center">회원정보 수정</h3>
			<div class="my-5 p-5 border text-center">
				<h4>회원정보 수정 완료 <i class="far fa-smile"></i></h4>
				<small>회원님의 정보가 수정되었습니다.</small>
			</div>
			<div class="text-center">
				<a href="${pageContext.request.contextPath}/" class="btn btn-secondary btn-lg">확인</a>
			</div>
		</div>
	</div>
</body>
</html>