<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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
#successRegContainer {
	width: 1200px;
	min-height: 700px;
	margin: 0 auto;
	margin-top: 15px;
}

#successRegContainer h1 {
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
#loginForm{
	
	width: 1200px;
	min-height: 300px;
	/* margin: 0 auto; */
	border:1px solid #D1D0CE;
	padding-top: 90px;
}
#login{
	/* border:1px solid red;
	width:600px !important;*/
	height:150px; 
	margin-left:400px;
	/* border:1px solid red; */ 
}
.loginInput{
	width:300px !important;
}
label{
		border:1px solid #D1D0CE;
		border-radius: 5px;
		padding:5px;
		color:#493D26;
		letter-spacing: 3px;
	}
#search{
	width:1200px;
	height:300px;
	 /* border:1px solid red;   */
	margin-top: 30px;
}
#search #findId{
	width:50%;
	height:300px;
	/* border:1px solid blue; */
	float:left;
	
}
#search #findPw{
	width:50%;
	height:300px;
	/* border:1px solid green; */
	float:left;
	
}
.search h3{
	width: 500px;
	height: 30px;
	line-height: 30px;
	margin-bottom: 30px;
	padding-left: 20px;
	border-left: 20px solid #EDE275;
	border-bottom: 2px solid #EDE275;
	letter-spacing: 4px;
	font-size:18px;
	color: #493D26;
	margin-bottom:50px;
}
#findIdForm{
	/* border:1px solid red; */
	padding-left: 40px;
	margin-top:15px;
}
</style>
</head>
<body>
	<div id="successRegContainer">
		<div id="regTitle">
			<h1>로그인</h1>
		</div>
		<div id="loginForm">
		<form class="form-horizontal" action="login" method="post" id="login">
			<div class="form-group">
				<label class="control-label col-sm-2" for="id">아이디</label>
				<div class="col-sm-10">
					<input type="text" class="form-control loginInput" id="id"
						placeholder="아이디를 입력하세요.">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="pw">비밀번호</label>
				<div class="col-sm-10">
					<input type="password" class="form-control loginInput" id="pw"
						placeholder="비밀번호를 입력하세요.">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-success">로그인</button>
					<button type="reset" class="btn btn-warning">취소</button>
				</div>
			</div>
		</form>
		</div>
		<div id="search">
			<div id="findId">
				<div class="search">
					<h3>아이디 찾기</h3>
				</div>
				<form class="form-horizontal" action="login" method="post" id="findIdForm">
			<div class="form-group">
				<label class="control-label col-sm-2" for="name">이름</label>
				<div class="col-sm-10">
					<input type="text" class="form-control loginInput" id="name"
						placeholder="이름을 입력하세요.">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="pw">이메일</label>
				<div class="col-sm-10">
					<input type="password" class="form-control loginInput" id="pw"
						placeholder="hairsalon@naver.com">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-success">아이디 찾기</button>
					<button type="reset" class="btn btn-warning">회원가입으로 바로가기</button>
				</div>
			</div>
		</form>
			</div>
			<div id="findPw">
				<div class="search">
					<h3>비밀번호 찾기</h3>
				</div>
				<form class="form-horizontal" action="login" method="post" id="findIdForm">
				<div class="form-group">
				<label class="control-label col-sm-2" for="name">이름</label>
				<div class="col-sm-10">
					<input type="text" class="form-control loginInput" id="name"
						placeholder="이름을 입력하세요.">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="id">아이디</label>
				<div class="col-sm-10">
					<input type="text" class="form-control loginInput" id="id"
						placeholder="아이디를 입력하세요.">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="pw">이메일</label>
				<div class="col-sm-10">
					<input type="password" class="form-control loginInput" id="pw"
						placeholder="hairsalon@naver.com">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-success">비밀번호 찾기</button>
					<button type="reset" class="btn btn-warning">회원가입으로 바로가기</button>
				</div>
			</div>
		</form>
			</div>
		</div>
		
	</div>
</body>
</html>
<%@ include file="../common/footer.jsp"%>