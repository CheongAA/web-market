<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자:: 공지사항 수정</title>

</head>
<body>
	<jsp:include page="../admin_header.jsp" flush="false" />
	<div class="row pt-5">
		<div class="pb-4 mb-2">
			<span class="h2">공지사항</span>
		</div>
		<form class="w-100" action="${pageContext.request.contextPath}/admin/notice/update/${notice.notice_id}" method="post">
			<input type="hidden" name="notice_id" value="${notice.notice_id}" />
			<table class="table table-bordered">
				<tbody>
					<tr>
						<th scope="row" style="width: 10%" class="table-secondary">제목</th>
						<td colspan="3">
							<input class="form-control" name="notice_title" type="text" value="${notice.notice_title}" maxlength="20" required />
						</td>
					</tr>
					<tr>
						<th scope="row" class="table-secondary">작성자</th>
						<td colspan="3">
							<input class="form-control" name="notice_writer" type="text" value="${notice.notice_writer}" required readonly/>
						</td>
					</tr>
					<tr>
						<th scope="row" class="table-secondary">작성일</th>
						<td style="width: 20%">
							<fmt:formatDate value="${notice.notice_created}" pattern="yyyy-MM-dd" />
						</td>
						<th style="width: 10%" class="table-secondary">조회수</th>
						<td>${notice.notice_view}</td>
					</tr>
					<tr>
						<td colspan="4">
							<textarea rows="30" name="notice_content" class="form-control" maxlength="500" required>
						${notice.notice_content}
					</textarea>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="w-100">
				<button type="submit" class="btn btn-secondary">수정</button>
			</div>
		</form>
	</div>
</body>
</html>