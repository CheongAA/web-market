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
							<form:form action="/user/update" method="post" autocomplete="off">
								<input type="hidden" name="user_id" value="${user.user_id}" />
								<div class="form-group">
									<label>아이디</label> <input type="text"
										name="user_identification" id="user_identification"
										class="form-control" required="required" readonly="readonly"
										value="${user.user_identification}">
								</div>
								<div class="form-row">
									<div class="col form-group">
										<label>새비밀번호 </label> <input type="password"
											name="user_password" id="user_password" class="form-control"
											required="required"> <small
											class="form-text text-danger" id="validation_password"></small>
									</div>
									<div class="col form-group">
										<label>새비밀번호 확인</label> <input type="password"
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
								<div class="form-row">
									<div class="col form-group">
										<label class="">성별 : </label><span> ${user.user_gender }</span>
									</div>
									<div class="col form-group">
										<label class="">주소</label> <a href="/user/address"
											class="btn btn-secondary btn-sm" id="address_btn"> 배송지 추가</a>
									</div>
								</div>
								<div class="form-group my-4">
									<a class="btn btn-outline-dark" href="">탈퇴하기</a>
									<button type="submit" class="btn btn-dark" id="update_btn">회원정보수정</button>
								</div>
							</form:form>
						</article>
					</div>
				</div>
			</div>
		</div>

	</div>
	<script type="text/javascript">
		
		
		// 이벤트 할당
		$("#user_password").on('blur', checkPwd);
		$("#user_password2").on('blur', checkPwd);
		$("#user_email").on('blur', checkEmail);
		$("#user_phone").on('blur', checkPhone);

		// 회원가입 버튼 비활성화
		$("#signup_btn").attr("disabled", true);

		// 정규식
		var pwdE = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		var nameE = /^[가-힣a-zA-Z]{2,10}$/;
		var emailE = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		var phoneE = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;

		// 가입 플래그
		var pwdFlag = false;
		var emailFlag = false;
		var phoneFlag = false;

		
		//init
		checkPwd();
		checkEmail();
		checkPhone();
		update();
		
		// 회원가입 버튼 활성화
		function update() {
			if (pwdFlag && emailFlag && phoneFlag) {
				$("#update_btn").attr("disabled", false);
			} else {
				$("#update_btn").attr("disabled", true);
			}
		}

		// 비밀번호 유효성 검사
		function checkPwd() {
			var inputValue = $("#user_password").val();
			var inputValue2 = $("#user_password2").val();

			if (!pwdE.test(inputValue)) {
				pwdFlag = false;
				$("#validation_password").text(
						"특수문자 /문자/숫자 포함 형태의 8~15자리 이내의 비밀번호를 입력해주세요.");
				$("#validation_password2").text("");
				$("#user_password2").val('');

				$("#user_password").removeClass('is-valid');
				$("#user_password").addClass('is-invalid');
				$("#user_password2").removeClass('is-valid');
				$("#user_password2").removeClass('is-invalid');
				update();
			} else {
				$("#validation_password").text("");
				$("#user_password").removeClass('is-invalid');
				$("#user_password").addClass('is-valid');

				if (inputValue != inputValue2) {
					pwdFlag = false;
					$("#validation_password2").text("비밀번호가 같지 않습니다.");
					$("#user_password2").removeClass('is-valid');
					$("#user_password2").addClass('is-invalid');
					update();
				} else {
					pwdFlag = true;
					$("#validation_password2").text("");
					$("#user_password").removeClass('is-invalid');
					$("#user_password").addClass('is-valid');
					$("#user_password2").removeClass('is-invalid');
					$("#user_password2").addClass('is-valid');
					update();
				}
			}
		}

		// 이메일 유효성 검사
		function checkEmail() {
			var inputValue = $("#user_email").val();

			if (!emailE.test(inputValue)) {
				emailFlag = false;
				$("#validation_email").text("정확한 이메일 형식을 입력해주세요.");
				$("#user_email").removeClass('is-valid');
				$("#user_email").addClass('is-invalid');
				update();
			} else {
				emailFlag = true;
				$("#validation_email").text("");
				$("#user_email").removeClass('is-invalid');
				$("#user_email").addClass('is-valid');
				update();
			}

		}

		// 핸드폰 번호 유효성 검사
		function checkPhone() {
			var inputValue = $("#user_phone").val();

			if (!phoneE.test(inputValue)) {
				phoneFlag = false;
				$("#validation_phone").text("-를 포함한  핸드폰 번호를 입력해주세요.")
				$("#user_phone").removeClass('is-valid');
				$("#user_phone").addClass('is-invalid');
				update();
			} else {
				phoneFlag = true;
				$("#validation_phone").text("")
				$("#user_phone").removeClass('is-invalid');
				$("#user_phone").addClass('is-valid');
				update();
			}

		}

		//주소찾기버튼
		$("#address_btn").on('click', getAddressList);

		function getAddressList() {
			window
					.open(this.href, '_blank',
							'width=400px,height=600px,toolbars=no,scrollbars=no,resizable=no');
			return false;
		}
	</script>
</body>
</html>