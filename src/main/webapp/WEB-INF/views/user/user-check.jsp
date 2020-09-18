<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<h3 class="mb-5">개인 정보 수정 / 탈퇴</h3>
			<h6>비밀번호 재확인</h6>
			<small>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요.</small>
			<c:if test="${msg == 1}">
				<script type="text/javascript">
					alert("비밀번호를 정확하게 입력해 주세요.");
				</script>
			</c:if>
			<form action="/user/check" method="post">
				<div class="my-4 p-3 border">
					<div class="row m-3">
						<h6 class="col-4">아이디</h6>
						<input type="text" class="col-5 form-control" name="user_identification" />
					</div>
					<div class="row m-3">
						<h6 class="col-4">비밀번호</h6>
						<input type="password" class="col-5 form-control" name="user_password" />
					</div>
				</div>
				<div class="text-center">
					<button type="submit" class="btn btn-secondary btn-lg">확인</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>