<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
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
	#registerContainer{
		width:1200px;
		border:1px solid red;
		min-height:800px;
		margin:0 auto;
	}
	#registerContainer h1{
		width:1200px;
		border:1px solid green;
		height:60px;
		
	}
	
	.reg{
		width:250px !important;
	}
	.addrInput{
		width:350px !important;
	}
	.emailInput{
		width:250px !important;
	}
	.idAlign, .addrAlign, .emailAddr{
		display:inline-block;	
	}
</style>

</head>
<body>
<div id="registerContainer">
	<div>
		<h1>회원가입</h1>
	</div>
	<form class="form-horizontal" method="post" action="register">
		<div class="form-group">
			<label class="control-label col-sm-2" for="name">이름</label>
			<div class="col-sm-10"> 
			<input type="text" name="name" id="name" class="form-control reg">
			</div>
		</div>
		<div class="form-group" >
			<label for="id" class="control-label col-sm-2" class="idAlign">아이디</label>
			<div class="col-sm-10">  
			<input type="text" name="id" id="id" class="form-control idAlign reg"> 
			<button class="btn btn-danger idAlign" id="duplicationId">중복확인</button><br>
			<span class="sub">＊6-12자 이내로 입력하세요.</span>
			</div>
		</div>
		<div class="form-group">
			<label for="pw" class="control-label col-sm-2">비밀번호</label>
			<div class="col-sm-10">  
			<input type="password" name="pw" id="pw" class="form-control reg"><br> 
			<span class="sub">＊ 10~16자리 영문+숫자+특수문자[불가능문자:^,;,:,&,',',/]</span>
			</div>
		</div>
		<div class="form-group">
			<label for="chkPw" class="control-label col-sm-2">비밀번호 확인</label> 
			<div class="col-sm-10">  
			<input type="password" name="chkPw" id="chkPw" class="form-control reg"><br> 
			<span class="sub">＊ 입력 오류 방지를 위하여 똑같이 한번 더 입력합니다.</span>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" class="addrAlign">주소</label>
			<div class="col-sm-5">   
			<input type="text" name="addr1" id="addr1" class="form-control addrAlign addrInput">
			<button id="searchAddr" class="btn btn-danger addrAlign">도로명 찾기</button><br> 
			<input type="text" name="addr2" id="addrDetail1" class="form-control addrAlign addrInput"><br> 
			<input type="text" name="addr3" placeholder="상세주소를 입력하세요." id="addrDetail2" class="form-control addrAlign addrInput">
			</div>
		</div>
		<div class="form-group">
			<label for="phone" class="control-label col-sm-2">휴대전화</label>
			<div class="col-sm-10">   
			<input type="text" name="phone" id="phone" class="form-control reg"><br> 
			<span class="subphone">＊'-'를 제외한 전화번호를 입력해주세요.</span>
			</div>
		</div>
		<div class="form-group">
			<label for="email" class="control-label col-sm-2 emailAddr">이메일</label><br>
			<div class="col-sm-10">   
			<input type="email" name="email1" class="form-control emailAddr emailInput" id="aaa1"> @ 
			<input type="email" name="email2" class="form-control emailAddr emailInput" id="aaa2"> 
			<select name="sel" id="aaa3" class="form-control emailAddr emailInput">
				<option>직접입력</option>
				<option>naver.com</option>
				<option>chol.com</option>
				<option>dreamwiz.com</option>
				<option>empal.com</option>
				<option>freechal.com</option>
				<option>gmail.com</option>
				<option>hanafos.com</option>
				<option>hanmail.net</option>
				<option>hanmir.com</option>
				<option>hitel.net</option>
				<option>hotmail.com</option>
				<option>korea.com</option>
				<option>lycos.co.kr</option>
				<option>nate.com</option>
				<option>netian.com</option>
				<option>paran.com</option>
			</select>
			</div>
		</div>
		<div class="form-group"> 
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-success">회원가입</button>
			<button type="reset" class="btn btn-warning">취소</button>
		</div>
		</div>
	</form>
	</div>
</body>
</html>
<%@ include file="../common/footer.jsp"%>