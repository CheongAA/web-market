<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>MARKET:: 회원가입</title>
</head>
<body>
	<div class="container py-5 text-center">
		<h2>MARKET 회원가입</h2>
		<p class="lead">환영합니다! 회원가입을 통해 더 많은 혜택을 누려보세요.</p>

		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card">
					<article class="card-body">
						<form:form commandName="user" action="/signup" method="post" autocomplete="off">
							<c:if test="${msg == 1}">
								<script type="text/javascript">
									alert("정확한 정보를 입력해주세요.")
								</script>
							</c:if>
							<div class="form-group">
								<label>아이디</label>
								<input type="text" name="user_identification" id="user_identification" class="form-control" required="required">
								<small class="form-text text-danger" id="validation_id"></small>
							</div>
							<div class="form-row">
								<div class="col form-group">
									<label>비밀번호 </label>
									<input type="password" name="user_password" id="user_password" class="form-control" required="required">
									<small class="form-text text-danger" id="validation_password"></small>
								</div>
								<div class="col form-group">
									<label>비밀번호 확인</label>
									<input type="password" name="user_password2" id="user_password2" class="form-control" required="required">
									<small class="form-text text-danger" id="validation_password2"></small>
								</div>
							</div>

							<div class="form-group">
								<label>이름</label>
								<input type="text" name="user_name" id="user_name" class="form-control" required="required">
								<small class="form-text text-danger" id="validation_name"></small>
							</div>

							<c:set var="today">
								<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd" />
							</c:set>

							<div class="form-group">
								<label>생년월일 (선택)</label>
								<input type="date" name="user_birth" class="form-control" placeholder="" max="${today}">
							</div>
							<div class="form-group">
								<label>이메일</label>
								<input type="email" name="user_email" id="user_email" class="form-control" required="required">
								<small class="form-text text-danger" id="validation_email"></small>
							</div>
							<div class="form-group">
								<label>핸드폰번호</label>
								<input type="text" name="user_phone" id="user_phone" class="form-control" required="required">
								<small class="form-text text-danger" id="validation_phone"></small>
							</div>
							<div class="form-group">
								<label class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="user_gender" value="남" required="required" checked>
									<span class="form-check-label"> Male </span>
								</label>
								<label class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="user_gender" value="여" required="required">
									<span class="form-check-label"> Female</span>
								</label>
							</div>

							<div class="form-row">
								<label class="w-100">주소</label>
								<div class="col-8 form-group">
									<input type="text" name="address_zip" id="zip" class="form-control" readonly="readonly">
								</div>
								<div class="col-4 form-group">
									<button type="button" class="btn btn-outline-secondary btn-block" id="search_zip_btn">우편번호</button>
								</div>
							</div>
							<div class="form-group">
								<input type="text" name="address_detail" id="address" class="form-control" readonly="readonly">
								<small id="guide" class="form-text text-muted"></small>
							</div>
							<div class="form-group">
								<input type="text" name="address_detail2" id="address2" class="form-control">
								<small class="form-text text-danger" id="validation_address2"></small>
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-dark btn-block" id="signup_btn">OK</button>
							</div>
							<small class="text-muted">By clicking the 'OK' button, you confirm that you accept our <br> Terms of use and Privacy Policy.
							</small>
						</form:form>
					</article>
					<!-- card-body end .// -->
					<div class="border-top card-body text-center">
						회원이신가요? <a href="/login">로그인</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 다음주소 -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- script-->
	<script type="text/javascript">
		// 이벤트 할당
		$("#user_identification").on('blur', checkId);
		$("#user_password").on('blur', checkPwd);
		$("#user_password2").on('blur', checkPwd);
		$("#user_name").on('blur', checkName);
		$("#user_email").on('blur', checkEmail);
		$("#user_phone").on('blur', checkPhone);
		$("#zip").on('blur', checkAddress);
		$("#address").on('blur', checkAddress);
		$("#address2").on('blur', checkAddress);
		$("#search_zip_btn").on('click', execDaumPostcode);

		// 정규식
		var idE = /^[a-zA-Z0-9]{4,12}$/;
		var pwdE = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		var nameE = /^[가-힣a-zA-Z]{2,10}$/;
		var emailE = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		var phoneE = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;

		// 가입 플래그
		var idFlag = false;
		var pwdFlag = false;
		var nameFlag = false;
		var emailFlag = false;
		var phoneFlag = false;
		var addressFlag = false;

		//init
		checkId();
		checkPwd();
		checkName();
		checkEmail();
		checkPhone();
		checkAddress();
		signup();

		// 회원가입 버튼 활성화
		function signup() {
			if (idFlag && pwdFlag && nameFlag && emailFlag && phoneFlag
					&& addressFlag) {
				$("#signup_btn").attr("disabled", false);
			} else {
				$("#signup_btn").attr("disabled", true);
			}
		}

		// 아이디 유효성 검사
		function checkId() {
			var inputValue = $("#user_identification").val();
			$
					.ajax({
						url : "/idCheck",
						type : "get",
						data : {
							user_identification : inputValue
						},
						success : function(data) {
							if (data == 1) {
								idFlag = false;
								$("#validation_id").text("이미 사용중인 아이디입니다.");
								$("#validation_id").removeClass('text-primary');
								$("#validation_id").addClass('text-danger');

								$("#user_identification").removeClass(
										'is-valid');
								$("#user_identification")
										.addClass('is-invalid');
								signup();
							} else {
								if (!idE.test(inputValue)) {
									idFlag = false;
									$("#validation_id").text(
											"4~12자의 영문 대소문자와 숫자로만 입력해주세요.");
									$("#validation_id").removeClass(
											'text-primary');
									$("#validation_id").addClass('text-danger');

									$("#user_identification").removeClass(
											'is-valid');
									$("#user_identification").addClass(
											'is-invalid');
									signup();
								} else {
									idFlag = true;
									$("#validation_id").text("사용 가능한 아이디입니다.");
									$("#validation_id").removeClass(
											'text-danger');
									$("#validation_id")
											.addClass('text-primary');

									$("#user_identification").removeClass(
											'is-invalid');
									$("#user_identification").addClass(
											'is-valid');
									signup();
								}
							}
						}
					});

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
				signup();
			} else {
				$("#validation_password").text("");
				$("#user_password").removeClass('is-invalid');
				$("#user_password").addClass('is-valid');

				if (inputValue != inputValue2) {
					pwdFlag = false;
					$("#validation_password2").text("비밀번호가 같지 않습니다.");
					$("#user_password2").removeClass('is-valid');
					$("#user_password2").addClass('is-invalid');
					signup();
				} else {
					pwdFlag = true;
					$("#validation_password2").text("");
					$("#user_password").removeClass('is-invalid');
					$("#user_password").addClass('is-valid');
					$("#user_password2").removeClass('is-invalid');
					$("#user_password2").addClass('is-valid');
					signup();
				}
			}
		}

		// 이름 유효성 검사
		function checkName() {
			var inputValue = $("#user_name").val();

			if (!nameE.test(inputValue)) {
				nameFlag = false;
				$("#validation_name").text("2~10자리 이내의 이름을 입력해주세요.");
				$("#user_name").removeClass('is-valid');
				$("#user_name").addClass('is-invalid');
				signup();
			} else {
				nameFlag = true;
				$("#validation_name").text("");
				$("#user_name").removeClass('is-invalid');
				$("#user_name").addClass('is-valid');
				signup();
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
				signup();
			} else {
				emailFlag = true;
				$("#validation_email").text("");
				$("#user_email").removeClass('is-invalid');
				$("#user_email").addClass('is-valid');
				signup();
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
				signup();
			} else {
				phoneFlag = true;
				$("#validation_phone").text("")
				$("#user_phone").removeClass('is-invalid');
				$("#user_phone").addClass('is-valid');
				signup();
			}

		}

		// 주소 유효성 검사
		function checkAddress() {
			var inputValue1 = $("#zip").val();
			var inputValue2 = $("#address").val();
			var inputValue3 = $("#address2").val();

			if (inputValue3.length > 50) {
				addressFlag = false;
				$("#validation_address2").text("50자 이내의 주소를 입력해주세요.");
				signup();
			} else if (inputValue1 != "" && inputValue2 != ""
					&& inputValue3 != "") {
				addressFlag = true;
				$("#validation_address2").text("");
				signup();
			} else {
				addressFlag = false;
				$("#validation_address2").text("정확한  주소를 입력해주세요");
				signup();
			}
		}

		// 주소찾기
		function execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var roadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 참고 항목 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					$('#zip').val(data.zonecode);
					$("#address").val(roadAddr);

					// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
					if (roadAddr !== '') {
						$("#address2").val(extraRoadAddr);
					} else {
						$("#address2").val('');
					}

					var guideTextBox = $("#guide");
					// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
					if (data.autoRoadAddress) {
						var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
						guideTextBox.text('(예상 도로명 주소 : ' + expRoadAddr + ')');
						guideTextBox.css("display", "block");
						checkAddress();

					} else if (data.autoJibunAddress) {
						var expJibunAddr = data.autoJibunAddress;
						guideTextBox.text('(예상 지번 주소 : ' + expJibunAddr + ')');
						guideTextBox.css("display", "block");
						checkAddress();
					} else {
						guideTextBox.text('');
						guideTextBox.css("display", "none");
						checkAddress();
					}
				}
			}).open();
		}
	</script>

</body>
</html>