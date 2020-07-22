/**
 * 
 */

var jsonData = JSON.parse('${categories}');
console.log(jsonData);

var cate1Arr = new Array();
var cate1Obj = new Object();

var cate2Arr = new Array();
var cate2Obj = new Object();

// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
for (var i = 0; i < jsonData.length; i++) {
	if (jsonData[i].category_depth == 1) {
		cate1Obj = new Object(); // 초기화
		cate1Obj.categoryCode = jsonData[i].category_code;
		cate1Obj.categoryName = jsonData[i].category_name;
		cate1Arr.push(cate1Obj);
	} else if (jsonData[i].category_depth == 2) {
		cate2Obj = new Object(); // 초기화
		cate2Obj.categoryCode = jsonData[i].category_code;
		cate2Obj.categoryCode2 = jsonData[i].category_code2;
		cate2Obj.categoryName = jsonData[i].category_name;
		cate2Arr.push(cate2Obj);
	}
}
// 1차 분류 셀렉트 박스에 데이터 삽입
var cate1Select = document.getElementById("category1");

for (var i = 0; i < cate1Arr.length; i++) {
	var newNode = document.createElement("option");
	newNode.value = cate1Arr[i].categoryCode;
	newNode.innerHTML = cate1Arr[i].categoryName;
	cate1Select.appendChild(newNode);
}

changeCategory1(cate1Arr[0].categoryCode);

//중분류 카테고리 변경
function changeCategory1(category1) {
	// 기존 카테고리 중분류 삭제
	var cate2Select = document.getElementById("category2");
	var cate2Length = cate2Select.options.length;

	for (i = 0; i < cate2Length;) {
		cate2Select.options[i] = null;
		cate2Length = cate2Select.options.length;
	}

	// 카테고리 중분류 추가

	for (var i = 0; i < cate2Arr.length; i++) {
		if (cate2Arr[i].categoryCode2 == category1) {

			var newNode = document.createElement("option");
			newNode.value = cate2Arr[i].categoryCode;
			newNode.innerHTML = cate2Arr[i].categoryName;
			cate2Select.appendChild(newNode);
		}
	}
}