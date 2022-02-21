<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=800">
<meta name="og:title" content="HTML5, 자바스크립트 데이터그리드 AUIGrid">
<meta name="og:url" content="https://www.auisoft.net/">
<meta name="og:description" content="HTML5, 자바스크립트 데이타그리드(javascript datagrid) AUISoft">
<title>AUIGrid 데모, HTML5, 자바스크립트 데이터그리드 AUIGrid</title>
<link href="https://www.auisoft.net/aui.ico" rel="shortcut icon" />

<!-- 데모 구성용 CSS 입니다. 실제 프로젝트에서는 불필요 하니 추가할 필요 없습니다. -->
<link href="/static/aui/demo.css" rel="stylesheet">

<!-- ajax 요청을 위한 스크립트입니다. -->
<!-- jQuery 사용한다면, 해당 2개의 JS는 불필요 합니다.  -->
<script type="text/javascript" src="/static/aui/ajax.js"></script>
<script type="text/javascript" src="/static/aui/common.js"></script>

<!-- AUIGrid 테마 CSS 파일입니다. 그리드 출력을 위해 꼭 삽입하십시오. -->
<!-- 원하는 테마가 있다면, 다른 파일로 교체 하십시오. -->
<link href="/static/AUIGrid/AUIGrid_style.css" rel="stylesheet">

<!-- AUIGrid 라이센스 파일입니다. 그리드 출력을 위해 꼭 삽입하십시오. -->
<script type="text/javascript" src="/static/AUIGrid/AUIGridLicense.js"></script>

<!-- 실제적인 AUIGrid 라이브러리입니다. 그리드 출력을 위해 꼭 삽입하십시오.--> 
<script type="text/javascript" src="/static/AUIGrid/AUIGrid.js"></script>
<script type="text/javascript">

// AUIGrid 생성 후 반환 ID
var myGridID;

// document ready (jQuery 의 $(document).ready(function() {}); 과 같은 역할을 합니다.
function documentReady() {  
	
	// AUIGrid 그리드를 생성합니다.
	createAUIGrid(columnLayout);
	
	// 데이터 요청, 요청 성공 시 AUIGrid 에 데이터 삽입합니다.
	requestData("./data/nutrition.json");

};

// AUIGrid 칼럼 설정
// 데이터 형태는 다음과 같은 형태임,
//"gubun1":"식물성식품 계","gubun2":"소계","avg98":"1,027.1","sdev98":"12.7","avg01":"1,027.5","sdev01":"11.5","avg05":"997.9","sdev05":"11.0","avg07":"1,038.9","sdev07":"14.7","avg08":"1,060.9","sdev08":"11.9","avg09":"1,080.2","sdev09":"11.5","avg10":"1,200.9","sdev10":"15.1","avg11":"1,161.8","sdev11":"15.7","avg12":"1,143.1","sdev12":"14.5"}, { .....} ];
var columnLayout = [ {
		dataField : "gubun1",
		headerText : "구분1",
		width : 160
	}, {
		dataField : "gubun2",
		headerText : "구분2",
		width : 160
	}, {
		headerText : "2008년",
		children : [ {
			dataField : "avg08",
			headerText : "평균(g)",
			width : 100
		}, {
			dataField : "sdev08",
			headerText : "표준편차",
			width : 100
		} ]
	}, {
		headerText : "2009년",
		children : [ {
			dataField : "avg09",
			headerText : "평균(g)",
			width : 100
		}, {
			dataField : "sdev09",
			headerText : "표준편차",
			width : 100
		} ]
	}, {
		headerText : "2010년",
		children : [ {
			dataField : "avg10",
			headerText : "평균(g)",
			width : 100
		}, {
			dataField : "sdev10",
			headerText : "표준편차",
			width : 100
		} ]
	}, {
		headerText : "2011년",
		children : [ {
			dataField : "avg11",
			headerText : "평균(g)",
			width : 100
		}, {
			dataField : "sdev11",
			headerText : "표준편차",
			width : 100
		} ]
	}, {
		headerText : "2012년",
		children : [ {
			dataField : "avg12",
			headerText : "평균(g)",
			width : 100
		}, {
			dataField : "sdev12",
			headerText : "표준편차",
			width : 100
		} ]
	} ];

// AUIGrid 를 생성합니다.
function createAUIGrid(columnLayout) {
	
	var auiGridProps = {};
	
	// singleRow 선택모드
	auiGridProps.selectionMode = "singleCell";
	
	auiGridProps.enableSorting = false;
	
	// 실제로 #grid_wrap 에 그리드 생성
	myGridID = AUIGrid.create("#grid_wrap", columnLayout, auiGridProps);
	
	// 셀 클릭 이벤트 바인딩
	AUIGrid.bind(myGridID, "cellClick", function(event) {
		alert(" ( " + event.rowIndex + ", " + event.columnIndex + ") :  " + event.value + " clicked!!");
	});
};
</script>

</head>
<body>

<div id="main">
	<div class="desc">
		<p>셀 클릭 이벤트를 정의한 모습입니다.</p>
<div class="src_cover"><pre>
// 셀 클릭 이벤트 바인딩
AUIGrid.bind(myGridID, "cellClick", function(event) {
	alert(" ( " + event.rowIndex + ", " + event.columnIndex + ") :  " + event.value + " clicked!!");
});
</pre></div>
	</div>
	<div>
		<!-- 에이유아이 그리드가 이곳에 생성됩니다. -->
		<div id="grid_wrap" style="width:1200px; height:480px; margin:0 auto;"></div>
	</div>
	<div class="desc_bottom">
		<p id="ellapse"></p>
		<div><span style="float:right;"> 식품군별 1일 섭취량 추이 , 통계청 </span></div>

	</div>
</div>
<div id="footer">
     <div class="copyright">
        <p>Copyright ©2021 AUISoft </p>
    </div>
</div>

</body>
</html>