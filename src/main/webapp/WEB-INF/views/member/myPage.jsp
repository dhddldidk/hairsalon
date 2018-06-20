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
td:nth-child(4), td:nth-child(5), td:nth-child(7),
td:nth-child(8), td:nth-child(9){
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
	<div id="myPageContainer">
		
		<ul id="myPageMenu">
			<c:if test = "${login.u_flag==1 }">
				<li><h2>예약 내역 관리</h2></li>
				<li><h2>이전 예약 리스트</h2></li>
			</c:if>
			<c:if test = "${login.u_flag==0 }">
				<li><h2>오늘의 예약 리스트</h2></li>
				<li><h2>이전 예약 리스트</h2></li>
			</c:if>
		</ul>
		<div id="myPageManagement">
		<table class='table table-bordered'>
			<tr class='active'>
			
				<!-- <th>번호</th>
				<th>예약 날짜</th>
				<th>예약 종료 시간</th>
				<th>헤어 스타일</th>
				<th>가격</th>
				<th>예약 취소</th>
				<th>이용 현황</th>
			 -->
			
				<th>번호</th>
				<th>예약 날짜</th>
				<th>예약 종료 시간</th>
				<th>헤어 스타일</th>
				<th>가격</th>
				<th>예약 취소</th>
			<c:if test = "${login.u_flag==0 }">
				<th>고객명</th>
				<th>연락처</th>
				<th>No Show</th>
			</c:if>	
			</tr>
			
		<c:if test = "${login.u_flag==1 }">	
			<c:forEach var="item" items="${myList }">
			<tr>
				<td>${item.res_no }</td>
				<fmt:formatDate value="${item.res_start }" pattern="yyyy-MM-dd HH:mm" var="resstart"/>
				<td>${resstart }</td>
				<td><fmt:formatDate value="${item.res_end }" pattern="yyyy-MM-dd HH:mm"/></td>
				<td>${item.hairstyleVo.hair_type }</td>
				<td><fmt:formatNumber value="${item.hairstyleVo.hair_price }" type="number"/></td>
				<td><button class="btn btn-danger cancel" data-resno="${item.res_no }" data-resstart="${resstart }">예약취소</button></td>
			</tr>
			</c:forEach>
		</c:if>
		<c:if test = "${login.u_flag==0 }">
		<c:set var="total" value="0"></c:set>
			<c:forEach var="item" items="${todayReservation }">
			
			<c:set var="price" value="${item.hairstyleVo.hair_price }"></c:set>
			<c:set var="total" value="${total=total+price }"></c:set> 
			<tr>
				<td>${item.res_no }</td>
				<fmt:formatDate value="${item.res_start }" pattern="yyyy-MM-dd HH:mm" var="resstart"/>
				<td>${resstart }</td>
				<td><fmt:formatDate value="${item.res_end }" pattern="yyyy-MM-dd HH:mm"/></td>
				<td>${item.hairstyleVo.hair_type }</td>
				<td><fmt:formatNumber value="${item.hairstyleVo.hair_price }" type="number"/></td>
				<td><button class="btn btn-danger cancel" data-resno="${item.res_no }" data-resstart="${resstart }">예약취소</button></td>
				<td>${item.member.u_name }</td>
				<td>${item.member.u_phone }</td>
				<td><input type="checkbox" class="chkBox" value="${item.res_usage}" name="res_usage" ${item.res_usage? 'checked="checked"':'' } data-resno="${item.res_no }"></td>
			</tr>
		</c:forEach>
			<tr>
				<td>총매출</td>
				<td colspan="3"></td>
				<!-- <td></td>
				<td></td>  -->
				<fmt:formatNumber value="${total }" type="number" var="total"/> 
				<td>${total }</td>
				<td colspan="4"></td>
				<!-- <td></td>
				<td></td>
				<td></td> -->
			</tr>
		</c:if>
		</table>
		
		<script type="text/javascript">
		
		var number = 1;
		$("#myPageContainer #myPageMenu li:first-child").click(function(){
			location.href="${pageContext.request.contextPath}/member/myPage";
		})
		$("#myPageContainer #myPageMenu li:last-child").click(function(){
			location.href="${pageContext.request.contextPath}/member/beforeMyPage?page="+number; 
		})
		
		
			var resdate="";
			$(".cancel").click(function(){
	
				var clickedVal = $(this).parent().parent();
				var res_no = $(this).attr("data-resno");        
				resdate = $(this).attr("data-resstart");
				
				var reservedDate = new Date(resdate);
				var resDateOfYear = reservedDate.getFullYear()+"-"+(reservedDate.getMonth()+1)+"-"+reservedDate.getDate();
				
				var currDate = new Date();
				var curDateOfYear = currDate.getFullYear()+"-"+(currDate.getMonth()+1)+"-"+currDate.getDate();
				
				
				
				//일반회원이 예약 취소시 예약 하루 전 날 까지만 취소할 수 있음
				if(${login.u_flag==1}){
					if(resDateOfYear==curDateOfYear){
						alert("예약 당일에는 취소할 수 없습니다.");
						return false;
					}
				} 
				
				//관리자 로그인시 현재시간 이전의 예약은 취소 할 수 없음
				if(${login.u_flag==0}){
					if(reservedDate<currDate){
						alert("예약을 취소할 수 없습니다.");
						return false;
					}
				} 
				
				
				var flag = confirm("선택된 예약을 취소 하시겠습니까?");
				if(flag==true){
					//$("input[name='res_no']").val(res_no);
					$("#f1").attr("action","myPage");
					$("#f1").submit();
				}else{
					return false;
				}
				
				$.ajax({
					type:"post",
					url:"${pageContext.request.contextPath}/member/myPage?res_no="+res_no,
					dataType:"text",
					success:function(result){
						console.log(result);
						console.log(clickedVal);
						
						clickedVal.remove();
						
					}
				})
			})
			
			$(document).on("click",".chkBox",function(){
				var chkFlag = $(this).is(':checked');
				var res_no = $(this).attr("data-resno");    
				
				
				$.ajax({
					type:"get",
					url:"${pageContext.request.contextPath}/member/checkBoxFlag?flag="+chkFlag+"&res_no="+res_no,
					dataType:"text",
					success:function(result){
						console.log(result);
						
					}
				})
			})
		</script>
		<!-- 페이징 -->
		<div id="pagingList">
  	<div>
  		<ul class="pagination">
  			<c:if test="${pageMaker.prev }">
  				<li><a href="myPage?page=${pageMaker.startPage-1 }">&laquo;</a></li>
  			</c:if>
  			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
  				<li ${pageMaker.cri.page == idx? 'class="active"':'' }><a href="myPage?page=${idx }">${idx }</a></li>
  			</c:forEach>
  			<c:if test="${pageMaker.next }">
  				<li><a href="myPage?page=${pageMaker.endPage+1 }">&raquo;</a></li>
  			</c:if>
  		</ul>
  	</div>
  </div> 
  </div>       
	
	
<%-- <!-- 이전 예약 리스트 -->
<div id="beforeMyPage">
		<table class='table table-bordered'>
			<tr class='active'>
				<th>번호</th>
				<th>예약 날짜</th>
				<th>예약 종료 시간</th>
				<th>헤어 스타일</th>
				<th>가격</th>
				<!-- <th>예약 취소</th>
				<th>이용 현황</th> -->
			</tr>
			
			
		<c:forEach var="item" items="${joinList }">
			
			<tr>
				<td>${item.res_no }</td>
				<td><fmt:formatDate value="${item.res_start }" pattern="yyyy-MM-dd HH:mm"/></td>
				<td><fmt:formatDate value="${item.res_end }" pattern="yyyy-MM-dd HH:mm"/></td>
				<td>${item.hairstyleVo.hair_type }</td>
				<td><fmt:formatNumber value="${item.hairstyleVo.hair_price }" type="number"/></td>
				<td><button class="btn btn-danger cancel" data-resno="${item.res_no }">예약취소</button></td> 
				<td><input type="checkbox" id="chkBox"></td>
			</tr>
			
		</c:forEach>
		</table>
				<!-- 페이징 -->
		<div id="pagingList">
  	<div>
  		<ul class="pagination">
  			<c:if test="${joinPageMaker.prev }">
  				<li><a href="myPage?page=${joinPageMaker.startPage-1 }">&laquo;</a></li>
  			</c:if>
  			<c:forEach begin="${joinPageMaker.startPage }" end="${joinPageMaker.endPage }" var="idx">
  				<li ${joinPageMaker.cri.page == idx? 'class="active"':'' }><a href="myPage?page=${idx }">${idx }</a></li>
  			</c:forEach>
  			<c:if test="${joinPageMaker.next }">
  				<li><a href="myPage?page=${joinPageMaker.endPage+1 }">&raquo;</a></li>
  			</c:if>
  		</ul>
  	</div>
  </div>
		</div> --%> 
</div>
<%@ include file="../common/footer.jsp"%>
