<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
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
/* table{
		width:1400px;
		
	}
	table,tr,td,th{
		border:1px solid orange;
		border-collapse: collapse;
	} */
tr, td, th {
	padding: 20px !important;
}

th {
	text-align: center;
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
	var dateToday = new Date();
	var theDate = new Date();
	var start = null;
	function printCalendar(date) {
		//date = new Date)(2016,4,1);
		var y = date.getFullYear();
		var m = date.getMonth();
		var d = date.getDate();

		theDate = new Date(y, m, 1);
		var theDay = theDate.getDay();

		/* alert("theDay"+date.getDay()); */
		var last = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];

		if (y % 4 == 0 && y % 100 !== 0 || y % 400 == 0)
			last[4] = 29;

		var row = Math.ceil(theDay + last[m]) / 7;
		var span =document.getElementsByTagName("span");
		span[0].innerHTML = y + "." + (m + 1);

		var calendar = "<table>";
		calendar += "<tr>";
		calendar += "<th id='sunday'>일</th>";
		calendar += "<th>월</th>";
		calendar += "<th>화</th>";
		calendar += "<th>수</th>";
		calendar += "<th>목</th>";
		calendar += "<th>금</th>";
		calendar += "<th id='saturday'>토</th>";
		calendar += "</tr>";
		
		//오늘날짜
		var dNum = d;
	
			calendar += "<tr>";
			
			//일요일부터 시작하는 날짜
			start = dNum-date.getDay();
			var nextDay = 1;
			
			//다음달의 말일이 몇일
			var nextMonth = m+1
			for (var k = 1; k <= 7; k++) {
				
				if(start <= last[m]){
					calendar += "<td>" + start + "</td>";
					start++;
					
				}else if(nextDay <= last[nextMonth]){
					calendar += "<td>" + nextDay + "</td>";
					nextDay++;
				}
				
				/* if (i == 0 && k <= theDay || dNum > last[m]) {
					calendar += "<td></td>";
				} else {
					
				} */
			}
			calendar += "</tr>";
		
		calendar += "</table>";
		
		var calen = document.getElementById("calen");
		calen.innerHTML = calendar;
	}
	function nextMonth(){
		/* dateToday = new Date(dateToday.getFullYear(),dateToday.getMonth()+1, 
				dateToday.getDate());
		alert(dateToday);
		printCalendar(dateToday); */
		var calDate = start+7;
		
		
		alert(nextDay);
		printCalendar(nextDay);
	}
		
	
	function beforeMonth(){
		
		/* dateToday = new Date(dateToday.getFullYear(),dateToday.getMonth()-1, 
				dateToday.getDate()); */
				var nextDay = start+7;
				alert(nextDay);
		printCalendar(start);
	}
	
	window.onload = function() {
		var calen = document.getElementById("calen");
		dateToday = new Date(theDate);
		calen=printCalendar(dateToday);
	}
</script>
<body>



<div id="wrap">
		<div>
			<img src="/hairsalon/resources/images/left_arrow.png" onclick="beforeMonth()"> <span></span>
			<img src="/hairsalon/resources/images/right_arrow.png" onclick="nextMonth()">
		</div>
		<div id="calen"></div>
	</div>

	<div id="regContainer">
		<div id="notice">
			<h4>주의사항</h4>
			<p>예약은 한 달 간격으로 할 수 있습니다.</p>
			<p>매달 21일이 되면 다음 달 예약을 할 수 있습니다.</p>
			<p>예약시간 변경은 마이페이지에서 예약 취소 후 다시 예약해주세요.</p>
			<p>문의 사항은 고객센터나 게시판을 이용해주세요.</p>
		</div>
		<div class="container">
			<h2>Horizontal form</h2>
			<form class="form-horizontal" action="/action_page.php">
				<div class="form-group">
					<label class="control-label col-sm-2" for="email">헤어스타일</label>
					<div class="col-sm-10">
						<select>
							<option>일반 컷</option>
							<option>단발펌</option>
							<option>롱웨이브펌</option>
							<option>볼륨매직</option>
							<option>염색</option>
							<option>염색+펌</option>
						</select>
					</div>
				</div>


			</form>
		</div>
		<table class="table table-bordered">
			<tr>
				<th></th>
				<th><img src="/hairsalon/resources/images/left_arrow.png" onclick="beforeMonth()">5/1</th>
				<th>5/2</th>
				<th>5/3</th>
				<th>5/4</th>
				<th>5/5</th>
				<th>5/6</th>
				<th>5/7<a><img src="/hairsalon/resources/images/right_arrow.png" onclick="nextMonth()"></a></th>
			</tr>

			<tr>
				<th>09:00</th>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<th>09:30</th>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<th>10:00</th>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<th>10:30</th>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<th>11:00</th>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<th>11:30</th>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<th>12:00</th>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<th>12:30</th>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
	</div>
</body>
</html>
<%@ include file="../common/footer.jsp"%>