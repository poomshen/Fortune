<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.1.1.min.js"></script>

</head>
<body>
	
	<form action="updateConfirm.htm" method="post">
		id &nbsp;<input type="text" id="id" name="id" readonly="readonly" value="${info.id}"><br>
		pwd &nbsp;<input type="text" id="pwd" name="pwd"><br>
		이름 &nbsp; <input type="text" id="name" name="name" readonly="readonly" value="${info.name}"><br>
		성별 &nbsp; <input type="text" id="gender" name="gender" readonly="readonly" value="${info.gender}"><br>
		생년월일 &nbsp; <input type="text" id="birthday" name="birthday" readonly="readonly" value="${info.birthday}"><br>
		전화번호 &nbsp; <input type="text" id="phone" name="phone" value="${info.phone}"><br>
		입사일 &nbsp; <input type="text" id="enterdate" name="enterdate" value="${fn:substring(info.enterdate,0,10)}" readonly="readonly"><br>
		부서명 &nbsp;
		<select name="deptno" id="deptno">
			<option value="" ${info.deptno == '' ? 'selected="selected"' : ''}>부서를 선택하세요</option>
			<option value="1" ${info.deptno == '1' ? 'selected="selected"' : ''}>개발부</option>
			<option value="2" ${info.deptno == '2' ? 'selected="selected"' : ''}>영업부</option>
			<option value="3" ${info.deptno == '3' ? 'selected="selected"' : ''}>기획부</option>
		</select><br>
		팀명 &nbsp;
		<select name="teamnum" id="teamnum">		
			<option value="" ${info.deptno == '' ? 'selected="selected"' : ''}>팀을 선택하세요</option>
			<option value="1" ${info.deptno == '1' ? 'selected="selected"' : ''}>1팀</option>
			<option value="2" ${info.deptno == '2' ? 'selected="selected"' : ''}>2팀</option>
			<option value="3" ${info.deptno == '3' ? 'selected="selected"' : ''}>3팀</option>		
		</select><br>
		직급번호 &nbsp;
		<select name="jobnum" id="jobnum">
			<option value="" ${info.jobnum == '' ? 'selected="selected"' : ''}>직급을 선택하세요</option>
			<option value="1" ${info.jobnum == '1' ? 'selected="selected"' : ''}>사원</option>
			<option value="2" ${info.jobnum == '2' ? 'selected="selected"' : ''}>대리</option>
			<option value="3" ${info.jobnum == '3' ? 'selected="selected"' : ''}>과장</option>
			<option value="4" ${info.jobnum == '4' ? 'selected="selected"' : ''}>차장</option>
			<option value="5" ${info.jobnum == '5' ? 'selected="selected"' : ''}>부장</option>
		</select><br>
		
		<input type="submit" onclick="alert('수정 완료')" value="수정완료">
	</form>
</body>
</html>