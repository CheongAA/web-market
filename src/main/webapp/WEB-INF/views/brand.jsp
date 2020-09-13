<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<form class="form-inline m-3">
					<div class="form-group mx-auto">
						<input class="form-control" type="text" placeholder="브랜드 검색"
							aria-label="Search" />
						<button class="btn" type="submit">
							<i class="fa fa-search" aria-hidden="true"></i>
						</button>
					</div>
				</form>
			</div>
			<div class="col-sm-12 text-dark mb-2 brand-box">
				<a class="col" href="#all">ALL</a> <a class="col" href="#ga">ㄱ</a> <a
					class="col" href="#na">ㄴ</a> <a class="col" href="#da">ㄷ</a> <a
					class="col" href="#ra">ㄹ</a> <a class="col" href="#ma">ㅁ</a> <a
					class="col" href="#ba">ㅂ</a> <a class="col" href="#sa">ㅅ</a> <a
					class="col" href="#a">ㅇ</a> <a class="col" href="#ja">ㅈ</a> <a
					class="col" href="#cha">ㅊ</a> <a class="col" href="#ka">ㅋ</a> <a
					class="col" href="#ta">ㅌ</a> <a class="col" href="#fa">ㅍ</a> <a
					class="col" href="#ha">ㅎ</a>
			</div>
			<div class="col-sm-12 mb-2 brand-box">
				<a class="col" href="#a">A</a> <a class="col" href="#b">B</a> <a
					class="col" href="#c">C</a> <a class="col" href="#d">D</a> <a
					class="col" href="#e">E</a> <a class="col" href="#f">F</a> <a
					class="col" href="#g">G</a> <a class="col" href="#h">H</a> <a
					class="col" href="#i">I</a> <a class="col" href="#j">J</a> <a
					class="col" href="#k">K</a> <a class="col" href="#l">L</a> <a
					class="col" href="#m">M</a> <a class="col" href="#n">N</a>
			</div>
			<div class="col-sm-12 mb-2 brand-box">
				<a class="col" href="#o">O</a> <a class="col" href="#p">P</a> <a
					class="col" href="#q">Q</a> <a class="col" href="#r">R</a> <a
					class="col" href="#s">S</a> <a class="col" href="#t">T</a> <a
					class="col" href="#u">U</a> <a class="col" href="#v">V</a> <a
					class="col" href="#w">W</a> <a class="col" href="#x">X</a> <a
					class="col" href="#y">Y</a> <a class="col" href="#z">Z</a> <a
					class="col" href="#etc">ETC</a>
			</div>
		</div>
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
		<div class="col-sm-12 mt-5 border" id="ha">
			<h1>B</h1>

		</div>
		<div class="col-sm-12 mt-5 border" id="ha">
			<h1>C</h1>

		</div>
		<div class="col-sm-12 mt-5 border" id="ha">
			<h1>D</h1>

		</div>
		<div class="col-sm-12 mt-5 border" id="ha">
			<h1>E</h1>

		</div>
		<div class="col-sm-12 mt-5 border" id="ha">
			<h1>F</h1>

		</div>
		<div class="col-sm-12 mt-5 border" id="ha">
			<h1>G</h1>

		</div>
		<div class="col-sm-12 mt-5 border" id="ha">
			<h1>H</h1>

		</div>
		<div class="col-sm-12 mt-5 border" id="ha">
			<h1>I</h1>

		</div>
		<div class="col-sm-12 mt-5 border" id="ha">
			<h1>J</h1>

		</div>
		<div class="col-sm-12 mt-5 border" id="ha">
			<h1>K</h1>

		</div>
		<div class="col-sm-12 mt-5 border" id="ha">
			<h1>L</h1>

		</div>
		<div class="col-sm-12 mt-5 border" id="ha">
			<h1>M</h1>

		</div>
		<div class="col-sm-12 mt-5 border" id="ha">
			<h1>N</h1>

		</div>
		<div class="col-sm-12 mt-5 border" id="ha">
			<h1>O</h1>

		</div>
		<div class="col-sm-12 mt-5 border" id="ha">
			<h1>P</h1>

		</div>
		<div class="col-sm-12 mt-5 border" id="ha">
			<h1>Q</h1>

		</div>
		<div class="col-sm-12 mt-5 border" id="ha">
			<h1>R</h1>

		</div>
		<div class="col-sm-12 mt-5 border" id="ha">
			<h1>S</h1>

		</div>
		<div class="col-sm-12 mt-5 border" id="ha">
			<h1>T</h1>

		</div>
		<div class="col-sm-12 mt-5 border" id="ha">
			<h1>U</h1>

		</div>
		<div class="col-sm-12 mt-5 border" id="ha">
			<h1>V</h1>

		</div>
		<div class="col-sm-12 mt-5 border" id="ha">
			<h1>W</h1>

		</div>
		<div class="col-sm-12 mt-5 border" id="ha">
			<h1>X</h1>

		</div>
		<div class="col-sm-12 mt-5 border" id="ha">
			<h1>Y</h1>

		</div>
		<div class="col-sm-12 mt-5 border" id="ha">
			<h1>Z</h1>

		</div>
		<div class="col-sm-12 mt-5 border" id="ha">
			<h1>ETC</h1>

		</div>



	</div>
	<script type="text/javascript">
		$('.brand-box a').addClass('text-secondary font-weight-bold h4 text-decoration-none');
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

			sortBrand(ini, brand,id);
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

		function sortBrand(initial, brand,id) {
			var $a = document.createElement('a');
			$($a).text(brand);
			$($a).addClass("col-sm-2 text-secondary text-decoration-none"); 
			$($a).attr("href", "/brand/"+id)

			for (var j = 0; j < space.length; j++) {
				if (space[j].innerText == initial) {
					space[j].after($a);
				}
			}
		}
	</script>
</body>
</html>