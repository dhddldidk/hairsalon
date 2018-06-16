<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<style>
	#mainLogo{
		width:100%;
		height: 60px;
		margin:0 auto;
		/* border:1px solid red; */
	}
	/* #mainLogo #mainHeader{
		width:100%;
		margin:0 auto;
		height: 320px;
		background: url("hairsalon/resources/images/header.jpg") repeat center ;
		background-size: cover;
		position: relative;
	}   
	#mainLogo #bgOpacity{
		width:100%;
		height:100%;
		background-color: rgba(0,0,0,0.5);
		
	}*/
	#mainLogo h1{
		padding-left: 50px;
		letter-spacing: 5px;
		font-weight:bolder;
		color:#848B79;
		font-style: italic;
	}
	#mainLogo h1 a{
		color:#848B79;
		text-decoration: none;
	}
	/* #mainLogo h1 span{
		color:#667C26;
	} */
	#navBg{
		background: #E5BFB4;
		border:1px solid #E5BFB4;
	}
	#introLi{
		width:50%;
		/* border:1px solid red;  */
	}
	#introLi li{
		width:24.9%;
		/* border:1px solid red; */
		text-align: center;
		border:1px solid #E5BFB4; 
	}
	#introLi li:hover{
		border:1px solid #848B79;
	}
	#introLi li a{
		width:100%;
		color:white !important;
		font-weight:bolder;
		letter-spacing:3px;
		font-size:16px;
		text-align: center;
	}
	#introLi li a:hover{
		color:#848B79 !important;
		background: white;
		/* border:1px solid red; */
	}
</style>
<body>
<div id="mainLogo">
	<div id="mainHeader">
		<h1><a href="${pageContext.request.contextPath }/board/mainPage"><span>Neko</span>Salon</a></h1>
	</div>
	
</div>
<nav class="navbar navbar-inverse" id="navBg">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#"></a>
    </div>
    <ul class="nav navbar-nav" id="introLi">
      <li><a href="${pageContext.request.contextPath }/board/mainPage">HairSalon 소개</a></li>
      <li><a href="${pageContext.request.contextPath }/reservation/reservation">예약</a></li>
      <li><a href="${pageContext.request.contextPath }/hairstyle/hairstyleList">헤어스타일</a></li>
      <li><a href="${pageContext.request.contextPath }/board/reviewListPage">고객센터</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
    	<c:if test="${login != null }">
    		<li><a href="#"><span class="glyphicon glyphicon-gift"></span> [${login.u_name }] 님 환영합니다.</a></li>
    		<li><a href="${pageContext.request.contextPath }/user/logOut"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
    		<c:if test="${login.u_flag==1}"> 		
      			<li><a href="${pageContext.request.contextPath }/member/myPage"><span class="glyphicon glyphicon-user"></span> 마이페이지</a></li>
      		</c:if>
      		<c:if test="${login.u_flag==0}"> 		
      			<li><a href="${pageContext.request.contextPath }/member/myPage"><span class="glyphicon glyphicon-user"></span> 예약현황</a></li>
      		</c:if>     
    	</c:if>
    
    	<c:if test="${login == null }">
    		<li><a href="${pageContext.request.contextPath }/user/login"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
      		<li><a href="${pageContext.request.contextPath }/member/register"><span class="glyphicon glyphicon-pencil"></span> 회원가입</a></li>
    	</c:if>
    </ul>
    
  </div>
</nav>	

