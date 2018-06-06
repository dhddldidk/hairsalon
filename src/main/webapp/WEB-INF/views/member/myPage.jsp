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
</style>
	<div id="myPageContainer">
		<h1>예약 내역 관리</h1>
		<table class='table table-bordered'>
			<tr class='active'>
				<th>번호</th>
				<th>예약 날짜</th>
				<th>예약 종료 시간</th>
				<th>헤어 스타일</th>
				<th>가격</th>
				<th>예약 취소</th>
				<th>이용 현황</th>
			</tr>
			
			<c:set var="no" value="0" ></c:set>
		<c:forEach var="item" items="${myList }">
			
			<tr>
				<td>${no=no+1 }</td>
				<td><fmt:formatDate value="${item.res_start }" pattern="yyyy-MM-dd HH:mm"/></td>
				<td><fmt:formatDate value="${item.res_end }" pattern="yyyy-MM-dd HH:mm"/></td>
				<td>${item.hairstyleVo.hair_type }</td>
				<td><fmt:formatNumber value="${item.hairstyleVo.hair_price }" type="number"/></td>
				<td><button class="btn btn-danger" id="cancel" data-resno="${item.res_no }">예약취소</button></td>
				<td><input type="checkbox" id="chkBox"></td>
			</tr>
			
		</c:forEach>
		</table>
		<script type="text/javascript">
				var res_no="";
			$("#cancel").click(function(){
				var clickedVal = $(this).parent().parent();
				res_no = $(this).attr("data-resno");        
				alert("res_no : "+$(this).attr("data-resno"));
				var flag = confirm("선택된 예약을 취소 하시겠습니까?");
				if(flag==true){
					$("input[name='res_no']").val(res_no);
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
						
						for(var i=2; i<result.length+1; i++){
							$("table").find("tr:nth-child("+i+") td:first-child").html(i-1);
							
						}
					}
				})
			})
		</script>
	</div>
	

<%@ include file="../common/footer.jsp"%>
