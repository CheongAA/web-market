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
			<h3 class="mb-5 text-center">개인 정보 메뉴</h3>
			<hr />
			<div class="row pt-5">
				<div class="col-sm-4">
					<a class="btn btn-block btn-secondary text-white p-5" href="${pageContext.request.contextPath}/user/update">개인정보수정</a>
				</div>
				<div class="col-sm-4">
					<a class="btn btn-block btn-secondary text-white p-5" href="${pageContext.request.contextPath}/user/update/password">비밀번호수정</a>
				</div>

				<div class="col-sm-4">
					<button type="button" class="btn btn-block btn-secondary text-white p-5" id="cancel_btn" data-toggle="modal" data-target="#cart_modal">탈퇴하기</button>

					<!-- Modal -->
					<div class="modal fade" id="cart_modal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="staticBackdropLabel">회원탈퇴</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<ul class="text-danger">
										<li>회원탈퇴 시 개인정보 및 MARKET에서 만들어진 모든 데이터는 즉시 삭제됩니다.</li>
										<li>탈퇴 후에는 회원님의 개인정보를 복원할 수 없으니 이 점 유의바랍니다.</li>
									</ul>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
									<a type="button" class="btn btn-danger" href="${pageContext.request.contextPath}/user/cancel/${user.user_id}">탈퇴하기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>