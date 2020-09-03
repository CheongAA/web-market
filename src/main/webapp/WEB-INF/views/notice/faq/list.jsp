<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MARKET:: 자주하는 질문</title>
</head>
<body>
	<div class="row pt-5">
		<jsp:include page="../notice_header.jsp" flush="false" />
		<div class="col text-center">
			<div class="row pb-4 mb-2">
				<span class="h2">자주하는 질문</span><span class="p-2 pb-0">고객님들께서
					가장 자주하시는 질문을 모두 모았습니다.</span>
			</div>
			<div class="row">
				<table class="table table-borderless text-center" style="table-layout: fixed">
					<thead>
						<tr class="border-bottom">
							<th>번호</th>
							<th>카테고리</th>
							<th colspan="2">제목</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="answer" items="${answers}" varStatus="status">
							<tr class="answer_tr border-bottom">
								<td><c:out value="${status.count} " /></td>
								<td>${answer.answer_category}</td>
								<td colspan="2">${answer.answer_title}</td>
							</tr>
							<tr>
								<td colspan="4" class="p-5 text-left" style="display: none;"
									id="content_${status.count}"><i
									class="fas fa-font market-color"> ></i><span class="ml-2">${answer.answer_content}</span></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			$(".answer_tr").hover(function() {
				$(this).css('background-color', '#E6E6E6');
			}, function() {
				$(this).css('background-color', 'transparent');
			});
		});
		
		$("tr").click(function() {
			var td = $("#content_" + $(this).children("td").html());

			if (td.css("display") == "none") {
				td.css("display", "table-cell");
			} else {
				td.css("display", "none");
			}
		});
	</script>
</body>
</html>