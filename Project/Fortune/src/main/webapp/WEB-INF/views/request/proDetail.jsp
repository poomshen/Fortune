<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">





<title>Insert title here</title>
</head>
<body>

<div>
	<dl>
		<dt>프로젝트 제목</dt>
		<dd>${list.collabo_req_title}</dd>
	</dl>
	<dl>
		<dt>프로젝트 내용</dt>
		<dd>${list.collabo_req_text}</dd>
	</dl>
	<dl>
		<dt>프로젝트 작성자</dt>
		<dd>${list.user_ID}</dd>
	</dl>
	<dl>
		<dt>프로젝트 전송받을 사람</dt>
		<dd>${list.collabo_req_ID}</dd>
	</dl>
	<dl>
		<dt>프로젝트 작성일</dt>
		<dd>${list.collabo_req_date}</dd>
	</dl>
	<dl>
		<dt>프로젝트 진행상태</dt>
		<dd>${list.collabo_req_state}</dd>
	</dl>
</div>
	<p><a href="requestList.htm">목록</a></p>
				<c:choose>
					<c:when test="${list.collabo_req_state == '수락'}">
						<p>수락완료</p>
						
					</c:when>
					<c:when test="${list.collabo_req_state == '거절'}"></c:when>
					<c:otherwise>
					<p><a href="accept.htm?collabo_req_index=${list.collabo_req_index}" name="collabo_req_state">수락</a></p> 
					<p><a  href="refuse.htm?collabo_req_index=${list.collabo_req_index}" name="collabo_req_state">거절</a></p>
					</c:otherwise>
					
				</c:choose>
				
	
	
	<p><a href="proEdit.htm?collabo_req_index=${list.collabo_req_index}">수정</a></p>


</body>
</html>