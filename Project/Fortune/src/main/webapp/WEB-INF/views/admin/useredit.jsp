<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
   request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>관리자 회원 수정</title>
<style>
table, th, td {
    border: 1px solid black;
    text-align: center;
}
input.buttonLink {
	background-color: transparent;
	text-decoration: underline;
	border: none;
	cursor: pointer;
}
</style>
</head>
<body style="color:#777">
	<h3 style="margin-bottom: 40px; margin-top: 30px;">사원정보 수정</h3>
	<hr>
	<div class="col-sm-7" style="padding-left: 0px;">
		<form action="">
			<select id="deptSelect1" name="deptSelect1">
				<option value="-1" selected>부서 선택</option>
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
			
			<%-- <select id="teamSelect" name="teamSelect">
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
			</select>  --%>
			<input type="button" class="btn btn-primary" onclick="deptshowadmin()" value="검색">
		</form>
		<form action="">
		<div id="deptshowDiv">
				<table class="table table-striped table-bordered table-hover">
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>부서명</th>
					</tr>
					<c:forEach var="i" items="${deptlist}">
						<c:if test="${not (i.user_id eq 'admin@fortune.com')}">
							<tr>
								<td><input type="button" value="${i.user_id}"
									class="buttonLink" onclick="ShowUserInfo('${i.user_id}')"></td>
								<td><c:out value="${i.user_name}"></c:out></td>
								<td><c:out value="${i.user_phone}"></c:out></td>
								<c:forEach var="j" items="${dept}">
									<c:if test="${i.dept_no == j.dept_no}">
										<td><c:out value="${j.dept_name}"></c:out></td>
									</c:if>
								</c:forEach>
							</tr>
						</c:if>
					</c:forEach>
				</table>
			</div>
		</form>
	</div>
	
	<div class="col-sm-5" style="padding-right: 0px;">
		<div class="row" style="padding-right: 0px;">
		<label style="height: 32px; margin-top: 10px;"> &nbsp;&nbsp;&nbsp; 사원 상세 정보</label>
			<form action="userupdateadmin.htm" method="post">
				<div id="usershowDiv"></div>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
function deptchange() {
	var deptval = $('#deptSelect').val();
	
	$.ajax({
		type:"get",
		url:"getteam.ajax",
		data:{"dept_no":$('#deptSelect').val()},
		success:function(data){
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

function deptshowadmin(){
	$.ajax({
		type:"get",
		url:"deptsearchadmin.ajax",
		data:{"dept_no": $('#deptSelect1').val()},
		success:function(data){
			$("#deptshowDiv").append($('#deptshowDiv').html(data));
		},
		error:function(){
			alert('회원 목록을 가져오는데 실패했습니다');
		}
		
	}); 
}

function ShowUserInfo(userid){
	$.ajax({
		type: "get",
		url : "userinfoadmin.ajax",
		data: {"user_id": userid},
		success:function(data){
			$("#usershowDiv").append($('#usershowDiv').html(data)); 
		},
		error:function(){
			alert('회원 상제 정보 가져오기 실패');
		}
	});
}

function CancelUpdate(){
	$("#usershowDiv").append($('#usershowDiv').html("")); 
}
</script>
</html>