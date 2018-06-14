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
	/* border:1px solid #D5D5D5; */
}
#hairstyleContainer ul li {
	width:24.3%;
	float:left;
	height:300px;
	border:1px solid #D5D5D5;
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
	border:3px solid #669966;
	/* font-size: 15px; */
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
	display: inline-block;
}
#hairstyleContainer h2 a:hover, #hairstyleContainer h3 a:hover {
	color:#669966;
	font-weight: bolder;
}

#hairRegisterContainer a, #hairstyleContainer h3 a{
	color:#848B79;
	text-decoration: none;
}
.updateHair{
	font-size: 13px;
	color:purple;
}
</style>
	<div id="hairstyleContainer">
		<div id="hairRegisterContainer">
			<h2><a href="${pageContext.request.contextPath }/hairstyle/hairstyleRegister">[ 헤어스타일 등록 ]</a></h2>
		</div>
		<div>
			<%-- <c:set var="i" value="1"></c:set> --%>
			<c:forEach var="list" items="${hairList}" end="${hairList.size() }">
			<%-- <c:if test="${list.hair_no==i }" > --%>
			<h3><a href="${pageContext.request.contextPath }/hairstyle/hairstyleUpdate?hair_no=${list.hair_no }">${list.hair_type }</a><span class="updateHair"> &nbsp;&nbsp;&lt;&#45;&#45;&nbsp;클릭하면 수정페이지로 전환됩니다.</span></h3>
				<ul>
					<c:set var="j" value="1"></c:set>
					<c:forEach var="joinList" items="${hairJoinList}" > 
					<c:if test="${list.hair_no==joinList.hair_no }" >
						<c:if test="${j<5 }" >
						<c:if test="${joinList.hair_filename!=null }" >
						
							<li class="hairIntro_li">
								<div class="hair_img">
									<img src="displayHairFile?hair_filename=${joinList.hair_filename }">
								</div>
								<div class="hair_detail">
									<p>예상 소요시간 : ${joinList.hair_time }분</p>
									<p>가격 : ${joinList.hair_price }원</p>
								</div>
							</li>
							<c:set var="j" value="${j=j+1 }"></c:set>
						</c:if>
						</c:if>
					</c:if>
					</c:forEach>
				</ul>
				<%-- <c:set var ="i" value="${i+1 }"></c:set> --%>
				<%-- </c:if>  --%>
			</c:forEach>
		</div>
	</div>
<%@ include file="../common/footer.jsp"%>