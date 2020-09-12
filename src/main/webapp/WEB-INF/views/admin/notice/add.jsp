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
		<h3 class="col-sm-12 border-bottom p-5">공지사항 추가</h3>
		<div class="col-sm-12 p-5">
			<form action="${pageContext.request.contextPath}/admin/notice/add"
				method="post">
				<div class="col-12 border mb-5">
					<table class="table">
						<tbody>
							<tr>
								<th scope="row">제목</th>
								<td class="form-inline"><input type="text"
									class="form-control" id="notice_title" name="notice_title"
									placeholder="" required="required"></td>
							</tr>
							<tr>
								<th scope="row">작성자</th>
								<td class="form-inline"><input type="text"
									class="form-control" id="notice_writer" name="notice_writer"
									value="MARKET" required="required" readonly></td>
							</tr>
							<tr>
								<th scope="row">내용</th>
								<td><textarea class="form-control" id="notice_content"
										name="notice_content" rows="10" required="required"></textarea></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col-12 text-center">
					<button type="submit" class="btn btn-dark btn-lg col-4">등록</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>