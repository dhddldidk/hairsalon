<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	height: 400px;
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
#reviewContainer{
	text-align: center;
}
th{
	text-align: center !important;
}
#hairContainer{
	width:1200px;
	height:300px;
}
#hairContainer ul{
	width:1200px;
	height:285px;
	border:1px solid black;
	list-style: none;
}
#hairContainer ul li{
	width:24%;
	float:left;
	height:285px;
	border:1px solid red;
}
#hairContainer ul li img{
	width:100% !important;
	
	height:285px;
	
}
#hairContainer ul li:nth-child(1),
#hairContainer ul li:nth-child(2),
#hairContainer ul li:nth-child(3)
{
	margin-right: 15px;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />
</head>
<body>
<script type="text/javascript">
	$(document).ready(function(){
		var name = $('#mainSlider>#hairContainer>ul>li');
		/* name.click(function() {
			$(this).addClass('on');
			name.not(this).removeClass('on');
		}); */
		var mySlider = $('.mainSlider_area_ul').bxSlider({
			maxSlides : 4, //슬라이드 수
			slideWidth : 284, //슬라이드 사이즈
			slideMargin : 20, //슬라이드마다 마진을 줌
			auto : true,// 자동으로 움직임
			pause : 8000, //잠시 정지
			speed : 500,//0.5초동안 움직이게
			autoControls : true, //
			captions : true, //밑에 글자나오게 
			pager : false,
			autoHover : true,
		});

	})
</script>
	<section id="mainContainer">
		
		<div id="mainSlider">
		<h1>Best HairStyle</h1>
		<div id="hairContainer">
			<ul class="mainSlider_area_ul">
				<c:forEach var="joinList" items="${hairStyle}">
				<li>
					<div>
						<a href="${pageContext.request.contextPath }/hairstyle/hairstyleList"><img src="${pageContext.request.contextPath }/hairstyle/displayHairFile?hair_filename=${joinList.hair_filename }"></a>
					</div>
				</li>
				</c:forEach>
			</ul>
		</div>
		</div>
		
		<div id="introduction">
		<h1>NecoSalon 소개</h1>
		간단한 소개</div>
		
		<div id="reviewBoard">
		<h1>후기 게시판</h1>
		<div id="reviewContainer">
		<table class="table table-bordered">
			<tr class="active">
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="list" items="${reviewBoard }">
				<tr>
					<td>${list.rb_no }</td>
					<td><a href="${pageContext.request.contextPath }/board/reviewReadPage?rb_no=${list.rb_no }&page=1&searchType=${cri.searchType}&keyword=${cri.keyword}&flag=true" class="linkTOBoard">${list.rb_title } [${list.rb_replycnt }]</a></td>
					<td>${list.rb_writer }</td>
					<td><fmt:formatDate value="${list.rb_regdate }" pattern="yyyy-MM-dd"/></td>
					<td><span class="badge bg-red">${list.rb_viewcnt }</span></td>
				</tr>
			</c:forEach>
			
		</table>
		</div>
		<script type="text/javascript">
			$(".linkTOBoard").click(function(){
				if(${login==null}){
					alert("로그인후 게시글을 볼 수 있습니다.");
				}
			})
		</script>
		</div>
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