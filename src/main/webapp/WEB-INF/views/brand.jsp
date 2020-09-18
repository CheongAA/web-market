<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Brand</title>
</head>
<body>
	<div class="row m-4">
		<div class="col-sm-12 border text-center p-3">
			<div class="col-sm-12">
				<form class="form-inline m-3" action="/brand/search" method="get">
					<div class="form-group mx-auto">
						<input class="form-control" type="text" placeholder="브랜드 검색" name="term" aria-label="Search" value="${term}" />
						<button class="btn" type="submit">
							<i class="fa fa-search" aria-hidden="true"></i>
						</button>
					</div>
				</form>
			</div>
			<div class="col-sm-12 text-dark mb-2 brand-box">
				<a class="col" href="${pageContext.request.contextPath}/brand#all">ALL</a>
				<a class="col" href="${pageContext.request.contextPath}/brand#ga">ㄱ</a>
				<a class="col" href="${pageContext.request.contextPath}/brand#na">ㄴ</a>
				<a class="col" href="${pageContext.request.contextPath}/brand#da">ㄷ</a>
				<a class="col" href="${pageContext.request.contextPath}/brand#ra">ㄹ</a>
				<a class="col" href="${pageContext.request.contextPath}/brand#ma">ㅁ</a>
				<a class="col" href="${pageContext.request.contextPath}/brand#ba">ㅂ</a>
				<a class="col" href="${pageContext.request.contextPath}/brand#sa">ㅅ</a>
				<a class="col" href="${pageContext.request.contextPath}/brand#a">ㅇ</a>
				<a class="col" href="${pageContext.request.contextPath}/brand#ja">ㅈ</a>
				<a class="col" href="${pageContext.request.contextPath}/brand#cha">ㅊ</a>
				<a class="col" href="${pageContext.request.contextPath}/brand#ka">ㅋ</a>
				<a class="col" href="${pageContext.request.contextPath}/brand#ta">ㅌ</a>
				<a class="col" href="${pageContext.request.contextPath}/brand#fa">ㅍ</a>
				<a class="col" href="${pageContext.request.contextPath}/brand#ha">ㅎ</a>
			</div>
			<div class="col-sm-12 mb-2 brand-box">
				<a class="col" href="${pageContext.request.contextPath}/brand#a">A</a>
				<a class="col" href="${pageContext.request.contextPath}/brand#b">B</a>
				<a class="col" href="${pageContext.request.contextPath}/brand#c">C</a>
				<a class="col" href="${pageContext.request.contextPath}/brand#d">D</a>
				<a class="col" href="${pageContext.request.contextPath}/brand#e">E</a>
				<a class="col" href="${pageContext.request.contextPath}/brand#f">F</a>
				<a class="col" href="${pageContext.request.contextPath}/brand#g">G</a>
				<a class="col" href="${pageContext.request.contextPath}/brand#h">H</a>
				<a class="col" href="${pageContext.request.contextPath}/brand#i">I</a>
				<a class="col" href="${pageContext.request.contextPath}/brand#j">J</a>
				<a class="col" href="${pageContext.request.contextPath}/brand#k">K</a>
				<a class="col" href="${pageContext.request.contextPath}/brand#l">L</a>
				<a class="col" href="${pageContext.request.contextPath}/brand#m">M</a>
				<a class="col" href="${pageContext.request.contextPath}/brand#n">N</a>
			</div>
			<div class="col-sm-12 mb-2 brand-box">
				<a class="col" href="${pageContext.request.contextPath}/brand#o">O</a>
				<a class="col" href="${pageContext.request.contextPath}/brand#p">P</a>
				<a class="col" href="${pageContext.request.contextPath}/brand#q">Q</a>
				<a class="col" href="${pageContext.request.contextPath}/brand#r">R</a>
				<a class="col" href="${pageContext.request.contextPath}/brand#s">S</a>
				<a class="col" href="${pageContext.request.contextPath}/brand#t">T</a>
				<a class="col" href="${pageContext.request.contextPath}/brand#u">U</a>
				<a class="col" href="${pageContext.request.contextPath}/brand#v">V</a>
				<a class="col" href="${pageContext.request.contextPath}/brand#w">W</a>
				<a class="col" href="${pageContext.request.contextPath}/brand#x">X</a>
				<a class="col" href="${pageContext.request.contextPath}/brand#y">Y</a>
				<a class="col" href="${pageContext.request.contextPath}/brand#z">Z</a>
				<a class="col" href="${pageContext.request.contextPath}/brand#etc">ETC</a>
			</div>
		</div>
		<c:choose>
			<c:when test="${not empty term}">
				<div class="col-sm-12 mt-5 border">
					<h1>검색결과</h1>
					<c:forEach var="brand" items="${brands}">
						<a href="${pageContext.request.contextPath}/brand/${brand.brand_id}" class="col-sm-2 text-secondary text-decoration-none" id="${brand.brand_id }">${brand.brand_name}</a>
					</c:forEach>
				</div>
			</c:when>
			<c:otherwise>
				<div class="col-sm-12 mt-5 border" id="all">
					<h1>ALL</h1>
					<c:forEach var="brand" items="${brands}">
						<a href="${pageContext.request.contextPath}/brand/${brand.brand_id}" class="col-sm-2 text-secondary text-decoration-none" id="${brand.brand_id }">${brand.brand_name}</a>
					</c:forEach>
				</div>
				<div class="col-sm-12 mt-5 border" id="ga">
					<h1>ㄱ</h1>
				</div>
				<div class="col-sm-12 mt-5 border" id="na">
					<h1>ㄴ</h1>

				</div>
				<div class="col-sm-12 mt-5 border" id="da">
					<h1>ㄷ</h1>

				</div>
				<div class="col-sm-12 mt-5 border" id="ra">
					<h1>ㄹ</h1>

				</div>
				<div class="col-sm-12 mt-5 border" id="ma">
					<h1>ㅁ</h1>

				</div>
				<div class="col-sm-12 mt-5 border" id="ba">
					<h1>ㅂ</h1>

				</div>
				<div class="col-sm-12 mt-5 border" id="sa">
					<h1>ㅅ</h1>

				</div>
				<div class="col-sm-12 mt-5 border" id="a">
					<h1>ㅇ</h1>

				</div>
				<div class="col-sm-12 mt-5 border" id="ja">
					<h1>ㅈ</h1>

				</div>
				<div class="col-sm-12 mt-5 border" id="cha">
					<h1>ㅊ</h1>

				</div>
				<div class="col-sm-12 mt-5 border" id="ka">
					<h1>ㅋ</h1>

				</div>
				<div class="col-sm-12 mt-5 border" id="ta">
					<h1>ㅌ</h1>

				</div>
				<div class="col-sm-12 mt-5 border" id="fa">
					<h1>ㅍ</h1>

				</div>
				<div class="col-sm-12 mt-5 border" id="ha">
					<h1>ㅎ</h1>

				</div>
				<div class="col-sm-12 mt-5 border" id="a">
					<h1>A</h1>

				</div>
				<div class="col-sm-12 mt-5 border" id="b">
					<h1>B</h1>

				</div>
				<div class="col-sm-12 mt-5 border" id="c">
					<h1>C</h1>

				</div>
				<div class="col-sm-12 mt-5 border" id="d">
					<h1>D</h1>

				</div>
				<div class="col-sm-12 mt-5 border" id="e">
					<h1>E</h1>

				</div>
				<div class="col-sm-12 mt-5 border" id="f">
					<h1>F</h1>

				</div>
				<div class="col-sm-12 mt-5 border" id="g">
					<h1>G</h1>

				</div>
				<div class="col-sm-12 mt-5 border" id="h">
					<h1>H</h1>

				</div>
				<div class="col-sm-12 mt-5 border" id="i">
					<h1>I</h1>

				</div>
				<div class="col-sm-12 mt-5 border" id="j">
					<h1>J</h1>

				</div>
				<div class="col-sm-12 mt-5 border" id="k">
					<h1>K</h1>

				</div>
				<div class="col-sm-12 mt-5 border" id="l">
					<h1>L</h1>

				</div>
				<div class="col-sm-12 mt-5 border" id="m">
					<h1>M</h1>

				</div>
				<div class="col-sm-12 mt-5 border" id="n">
					<h1>N</h1>

				</div>
				<div class="col-sm-12 mt-5 border" id="o">
					<h1>O</h1>

				</div>
				<div class="col-sm-12 mt-5 border" id="p">
					<h1>P</h1>

				</div>
				<div class="col-sm-12 mt-5 border" id="q">
					<h1>Q</h1>

				</div>
				<div class="col-sm-12 mt-5 border" id="r">
					<h1>R</h1>

				</div>
				<div class="col-sm-12 mt-5 border" id="s">
					<h1>S</h1>

				</div>
				<div class="col-sm-12 mt-5 border" id="t">
					<h1>T</h1>

				</div>
				<div class="col-sm-12 mt-5 border" id="u">
					<h1>U</h1>

				</div>
				<div class="col-sm-12 mt-5 border" id="v">
					<h1>V</h1>

				</div>
				<div class="col-sm-12 mt-5 border" id="w">
					<h1>W</h1>

				</div>
				<div class="col-sm-12 mt-5 border" id="x">
					<h1>X</h1>

				</div>
				<div class="col-sm-12 mt-5 border" id="y">
					<h1>Y</h1>

				</div>
				<div class="col-sm-12 mt-5 border" id="z">
					<h1>Z</h1>

				</div>
				<div class="col-sm-12 mt-5 border" id="etc">
					<h1>ETC</h1>

				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<script type="text/javascript">
		$('.brand-box a').addClass(
				'text-secondary font-weight-bold h4 text-decoration-none');
		var check_eng = /[a-zA-Z]/; // 문자 
		var check_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글체크

		var space = $("div h1");
		var brands = $("#all a");

		for (var i = 0; i < brands.length; i++) {

			var brand = brands[i].innerText;
			var id = brands[i].id;
			var initial = "";

			if (check_kor.test(brand)) {
				ini = getConstantVowel(brand);
			} else if (check_eng.test(brand)) {
				ini = brand.charAt(0).toUpperCase();
			} else {
				ini = "ETC";
			}

			sortBrand(ini, brand, id);
		}

		function getConstantVowel(kor) {
			const f = [ 'ㄱ', 'ㄲ', 'ㄴ', 'ㄷ', 'ㄸ', 'ㄹ', 'ㅁ', 'ㅂ', 'ㅃ', 'ㅅ', 'ㅆ',
					'ㅇ', 'ㅈ', 'ㅉ', 'ㅊ', 'ㅋ', 'ㅌ', 'ㅍ', 'ㅎ' ];

			const ga = 44032;

			let uni = kor.charCodeAt(0);
			uni = uni - ga;
			let fn = parseInt(uni / 588);

			return f[fn];
		}

		function sortBrand(initial, brand, id) {
			var $a = document.createElement('a');
			$($a).text(brand);
			$($a).addClass("col-sm-2 text-secondary text-decoration-none");
			$($a).attr("href", "/brand/" + id)

			for (var j = 0; j < space.length; j++) {
				if (space[j].innerText == initial) {
					space[j].after($a);
				}
			}
		}
	</script>
</body>
</html>