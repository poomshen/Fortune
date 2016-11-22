<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 목록</title>
</head>
<body>
	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>조회수</th>
			<th>작성일</th>
		</tr>
		<c:forEach items="${noticelist}" var="noticedto">
			<tr>
				<td>${noticedto.notice_no}</td>
				<td><a href="noticeDetail.htm?notice_no=${noticedto.notice_no}">${noticedto.notice_title}</a></td>
				<td>${noticedto.notice_hits}</td>
				<td>${noticedto.notice_date}</td>
			</tr>
		</c:forEach>
	</table>
	<table width="500">
		<tr>
			<td align="center"><c:if test="${pg>block}">
						[<a href="noticeList.htm?pg=1">◀◀</a>]
						[<a href="noticeList.htm?pg=${from_page-1}">◀</a>]		
					</c:if> <c:if test="${pg<=block}">
						[<span style="color: gray">◀◀</span>]	
						[<span style="color: gray">◀</span>]
					</c:if> <c:forEach begin="${from_page}" end="${to_page}" var="i">
					<c:if test="${i==pg}">[${i}]</c:if>
					<c:if test="${i!=pg}">
							[<a href="noticeList.htm?pg=${i}">${i}</a>]
						</c:if>
				</c:forEach> <c:if test="${to_page<all_page}">
						[<a href="noticeList.htm?pg=${to_page+1}">▶</a>]
						[<a href="noticeList.htm?pg=${all_page}">▶▶</a>]
					</c:if> <c:if test="${to_page>=all_page}">
						[<span style="color: gray">▶</span>]
						[<span style="color: gray">▶▶</span>]
					</c:if></td>
		</tr>
	</table>
	<p>
		<a href="noticeInsert.htm">글작성하기</a>
	</p>
</body>
</html>