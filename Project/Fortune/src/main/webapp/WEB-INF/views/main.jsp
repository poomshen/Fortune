<!-- 
작성자  : 이예지 
최초작업일 : 2016/11/29
최종수정일 : 2016/11/29
작업내용 : 메인화면의 진척률을 나타내는 차트 3개와 알림 내역을 띄운다
 -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="scurity" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


</head>
	<style>
			.col {
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
	
	 var chart = Highcharts.chart('gg',{
	        chart: {
	            type: 'column'
	        },
	        
	        
	        title: {
	            text: 'Browser market shares. January, 2015 to May, 2015'
	        },
	        subtitle: {
	            text: 'Click the columns to view versions. Source: <a href="http://netmarketshare.com">netmarketshare.com</a>.'
	        },
	        xAxis: {
	            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
	            labels: {
	                style: {
	                    color: 'blue'
	                }
	            }
	        },
	        yAxis: {
	            title: {
	                text: 'Total percent market share'
	            }

	        },
	        legend: {
	            enabled: false
	        },
	        plotOptions: {
	            series: {
	                borderWidth: 0,
	                dataLabels: {
	                    enabled: true,
	                    format: '{point.y:.1f}%'
	                }
	            }
	        },

	        tooltip: {
	            headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
	            pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
	        },
	        exporting: {
	            buttons: {
	              custom: {
	                     x: -20,
	                    text:'전체보기',
	                    symbolFill: '#B5C9DF',
	                    hoverSymbolFill: '#779ABF',
	                    _titleKey: 'printButtonTitle',
	                    onclick: function () {
	                    	 chart.redraw();
	                    }
	                }
	            }
	        },
	            series: [{
	                data: [29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]
	            }]
	         
	     
	    });

//모든 프로젝트의 x축 클릭시 상세 차트를 비동기로 불러오는 함수
	$('.highcharts-xaxis-labels text').on('click', function () {
		
	    console.log($(this).text());
	    alert($(this).text());
	    $.ajax({
			  
			  type:"post",
			  dataType: "html",
			  url:"selectChart.htm",
			  data:{"chart_type": $(this).text()},
			  success:function(data){
			  
				  
				  console.log("차트 종류 보내기");
				  
				  $('#gg').empty();
				  $('#gg').html(data);
				 
			
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
               text: 'Browser market shares January, 2015 to May, 2015'
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
				<div id="gg" class="col-md-8 col">
					<div>
						<b>1</b>
						전체 프로젝트 진행률
					</div>
				</div>

				<div id="ll" class="col-md-4 col">
					<div>
						<b>4</b>
						알림화면
						
					</div>
				</div>
				
			</div>

            <div class="row grid-columns"style="width:1000px">
				<div id="kk" class="col-md-8 col">
					<div>
						<b>2</b>
						위의 각 프로젝트 x축 클릭시 상세 차트( 비동기 )화면
					</div>
				</div>
				<div class="col-md-4 col">
					<div>
						<b>3</b>
                      	 알림리스트
					</div>
			 </div>


		</div>
		</div>
	
</body>
	
</html>