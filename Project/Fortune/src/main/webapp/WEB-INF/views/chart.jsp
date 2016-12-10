<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%
   request.setCharacterEncoding("UTF-8");
   ArrayList each_chart_x =(ArrayList)request.getAttribute("eachChart_x");
   ArrayList each_chart_y = (ArrayList)request.getAttribute("eachChart_y");
   int project_num =(Integer)request.getAttribute("project_num");
   String project_name =(String)request.getAttribute("project_name");
   System.out.println(each_chart_x.get(0));
   
%>
<script>
$(function () {
	
	console.log(<%=(String)each_chart_x.get(0)%>);

    Highcharts.chart('kk', {
        title: {
            text: '각 프로젝트 날짜별 진척률',
            x: -20 //center
        },
     
        xAxis: {       	
         
          categories:<%=each_chart_x%>,
          labels: {
          	  title:'날짜',
              style: {
                  color: 'blue'
              }
          }
     
        },
        yAxis: {
            title: {
                text: '진척률%'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        credits:{ enabled:false },
        tooltip: {
        	
            valueSuffix: '%'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
            name:'<%=project_name%>',
            data:<%=each_chart_y%>
          
        }]
    });
});

</script>