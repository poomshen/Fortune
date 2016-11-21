<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
   request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.1.1.min.js"></script>

</head>
<body>
	
	<form action="updateConfirm.htm" method="post">
		id &nbsp;<input type="text" id="user_id" name="user_id" readonly="readonly" value="${sessionScope.info.user_id}"><br>
	 	pwd &nbsp;<input type="text" id="user_password" name="user_password"><br>
		이름 &nbsp; <input type="text" id="user_name" name="user_name" readonly="readonly" value="${sessionScope.info.user_name}"><br>
		성별 &nbsp; <input type="text" id="user_gender" name="user_gender" readonly="readonly" value="${sessionScope.info.user_gender}"><br>
		생년월일 &nbsp; <input type="text" id="user_date" name="user_date" readonly="readonly" value="${sessionScope.info.user_date}"><br>
		전화번호 &nbsp; <input type="text" id="user_phone" name="user_phone" value="${sessionScope.info.user_phone}"><br>
		입사일 &nbsp; <input type="text" id="user_join" name="user_join" value="${fn:substring(sessionScope.info.user_join,0,10)}" readonly="readonly"><br>
		
		<%--
		부서명 &nbsp;
 	<select name="dept_no" id="dept_no">
         	<c:forEach var="dept" items="${dept}">            
            	<option value="${sessionScope.info.dept_no}" ${sessionScope.info.dept_no == 'dept.dept_no' ? 'selected="selected"' : ''}></option>
            </c:forEach> 
		이거 안됨ㅡㅡ
	</select>  
			<input type="text" id="dept_no" name="dept_no" value="${sessionScope.info.dept_no}" readonly="readonly"><br>
		
		<br>
		팀명 &nbsp;
		<select name="team_no" id="team_no">		
			<option value=""  ${sessionScope.info.team_no == '' ? 'selected="selected"' : ''}>팀을 선택하세요</option>
			<option value="1" ${sessionScope.info.team_no == '101' ? 'selected="selected"' : ''}>개발1팀</option>
			<option value="2" ${sessionScope.info.team_no == '102' ? 'selected="selected"' : ''}>개발2팀</option>
			<option value="3" ${sessionScope.info.team_no == '103' ? 'selected="selected"' : ''}>개발3팀</option>		
		</select><br>
		직급번호 &nbsp;
		<select name="position_no" id="position_no">
			<option value=""  ${sessionScope.info.position_no == '' ? 'selected="selected"' : ''}>직급을 선택하세요</option>
			<option value="1" ${sessionScope.info.position_no == '1' ? 'selected="selected"' : ''}>사원</option>
			<option value="2" ${sessionScope.info.position_no == '2' ? 'selected="selected"' : ''}>대리</option>
			<option value="3" ${sessionScope.info.position_no == '3' ? 'selected="selected"' : ''}>과장</option>
			<option value="4" ${sessionScope.info.position_no == '4' ? 'selected="selected"' : ''}>차장</option>
			<option value="5" ${sessionScope.info.position_no == '5' ? 'selected="selected"' : ''}>부장</option>
		</select><br>
		--%>
		<input type="submit" onclick="alert('수정 완료')" value="수정완료">
	</form>
</body>
</html>