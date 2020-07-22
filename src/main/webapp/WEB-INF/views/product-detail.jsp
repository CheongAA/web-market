<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 디테일</title>
<script>
	function getInfo(name) {
		currentState = document.getElementById(name).style.display;
		console.log(currentState);
		if (currentState == "block") {
			document.getElementById(name).style.display = "none";
		} else {
			document.getElementById(name).style.display = "block";
		}
	}
</script>
</head>
<body>
	<div class="row m-4">
		<div class="col">
			<div class="row mb-5">
				<div class="col-sm-5 pl-0 mr-5">
					<img class="w-100 h-100 mb-3 product-img" alt=""
						src="data:image/jpeg;base64,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">
				</div>
				<div class="col-sm-6">
					<h2>${product.product_name}</h2>
					<p class="text-muted">${product.product_desc}</p>
					<h2>${product.product_price}원</h2>
					<div class="row">
						<table class="table table-borderless mt-3">
							<thead>
								<tr>
									<th style="width: 40%">판매단위</th>
									<td>1팩</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">중량/용량</th>
									<td>옵션별 상이</td>
								</tr>
								<tr>
									<th scope="row">원산지</th>
									<td>Larry</td>
								</tr>
								<tr>
									<th scope="row">유통기한</th>
									<td>Larry</td>
								</tr>
								<tr>
									<th scope="row">안내사항</th>
									<td>Larry</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="row mt-4">
						<form class=" col px-0">
							<div class="form-group">
							<form>
								<select class="form-control m-3">
									<option>${product.product_volume}g</option>
								</select>
								<button class="col-5 btn btn-outline-info py-3 my-3 ml-5">SHOPPING
									BAG</button>
								<a href="/order/${product.product_id}" class="col-5 btn btn-info py-3" >BUY NOW</a>
							</form>
							</div>

						</form>
					</div>
					<div class="row  mt-4">
						<button class="col btn btn-light text-center">
							<p class="float-left">
								앱에서 첫 구매 시 15% 할인 <br> 그리고 다양한 추가 할인 혜택들
							</p>
							<i class="fas fa-arrow-right float-right pt-3"></i>
						</button>
					</div>
				</div>
			</div>
			<div class="row pt-5">
				<ul class="col nav nav-tabs">
					<li class="nav-item"><a class="nav-link active h4 px-5"
						href="#desc">상품설명</a></li>
					<li class="nav-item"><a class="nav-link h4 px-5" href="#image">상품이미지</a></li>
					<li class="nav-item"><a class="nav-link h4 px-5"
						href="#desc_detail">상세정보</a></li>
					<li class="nav-item"><a class="nav-link h4 px-5"
						href="#review">고객후기</a></li>
					<li class="nav-item"><a class="nav-link h4 px-5" href="#qna">상품문의</a></li>
				</ul>
			</div>
			<div class="row pt-5" id="desc">
				<img alt="" src=""> 상품설명이미지
			</div>
			<div class="row pt-5">
				<ul class="col nav nav-tabs">
					<li class="nav-item"><a class="nav-link h4 px-5" href="#desc">상품설명</a>
					</li>
					<li class="nav-item"><a class="nav-link active h4 px-5"
						href="#image">상품이미지</a></li>
					<li class="nav-item"><a class="nav-link h4 px-5"
						href="#desc_detail">상세정보</a></li>
					<li class="nav-item"><a class="nav-link h4 px-5"
						href="#review">고객후기</a></li>
					<li class="nav-item"><a class="nav-link h4 px-5" href="#qna">상품문의</a></li>
				</ul>
			</div>
			<div class="row pt-5" id="image">
				<img alt="" src=""> 상품이미지
			</div>
			<div class="row pt-5">
				<ul class="col nav nav-tabs">
					<li class="nav-item"><a class="nav-link h4 px-5" href="#desc">상품설명</a>
					</li>
					<li class="nav-item"><a class="nav-link  h4 px-5"
						href="#image">상품이미지</a></li>
					<li class="nav-item"><a class="nav-link active h4 px-5"
						href="#desc_detail">상세정보</a></li>
					<li class="nav-item"><a class="nav-link h4 px-5"
						href="#review">고객후기</a></li>
					<li class="nav-item"><a class="nav-link h4 px-5" href="#qna">상품문의</a></li>
				</ul>
			</div>
			<div class="row pt-5" id="esc_detail">
				<table class="col table table-borderless mt-3">
					<thead>
						<tr>
							<th style="width: 40%">판매단위</th>
							<td>1팩</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">중량/용량</th>
							<td>옵션별 상이</td>
						</tr>
						<tr>
							<th scope="row">원산지</th>
							<td>Larry</td>
						</tr>
						<tr>
							<th scope="row">유통기한</th>
							<td>Larry</td>
						</tr>
						<tr>
							<th scope="row">안내사항</th>
							<td>Larry</td>
						</tr>
					</tbody>
				</table>
				<table class="col table table-borderless mt-3">
					<thead>
						<tr>
							<th style="width: 40%">판매단위</th>
							<td>1팩</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">중량/용량</th>
							<td>옵션별 상이</td>
						</tr>
						<tr>
							<th scope="row">원산지</th>
							<td>Larry</td>
						</tr>
						<tr>
							<th scope="row">유통기한</th>
							<td>Larry</td>
						</tr>
						<tr>
							<th scope="row">안내사항</th>
							<td>Larry</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="row pt-5">
				<ul class="col nav nav-tabs">
					<li class="nav-item"><a class="nav-link h4 px-5" href="#desc">상품설명</a>
					</li>
					<li class="nav-item"><a class="nav-link h4 px-5" href="#image">상품이미지</a></li>
					<li class="nav-item"><a class="nav-link h4 px-5"
						href="#desc_detail">상세정보</a></li>
					<li class="nav-item"><a class="nav-link active h4 px-5"
						href="#review">고객후기</a></li>
					<li class="nav-item"><a class="nav-link h4 px-5" href="#qna">상품문의</a></li>
				</ul>
			</div>
			<div class="row pt-5" id="review">
				<img alt="" src=""> 고객후기
			</div>
			<div class="row pt-5">
				<ul class="col nav nav-tabs">
					<li class="nav-item"><a class="nav-link h4 px-5" href="#desc">상품설명</a>
					</li>
					<li class="nav-item"><a class="nav-link h4 px-5" href="#image">상품이미지</a></li>
					<li class="nav-item"><a class="nav-link h4 px-5"
						href="#desc_detail">상세정보</a></li>
					<li class="nav-item"><a class="nav-link h4 px-5"
						href="#review">고객후기</a></li>
					<li class="nav-item"><a class="nav-link active h4 px-5"
						href="#qna">상품문의</a></li>
				</ul>
			</div>
			<div class="row pt-5" id="qna">
				<img alt="" src=""> 상품문의
			</div>
			<!--  
			<div class="row">
				<button class="btn" type="button" onclick="getInfo('product-info')">
					<h4>
						상품정보 <i class="fas fa-caret-down"></i>
					</h4>
				</button>
			</div>
			<div class="row" id="product-info" style="display: none;">
				<h4>상품코드: 34324</h4>
				<h4>배송정보: 해당 어쩌고</h4>
			</div>
			<hr />
			<div class="row">
				<button class="btn" type="button" onclick="getInfo('size-info')">
					<h4>
						사이즈정보 <i class="fas fa-caret-down"></i>
					</h4>
				</button>
			</div>
			<div class="row" id="size-info" style="display: none;">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">사이즈명(cm)</th>
							<th scope="col">총길이</th>
							<th scope="col">어깨 너비</th>
							<th scope="col">가슴 너비</th>
							<th scope="col">소매 길이</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Mark</td>
							<td>Mark</td>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
						</tr>
						<tr>
							<td>Mark</td>
							<td>Mark</td>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
						</tr>
						<tr>
							<td>Mark</td>
							<td>Mark</td>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
						</tr>
					</tbody>
				</table>
			</div>
			<hr />
			<div class="row  m-4">
				<button class="col btn">
					<img alt="" src="">쿠폰이미지
				</button>
			</div>
			<div class="row p-3">
				<h4>상품 설명</h4>
				<p>SÉOULIEN 첫 시즌 로고 루즈핏 맨투맨 티셔츠로 전면 가슴 부분 SÉOULIEN 로고가 포인트입니다.
					코마사를 사용하여 조직 구성이 탄탄하며 텐타덤블 가공을 통하여 세탁후 축률을 최소화하고 헤리테이프 처리를 하여 목늘어남을
					방지합니다.</p>
				<img alt="" src="">상품이미지
			</div>
			<hr />
			<div class="row p-3">
				<h4>모델사이즈</h4>
				<table class="table table-bordered mt-3">
					<thead>
						<tr>
							<th>여자</th>
							<th>남자</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>160cm</td>
							<td>180cm</td>
						</tr>
						<tr>
							<td>Mark</td>
							<td>Mark</td>
						</tr>
						<tr>
							<td>Mark</td>
							<td>Mark</td>
						</tr>
						<tr>
							<td>Mark</td>
							<td>Mark</td>
						</tr>
					</tbody>
				</table>
			</div>
			<hr />
			<div class="row p-3">
				<h4>상품정보 보기</h4>
				<table class="table table-bordered mt-3">
					<thead>
						<tr>
							<th style="width: 40%">제품소재</th>
							<td>Mark</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">색상</th>
							<td>Mark</td>
						</tr>
						<tr>
							<th scope="row">치수</th>
							<td>Jacob</td>
						</tr>
						<tr>
							<th scope="row">제조자</th>
							<td>Larry</td>
						</tr>
						<tr>
							<th scope="row">제조국</th>
							<td>Larry</td>
						</tr>
						<tr>
							<th scope="row">세탁방법 및 취급시 주의사항</th>
							<td>Larry</td>
						</tr>
						<tr>
							<th scope="row">제조연월</th>
							<td>Larry</td>
						</tr>
						<tr>
							<th scope="row">품질보증기준</th>
							<td>Larry</td>
						</tr>
						<tr>
							<th scope="row">A/S 책임자와 전화번호</th>
							<td>Larry</td>
						</tr>
					</tbody>
				</table>
			</div>
			<hr />
			<div class="row p-3">
				<div class="jumbotron">
					<h1 class="display-4">브랜드명</h1>
					<p class="lead">This is a simple hero unit, a simple
						jumbotron-style component for calling extra attention to featured
						content or information.</p>
					<p>It uses utility classes for typography and spacing to space
						content out within the larger container.</p>
					<a class="btn btn-outline-secondary btn-lg" href="#" role="button">Brand
						Home <i class="fas fa-arrow-right align-middle pl-5"></i>
					</a>
				</div>
			</div>
			<hr />
			<div class="row p-3">
				<h4>리뷰</h4>
			</div>
			<hr />
			<div class="row p-3">
				<h4>상품 Q&A</h4>
			</div>
			<hr />
			<div class="row p-3">
				<h4 class="w-100">배송정보</h4>
				<ul class="m-4 pl-0">
					<li>Cras justo odio</li>
					<li>Cras justo odio</li>
					<li>Cras justo odio</li>
					<li>Cras justo odio</li>
					<li>Cras justo odio</li>
				</ul>
			</div>
			<hr />
			<div class="row p-3">
				<h4 class="w-100">교환, 환불, A/S 안내</h4>
				<ul class="m-4 pl-0">
					<li>Cras justo odio</li>
					<li>Cras justo odio</li>
					<li>Cras justo odio</li>
					<li>Cras justo odio</li>
					<li>Cras justo odio</li>
				</ul>
			</div>
			<hr />
		</div>
		-->
		</div>
</body>
</html>