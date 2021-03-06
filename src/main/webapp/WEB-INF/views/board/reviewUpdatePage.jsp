<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#reviewUpdatePage{
		width:1200px;
		min-height:700px;
		margin:0 auto;
		margin-top:15px;
	}
	#reviewUpdatePage h1{
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
	}
	.wrap button{
		position: absolute;
		top:0px;
		right: 0px;
		background: orange;
	}
	#previewBox, #previewBox11{
		width:800px;
		height: 120px;
		border:3px dotted #848B79;
		margin-left:203px;
		margin-bottom: 20px;
		
	}
	#previewBox img{
		width:100px;
	}
</style>
</head>
<body>
		<div id="reviewUpdatePage">
  <h1>후기 수정</h1>
  		<form class="form-horizontal" method="post" action="reviewUpdatePage" enctype="multipart/form-data">
  			<input type="hidden" name="rb_no" value="${reviewBoard.rb_no }">
  			<input type="hidden" name="page" value="${cri.page }">
  			<input type="hidden" name="searchType" value="${cri.searchType }">
  			<input type="hidden" name="keyword" value="${cri.keyword }">
  			<div id="delFile">
  				<!-- 
					수정하기 위해 먼저 선택된 파일들을 지우기 위해 
					엑스 버튼이 클릭 될 때마다 그 파일의 주소를 input 태그에
					같은 name을 줘서 쌓아서 controller에 넘김
					<input type="hidden" name="oldFiles" id="delFile"> -->
  			</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="rb_title">제목</label>
			<div class="col-sm-10"> 
			<input type="text" name="rb_title" id="rb_title" class="form-control" value="${reviewBoard.rb_title }"><br>
			</div>
		</div>
		<div class="form-group" >
			<label for="rb_context" class="control-label col-sm-2" class="idAlign">내용</label>
			<div class="col-sm-10">  
			<textarea class="form-control reg" name="rb_context" row="20">${reviewBoard.rb_context }</textarea>
			</div>
		</div>
		<div class="form-group">
			<label for="rb_writer" class="control-label col-sm-2">작성자</label>
			<div class="col-sm-10">  
			<input type="text" name="rb_writer" id="rb_writer" class="form-control" value="${reviewBoard.rb_writer }" readonly="readonly"><br>
			</div>
		</div>
		
		
		
		<div class="form-group">
			<label for="newFiles" class="control-label col-sm-2">첨부파일</label>
			<div class="col-sm-10">  
			<input type="file" name="newFiles" class="form-control" multiple="multiple" id="file">
			</div>
		</div>
		<div class="form-group" id="previewBox11">	
			<c:forEach var="file" items="${reviewBoard.files }">
				<div class="wrap">
					<img src="displayFile?att_filename=${file }">
					<button data-file="${file }">X</button>
				</div>
			</c:forEach>
		</div>
		<div class="form-group"  id="previewBox">
							
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-success" id="modifyBtn">수정하기</button>
				<button type="submit" class="btn btn-warning" id="returnBtn">게시판 리스트로 돌아가기</button>
			</div>
		</div>
		</form>
		<script type="text/javascript">
			$("#modifyBtn").click(function(){
				//location.href="reviewListPage";
				$("#f1").attr("action", "reviewUpdatePage");
				$("#f1").submit();
			})
			$("#returnBtn").click(function(){
				location.href="reviewListPage";	
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
			$("#file").change(function(){
				$("#previewBox").empty();
				for(var i =0; i<$(this)[0].files.length; i++){
					var reader = new FileReader();
					reader.onload=function(e){
						var imgObj = $("<img multiple='multiple'>").attr("src", e.target.result);
						$("#previewBox").append(imgObj);
					}
					reader.readAsDataURL($(this)[0].files[i]);
				}
			})
		</script>
	
  
  </div>
</body>
</html>
<%@ include file="../common/footer.jsp" %>