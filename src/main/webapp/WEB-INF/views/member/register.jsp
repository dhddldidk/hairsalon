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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style type="text/css">
	#registerContainer{
		width:1200px;
		min-height:700px;
		margin:0 auto;
		margin-top:15px;
	}
	#registerContainer h1{
		width:1200px;
		height:60px;
		line-height:60px;
		margin-bottom: 30px;
		padding-left:20px;
		border-left: 20px solid #EDE275;
		border-bottom: 2px solid #EDE275;
		letter-spacing: 4px;
		color:#493D26;
		font-size: 24px;
	}
	#phone1{
		width:120px !important;
	}
	.addrInput{
		width:300px !important;
	}
	.addrDetail{
		width:700px !important;
	}
	.emailInput, .reg{
		width:200px !important;
	}
	.idAlign, .addrAlign, .emailAddr, .reg, #phone1{
		display:inline-block;	
	}
	#addrDetail1{
		margin-top:10px;
	}
	#regTitle{
		/* border:1px solid red; */
		margin-top: 25px;
	} 
	.form-group{
		padding:10px;
	}
	.pw, .chkPw{
		visibility: hidden;
		color: red;
		font-weight: bold;
	}
	.notice{
		color:#848B79;
		font-size: 14px;
	}
	label{
		border:1px solid #D1D0CE;
		border-radius: 5px;
		padding:5px;
		color:#493D26;
		letter-spacing: 3px;
	}
</style>
<script type="text/javascript">

//다음지도 api 주소찾기
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
           $("[name=addr1]").val(data.zonecode);
           $("[name=addr2]").val(fullRoadAddr);
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}


	$(function(){
		
		var success=false;
		//비밀번호 입력
		var passReg=/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%*-]).{10,16}$/i;
		$("#pw").on("keyup", function(){
			var pw = $("#pw").val();
			if(passReg.test(pw)==false){
				$(".pw").css("visibility","visible");
			}else{
				$(".pw").css("visibility","hidden");
			}
		})
		//비밀번호 확인
		$("#chkPw").on("keyup", function(){
			var pw = $("#pw").val();
			var chkPw = $("#chkPw").val();
			if(pw!=chkPw){
				$(".chkPw").css("visibility","visible");
				success=false;
			}else{
				$(".chkPw").css("visibility","hidden");
				success=true;
			}
		})
		
		
		//이메일 확인
		$("#email3").change(function(){
				var m = $("#email3").val();
				$("#email2").val(m);    
				
			})
		
		//회원가입 버튼을 눌렀을 때
		$("#regBtn").click(function(){
			
			//이름 에러처리
			var name = $("input[name='u_name']").val();
			if(name.length==0){
				
				alert("이름을 입력해 주세요.");
				
				return false;
			}
			//아이디 에러처리
			var id = $("input[name='u_id']").val();
			if(id.length==0){
				alert("아이디를 입력해주세요.");
				return false;
			}
			if(success==false){
				alert("아이디 중복확인을 해주세요.");
				return false;
			}
			//휴대전화 
			var ph1 = $("#phone1").val();
			var ph2 = $("#phone2").val();
			var ph3 = $("#phone3").val();
			
			if(ph2.length == 0 || ph3.length == 0){
				alert("전화번호를 입력해주세요.");
			}
			
			var phone = ph1+"-"+ph2+"-"+ph3;
			var phoneObj = "<input type='hidden' name='u_phone' value='"+phone+"'>";
			alert(phoneObj);
			
			/* 메일 확인 */
			var m1= $("#email1").val();    
			var m2= $("#email2").val();    
			if(m1.length==0 || m2.length==0){
				alert("메일을 입력해주세요.");
				return false;
			}
			
			var email = m1+"@"+m2;
			var emailObj = "<input type='hidden' name='u_email' value='"+email+"'>";
			
			/* 주소 확인 */
			var addr1 = $("#addr1").val();
			var addr2 = $("#addr2").val();
			var addr3 = $("#addr3").val();
			
			if(addr1.length==0 || addr3.length==0){
				alert("주소를 입력해주세요.");
				return false;
			}
			
			var addr = addr1+","+addr2+","+addr3;
			var addrObj = "<input type='hidden' name='u_address' value='"+addr+"'>"
			
			
			
			
			/* input hidden으로 실어서 Controller에 보내기 */
			$("#div_hidden").append(phoneObj).append(emailObj).append(addrObj);
		})
		
		//아이디 중복확인
		$("#duplicationId").click(function(e){
			e.preventDefault();
			
			var id = $("#id").val();
			
			var idReg=/^[a-z0-9]{6,12}$/i;
			if(idReg.test(id)==false || id.length==0){
				$("#id").val("");
				alert("6-12자 이내로 아이디를 입력해주세요.");
				return false;
			}
			
			$.ajax({
				type:"get",
				url:"${pageContext.request.contextPath}/member/chkDuplication?id="+id,
				dataType:"text",
				success:function(result){
					console.log(result);
					if(result!=""){
						alert("이미 가입된 아이디 입니다.");
						$("#id").val("");
						
					}else{
						alert("사용할 수 있는 아이디입니다.");
						$("#id").val(id);
						
					}
				}
			})
			
		})
		
	})
</script>
</head>
<body>
<div id="registerContainer">
	<div id="regTitle">
		<h1>회원가입</h1>
	</div>
	<form class="form-horizontal" method="post" action="register">
		<div class="form-group">
			<label class="control-label col-sm-2" for="name">이름</label>
			<div class="col-sm-10"> 
			<input type="text" name="u_name" id="name" class="form-control reg"><br>
			<span class="notice">＊ 12자 이내로 입력하세요.</span>
			</div>
		</div>
		<div class="form-group" >
			<label for="id" class="control-label col-sm-2" class="idAlign">아이디</label>
			<div class="col-sm-10">  
			<input type="text" name="u_id" id="id" class="form-control idAlign reg"> 
			<button class="btn btn-danger idAlign" id="duplicationId">중복확인</button><br>
			<span class="notice">＊ 6-12자 이내로 입력하세요.</span>
			</div>
		</div>
		<div class="form-group">
			<label for="pw" class="control-label col-sm-2">비밀번호</label>
			<div class="col-sm-10">  
			<input type="password" name="u_pw" id="pw" class="form-control reg"><span class="pw">＊ 형식에 맞게 입력해주세요</span><br>
			<span class="notice">＊ 10~16자리 영문+숫자+특수문자[불가능문자:^,;,:,&,',',/]</span>
			</div>
		</div>
		<div class="form-group">
			<label for="chkPw" class="control-label col-sm-2">비밀번호 확인</label>
			<div class="col-sm-10">  
			<input type="password" name="chkPw" id="chkPw" class="form-control reg"><span class="chkPw">＊ 비밀번호가 맞지 않습니다. 다시 입력해주세요.</span><br> 
			<span class="notice">＊ 입력 오류 방지를 위하여 똑같이 한번 더 입력합니다.</span>
			</div>
		</div>
		<div class="form-group">
			<label for="phone2" class="control-label col-sm-2">휴대전화</label>
			<div class="col-sm-10">   
			<select id="phone1" class="form-control">
				<option>010</option>
				<option>011</option>
				<option>017</option>
				<option>018</option>
				<option>019</option>
			</select> - 
			
			<input type="text" name="phone" id="phone2" class="form-control reg"> -
			<input type="text" name="phone" id="phone3" class="form-control reg"><br>
			<span class="notice">＊ '-'를 제외한 전화번호를 입력해주세요.</span>
			</div>
		</div>
		<div class="form-group">
			<label for="email" class="control-label col-sm-2 emailAddr">이메일</label>
			<div class="col-sm-10">   
			<input type="text" name="email1" class="form-control emailAddr emailInput" id="email1"> @ 
			<input type="text" name="email2" class="form-control emailAddr emailInput" id="email2"> 
			<select name="sel" id="email3" class="form-control emailAddr emailInput">
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
			<label class="control-label col-sm-2" class="addrAlign">주소</label>
			<div class="col-sm-5">   
			<input type="text" name="addr1" id="addr1" class="form-control addrAlign addrInput" placeholder="우편번호" readonly="readonly">
			<button type="button" id="searchAddr" class="btn btn-danger addrAlign" onclick="execPostCode();"><i class="fa fa-search"></i>도로명 찾기</button><br> 
			<input type="text" name="addr2" id="addr2" class="form-control addrAlign addrDetail" readonly="readonly" placeholder="도로명 주소"><br> 
			<input type="text" name="addr3" placeholder="상세주소" id="addr3" class="form-control addrAlign addrDetail">
			</div>
		</div>
		<!-- div안에 input hidden으로 전화, 메일, 주소를 보냄 -->
		<div id="div_hidden"></div>
		<div class="form-group regBtn" > 
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-success" id="regBtn">회원가입</button>
			<button type="reset" class="btn btn-warning">취소</button>
		</div>
		</div>
	</form>
	</div>
</body>
</html>
<%@ include file="../common/footer.jsp"%>