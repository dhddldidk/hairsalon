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

table {
	position: relative;
	/* text-align: center !important; */
}

tr, td, th {
	padding: 20px !important;
	text-align: center !important;
	width: 120px !important;
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
		/* calendar += "<tr>";
		calendar += "<th></th>";
		calendar += "<th id='sunday'>일</th>";
		calendar += "<th>월</th>";
		calendar += "<th>화</th>";
		calendar += "<th>수</th>";
		calendar += "<th>목</th>";
		calendar += "<th>금</th>";
		calendar += "<th id='saturday'>토</th>";
		calendar += "</tr>";  */

		//오늘날짜
		var dNum = d;

		calendar += "<tr class='active'>";
		calendar += "<th></th>";
		//일요일부터 시작하는 날짜
		start = dNum - date.getDay();
		alert("넘어온 30일이 " + start);

		//다음달의 말일이 몇일
		var currMonth = m + 1;
		for (var k = 1; k <= 7; k++) {

			//정상적으로 시작일이 그 달의 말일보다 작을 때부터 같을 때 까지  1.번
			if (start <= last[m]) {
				if (k == 1) {
					calendar += "<th class='imgObj'><img src='/hairsalon/resources/images/left_arrow.png' onclick='beforeMonth()' id='leftArrow'>"
							+ currMonth + "월" + start + "일" + "</th>";

				} else if (k == 7) {
					calendar += "<th class='imgObj'>"
							+ currMonth
							+ "월"
							+ start
							+ "일"
							+ "<img src='/hairsalon/resources/images/right_arrow.png' onclick='nextMonth()'></th>";

				} else {
					calendar += "<th class='imgObj'>" + currMonth + "월" + start
							+ "일" + "</th>";

				}
				start++

				//7일씩 찍는 동안 달이 바뀔경우 일자를 1일로 변경시키고
				//달+1해서 찍어줌					
			} else if (start > last[m]) {
				alert("??????????????????????????"+m);
				start = 1;

				currMonth++;
				if (currMonth > last.length) {
					y++;
					m = 0;
					currMonth = m + 1;
				} else {
					m = m + 1;
				}  
				if (k == 1) {
					calendar += "<th class='imgObj'><img src='/hairsalon/resources/images/left_arrow.png' onclick='beforeMonth()'>"
							+ currMonth + "월" + start + "일" + "</th>";

				} else if (k == 7) {
					calendar += "<th class='imgObj'>"
							+ currMonth
							+ "월"
							+ start
							+ "일"
							+ "<img src='/hairsalon/resources/images/right_arrow.png' onclick='nextMonth()'></th>";

				} else {
					calendar += "<th class='imgObj'>" + currMonth + "월" + start
							+ "일" + "</th>";
				}
				start++;
			}
		}
		calendar += "</tr>";
		
		
		
		
		/*30분 단위 시간계산 */
		const currDate = new Date("11/20/2017 10:00 AM");
		const modiDate = new Date(currDate.valueOf());
		
		//달력밑에 시간 추가
		for(var i = 0; i<21; i++){
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
			
			for(var k =0; k <1; k++){
				
				calendar +="<th class='active'>"+hour+":"+min+"</th>";
				calendar +="<td></td>";
				calendar +="<td></td>";
				calendar +="<td></td>";
				calendar +="<td></td>";
				calendar +="<td></td>";
				calendar +="<td></td>";
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
		alert("달력 그리기 전 start" + start);
		printCalendar(nDate);
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
			start = last[m-1]+start;
			alert("왼쪽이동"+start);
			
			
			//m이 0인 경우는 1월달
			//m이 0일 때 -1을 해주면 
			//Date객체에서 자동으로 작년으로 넘어가고, 달을 12월로 바꿔줌
		var	nDate = new Date(y, m-1, start);
			/* alert("말일보다 작을경우 calDate"+nDate); */
			/* calDate = calDate; */
		}
		alert("달력 그리기 전 start" + start);
		printCalendar(nDate);
	}

	window.onload = function() {
		var calen = document.getElementById("calen");
		dateToday = new Date(theDate);
		calen = printCalendar(dateToday);
	}
</script>
<script type="text/javascript">
	
</script>
<body>



	<!-- <div id="wrap">
		<div>
			<img src="/hairsalon/resources/images/left_arrow.png" onclick="beforeMonth()"> <span></span>
			<img src="/hairsalon/resources/images/right_arrow.png" onclick="nextMonth()">
		</div>
		<div id="calen"></div>
	</div> -->

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
		<div id="wrap">

			<div id="draw"></div>
		</div>
		<script type="text/javascript">
			$(function() {
				var leftObj = $("<img src=>");
				leftObj.css("src",
						"/hairsalon/resources/images/right_arrow.png");
				/* leftObj.attr("/hairsalon/resources/images/right_arrow.png");  */
				/* leftImg. */

				$("tr:first-child").find("th:nth-child(2) img").attr("src",
						"/hairsalon/resources/images/right_arrow.png");
			})
		</script>
		<!-- 	<table class="table table-bordered">
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
		</table> -->
	</div>
</body>
</html>
<%@ include file="../common/footer.jsp"%>