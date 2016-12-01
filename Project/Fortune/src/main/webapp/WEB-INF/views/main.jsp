<!-- 
작성자  : 이예지 
최초작업일 : 2016/11/29
최종수정일 : 2016/11/29
작업내용 : 메인화면의 진척률을 나타내는 차트 3개와 알림 내역을 띄운다
 -->
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="scurity" uri="http://www.springframework.org/security/tags" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<%
   request.setCharacterEncoding("UTF-8");
   ArrayList chart_x = (ArrayList)request.getAttribute("chart_x");
   ArrayList chart_y = (ArrayList)request.getAttribute("chart_y");
   
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


</head>
	<style>
.col{
	margin-bottom: 30px;
	}
.col>div {
	background-color: #fff;
	height: 100%;
	padding: 10px;
	border-radius: 6px;
	height: 260px;
	box-shadow: 7px 7px 10px 0px #AAA; 
			}
	​
    </style>


<script>

//모든 프로젝트의 진척률을 나타내는 차트

$(function () {

    $.ajax({
		  
		  type:"post",
		  dataType: "html",
		  url:"selectChart.htm",
		  data:{"project_num": <%=chart_x.get(0)%>},
		  success:function(data){
		  

			  $('#kk').html(data);
			 
		
		  }
	  });	
	
	console.log(<%=chart_x%>);
	console.log(<%=chart_y%>);
  var chart=Highcharts.chart('gg',{
           chart: {
               type: 'column'
           },
           title: {
               text: '전체 프로젝트의 각 진척률%'
           },
           xAxis: {
               categories:<%=chart_x%>,
               labels: {
            	
                   style: {
                       color: 'blue'
                   }
               }
           },
           yAxis: {
               title: {
                   text: '프로젝트 총 진척률%'
               }

           },
           legend: {
               enabled: false
           },
           plotOptions: {
               series: {
                   borderWidth: 1,
                   dataLabels: {
                       enabled: true,
                       format: '{point.y:.2f}%'
                   }
               }
           },
           credits:{ enabled:false },
           tooltip: {
               headerFormat: '<span style="font-size:11px">프로젝트{point.x}</span><br>',
               pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
           },
    
               series: [{
                   data: <%=chart_y%>
               
               }]
            
        
       });


	

//모든 프로젝트의 x축 클릭시 상세 차트를 비동기로 불러오는 함수
	$('.highcharts-xaxis-labels text').on('click', function () {
		
	    console.log($(this).text());
		    $.ajax({
			  
			  type:"post",
			  dataType: "html",
			  url:"selectChart.htm",
			  data:{"project_num": $(this).text()},
			  success:function(data){
			  
				  
				  console.log("차트 종류 보내기");
				  
				  $('#kk').empty();
				  $('#kk').html(data);
				 
			
			  }
		  });	
	});

//도넛형 차트
	   Highcharts.chart('ll', {
           chart: {
               plotBackgroundColor: null,
               plotBorderWidth: null,
               plotShadow: false,
               type: 'pie'
           },
           title: {
               text: '사업규모'
           },
           tooltip: {
               pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
           },
           plotOptions: {
               pie: {
                   allowPointSelect: true,
                   cursor: 'pointer',
                   dataLabels: {
                       enabled: false
                   },
                   showInLegend: true
               }
           },
           series: [{
               name: 'Brands',
               colorByPoint: true,
               data: [{
                   name: 'Microsoft Internet Explorer',
                   y: 56.33
               }, {
                   name: 'Chrome',
                   y: 24.03,
                   sliced: true,
                   selected: true
               }, {
                   name: 'Firefox',
                   y: 10.38
               }, {
                   name: 'Safari',
                   y: 4.77
               }, {
                   name: 'Opera',
                   y: 0.91
               }, {
                   name: 'Proprietary or Undetectable',
                   y: 0.2
               }]
           }]
       });
   });


</script>
<body>
	<div class="container">
			
			<div class="row grid-columns" style="width:1000px; margin-top:20px">
				<div id="gg" style="height:280px" class="col-md-8 col">
					<div>
						<b>1</b>
						전체 프로젝트 진행률
					</div>
				</div>

				<div id="ll" style="height:280px" class="col-md-4 col">
					<div>
						<b>4</b>
						알림화면
						
					</div>
				</div>
				
			</div>

            <div class="row grid-columns"style="width:1000px">
				<div id="kk" style="height:280px" class="col-md-8 col">
					<div>
						<b>2</b>
						위의 각 프로젝트 x축 클릭시 상세 차트( 비동기 )화면
					</div>
				</div>
				<div style="height:280px" class="col-md-4 col">
					<div>
						<b>3</b>
                      	 알림리스트
					</div>
			 </div>


		</div>
		</div>
	
</body>
	
</html>