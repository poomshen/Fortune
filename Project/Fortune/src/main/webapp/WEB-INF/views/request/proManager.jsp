<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<form action="insertmanager.htm" method="post">
		<input type="hidden" name="collabo_req_index" value="${list.collabo_req_index}">
		<input type="hidden" name="collabo_no" value="${list.collabo_no}">
		<input type="hidden" name="collabo_req_no" value="${list.collabo_req_no}">

		<input type="hidden" name="collabo_start" value="${list.collabo_start}">
		<input type="hidden" name="collabo_end" value="${list.collabo_end}">
		<input type="hidden" name="collabo_state" value="${list.collabo_state}">
		
		<input type="hidden" name="collabo_req_ID" value="${list.collabo_req_ID}">
			
		담당자 선택 :<input name="user_ID" value="">
		<input type="submit" value="submit">
		
	
	
	</form>
	</div>
</body>
</html>