<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자:: 공지 조회 /수정/삭제</title>
</head>
<body>
	<jsp:include page="../admin_header.jsp" flush="false" />
	<div class="row mt-5">
		<h3 class="w-100">FAQ 조회 / 수정 / 삭제</h3>
		<table class="table table-borderless text-center"
			style="table-layout: fixed">
			<thead>
				<tr class="border-bottom">
					<th></th>
					<th>번호</th>
					<th>카테고리</th>
					<th colspan="2">제목</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="answer" items="${answers}" varStatus="status">
					<c:if test="${answer.question_category_id != 0}">
						<tr class="border-bottom">
							<td><input type="radio" name="answer_id"
								value="${answer.answer_id}" /></td>
							<td><c:out value="${status.count} " /></td>
							<td>${answer.questionCategory.question_category_title}</td>
							<td class="answer_title font-weight-bold"
								id="${answer.answer_id}" colspan="2">${answer.answer_title}</td>
						</tr>
						<tr>
							<td colspan="5" class="p-5 text-left" style="display: none;"
								id="content_${status.count}"><i
								class="fas fa-font market-color"> ></i><span class="ml-2">${answer.answer_content}</span></td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
		<div class="w-100 my-5">
			<button id="delete_btn" class="btn btn-danger float-right px-5">삭제</button>
			<a href="${pageContext.request.contextPath}"
				class="btn btn-warning float-right px-5 mr-1">수정</a> <a
				href="${pageContext.request.contextPath}/admin/answer/add/0"
				class="btn btn-primary float-right px-5 mr-1">등록</a>
		</div>
	</div>
	<script type="text/javascript">
		$(".answer_title").click(function() {
			var td = $("#content_" + $(this).attr('id'));

			if (td.css("display") != "table-cell") {
				$("[id^=content_]").css("display", "none");
				td.css("display", "table-cell");
			} else {
				td.css("display", "none");
			}
		});
		$("#delete_btn").click(function() {
			var data = $("input[name='answer_id']:checked").val();
			$.ajax({
				url : "/admin/answer/delete/" + data,
				type : "get",
				success : function(data) {
					alert("삭제되었습니다.");
					window.location.reload(true);
				}
			});
		});
	</script>
</body>
</html>