<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
#myPageContainer {
	width: 1200px;
	min-height: 700px;
	margin: 0 auto;
	margin-top: 15px;
}

#myPageContainer h1 {
	width: 1200px;
	height: 60px;
	line-height: 60px;
	margin-bottom: 50px;
	padding-left: 20px;
	border-left: 20px solid #EDE275;
	border-bottom: 2px solid #EDE275;
	letter-spacing: 4px;
	color: #493D26;
	font-size: 24px;
}
table th{
	text-align: center;
	padding: 15px !important;
}
table td{
	text-align: center;
	padding: 10px !important;
}
input[type=checkbox]{
	-ms-transform: scale(2.2);
  -moz-transform: scale(2.2);
  -webkit-transform: scale(2.2);
  -o-transform: scale(2.2);
}
td:nth-child(1), td:nth-child(2), td:nth-child(3),
td:nth-child(4), td:nth-child(5), td:nth-child(7){
	padding-top: 16px !important; 
}

#pagingList{
		text-align: center;
	}
#myPageContainer #myPageMenu{
	width:1200px;
	height:60px;
	list-style: none;
}
#myPageContainer #myPageMenu li:first-child{
	width:50%;
	height:60px;
	float:left;
	margin-bottom: 50px;
	padding-left: 20px;
	border-left: 20px solid #EDE275;
	border-bottom: 2px solid #EDE275;
	letter-spacing: 4px;
	color: #493D26;
}
#myPageContainer #myPageMenu li:last-child{
	width:50%;
	height:60px;
	float:left;
	margin-bottom: 50px;
	padding-left: 20px;
	border-left: 20px solid #DDA0DD;
	border-bottom: 2px solid #DDA0DD;
	letter-spacing: 4px;
	color: #493D26;
}
#myPageContainer #myPageMenu li h2{
	font-size: 26px;	
}
#myPageContainer #myPageMenu li:first-child:hover{
	color: #669966;
}
#myPageContainer #myPageMenu li:last-child:hover{
	color: #8B008B;
}
#myPageContainer #myPageMenu li h2:hover{
	font-size: 28px;	
	font-weight: bold;
}

#beforeMyPage td{
	padding:17px !important;
}

</style>
<script>


</script>
	<div id="myPageContainer">
		
		<ul id="myPageMenu">
			<c:if test = "${login.u_flag==1 }">
				<li><h2>예약 내역 관리</h2></li>
				<li><h2>이전 예약 리스트</h2></li>
			</c:if>
			<c:if test = "${login.u_flag==0 }">
				<li><h2>오늘의 예약 리스트</h2></li>
				<li><h2>회원 리스트</h2></li>
			</c:if>
		</ul>
		
		<script type="text/javascript">
		
		var number = 1;
		$("#myPageContainer #myPageMenu li:first-child").click(function(){
			
			location.href="${pageContext.request.contextPath}/member/myPage";
		})
		$("#myPageContainer #myPageMenu li:last-child").click(function(){
			
			location.href="${pageContext.request.contextPath}/member/beforeMyPage?page="+number; 
		})
		
		</script>
	 
	
	
<!-- 이전 예약 리스트 -->
<div id="beforeMyPage">
		<table class='table table-bordered'>
			<tr class='active'>
			<c:if test = "${login.u_flag==1 }">
				<th>번호</th>
				<th>예약 날짜</th>
				<th>예약 종료 시간</th>
				<th>헤어 스타일</th>
				<th>가격</th>
			</c:if>	
			<c:if test = "${login.u_flag==0 }">
				<th>번호</th>
				<th>이름</th>
				<th>아이디</th>
				<th>연락처</th>
				<th>이메일</th>
				<th>No Show</th>
				
			</c:if>
			</tr>
			
		<c:if test = "${login.u_flag==1 }">		
		<c:forEach var="item" items="${joinList }">
			<tr>
				<td>${item.res_no }</td> 
				<td><fmt:formatDate value="${item.res_start }" pattern="yyyy-MM-dd HH:mm"/></td>
				<td><fmt:formatDate value="${item.res_end }" pattern="yyyy-MM-dd HH:mm"/></td>
				<td>${item.hairstyleVo.hair_type }</td>
				<td><fmt:formatNumber value="${item.hairstyleVo.hair_price }" type="number"/></td>
				<%-- <td><button class="btn btn-danger cancel" data-resno="${item.res_no }">예약취소</button></td> 
				<td><input type="checkbox" id="chkBox"></td> --%>
			</tr>
			
		</c:forEach>
		</c:if>
		<c:set var="no" value="${(memberPageMaker.cri.page-1)*10 }"></c:set>
		<c:if test = "${login.u_flag==0 }">		                     
		<c:forEach var="item" items="${memberList }">
			
			<tr>
				<td>${no=no+1 }</td> 
				<td>${item.member.u_name}</td>
				<td>${item.member.u_id }</td>
				<td>${item.member.u_phone }</td>
				<td>${item.member.u_email }</td>
				<td>${item.member.u_noshow }</td>
				<%-- <td><button class="btn btn-danger cancel" data-resno="${item.res_no }">예약취소</button></td> 
				<td><input type="checkbox" id="chkBox"></td> --%>
			</tr>
			
		</c:forEach>
		</c:if>
		</table>
				<!-- 페이징 -->
				<c:if test = "${login.u_flag==1 }">
		<div id="pagingList">
  	<div>
  		<ul class="pagination">
  			<c:if test="${joinPageMaker.prev }">
  				<li><a href="beforeMyPage?page=${joinPageMaker.startPage-1 }">&laquo;</a></li>
  			</c:if>
  			<c:forEach begin="${joinPageMaker.startPage }" end="${joinPageMaker.endPage }" var="idx">
  				<li ${joinPageMaker.cri.page == idx? 'class="active"':'' }><a href="beforeMyPage?page=${idx }">${idx }</a></li>
  			</c:forEach>
  			<c:if test="${joinPageMaker.next }">
  				<li><a href="beforeMyPage?page=${joinPageMaker.endPage+1 }">&raquo;</a></li>
  			</c:if>
  		</ul>
  	</div>
  </div>
  </c:if>
  
  <!-- 페이징 -->
				<c:if test = "${login.u_flag==0 }">
		<div id="pagingList">
  	<div>
  		<ul class="pagination">
  			<c:if test="${memberPageMaker.prev }">
  				<li><a href="beforeMyPage?page=${memberPageMaker.startPage-1 }">&laquo;</a></li>
  			</c:if>
  			<c:forEach begin="${memberPageMaker.startPage }" end="${memberPageMaker.endPage }" var="idx">
  				<li ${memberPageMaker.cri.page == idx? 'class="active"':'' }><a href="beforeMyPage?page=${idx }">${idx }</a></li>
  			</c:forEach>
  			<c:if test="${memberPageMaker.next }">
  				<li><a href="beforeMyPage?page=${memberPageMaker.endPage+1 }">&raquo;</a></li>
  			</c:if>
  		</ul>
  	</div>
  </div>
  </c:if>
		</div> 
</div>
<%@ include file="../common/footer.jsp"%>
