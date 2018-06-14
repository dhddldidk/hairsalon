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
#previewBox, #previewBox11{
		width:800px;
		height: 200px;
		border:3px dotted #848B79;
		margin-left:203px;
		margin-bottom: 20px;
		
	}
	#previewBox img{
		width:100px;
		height:100px;
		border:1px solid #848B79;
	}
	.wrap{
		position: relative;
		width:100px;
		height: 100px;
		border:1px solid gray;
		text-align: center;
		display: inline-block;
	}
	.wrap img{
		width:100px;
		height: 100px;
	}
	.wrap button{
		position: absolute;
		top:0px;
		right: 0px;
		background: orange;
	}
</style>
	<div id="hairstyleContainer">
		<div>
			<h1>헤어스타일 수정</h1>
		</div>
		<form class="form-horizontal" method="post" enctype="multipart/form-data" id="f1">
			<input type="hidden" name="hair_no" value="${hairVo.hair_no }">
			<div id="delFile">
				<!-- 
					수정하기 위해 먼저 선택된 파일들을 지우기 위해 
					엑스 버튼이 클릭 될 때마다 그 파일의 주소를 input 태그에
					같은 name을 줘서 쌓아서 controller에 넘김
					<input type="hidden" name="oldFiles" id="delFile"> -->
			</div>
		
			<!-- 헤어이름, 헤어시간, 헤어가격, 첨부파일 ㄴ -->
		<div class="form-group">
			<label class="control-label col-sm-2" for="hair_type">헤어타입</label>
			<div class="col-sm-10"> 
			<input type="text" name="hair_type" id="hair_type" class="form-control" value="${hairVo.hair_type }"><br>
			</div>
		</div>
		<div class="form-group" >
			<label for="hair_time" class="control-label col-sm-2">헤어소요시간</label>
			<div class="col-sm-10">  
			<input type="text" name="hair_time" id="hair_time" value="${hairVo.hair_time }" class="form-control" placeholder="예)120">
			<span>헤어 소요시간은 분 단위로 숫자만 입력해주세요.</span>
			</div>
		</div>
		<div class="form-group" >
			<label for="hair_price" class="control-label col-sm-2">가격</label>
			<div class="col-sm-10">  
			<input type="text" name="hair_price" id="hair_price" value="${hairVo.hair_price }" class="form-control" placeholder="숫자만 입력해주세요. 예)15000">
			<span>가격은 숫자만 입력해주세요.</span>
			</div>
		</div>
		<div class="form-group" >
			<label for="newFiles" class="control-label col-sm-2">헤어이미지</label>
			<div class="col-sm-10">  
			<input type="file" name="newFiles" id="newFiles" class="form-control" multiple="multiple"> 
			</div>
		</div>
		<div class="form-group" id="previewBox11">
			<c:forEach var="file" items="${hairVo.hFiles }">
				<div class="wrap">
					<img src="displayHairFile?hair_filename=${file }">
					<button data-file="${file }">X</button>
				</div>
			</c:forEach>
		</div>
		<div class="form-group previewBox" id="previewBox">
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-success" id="modifyBtn">수정하기</button>
			<button type="submit" class="btn btn-danger" id="deleteBtn">삭제하기</button>
			<button type="button" class="btn btn-warning" id="returnListBtn">헤어스타일 페이지 이동</button>
			</div>
		</div>
		</form>
		<script type="text/javascript">
		$("#modifyBtn").click(function(){
			$("#f1").attr("action", "hairstyleUpdate");
			$("#f1").submit();
		})
		$("#returnListBtn").click(function(){
			location.href="hairstyleList";
		})	
		$("#deleteBtn").click(function(){
			var flag=confirm("헤어스타일 관련 정보를 삭제하시겠습니까?");
			if(flag==true){
				$("#f1").attr("action", "hairstyleDelete");
				$("#f1").submit();
			}else{
				return false;
			}
		})
		$(".wrap button").click(function(){
				//버튼을 클릭을 했을 때 버튼이 파일 경로의 값을 들고 있을 수 있도록
				//버튼에 속성을 줄 수 있음 ex)<button data-file="${file }">X</button>
				
				var path = $(this).attr("data-file");
				$(this).parent().remove();
				
				var inputObj = $('<input type="hidden" name="oldFiles" id="delFile">');
				$(inputObj).val(path);
				$("#delFile").append(inputObj);
			})
			//파일 선택시 프리뷰 
			$("#newFiles").change(function(){
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
		</script>
	</div>
<%@ include file="../common/footer.jsp"%>