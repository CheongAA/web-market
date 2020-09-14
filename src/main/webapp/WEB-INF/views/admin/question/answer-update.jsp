<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<div class="col-12 mt-5">
		<h3 class="col-sm-12 border-bottom pb-5">답변 수정하기</h3>
		<form action="/admin/answer/update" method="post">
			<input type="hidden" name="answer_id" value="${answer.answer_id}">
			<table class="table table-bordered">
				<tbody>
					<tr>
						<th scope="row" style="width: 10%" class="table-secondary">제목
							*</th>
						<td><c:choose>
								<c:when test="${questionCategories != null}">
									<select class="mb-2" name="question_category_id"
										class="form-control">
										<c:forEach var="questionCategory"
											items="${questionCategories}">
											<c:choose>
												<c:when
													test="${questionCategory.question_category_title eq answer.questionCategory.question_category_title}">
													<option value="${questionCategory.question_category_id}"
														selected>${questionCategory.question_category_title}</option>
												</c:when>
												<c:otherwise>
													<option value="${questionCategory.question_category_id}">${questionCategory.question_category_title}</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
									<input type="text" name="answer_title"
										class="form-control col-sm-5" value="${answer.answer_title}"
										required>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="question_category_id"
										value="${answer.question_category_id}">
									<input type="text" name="answer_title"
										class="form-control col-sm-5" value="${answer.answer_title}"
										readonly required>
								</c:otherwise>
							</c:choose></td>
					</tr>
					<tr>
						<th scope="row" class="table-secondary">내용 *</th>
						<td colspan="3" rowspan="10"><textarea class="form-control"
								rows="20" cols="100" name="answer_content" required>${answer.answer_content }</textarea></td>
					</tr>
				</tbody>
			</table>
			<button type="submit" class="btn btn-primary float-right">저장</button>
		</form>
	</div>
</body>
</html>