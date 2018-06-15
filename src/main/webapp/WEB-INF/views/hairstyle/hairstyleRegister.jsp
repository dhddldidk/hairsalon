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

#hairstyleContainer h1 {
	width: 1200px;
	height: 40px;
	line-height: 40px;
	margin-bottom: 20px;
	padding-left: 20px;
	border-left: 20px solid #EDE275;
	border-bottom: 2px solid #EDE275;
	letter-spacing: 4px;
	color: #493D26;
	font-size: 24px; 
}
#previewBox{
		width:800px;
		height: 300px;
		border:3px dotted #848B79;
		margin-left:203px;
		margin-bottom: 20px;
		
	}
	#previewBox img{
		width:100px;
		height:100px;
		border:1px solid #848B79;
	}
</style>
	<div id="hairstyleContainer">
		<div>
			<h1>헤어스타일 등록</h1>
		</div>
		<form action="" class="form-horizontal" method="post" enctype="multipart/form-data">
			<!-- 헤어이름, 헤어시간, 헤어가격, 첨부파일 ㄴ -->
		<div class="form-group">
			<label class="control-label col-sm-2" for="hair_type">헤어타입</label>
			<div class="col-sm-10"> 
			<input type="text" name="hair_type" id="hair_type" class="form-control"><br>
			</div>
		</div>
		<div class="form-group" >
			<label for="hair_time" class="control-label col-sm-2">헤어소요시간</label>
			<div class="col-sm-10">  
			<input type="text" name="hair_time" id="hair_time" class="form-control" placeholder="예)120">
			<span>헤어 소요시간은 분 단위로 숫자만 입력해주세요.</span>
			</div>
		</div>
		<div class="form-group" >
			<label for="hair_price" class="control-label col-sm-2">가격</label>
			<div class="col-sm-10">  
			<input type="text" name="hair_price" id="hair_price" class="form-control" placeholder="숫자만 입력해주세요. 예)15000">
			<span>가격은 숫자만 입력해주세요.</span>
			</div>
		</div>
		<div class="form-group" >
			<label for="hairFiles" class="control-label col-sm-2">헤어이미지</label>
			<div class="col-sm-10">  
			<input type="file" name="hairFiles" id="hairFiles" class="form-control" multiple="multiple"> 
			</div>
		</div>
		<div class="form-group previewBox" id="previewBox">
		</div>
			
			
			<script type="text/javascript">
			
			//파일 선택시 프리뷰 
			$("#hairFiles").change(function(){
				$("#previewBox").empty();
				for(var i =0; i<$(this)[0].files.length; i++){
					var reader = new FileReader();
					reader.onload = function(e){
						var imgObj = $("<img multiple='multiple'>").attr("src", e.target.result);
						$("#previewBox").append(imgObj);
					}
					reader.readAsDataURL($(this)[0].files[i]);
				}
				
			})
			
			$(document).on("click","#returnListBtn", function(){
				location.href="hairstyleList";
			})
		</script>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-success">등록하기</button>
			<button type="reset" class="btn btn-danger">취소하기</button>
			<button type="button" class="btn btn-warning" id="returnListBtn">헤어스타일 페이지</button>
			</div>
		</div>
		</form>
	</div>
<%@ include file="../common/footer.jsp"%>