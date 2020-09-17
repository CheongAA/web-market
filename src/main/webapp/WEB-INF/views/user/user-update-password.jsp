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
			<h2>회원 비밀번호 수정</h2>
			<div class="row justify-content-center mt-5">
				<div class="col-md-6">
					<div class="card">
						<article class="card-body">
							<form:form action="/user/update/password" method="post" autocomplete="off">
								<input type="hidden" name="user_id" value="${user.user_id}" />
								<div class="form-row">
									<div class="col form-group">
										<label>새비밀번호 </label> <input type="password"
											name="user_password" id="user_password" class="form-control"
											required="required"> <small
											class="form-text text-danger" id="validation_password"></small>
									</div>
									<div class="col form-group">
										<label>새비밀번호 확인</label> <input type="password"
											 id="user_password2"
											class="form-control" required="required"> <small
											class="form-text text-danger" id="validation_password2"></small>
									</div>
								</div>
								<div class="form-group my-4">
									<button type="submit" class="btn btn-dark" id="update_btn">비밀번호 수정</button>
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

		// 정규식
		var pwdE = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		
		// 플래그
		var pwdFlag = false;

		//init
		checkPwd();
		update();

		// 회원가입 버튼 활성화
		function update() {
			if (pwdFlag) {
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
	</script>
</body>
</html>