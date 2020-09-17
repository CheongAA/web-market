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
		$("#user_email").on('blur', checkEmail);
		$("#user_phone").on('blur', checkPhone);
		// 정규식
		var nameE = /^[가-힣a-zA-Z]{2,10}$/;
		var emailE = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		var phoneE = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;

		// 가입 플래그
		var emailFlag = false;
		var phoneFlag = false;

		//init
		checkEmail();
		checkPhone();
		update();

		// 회원가입 버튼 활성화
		function update() {
			if (emailFlag && phoneFlag) {
				$("#update_btn").attr("disabled", false);
			} else {
				$("#update_btn").attr("disabled", true);
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
		$("#address_btn")
				.on(
						'click',
						function() {
							window
									.open(this.href, '_blank',
											'width=400px,height=600px,toolbars=no,scrollbars=no,resizable=no');
							return false;
						});

	</script>
</body>
</html>