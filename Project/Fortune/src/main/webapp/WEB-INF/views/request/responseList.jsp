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
<table class="article-list margin-small">
		<caption class="hidden">공지사항</caption>
		<thead>
			<tr>
				<th class="collabo_no">협업번호</th>
				<th class="collabo_req_index">협업구분자</th>
				<th class="collabo_req_no">요청번호</th>
				
				
				<th class="user_ID">협업담당자</th>
				<th class="collabo_start">시작일</th>
				<th class="collabo_end">마지막일</th>
				<th class="collabo_state">진행 상태</th>
				<th class="collabo_req_id">협업수락자</th>
				<th class="collabo_cal">일정</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="n">
				<tr>
					<td class="collabo_no">${n.collabo_no}</td>
					<td class="collabo_req_index">${n.collabo_req_index}</td>
					<td class="collabo_req_no">${n.collabo_req_no}</td>

					<td class="user_ID">${n.user_ID}</td>
					<td class="collabo_start">${n.collabo_start}</td>
					<td class="collabo_end">${n.collabo_end}</td>
					<td class="collabo_req_state">${n.collabo_state}</td>
					<td class="collabo_req_id">${n.collabo_req_id}</td>
					<td class="collabo_cal"><a href="schedule.htm"><button>Click</button></a></td>
					
					
				</tr>	
			</c:forEach>
			
			
			
			
			
		</tbody>
	</table>
	
	
	
	<a href="responseList.htm">리스트</a>

</body>
</html>