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
		<div class="col  py-5 text-center">
			<h2>회원정보 수정</h2>
			<div class="row justify-content-center">
				<div class="col-md-6">
					<div class="card">
						<article class="card-body">
							<form:form commandName="user" action="/signup" method="post"
								autocomplete="off">
								<c:if test="${msg == 1}">
									<script type="text/javascript">
										alert("정확한 정보를 입력해주세요.")
									</script>
								</c:if>
								<div class="form-group">
									<label>아이디</label> <input type="text"
										name="user_identification" id="user_identification"
										class="form-control" required="required" readonly="readonly"
										value="${user.user_identification}">
								</div>
								<div class="form-row">
									<div class="col form-group">
										<label>비밀번호 </label> <input type="password"
											name="user_password" id="user_password" class="form-control"
											required="required"> <small
											class="form-text text-danger" id="validation_password"></small>
									</div>
									<div class="col form-group">
										<label>비밀번호 확인</label> <input type="password"
											name="user_password2" id="user_password2"
											class="form-control" required="required"> <small
											class="form-text text-danger" id="validation_password2"></small>
									</div>
								</div>

								<div class="form-group">
									<label>이름</label> <input type="text" name="user_name"
										id="user_name" class="form-control" required="required"
										readonly="readonly" value="${user.user_name}">
								</div>

								<c:set var="today">
									<fmt:formatDate value="<%=new java.util.Date()%>"
										pattern="yyyy-MM-dd" />
								</c:set>

								<div class="form-group">
									<label>생년월일 (선택)</label> <input type="date" name="user_birth"
										class="form-control" placeholder="" max="${today}"
										value="${user.user_birth}">
								</div>
								<div class="form-group">
									<label>이메일</label> <input type="email" name="user_email"
										id="user_email" class="form-control" required="required"
										value="${user.user_email}"> <small
										class="form-text text-danger" id="validation_email"></small>
								</div>
								<div class="form-group">
									<label>핸드폰번호</label> <input type="text" name="user_phone"
										id="user_phone" class="form-control" required="required"
										value="${user.user_phone}"> <small
										class="form-text text-danger" id="validation_phone"></small>
								</div>
								<div class="form-group">
									<label class="form-check form-check-inline"> <input
										class="form-check-input" type="radio" name="user_gender"
										value="남" required="required" checked readonly="readonly">
										<span class="form-check-label"> Male </span>
									</label> <label class="form-check form-check-inline"> <input
										class="form-check-input" type="radio" name="user_gender"
										value="여" required="required" readonly="readonly"> <span
										class="form-check-label"> Female</span>
									</label>
								</div>

								<div class="form-row">
									<label class="w-100">주소</label> <a href="/user/address"
										class="btn btn-secondary btn-sm mx-auto" id="address_btn"> 배송지 추가</a>
								</div>
								<div class="form-group my-4">
									<button type="submit" class="btn btn-dark btn-block"
										id="signup_btn">OK</button>
								</div>
							</form:form>
						</article>
					</div>
				</div>
			</div>
		</div>

	</div>
	<script type="text/javascript">
		$("#address_btn").on('click', getAddressList);

		function getAddressList() {
			window.open(this.href, '_blank',
					'width=400px,height=600px,toolbars=no,scrollbars=no,resizable=no');
			return false;
		}
	</script>
</body>
</html>