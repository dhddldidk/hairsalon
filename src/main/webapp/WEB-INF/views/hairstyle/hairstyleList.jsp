<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
li{
	list-style: none;
}
#hairstyleContainer {
	width: 1200px;
	min-height: 700px;
	margin: 0 auto;
	margin-top: 15px;
}

#hairstyleContainer h3 {
	width: 1200px;
	height: 40px;
	line-height: 40px;
	margin-bottom: 20px;
	padding-left: 20px;
	border-left: 20px solid #EDE275;
	border-bottom: 2px solid #EDE275;
	letter-spacing: 4px;
	color: #493D26;
	/* font-size: 24px; */
}
#hairstyleContainer ul {
	width:100%;
	height:300px;
	border:1px solid red;
}
#hairstyleContainer ul li {
	width:24.3%;
	float:left;
	height:300px;
	border:1px solid green;
	position: relative;
}
#hairstyleContainer ul li .hair_img img{
	width:100%;
	height:300px;
}
#hairstyleContainer ul li .hair_detail{
	width:100%;
	height:300px;
	background-color:rgba(189,189,189,0.5);
	opacity:0;
	position:absolute;
	top:0;
	overflow:hidden;
	color:white;
	font-weight: bold;
}
#hairstyleContainer ul li .hair_detail p{
	margin-left: 90px;
}
#hairstyleContainer ul li .hair_detail p:first-child{
	margin-top: 120px;
}
#hairstyleContainer ul li .hair_detail:hover{
	opacity:1;
	border:2px solid red;
}
#hairstyleContainer ul li:nth-child(1),
#hairstyleContainer ul li:nth-child(2),
#hairstyleContainer ul li:nth-child(3) {
	margin-right: 11px;
}
#hairRegisterContainer {
	border:2px dotted #D5D5D5;
	width:1200px;
	height:70px;
}
#hairRegisterContainer h2{
	padding-left:20px;
}
#hairRegisterContainer a{
	color:#848B79;
	text-decoration: none;
}
</style>
	<div id="hairstyleContainer">
		<div id="hairRegisterContainer">
			<h2><a href="${pageContext.request.contextPath }/hairstyle/hairstyleRegister">[ 헤어스타일 등록 ]</a></h2>
		</div>
		<div>
			<h3>일반컷</h3>
				<ul>
					<li class="hairIntro_li">
						<div class="hair_img">
							<img src="${pageContext.request.contextPath }/resources/header.jpg">
						</div>
						<div class="hair_detail">
							<p>예상 소요시간 : 30분</p>
							<p>가격 : 15000원</p>
						</div>
					</li>
					<li>22222</li>
					<li>33333</li>
					<li>44444</li>
				</ul>
		</div>
		<div>
			<h3>일반단발펌</h3>
				<ul>
					<li class="hairIntro_li">
						<div class="hair_img">
							<img src="${pageContext.request.contextPath }/resources/header.jpg">
						</div>
						<div class="hair_detail">
							<p>예상 소요시간 : 30분</p>
							<p>가격 : 15000원</p>
						</div>
					</li>
					<li>22222</li>
					<li>33333</li>
					<li>44444</li>
				</ul>
		</div>
	</div>
<%@ include file="../common/footer.jsp"%>