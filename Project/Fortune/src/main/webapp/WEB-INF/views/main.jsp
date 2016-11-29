<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="scurity" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>

</head>
  <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
 -->		<style>
			.col {
				margin-bottom: 30px;
			}
			.col>div {
				background-color: #eee;
				height: 100%;
				padding: 10px;
				border-radius: 6px;
				border: 1px solid #aaa;
				height: 260px;
			}
		</style>
		
<script>
$(function () {
    Highcharts.chart('container', {
        title: {
            text: 'Monthly Average Temperature',
            x: -20 //center
        },
        subtitle: {
            text: 'Source: WorldClimate.com',
            x: -20
        },
        xAxis: {
            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
        },
        yAxis: {
            title: {
                text: 'Temperature (°C)'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: '°C'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
            name: 'Tokyo',
            data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
        }, {
            name: 'New York',
            data: [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
        }, {
            name: 'Berlin',
            data: [-0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
        }, {
            name: 'London',
            data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
        }]
    });
});

</script>
<body>
	<div class="container">
			
			<h1>dashboard</h1>
			
			
			<div class="row grid-columns" style="width:1000px">
				<div class="col-md-8 col">
					<div>
						<b>1</b>
						전체 프로젝트 진행률
					</div>
				</div>

				<div class="col-md-4 col">
					<div>
						<b>4</b>
						알림화면
						
					</div>
				</div>
				
			</div>

            <div class="row grid-columns"style="width:1000px">
				<div class="col-md-8 col">
					<div>
						<b>2</b>
						차트1의 각 프로젝트 상세 차트 비동기 화면
					</div>
				</div>
				<div class="col-md-4 col">
					<div>
						<b>3</b>
                      	 도넛형 차트
					</div>
			 </div>


		</div>
		</div>
	
</body>
	
</html>