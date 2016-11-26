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
</head>
<body>

<h3>같은 부서인 사람들 정보 뽑기</h3>
<!-- <input type="button" onclick="deptshow()" value="같은 부서원 정보 뿌리기"> -->
<h2>deptno 확인 : ${sessionScope.info.dept_no}</h2>

<form action="deptsearch.ajax">
	<select>
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
	
	<%-- <select>
		<c:forEach var="i" items="${team}">
			<c:choose>
				<c:when test="${i.team_no == sessionScope.info.team_no}">
					<option value="${i.team_no}" selected>${i.team_name}</option>
				</c:when>			
				<c:otherwise>
					<option value="${i.team_no}">${i.team_name}</option>	
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</select> --%>

	<input type="submit" class="btn btn-primary" value="검색">
</form>


	<table>
	<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>전화번호</th>
		<th>입사일</th>
		<th>부서명</th>
		<th>팀명</th>
		<th>직급명</th>
	</tr>
		<c:forEach var="i" items="${deptlist}">
			<c:if test="${not (i.user_id eq 'admin@fortune.com' or i.user_id eq sessionScope.info.user_id)}">
			<tr>
				<td><c:out value="${i.user_id}"></c:out></td>
				<td><c:out value="${i.user_name}"></c:out></td>
				<td><c:out value="${i.user_phone}"></c:out></td>
				<td><c:out value="${fn:substring(i.user_join,0,10)}"></c:out></td>
				<td><c:out value="${i.dept_no}"></c:out></td>
				<td><c:out value="${i.team_no}"></c:out></td>
				<td><c:out value="${i.position_no}"></c:out></td>
			</tr>
			</c:if>
		</c:forEach><br>

</table>

<!-- 
<script type="text/javascript">
function deptshow(){
	
	var deptno = ${sessionScope.info.dept_no};

	$.ajax({
		type:"get",
		url:"deptinfo.ajax",
		data:{"dept_no": deptno },
		success:function(data){
			if(data != null){
				
				console.log(data.length);
				 for(var i=0; i<data.length; i++){
					console.log(data[i].user_id);
				} 
			}
			else{
				alert('실패함');
			}
		},
		error:function(){
			alert('이건 에러');
		}
	});
}
	
</script> -->
</body>
</html>