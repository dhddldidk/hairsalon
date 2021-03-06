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
	#replyContainer{
		width:1200px;
		margin:0 auto;
		margin-top:30px;
		/* border-top:1px solid #848B79; */
	}
	#replyContainer h3{
		width:1200px;
		height:40px;
		line-height:40px;
		padding-left:20px;
		border-left: 20px solid #EDE275;
		border-top: 2px solid #EDE275;
		letter-spacing: 4px;
		color:#493D26;
	}
	#replyContainer input{
		width:800px !important;
	}
	#replyContainer textarea{
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
	.replyLi{
		border:2px dotted #D5D5D5; 
		margin-bottom:10px;
		padding:5px;
		padding-left:10px;
	}
	
	li{
		list-style: none;
	}
	#pagingList{
		text-align: center;
	}
	.timeline li{
		/* margin:5px; */
	}
	
	.timeline h5{
		border-bottom: 1px solid #D5D5D5; 
		
	}
	
</style>
</head>
<script src="${pageContext.request.contextPath }/resources/handlebars-v4.0.10.js"></script>
<body>
<div id="reviewReadPage">
  <h1>후기 게시판</h1>
  	<!-- <form class="form-horizontal" method="post" action="reviewUpdatePage"> -->
  		<form method="get" id="f1">
  			<input type="hidden" name="rb_no" value="${reviewBoard.rb_no }">
  			<input type="hidden" name="page" value="${cri.page }">
  			<input type="hidden" name="searchType" value="${cri.searchType }">
  			<input type="hidden" name="keyword" value="${cri.keyword }">
  			<c:forEach var="file" items="${reviewBoard.files }">
  				<input type="hidden" name="files" value="${file }">
  			</c:forEach>
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
		<div class="form-group" id="previewBox">
			<c:forEach var="file" items="${reviewBoard.files }">
				<img src="displayFile?att_filename=${file }">
			</c:forEach>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<c:if test="${login.u_id==reviewBoard.rb_writer }">
					<button type="submit" class="btn btn-success" id="modifyBtn">수정하기</button>
					<button type="submit" class="btn btn-danger" id="deleteBtn">삭제하기</button>
				</c:if>
				<c:if test="${login.u_flag==0 }">
					<button type="submit" class="btn btn-danger" id="deleteBtn">삭제하기</button>
				</c:if>
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
			
			//댓글이 달린 게시물은 삭제할 수 없도록 처리
			$("#deleteBtn").click(function(){
				
				var replyCnt = $("#replyCnt").html();
				if(replyCnt>0){
					alert("댓글이 달린 게시물은 삭제할 수 없습니다.");
					return;
				}
				
				var flag=confirm("해당 게시글을 삭제하겠습니까?");
				
				if(flag==true){

					$("#f1").attr("action", "reviewDeletePage");
					$("#f1").submit();
				}else{
					return false;
				}
			})
		</script>
  </div>
  <!-- 댓글 -->
  <div id="replyContainer">
  		<div class="form-group">
			<h3 class="box-title">댓글 달기</h3>
		</div>
		<form class="form-horizontal" onSubmit="return false;">
  		<div class="form-group">
			<label class="control-label col-sm-2" for="reply_writer">작성자</label>
			<div class="col-sm-10"> 
			<input type="text" name="reply_writer" id="reply_writer" class="form-control" value="${login.u_id }" readonly="readonly"><br>
			</div>
		</div>
		<div class="form-group" >
			<label for="reply_content" class="control-label col-sm-2">댓글 내용</label>
			<div class="col-sm-10">  
			<input type="text" name="reply_content" id="reply_content" class="form-control" placeholder="댓글을 작성해 주세요."><br>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10"> 
			<button class="btn btn-primary" id="replyAddBtn">등록하기</button>
			<button class="btn btn-warning" id="repliesDiv">댓글 리스트 보기 [<span id="replyCnt">${reviewBoard.rb_replycnt }</span>]</button>
			</div>
		</div>
		<ul class="timeline">
				
			</ul> 
			
		</form>
		<div id="pagingList">
  	<div>
  		<ul class="pagination">
  			
  		</ul> 
  	</div>
  </div>
  </div>
  
 <script id="template" type="text/x-handlebars-template">

{{#each.}}
<li class="replyLi" data-rno={{reply_no}}>
	<i class="fa fa-comments bg-blue"></i>
	<div class="timeline-item">
		
			<span class="time" id="replyTime">
				<i class="fa fa-clock-o"></i>{{prettifyDate reply_date}}
			</span>
		
		
			<h5 class="timeline-header"><strong>{{reply_no}}</strong> 작성자[{{reply_writer}}]</h5>
		
			<h4 class="timeline-body">{{reply_content}}</h4>
			{{#if reply_writer}}
		<div class="timeline-footer">
			<a class="btn btn-success" data-toggle="modal" data-target="#modifyModal">수정하기</a>
			<a class="btn btn-danger">삭제하기</a>
		</div>
			{{/if}}
			{{#ifModify reply_writer}}
		<div class="timeline-footer">
			<a class="btn btn-success" data-toggle="modal" data-target="#modifyModal">수정하기</a>
			<a class="btn btn-danger">삭제하기</a>
		</div>
			{{/ifModify}}
			{{#ifadmin reply_writer}}
		<div class="timeline-footer">
			<a class="btn btn-danger">삭제하기</a>
		</div>
			{{/ifadmin}}
	</div>
</li>
{{/each}}

</script>
  
  <script type="text/javascript">
  
  //보통 매개변수 하나만 받음 그데 매개변수 처리하기 위해서 하나 더 받음
  //댓글 단 사람만 수정할 수 있도록 처리하기
  Handlebars.registerHelper("if", function(reply_writer, options){
	  if(reply_writer == "${login.u_id}" && ${login.u_flag}==1){
		  return options.fn(this);// if문에 해당하는 div를 그대로 반환할 수 있음(수정, 삭제 버튼이 들어감) 
	  }else{
		  return '';
	  }
  })
  
  Handlebars.registerHelper("ifModify", function(reply_writer, options){
	  if(reply_writer == "${login.u_id}" && ${login.u_flag}==0){
		  return options.fn(this);// if문에 해당하는 div를 그대로 반환할 수 있음(수정, 삭제 버튼이 들어감) 
	  }else{
		  return '';
	  }
  })
  
  
  Handlebars.registerHelper("ifadmin", function(reply_writer, options){
	  if(reply_writer != "${login.u_id}" && ${login.u_flag}==0){
		  return options.fn(this);// if문에 해당하는 div를 그대로 반환할 수 있음(삭제 버튼이 들어감) 
	  }else{
		  return '';
	  }
  })
  
  Handlebars.registerHelper("prettifyDate", function(value){
	  var dateObj = new Date(value);
	  var year = dateObj.getFullYear();
	  var month = dateObj.getMonth()+1;
	  var date = dateObj.getDate();
	  
	  return year+"/"+month+"/"+date;
  })
  
  var source = $("#template").html();
  var tFunc = Handlebars.compile(source);
  var rb_noVal = ${reviewBoard.rb_no };
  var pageNumber=1;
  
  	$("#replyAddBtn").click(function(){
  		var replyWriter =  $("#reply_writer").val();
  		var replyContent = $("#reply_content").val();
  		var sendData = {rb_no:rb_noVal, reply_writer:replyWriter, reply_content:replyContent};//키, 값
  		var replyCnt = Number($("#replyCnt").html())+1;
  		
  		if(replyContent==""){
  			alert("댓글을 작성해주세요.");
  			return;
  		}
  		
  		//Spring Controller에
  		//@requestBody를 쓸 경우 jsp 파일에 JSON.stringify, headers에 Content-type을 써줘야 함
  		$.ajax({
  			type:"post",
  			url:"${pageContext.request.contextPath}/replies",
  			data:JSON.stringify(sendData),
  			dataType:"text",
  			headers:{"Content-Type":"application/json"},
  			success:function(result){
  				console.log(result);
  				if(result=="success"){
  					alert("댓글이 등록되었습니다.");
  					$("#reply_content").val("");
  					$("#replyCnt").html(replyCnt);
  				}
  			}
  		})
  	})
  	
  	$("#repliesDiv").click(function(e){
  		e.preventDefault();
  		
  		
  		$.ajax({
  			url:"${pageContext.request.contextPath}/replies/"+rb_noVal+"?page="+pageNumber,
  			type:"get",
  			dataType:"json",
  			success:function(result){
  				console.log(result);
  				
  				displayList(result.list);
  				
  				displayPaging(result.pageMaker);
  			}
  		})
  	})
  	
  	$(document).on("click",".pagination a", function(e){
  		e.preventDefault();
  		
  		pageNumber = $(this).text();
  		
  		//getListPage(ajax를 실행시켜야 함 ) - > 버튼이 클릭되도록 함getListPage
		$("#repliesDiv").trigger("click"); // = $("#repliesDiv").click();
		
  		/* $.ajax({
  			url:"${pageContext.request.contextPath}/replies/"+rb_noVal+"?page="+pageNumber,
  			type:"get",
  			dataType:"json",
  			success:function(result){
  				console.log(result);
  				
  				displayList(result.list);
  				
  				displayPaging(result.pageMaker);
  			}
  		}) */
  	})
  	
  	function displayList(data){
		$(".replyLi").remove();
		var str = tFunc(data);
		$(".timeline").append(str);
	}
	
	function displayPaging(pageMaker){
		var str = "";
		var index = "";
		
		if(pageMaker.prev){
			str += "<li><a href='#'> << </a></li>";
		}
		
		for(var i = pageMaker.startPage; i<=pageMaker.endPage; i++){
			if(pageNumber==i){
				str += "<li class='active'><a href='#'> "+i+" </a></li>";
			}else{
				str += "<li><a href='#'> "+i+" </a></li>";
			}
			
		}
		
		if(pageMaker.next){
			str += "<li><a href='#'> >> </a></li>";
		}
		$(".pagination").html(str);
	}
	
	//댓글 삭제
	$(document).on("click", ".timeline-footer a:last-child", function(e){
		var reply_no = $(this).parents(".replyLi").attr("data-rno");
		var replyCnt = Number($("#replyCnt").html())-1;
		
		$.ajax({
			type:"delete",
			url:"${pageContext.request.contextPath}/replies/"+reply_no,
			dataType:"text",
			success:function(result){
				console.log(result);
				if(result == "success"){
					alert("댓글이 삭제되었습니다.");
					$("#replyCnt").html(replyCnt);
				}
				$("#repliesDiv").trigger("click");
			}
		})
		
	})
	
	//댓글 수정1. Modal에 값 넣기
	$(document).on("click", ".timeline-footer a:first-child", function(){
		var replyNo = $(this).parents(".replyLi").attr("data-rno");
		var replyContent = $(this).parents(".replyLi").find(".timeline-body").html();
		
		$("#replyNumber").val(replyNo);
		$("#getReplyContent").val(replyContent);         
	})
	
	//댓글 수정2. Modal에 댓글 수정하기
	$(document).on("click", ".updateComplete", function(){
		var reply_no=$("#replyNumber").val();
		var replyContentVal = $("#getReplyContent").val();
		var sendData = {reply_content:replyContentVal};
		
		$.ajax({
			type:"put",
			url:"${pageContext.request.contextPath}/replies/"+reply_no,
			data:JSON.stringify(sendData),
			dataType:"text",
			headers:{"Content-Type":"application/json"},
			success:function(result){
				console.log(result);
				if(result=="success"){
					alert("수정되었습니다.");
				}
				$("#repliesDiv").trigger("click");
			}
		})
	})
  </script>
  
  <!-- Modal 댓글 수정누르면 수정하는 Modal 뜨도록 -->
  <div class="modal fade" id="modifyModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
        	<!-- data-dismiss="modal" 닫게 해줌 -->
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">수정하기</h4>
        </div>
        <div class="modal-body">
          
			<div class="form-group">
				<label for="reply_no">번호</label>
				<input type="text" class="form-control" id="replyNumber" readonly="readonly">
			</div>
			<div class="form-group">
				<label for="reply_content">댓글내용</label>
				<input type="text" class="form-control" id="getReplyContent">
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary updateComplete" data-dismiss="modal">수정하기</button>
			</div>
		
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
        </div>
      </div>
      
    </div>
  </div>
</body>
</html>
<%@ include file="../common/footer.jsp" %>