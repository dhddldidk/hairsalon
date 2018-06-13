<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	#reviewRegister{
		width:1200px;
		min-height:700px;
		margin:0 auto;
		margin-top:15px;
	}
	#reviewRegister h1{
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
	input, textarea{
		width:800px !important;
	}
	textarea{
		width:800px !important;
		height: 200px !important;
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
	}
</style>
</head>
<body>
	<div id="reviewRegister">
  <h1>후기 등록</h1>
  	<form class="form-horizontal" method="post" action="reviewRegisterPage" enctype="multipart/form-data">
		<div class="form-group">
			<label class="control-label col-sm-2" for="rb_title">제목</label>
			<div class="col-sm-10"> 
			<input type="text" name="rb_title" id="rb_title" class="form-control"><br>
			</div>
		</div>
		<div class="form-group" >
			<label for="rb_context" class="control-label col-sm-2" class="idAlign">내용</label>
			<div class="col-sm-10">  
			<textarea class="form-control reg" name="rb_context" row="20"></textarea>
			</div>
		</div>
		<div class="form-group">
			<label for="rb_writer" class="control-label col-sm-2">작성자</label>
			<div class="col-sm-10">  
			<input type="text" name="rb_writer" id="rb_writer" value="${login.u_id }" class="form-control" readonly="readonly">
			</div>
		</div>
		<div class="form-group">
			<label for="imageFiles" class="control-label col-sm-2">첨부파일</label>
			<div class="col-sm-10">  
			<input type="file" name="imageFiles" multiple="multiple" id="file" class="form-control">
			</div>
		</div>
		<div class="form-group previewBox" id="previewBox">
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-success">등록하기</button>
			<button type="reset" class="btn btn-danger">취소하기</button>
			<button type="button" class="btn btn-warning" id="returnListBtn">후기 게시판으로 돌아가기</button>
			</div>
		</div>
		<script type="text/javascript">
			$("#returnListBtn").click(function(){
				location.href="reviewListPage";
			})
			
			//파일 선택시 프리뷰 
			$("#file").change(function(){
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
		
	</form>
  
  </div>
</body>
</html>
<%@ include file="../common/footer.jsp" %>