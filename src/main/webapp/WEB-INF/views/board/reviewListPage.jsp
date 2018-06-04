<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	#reviewContainer{
		width:1200px;
		min-height:700px;
		margin:0 auto;
		margin-top:15px;
	}
	#reviewContainer h1{
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
	
</style>
</head>
<body>
  <div id="reviewContainer">
  <h1>후기 게시판</h1>
  <p>후기를 남기신 고객분들께 2000포인트를 드립니다.</p>
  <div class="form-group">
  <button id="reviewRegister" class="btn btn-warning">후기 등록하기</button>
  
  </div>
  
  <script type="text/javascript">
  	$("#reviewRegister").click(function(){
  		location.href="reviewRegisterPage";
  	})
  </script>
  
  <table class="table table-bordered">
  	<tr>
		<th style="width:80px;">번호</th>
		<th style="width:80px;">제목</th>
		<th>작성자</th>
		<th>등록일</th>
		<th style="width:80px;">조회수</th>
	</tr>
	<c:forEach var="list" items="${boardList }">
		<tr>
			<td>${list.rb_no }</td>
			<td><a href="reviewReadPage?rb_no=${list.rb_no }">${list.rb_title }</a></td>
			<td>${list.rb_writer }</td>
			<td><fmt:formatDate value="${list.rb_regdate }" pattern="yyyy-MM-dd HH:mm"/></td>
			<td>${list.rb_viewcnt }</td>
		</tr>
	</c:forEach>
	
  </table>
              

</div>
  
</body>
</html>
<%@ include file="../common/footer.jsp" %>