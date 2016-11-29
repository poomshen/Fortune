<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>Insert title here</title>
</head>
<body>
	<table border="1" width="100%">
	<tr><td>상태:</td><td>${list.collabo_req_state}</td><td>작성일</td><td>${list.collabo_req_date}</td></tr>
	<tr><td>제목:</td><td>${list.collabo_req_title}</td><td>작성자</td><td>${list.user_ID}</td></tr>
	<tr><td >내용</td><td colspan="3"></td></tr>
	<tr ><td colspan="4"><c:choose>
		<c:when test="${list.collabo_req_state != '거절'}">
			${list.collabo_req_text}
		</c:when>
		<c:otherwise>
			${list.collabo_req_text}
		</c:otherwise>
		</c:choose></td></tr>
	<tr><td colspan="2">수신자:</td><td colspan="2">${list.collabo_req_ID}</td></tr>
	<tr><td colspan="2">첨부파일:</td><td colspan="2"><a href="download.htm?p=upload&f=${list.collabo_req_filesrc}">${list.collabo_req_filesrc}</a></td></tr>
	</table>
	


	

	<%-- <p><a href="proEdit.htm?collabo_req_index=${list.collabo_req_index}">수정</a></p> --%>


</body>
</html>