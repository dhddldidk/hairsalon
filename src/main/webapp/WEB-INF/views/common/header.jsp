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
	#mainLogo h1{
		padding-left: 15px;
		letter-spacing: 5px;
	}
	#navBg{
		background: #FFBB00;
		border:1px solid #FFBB00;
	}
</style>
<body>
<div id="mainLogo">
	<h1>NekoSalon</h1>
</div>
<nav class="navbar navbar-inverse" id="navBg">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">HairSalon 소개</a></li>
      <li><a href="#">예약</a></li>
      <li><a href="#">헤어스타일</a></li>
      <li><a href="${pageContext.request.contextPath }/board/listPage">고객센터</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> 로그인</a></li>
      <li><a href="${pageContext.request.contextPath }/member/register"><span class="glyphicon glyphicon-log-in"></span> 회원가입</a></li>
    </ul>
  </div>
</nav>	
</body>
</html>