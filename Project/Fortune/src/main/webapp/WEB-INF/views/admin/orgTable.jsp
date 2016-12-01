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
		<th>부서명</th>
	</tr>
	<c:forEach var="i" items="${deptlist}">
		<c:if
			test="${not (i.user_id eq 'admin@fortune.com')}">
			<tr>
				<td><input type="button" value="${i.user_id}" class="buttonLink" onclick="ShowUserInfo('${i.user_id}')" ></td>
				<td><c:out value="${i.user_name}"></c:out></td>
				<td><c:out value="${i.user_phone}"></c:out></td>
				<c:if test="${i.dept_no == 0}">
					<td><c:out value="없음"></c:out></td>
				</c:if>
				<c:forEach var="j" items="${dept}">
					<c:choose>
						<c:when test="${i.dept_no == j.dept_no}">
							<td><c:out value="${j.dept_name}"></c:out></td>
						</c:when>
					</c:choose>
				</c:forEach>
			</tr>
		</c:if>
	</c:forEach>
</table>