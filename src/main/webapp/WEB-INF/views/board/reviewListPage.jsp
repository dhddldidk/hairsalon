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
	th, td:nth-child(1),
	td:nth-child(3),
	td:nth-child(4),
	td:nth-child(5){
		text-align: center;
	}
	th,td{
		padding:10px !important;
	}
	#searchType{
		/* display: inline-block; */
		width:200px !important;
	}
	#keyword{
		display: inline-block; 
		width:400px !important;
	}
	#div1, #div2{
		display: inline-block !important;
	}
	#pagingList{
		text-align: center;
	}
</style>
</head>
<body>
  <div id="reviewContainer">
  <h1>후기 게시판</h1>
  <p>후기를 남기신 고객분들께 2000포인트를 드립니다.</p>
  <div class="form-group" id="div1">
  	<select class="form-control" name="searchType" id="searchType">
  		<option value="n" ${cri.searchType=='n'? 'selected="selected"':''}>======= 검색 =======</option>
  		<option value="t" ${cri.searchType=='t'? 'selected="selected"':''}>제목</option>
  		<option value="c" ${cri.searchType=='c'? 'selected="selected"':''}>내용</option>
  		<option value="w" ${cri.searchType=='w'? 'selected="selected"':''}>작성자</option>
  		<option value="tc" ${cri.searchType=='tc'? 'selected="selected"':''}>제목 or 내용</option>
  		<option value="cw" ${cri.searchType=='cw'? 'selected="selected"':''}>내용 or 작성자</option>
  		<option value="tcw" ${cri.searchType=='tcw'? 'selected="selected"':''}>제목 or 내용 or 작성자</option>
  	</select>
  	</div>
  	<div class="form-group" id="div2">
  <input type="text" class="form-control" id="keyword" name="keyword" value="${cri.keyword }">
  <button id="reviewSearch" class="btn btn-primary">검색하기</button>	
  <button id="reviewRegister" class="btn btn-warning">후기 등록하기</button>
  
  </div>
  
  <script type="text/javascript">
  	$("#reviewRegister").click(function(){
  		location.href="reviewRegisterPage";
  	})
  	
  	$("#reviewSearch").click(function(){
	var searchType = $("#searchType").val();
	var keyword = $("#keyword").val();
							
	location.href="reviewListPage?searchType="+searchType+"&keyword="+keyword;
	})
						
  </script>
  
  <table class="table table-bordered">
  	<tr class="active">
		<th style="width:70px;">번호</th>
		<th>제목</th>
		<th style="width:200px;">작성자</th>
		<th style="width:220px;">등록일</th>
		<th style="width:75px;">조회수</th>
	</tr>
	
	<c:forEach var="list" items="${boardList }">
		
		<tr>
			<td>${list.rb_no }</td>
			
			<!-- 조회수 올릴 때 생각해야할 경우의 수는 2가지 
								1. listPage에서 타이틀을 클릭하면 readPage로 넘어감
									그때만 조회수가 올라가야 함!! 수정이나, 수정에서 취소 클릭시에는 올라가면 안됨
								2. 그래서 클릭을 할 때 flag=true를 매개변수로 줘서 readPage에 
									들어갔을 때만 조회수를 올려주고 
								3. readPage에서 수정이나 수정에서 취소를 누르고 난 후 listPage로 
									돌아왔을 때에는 flag=false가 되서 조회수를 올리면 안됨 -->
			
			
			<td><a href="reviewReadPage?rb_no=${list.rb_no }&page=${pageMaker.cri.page}&searchType=${cri.searchType}&keyword=${cri.keyword}&flag=true">${list.rb_title } [${list.rb_replycnt }]</a></td>
			<td>${list.rb_writer }</td>
			<td><fmt:formatDate value="${list.rb_regdate }" pattern="yyyy-MM-dd"/></td>
			<td><span class="badge bg-red">${list.rb_viewcnt }</span></td>
		</tr>
	</c:forEach>
	
  </table>
  <div id="pagingList">
  	<div>
  		<ul class="pagination">
  			<c:if test="${pageMaker.prev }">
  				<li><a href="reviewListPage?page=${pageMaker.startPage-1 }">&laquo;</a></li>
  			</c:if>
  			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
  				<li ${pageMaker.cri.page == idx? 'class="active"':'' }><a href="reviewListPage?page=${idx }&searchType=${cri.searchType}&keyword=${cri.keyword}">${idx }</a></li>
  			</c:forEach>
  			<c:if test="${pageMaker.next }">
  				<li><a href="reviewListPage?page=${pageMaker.endPage+1 }&searchType=${cri.searchType}&keyword=${cri.keyword}">&raquo;</a></li>
  			</c:if>
  		</ul>
  	</div>
  </div>            

</div>
  
</body>
</html>
<%@ include file="../common/footer.jsp" %>