<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
</head>
<body>
<table width="500" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<th class="notice_seq">번호</th>
		<th class="notice_title">제목</th>		
		<th class="notice_date">작성일</th>
		<th class="notice_hits">조회수</th>
	</tr>
	<c:forEach items="${noticelist}" var="noticedto">
	<tr>
		<td class="notice_seq">${noticedto.seq}</td>
		<td class="notice_title"><a href="noticeDetail.htm?notice_seq=${noticedto.notice_no}">${noticedto.notice_title}</a></td>
		<td class="notice_date">${noticedto.notice_date}</td>
		<td class="notice_hits">${noticedto.hits}</td>
	</tr>
	</c:forEach>
</table>
<p><a href="noticeWrite">글작성하기</a></p>
</body>
</html>