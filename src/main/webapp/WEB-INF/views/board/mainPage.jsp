<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#mainContainer {
	width: 1200px;
	min-height: 700px;
	margin: 0 auto;
	margin-top: 15px;
	border: 1px solid red;
}

#mainContainer h1 {
	width: 1200px;
	height: 60px;
	line-height: 60px;
	margin-bottom: 30px;
	padding-left: 20px;
	border-left: 20px solid #EDE275;
	border-bottom: 2px solid #EDE275;
	letter-spacing: 4px;
	color: #493D26;
	font-size: 24px;
}

#mainContainer #mainSlider {
	width: 1200px;
	height: 300px;
	border: 1px solid green;
	margin-bottom: 25px;
}

#mainContainer #introduction {
	width: 1200px;
	height: 300px;
	border: 1px solid orange;
	margin-bottom: 25px;
}

#mainContainer #map {
	width: 1200px;
	height: 300px;
	border: 1px solid blue;
	margin-bottom: 40px;
}
#mainContainer #reviewBoard{
	width: 1200px;
	height: 300px;
	border: 1px solid purple;
	margin-bottom: 25px;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<section id="mainContainer">
		<h1>Best HairStyle</h1>
		<div id="mainSlider">슬라이더</div>
		<h1>NecoSalon 소개</h1>
		<div id="introduction">간단한 소개</div>
		<h1>후기 게시판</h1>
		<div id="reviewBoard">후기게시판</div>
		<h1>오시는 길</h1>
		<div id="map">
			<!-- * Daum 지도 - 지도퍼가기 -->
			<!-- 1. 지도 노드 -->
			<div id="daumRoughmapContainer1529036260307"
				class="root_daum_roughmap root_daum_roughmap_landing"></div>

			<!--
	2. 설치 스크립트
	* 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
-->
			<script charset="UTF-8" class="daum_roughmap_loader_script"
				src="http://dmaps.daum.net/map_js_init/roughmapLoader.js"></script>

			<!-- 3. 실행 스크립트 -->
			<script charset="UTF-8">
				new daum.roughmap.Lander({
					"timestamp" : "1529036260307",
					"key" : "okvx",
					"mapWidth" : "1200",
					"mapHeight" : "300"
				}).render();
			</script>
		</div>
		<div>길찾기를 클릭해서 자세한 경로를 탐색해 보세요.</div>
	</section>
</body>
</html>
<%@ include file="../common/footer.jsp"%>