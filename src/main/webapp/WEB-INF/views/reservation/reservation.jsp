<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#regContainer {
	width: 1400px;
	margin: 0 auto;
}

table {
	position: relative;
	/* text-align: center !important; */
}

tr, td, th {
	padding: 20px !important;
	text-align: center !important;
	width: 120px !important;
}
td:hover{
	background: #4CC417;
}
table img {
	width: 35px;
	height: 35px;
	margin-bottom: 5px;
}

tr:first-child th:nth-child(2) img {
	/* border:1px solid red; */
	position: absolute;
	top: 17px;
	left: 180px;
}

tr:first-child th:last-child img {
	/* border:1px solid red; */
	position: absolute;
	top: 17px;
	right: 5px;
}

tr:first-child th:nth-child(2), tr:first-child th:nth-child(3), tr:first-child th:nth-child(4),
	tr:first-child th:nth-child(5), tr:first-child th:nth-child(6), tr:first-child th:nth-child(7),
	tr:first-child th:nth-child(8) {
	padding-top: 25px !important;
}

#notice {
	margin-bottom: 20px;
}

#notice p {
	font-size: 13px;
}

#notice h4 {
	width: 800px;
	height: 30px;
	line-height: 30px;
	margin-bottom: 20px;
	padding-left: 20px;
	border-left: 20px solid #EDE275;
	border-bottom: 2px solid #EDE275;
	letter-spacing: 4px;
	color: #493D26;
}
#sWidth{
	width:200px !important;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<script type="text/javascript">
	//달력 생성
	var theDate = new Date();
	
	//달력 시작일
	var start = null;

	//말일
	var last = null;

	//월
	var m = null;
	var nextDay = 1;
	var y = null;
	var d = null;

	function printCalendar(date) {

		y = date.getFullYear();
		m = date.getMonth();
		d = date.getDate();

		last = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];

		if (y % 4 == 0 && y % 100 !== 0 || y % 400 == 0)
			last[4] = 29;

		/* var row = Math.ceil(theDay + last[m]) / 7; */
		var span = document.getElementsByTagName("span");
		span[0].innerHTML = y + "." + (m + 1);

		var calendar = "<table class='table table-bordered'>";
		

		//오늘날짜
		var dNum = d;

		calendar += "<tr class='active'>";
		calendar += "<th></th>";
		//일요일부터 시작하는 날짜
		start = dNum - date.getDay();
		alert("6월1일임  " + m);

		if(start < 1){
			start = last[m-1]+start;
			m=m-1;
		}
		alert("6월1일임  " + m);

		alert("넘어온 30일이 " + start);

		//다음달의 말일이 몇일
		var currMonth = m + 1;
		for (var k = 1; k <= 7; k++) {

			//정상적으로 시작일이 그 달의 말일보다 작을 때부터 같을 때 까지  1.번
			if (start <= last[m]) {
				
				var startM = currMonth>9? currMonth:"0"+currMonth;
				var startD = start>9? start:"0"+start;
				
				if (k == 1) {
					calendar += "<th data-thisyear='"+y+'-'+startM+'-'+startD+"'><img src='/hairsalon/resources/images/left_arrow.png' onclick='beforeMonth()' id='leftArrow'>"
							+ currMonth + "월" + start + "일" + "</th>";

				} else if (k == 7) {
					calendar += "<th data-thisyear='"+y+'-'+startM+'-'+startD+"'>"
							+ currMonth
							+ "월"
							+ start
							+ "일"
							+ "<img src='/hairsalon/resources/images/right_arrow.png' onclick='nextMonth()'></th>";

				} else {
					calendar += "<th data-thisyear='"+y+'-'+startM+'-'+startD+"'>" + currMonth + "월" + start
							+ "일" + "</th>";

				}
				start++

				//7일씩 찍는 동안 달이 바뀔경우 일자를 1일로 변경시키고
				//달+1해서 찍어줌					
			} else if (start > last[m]) {
				alert("??????????????????????????"+m);
				start = 1;

				currMonth++;
				var startM = currMonth>9? currMonth:"0"+currMonth;
				var startD = start>9? start:"0"+start;
				if (currMonth > last.length) {
					y++;
					m = 0;
					currMonth = m + 1;
				} else {
					m = m + 1;
				}  
				if (k == 1) {
					calendar += "<th data-thisyear='"+y+'-'+startM+'-'+startD+"'><img src='/hairsalon/resources/images/left_arrow.png' onclick='beforeMonth()'>"
							+ currMonth + "월" + start + "일" + "</th>";

				} else if (k == 7) {
					calendar += "<th data-thisyear='"+y+'-'+startM+'-'+startD+"'>"
							+ currMonth
							+ "월"
							+ start
							+ "일"
							+ "<img src='/hairsalon/resources/images/right_arrow.png' onclick='nextMonth()'></th>";

				} else {
					calendar += "<th data-thisyear='"+y+'-'+startM+'-'+startD+"'>" + currMonth + "월" + start
							+ "일" + "</th>";
				}
				start++;
			}
		}
		calendar += "</tr>";
		
		
		
		
		/*30분 단위 시간계산 */
		const currDate = new Date("11/20/2017 09:30 AM");
		const modiDate = new Date(currDate.valueOf());
		
		//달력밑에 시간 추가
		for(var i = 0; i<20; i++){
			//alert("시간시간시간 달력에서 온 날짜"+d);
			calendar += "<tr>";
			/*30분 단위 시간계산 */
			
			modiDate.setMinutes(modiDate.getMinutes()+30);
			var hour = modiDate.getHours();
			var min = modiDate.getMinutes();
			if(min==0){
				min = min+"0";
			}
			/* alert("hour"+hour);
			alert("min"+min); */
			calendar +="<th class='active'>"+hour+":"+min+"</th>";
			for(var k =0; k <7; k++){	
				calendar +="<td></td>";
			}
			calendar +="</tr>";
		}
		calendar += "</table>";
		var calen = document.getElementById("draw");
		calen.innerHTML = calendar;
	}

	function nextMonth() {
		var nDate = null;
		//다음 버튼을 눌렀을 때
		// 시작일이 말일보다 클 경우 처리 
		if (start > last[m]) {
			start = start - Number(last[m]);
			alert("if start" + start);
			nDate = new Date(y, m + 1, start);
		} else if (start <= last[m]) {
			//10이 넘어옴
			nDate = new Date(y, m, start);
			/* alert("말일보다 작을경우 calDate"+nDate); */
			/* calDate = calDate; */
		}
		
		var sDate = new Date(nDate.getFullYear(), nDate.getMonth(), start);
		var eDate = new Date(nDate.getFullYear(), nDate.getMonth(), start+6); 
		
		var ssDate = sDate.getFullYear()+"-"+((sDate.getMonth()+1) > 9? (sDate.getMonth()+1):"0"+(sDate.getMonth()+1))+"-"+((sDate.getDate()) > 9? (sDate.getDate()):"0"+(sDate.getDate()))+" 00:00";
		var eeDate = eDate.getFullYear()+"-"+((eDate.getMonth()+1) > 9? (eDate.getMonth()+1):"0"+(eDate.getMonth()+1))+"-"+((eDate.getDate()) > 9? (eDate.getDate()):"0"+(eDate.getDate()))+" 23:59";
		alert("달력 그리기 전 start" + start);
		printCalendar(nDate);
		reservedListDraw(ssDate,eeDate);
	}

	function beforeMonth() {
		/* var nDate = null; */
		//다음 버튼을 눌렀을 때
		// 시작일이 말일보다 클 경우 처리 
		alert("계산하기 전 start"+start);
			start = start - 14;
		alert("돌아오는 start"+start);
		if (start > 0) {
			alert("if start" + start);
		var	nDate = new Date(y, m, start);
		} else if (start <= 0) {
			//10이 넘어옴
			alert("왼쪽이동m "+m);
			
			if((m-1)<0){
				m=last.length;
				start = last[m-1]+start;
				y--;
			}else{
				start = last[m-1]+start;
			}
			
			alert("왼쪽이동"+start);
			
			
			//m이 0인 경우는 1월달
			//m이 0일 때 -1을 해주면 
			//Date객체에서 자동으로 작년으로 넘어가고, 달을 12월로 바꿔줌
		var	nDate = new Date(y, m-1, start);
			/* alert("말일보다 작을경우 calDate"+nDate); */
			/* calDate = calDate; */
		}
		var sDate = new Date(nDate.getFullYear(), nDate.getMonth(), start);
		var eDate = new Date(nDate.getFullYear(), nDate.getMonth(), start+6); 
		
		var ssDate = sDate.getFullYear()+"-"+((sDate.getMonth()+1) > 9? (sDate.getMonth()+1):"0"+(sDate.getMonth()+1))+"-"+((sDate.getDate()) > 9? (sDate.getDate()):"0"+(sDate.getDate()))+" 00:00";
		var eeDate = eDate.getFullYear()+"-"+((eDate.getMonth()+1) > 9? (eDate.getMonth()+1):"0"+(eDate.getMonth()+1))+"-"+((eDate.getDate()) > 9? (eDate.getDate()):"0"+(eDate.getDate()))+" 23:59";
		
		alert("달력 그리기 전 start" + start);
		
		printCalendar(nDate);
		reservedListDraw(ssDate,eeDate);
	}

	
	
	window.onload = function() {
		var calen = document.getElementById("calen");
		dateToday = new Date(theDate);
		
		var dstartDate = dateToday.getDate()-dateToday.getDay();
		
		var sDate = new Date(dateToday.getFullYear(), dateToday.getMonth(), dstartDate);
		var eDate = new Date(dateToday.getFullYear(), dateToday.getMonth(), dstartDate+6); 
		
		var ssDate = sDate.getFullYear()+"-"+((sDate.getMonth()+1) > 9? (sDate.getMonth()+1):"0"+(sDate.getMonth()+1))+"-"+((sDate.getDate()) > 9? (sDate.getDate()):"0"+(sDate.getDate()))+" 00:00";
		var eeDate = eDate.getFullYear()+"-"+((eDate.getMonth()+1) > 9? (eDate.getMonth()+1):"0"+(eDate.getMonth()+1))+"-"+((eDate.getDate()) > 9? (eDate.getDate()):"0"+(eDate.getDate()))+" 23:59";
		alert("달력달력달력달력달겨"+sDate);
		//달력 그려서 div에 넣어주기 
		calen = printCalendar(dateToday);
		reservedListDraw(ssDate, eeDate);
	}
	function reservedListDraw(sDate, eDate){
		
		var sendData = {res_start:sDate, res_end:eDate};//키 : 값	
	
		//예약된 리스트들 가져오기
		$.ajax({
			type:"get",
			url:"${pageContext.request.contextPath}/reservation/resAll",
			data:sendData,
			dataType:"json",
			headers:{"Content-Type":"application/json"},
			success:function(result){
				console.log(result);
				
				//ajax로 선택된 예약정보를 받아옴
				$(result).each(function(i, obj){
					
					//miliseconds를 알면 
					//Date 객체를 생성해서 넣어주면 
					//그에 해당하는 시간과 날짜 정보를 알 수 있음
					
					//예약종료시간
					var resEndDate = new Date(obj.res_end);
					alert("resEndDate : "+resEndDate);
					//예약시작시간
					var resStartDate = new Date(obj.res_start);
					alert("resStartDate : "+resStartDate);
					//헤어시간 만들기
					var hairHours = (resEndDate-resStartDate)/(60*1000); //분이나옴 
					alert("헤어시간 계산하기 "+hairHours);
					
					
					
					//시작일에서 날짜와 시간 받아오기 
					
					var resMonth = resStartDate.getMonth()+1;
					var resDate = resStartDate.getDate();
					var resHour = resStartDate.getHours();
					var resMin = resStartDate.getMinutes();
					
					//정각이면 시간과 분이 11:0으로 나오기 때문에 0을 붙여줌
					if(resMin==0){
						resMin = resMin+"0";
					}
					
					//시간 만들기 11:00
					var resTime = resHour+":"+resMin;
					alert("시작시간 :  "+resTime);
					
					//월 만들기 6월1일
					var resFullDate = resMonth+"월"+resDate+"일";
					
					//예약된 날짜의 th로 그 th가 해당하는 index를 찾아올 수 있음 contains
					var index = $("table tr:first th").index($("th:contains('"+resFullDate+"')"));
					
					//시간이 속해 있는 th의 부모인 tr을 찾은 후
					//그 자식인 td를 찾아 css처리
					//$("th:contains('"+resTime+"')").parent().find("td").eq(index-1).css("background","red"); 
					if(hairHours/30==1){
						$("th:contains('"+resTime+"')").parent().find("td").eq(index-1).css("background","#FF7F50");
					}
					if(hairHours/30==2){
						$("th:contains('"+resTime+"')").parent().find("td").eq(index-1).css("background","#A23BEC");
						$("th:contains('"+resTime+"')").parent().next().find("td").eq(index-1).css("background","#A23BEC");
					}
					
					if(hairHours/30==4){
						$("th:contains('"+resTime+"')").parent().find("td").eq(index-1).css("background","#FFD801");
						$("th:contains('"+resTime+"')").parent().next().find("td").eq(index-1).css("background","#FFD801");
						$("th:contains('"+resTime+"')").parent().next().next().find("td").eq(index-1).css("background","#FFD801");
						$("th:contains('"+resTime+"')").parent().next().next().next().find("td").eq(index-1).css("background","#FFD801");
					}
					if(hairHours/30==6){
						$("th:contains('"+resTime+"')").parent().find("td").eq(index-1).css("background","#1589FF");
						$("th:contains('"+resTime+"')").parent().next().find("td").eq(index-1).css("background","#1589FF");
						$("th:contains('"+resTime+"')").parent().next().next().find("td").eq(index-1).css("background","#1589FF");
						$("th:contains('"+resTime+"')").parent().next().next().next().find("td").eq(index-1).css("background","#1589FF");
						$("th:contains('"+resTime+"')").parent().next().next().next().next().find("td").eq(index-1).css("background","#1589FF");
						$("th:contains('"+resTime+"')").parent().next().next().next().next().next().find("td").eq(index-1).css("background","#1589FF");
					}
					
				})
			}
		})
		
	}
	
</script>

<body>
	<div id="regContainer">
		<div id="notice">
			<h4>주의사항</h4>
			<p>예약은 한 달 간격으로 할 수 있습니다.</p>
			<p>매달 21일이 되면 다음 달 예약을 할 수 있습니다.</p>
			<p>예약시간 변경은 마이페이지에서 예약 취소 후 다시 예약해주세요.</p>
			<p>문의 사항은 고객센터나 게시판을 이용해주세요.</p>
		</div>
		<div class="container">
			<h2>Reservation</h2>
			<form class="form-horizontal" action="/action_page.php">
			
				<div class="form-group">
					<label class="control-label col-sm-2" for="email">헤어스타일</label>
					<div class="col-sm-10">
					
					<!-- 헤어스타일 종류 넣기 -->
					
						<select class="form-control" id="sWidth">
							<c:forEach var="list" items="${hairList }">
							<option value="${list.hair_time }" data-hairno="${list.hair_no }">${list.hair_type}</option>
							</c:forEach>
						</select>
					
					</div>
				</div>
			</form>
		</div>
		<div id="wrap">
			<div id="draw"></div>
		</div>
		
		<script type="text/javascript">
					
					//예약을 하려고 table을 눌렀을 때 
					$(document).on("click", "td", function(){
						
						//예약이 된 시간에는 예약 못하도록
						var colorBg = $(this).css("background");
						
						//alert("colorBg"+colorBg);
						
						//"rgb(0, 128, 0) none repeat scroll 0% 0% / auto padding-box border-box"
						//colorBg.startsWith("rgb(0, 128, 0)")
						//이 값이 있냐 없냐를 true or false로 반환함
						if(!colorBg.startsWith("rgb(76, 196, 23)")){
							
							alert("이미 예약되었습니다.");
							return false;
						} 
						$(this).each(function(i, obj){
						
							var hairTime = Number($("#sWidth option:selected").val());
							var hairType = $("#sWidth option:selected").html();
							var hairNo = $("#sWidth option:selected").attr("data-hairno");
							alert("hariNo : "+hairNo);
							alert("hairTime : "+hairTime);
							//td index찾기
							var tdIndex = $(obj).index();
							
							//td 시간찾기
							var tdTime = $(obj).parent().find("th").html();
							
							//th td에 해당하는 th 속성찾기
							var thObj =  $(obj).parents("table").find("th").eq(tdIndex).attr("data-thisyear");
							
							//선택된 td의 예약날짜와 시간
							var startDate = thObj+" "+tdTime;
							alert("startDate : "+startDate);
							
							const selectedDate = new Date(startDate);
							const modifiedDate = new Date(selectedDate.valueOf());
							
							
							modifiedDate.setMinutes(modifiedDate.getMinutes()+hairTime);
							
							var modYear = modifiedDate.getFullYear();
							var modMonth = modifiedDate.getMonth()+1;
							var modDate = modifiedDate.getDate();
							var modHours = modifiedDate.getHours();
							var modMins = modifiedDate.getMinutes();
							alert("hours : "+modHours+"minutes : "+modMins);
							
							//정각이면 시간과 분이 11:0으로 나오기 때문에 0을 붙여줌
							if(modMins==0){
								modMins = modMins+"0";
							}
							
							
							//종료시간
							var endDate = modYear+"-"+(modMonth>9? modMonth:"0"+modMonth)+"-"+(modDate>9? modDate:"0"+modDate)+" "+modHours+":"+modMins;
							
							alert(endDate);
							
							var reservedInfo = confirm("예약날짜 : "+startDate+"\n예상 종료시간 : "+endDate+"\n헤어종류 : "+hairType+"\n해당 날짜에 예약 하시겠습니까?");
							
							var formObj = $('<form id="f1" method="post">');
							var SDate = $("<input type='hidden' name='res_sDate' value='"+startDate+"'>");
							var eDate = $("<input type='hidden' name='res_eDate' value='"+endDate+"'>");
							var hairno = $("<input type='hidden' name='hair_no' value='"+hairNo+"'>");
							var uId = $("<input type='hidden' name='user_id' value='${login.u_id }'>");
				
							alert("헤어번호"+hairno.val());
							alert("헤어번호"+uId.val());
							formObj.append(SDate).append(eDate).append(hairno).append(uId);
							$("#sendData").append(formObj);
							
							if(reservedInfo==true){
								
								$("#f1").attr("action", "reservation");
								$("#f1").submit();
								
							}						
						})
					})
					
					
					</script>
		<!-- <form id="f1" method="post" action="reservation"></form> -->
		<div id="sendData"></div>
	</div>
</body>
</html>
<%@ include file="../common/footer.jsp"%>