<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
   request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
table, th, td {
    border: 1px solid black;
}
</style>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>

<h3>주소록</h3>

<form action="" >
	<select id="deptSelect" name="deptSelect" onchange="deptchange()">
		<c:forEach var="i" items="${dept}">
			<c:choose>
				<c:when test="${i.dept_no == sessionScope.info.dept_no}">
					<option value="${i.dept_no}" selected>${i.dept_name}</option>
				</c:when>
				<c:otherwise>
					<option value="${i.dept_no}">${i.dept_name}</option>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</select>
	
	<select id="teamSelect" name="teamSelect">
		<c:forEach var="j" items="${team}">				
			<c:if test="${sessionScope.info.dept_no == j.dept_no}">
				<c:choose>
					<c:when test="${sessionScope.info.team_no == j.team_no}">
						<option value="${j.team_no}" selected>${j.team_name}</option>
					</c:when>
					<c:otherwise>
						<option value="${j.team_no}">${j.team_name}</option>
					</c:otherwise>
				</c:choose>				
			</c:if>	
		</c:forEach>		
	</select>
	
	<input type="button" class="btn btn-primary" onclick="deptshow()" value="검색">
</form>

<!-- 표 부분 -->
<div id="deptshowDiv">
</div>

<script type="text/javascript">
(function() {
	alert('잠시만 기다려주세요...');

	$.ajax({
		type:"get",
		url:"deptsearch2.ajax",
		data:{"dept_no": ${sessionScope.info.dept_no}, 
			  "team_no": ${sessionScope.info.team_no} },
		success:function(data){
			//console.log(data);
			$("#deptshowDiv").append($('#deptshowDiv').html(data)); 		
		},
		error:function(){
			alert('처음 띄우는데에서 에러남!');
		}
	});	
})();

function deptshow(){
	alert('잠시만 기다려주세요...');

	$.ajax({
		type:"get",
		url:"deptsearch.ajax",
		data:{"dept_no": $('#deptSelect').val(), 
			  "team_no": $('#teamSelect').val()},
		success:function(data){
			//console.log(data);
			$("#deptshowDiv").append($('#deptshowDiv').html(data)); 
			if(data != null){
				alert('검색 완료');
			
			}else{
				alert('회원 목록을 가져오는데 실패했습니다');
			}
		},
		error:function(){
			alert('검색 에러! 관리자에게 문의하세요');
		}
		
	}); 
}
function deptchange() {
	
	var deptval = $('#deptSelect').val();
		
	$.ajax({
		type:"get",
		url:"getteam.ajax",
		data:{"dept_no":$('#deptSelect').val()},
		success:function(data){
			//console.log(data[0].team_name);
			alert('팀목록 바뀜요');
			$("#teamSelect").html("");
			for(var i=0; i<data.length; i++){
				if(i==0){
					$('#teamSelect').append("<option value='"+data[i].team_no+"' selected>"+data[i].team_name+"</option>");
				}else{
					$('#teamSelect').append("<option value='"+data[i].team_no+"'>"+data[i].team_name+"</option>");
				}
				
			}
			
		},
		error:function(){
			alert('팀목록 가져오는데서 에러남!');
		}
	});
	
	
}

</script>
</body>
</html>