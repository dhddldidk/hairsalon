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
	#reviewReadPage{
		width:1200px;
		min-height:700px;
		margin:0 auto;
		margin-top:15px;
	}
	#reviewReadPage h1{
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
	
</style>
</head>
<body>
		<div id="reviewReadPage">
  <h1>후기 게시판</h1>
  	<!-- <form class="form-horizontal" method="post" action="reviewUpdatePage"> -->
  		<form method="get" id="f1">
  			<input type="hidden" name="rb_no" value="${reviewBoard.rb_no }">
  		</form>
  		<form class="form-horizontal" onSubmit="return false;">
		<div class="form-group">
			<label class="control-label col-sm-2" for="rb_title">제목</label>
			<div class="col-sm-10"> 
			<input type="text" name="rb_title" id="rb_title" class="form-control" value="${reviewBoard.rb_title }" readonly="readonly"><br>
			</div>
		</div>
		<div class="form-group" >
			<label for="rb_context" class="control-label col-sm-2" class="idAlign">내용</label>
			<div class="col-sm-10">  
			<textarea class="form-control reg" name="rb_context" row="20" readonly="readonly">${reviewBoard.rb_context }</textarea>
			</div>
		</div>
		<div class="form-group">
			<label for="rb_writer" class="control-label col-sm-2">작성자</label>
			<div class="col-sm-10">  
			<input type="text" name="rb_writer" id="rb_writer" class="form-control" value="${reviewBoard.rb_writer }" readonly="readonly"><br>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-success" id="modifyBtn">수정하기</button>
				<button type="submit" class="btn btn-danger" id="deleteBtn">삭제하기</button>
				<button type="submit" class="btn btn-warning" id="returnListBtn">게시판 리스트로 돌아가기</button>
			</div>
		</div>
		</form>
		<script type="text/javascript">
			$("#returnListBtn").click(function(){
				//location.href="reviewListPage";
				$("#f1").attr("action", "reviewListPage");
				$("#f1").submit();
			})
			$("#modifyBtn").click(function(){
				//location.href="reviewListPage";
				$("#f1").attr("action", "reviewUpdatePage");
				$("#f1").submit();
			})
		</script>
	<!-- </form> -->
  
  </div>
</body>
</html>
<%@ include file="../common/footer.jsp" %>