<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>회원가입</title>
</head>
<body>
	<div class="container py-5 text-center">
		<h2>MARKET 회원가입</h2>
		<p class="lead">환영합니다! 회원가입을 통해 더 많은 혜택을 누려보세요.</p>

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
							<c:if test="${msg == 2}">
								<script type="text/javascript">
									alert("비밀번호를 확인해주세요.")
								</script>
							</c:if>

							<div class="form-group">
								<label>아이디</label>
									<input type="text" name="user_identification"
										id="user_identification" class="form-control"
										required="required"> <small
										class="form-text text-danger" id="validation_id"></small>
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
										name="user_password2" id="user_password2" class="form-control"
										required="required"> <small
										class="form-text text-danger" id="validation_password2"></small>
								</div>
							</div>

							<div class="form-group">
								<label>이름</label> <input type="text" name="user_name"
									id="user_name" class="form-control" required="required">
								<small class="form-text text-danger" id="validation_name"></small>
							</div>

							<c:set var="today">
								<fmt:formatDate value="<%=new java.util.Date()%>"
									pattern="yyyy-MM-dd" />
							</c:set>

							<div class="form-group">
								<label>생년월일 (선택)</label> <input type="date" name="user_birth"
									class="form-control" placeholder="" max="${today}">
							</div>
							<div class="form-group">
								<label>이메일</label> <input type="email" name="user_email"
									id="user_email" class="form-control" required="required">
								<small class="form-text text-danger" id="validation_email"></small>
							</div>
							<div class="form-group">
								<label>핸드폰번호</label> <input type="text" name="user_phone"
									id="user_phone" class="form-control" required="required">
								<small class="form-text text-danger" id="validation_phone"></small>
							</div>
							<div class="form-group">
								<label class="form-check form-check-inline"> <input
									class="form-check-input" type="radio" name="user_gender"
									value="남" required="required" checked> <span
									class="form-check-label"> Male </span>
								</label> <label class="form-check form-check-inline"> <input
									class="form-check-input" type="radio" name="user_gender"
									value="여" required="required"> <span
									class="form-check-label"> Female</span>
								</label>
							</div>

							<div class="form-row">
								<label class="w-100">주소</label>
								<div class="col-8 form-group">
									<input type="text" name="user_zip" id="zip"
										class="form-control" readonly="readonly">
								</div>
								<div class="col-4 form-group">
									<button type="button"
										class="btn btn-outline-secondary btn-block"
										id="search_zip_btn">우편번호</button>
								</div>
							</div>
							<div class="form-group">
								<input type="text" name="user_address" id="address"
									class="form-control" readonly="readonly"> <small
									id="guide" class="form-text text-muted"></small>
							</div>
							<div class="form-group">
								<input type="text" name="user_address2" id="address2"
									class="form-control"> <small
									class="form-text text-danger" id="validation_address2"></small>
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-dark btn-block"
									id="signup_btn">OK</button>
							</div>
							<small class="text-muted">By clicking the 'OK' button,
								you confirm that you accept our <br> Terms of use and
								Privacy Policy.
							</small>
						</form:form>
					</article>
					<!-- card-body end .// -->
					<div class="border-top card-body text-center">
						회원이신가요? <a href="/login">Login</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 다음주소 -->
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- script-->
	<script src="${pageContext.request.contextPath}/resources/js/signup.js"></script>
</body>
</html>