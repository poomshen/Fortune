<!-- 
작성자  : 김지현
최초작업일 : 2016/12/10
최종수정일 : 2016/12/10
작업내용 : 회원 리스트를 테이블 형식으로 보여주는 page
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
   request.setCharacterEncoding("UTF-8");
%>

<table class="table table-striped table-bordered table-hover">
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
					
					<c:forEach var="j" items="${dept}">
						<c:if test="${i.dept_no == j.dept_no}">
						<td><c:out value="${j.dept_name}"></c:out></td>
						</c:if>
					</c:forEach>		
							
					<c:forEach var="j" items="${team}">
						<c:if test="${i.team_no == j.team_no}">
							<td><c:out value="${j.team_name}"></c:out></td>
						</c:if>					
					</c:forEach>	
											
					<c:forEach var="j" items="${position}">
						<c:if test="${i.position_no ==  j.position_no}">
							<td><c:out value="${j.position_name}"></c:out></td>
						</c:if>			
					</c:forEach>				
				</tr>
			</c:if>
		</c:forEach><br>

</table>
