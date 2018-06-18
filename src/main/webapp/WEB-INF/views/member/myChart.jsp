<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<style type="text/css">
	#chartContainer{
		width:1400px;
		margin:0 auto;
	}
</style>
</head>
<body>
	
	<script>
	
	
	
	google.charts.load('current', {'packages':['line']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {

      var data = new google.visualization.DataTable();
      data.addColumn('number', '시간대별 월 매출현황');
      data.addColumn('number', '오전 10:00~13:00(3시간)');
      data.addColumn('number', '오후 13:00~17:00(4시간)');
      data.addColumn('number', '저녁 17:00~20:00(3시간)');

   
      
    	  data.addRows([
    		 /* chart */
    		  /* [1, ${chartVO.get(0).morning }, ${chartVO.get(0).afternoon }, ${chartVO.get(0).evening }],
    		  [2, ${chartVO.get(1).morning }, ${chartVO.get(1).afternoon }, ${chartVO.get(1).evening }],
    		  [3, ${chartVO.get(2).morning }, ${chartVO.get(2).afternoon }, ${chartVO.get(2).evening }],
    		  [4, ${chartVO.get(3).morning }, ${chartVO.get(3).afternoon }, ${chartVO.get(3).evening }],
    		  [5, ${chartVO.get(4).morning }, ${chartVO.get(4).afternoon }, ${chartVO.get(4).evening }],
    		  [6,,,]  */
    		  
    		 <c:forEach var = "list" items="${chartVO}" varStatus="status">
    		 <c:if test="${chartVO.get(status.index).month==null}">
    		 [${status.index+1 },0,0,0]
    		 <c:if test="${chartVO.size()!=status.index+1}">,</c:if>
    		 </c:if>
    		 <c:if test="${chartVO.get(status.index).month!=null}">
        		[${status.index+1 }, ${chartVO.get(status.index).morning }, ${chartVO.get(status.index).afternoon }, ${chartVO.get(status.index).evening }]
        		<c:if test="${chartVO.size()!=status.index+1}">,</c:if>
        	</c:if>
        	</c:forEach>
    		  ]);
    	 

      var options = {
        chart: {
          title: '시간대별 월 매출현황',
          subtitle: '오전, 오후, 저녁으로 구성되어 있습니다.'
        },
        width: 1400,
        height: 700
      };

      var chart = new google.charts.Line(document.getElementById('linechart_material'));

      chart.draw(data, google.charts.Line.convertOptions(options));
    }
    </script>
    <div id="chartContainer">
    <div id="linechart_material"></div>
    </div>
   
</body>
</html>
<%@ include file="../common/footer.jsp"%>