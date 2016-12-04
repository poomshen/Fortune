<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<table  style="width:100%; height: 400px"   class="w3-table w3-bordered w3-card-4" >
	<tr class="w3-hover-text-blue" style="height: 10px"><td>상태:</td><td>${list.collabo_req_state}</td><td>작성일</td><td>${list.collabo_req_date}</td></tr>
	<tr class="w3-hover-text-blue" style="height: 10px"><td>제목:</td><td>${list.collabo_req_title}</td><td>작성자</td><td>${list.user_ID}</td></tr>
	<tr class="w3-hover-text-blue" style="height: 10px"><td >내용</td><td colspan="3"></td></tr>
	<tr class="w3-hover-text-blue" style="overflow: scroll;"><td colspan="4" width="100px" height="100%" style="overflow: scroll;"><c:choose>
		<c:when test="${list.collabo_req_state != '거절'}">
			${list.collabo_req_text}
		</c:when>
		<c:otherwise>
			${list.collabo_req_text}
		</c:otherwise>
		</c:choose></td></tr>
	<tr class="w3-hover-text-blue" style="height: 10px"><td colspan="2">수신자:</td><td colspan="2">${list.collabo_req_ID}</td></tr>
	<tr class="w3-hover-text-blue" style="height: 10px"><td colspan="2">첨부파일:</td><td colspan="2"><a class="w3-small" href="download.htm?p=upload&f=${list.collabo_req_filesrc}">${list.collabo_req_filesrc}</a></td></tr>
	</table>


	

	<%-- <p><a href="proEdit.htm?collabo_req_index=${list.collabo_req_index}">수정</a></p> --%>

