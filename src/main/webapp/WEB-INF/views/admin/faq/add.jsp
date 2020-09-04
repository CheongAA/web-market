<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자:: 공지사항 추가</title>

</head>
<body>
	<jsp:include page="../admin_header.jsp" flush="false" />
	<div class="row mt-5">
		<h3 class="w-100 text-center border-bottom pb-5">공지사항 추가</h3>
		<form class="m-auto"
			action="${pageContext.request.contextPath}/admin/notice/add"
			method="post">
			<div class="form-group">
				<label for="notice_title">제목</label> <input type="text"
					class="form-control" id="notice_title" name="notice_title"
					placeholder="" required="required">
			</div>
			<div class="form-group">
				<label for="notice_title">작성자</label> <input type="text"
					class="form-control" id="notice_writer" name="notice_writer"
					placeholder="" required="required" value="Market">
			</div>
			<div class="form-group">
				<label for="notice_content">내용</label>
				<textarea class="form-control" id="notice_content"
					name="notice_content" rows="50" required="required"></textarea>
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-dark btn-block">등록</button>
			</div>
		</form>
	</div>
</body>
</html>