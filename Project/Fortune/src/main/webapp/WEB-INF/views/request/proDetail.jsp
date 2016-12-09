<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 보낸 요청함, 상세보기 -->
<form action="proEdit.htm" method="post" name="modifyform" enctype="multipart/form-data">
<label>프로젝트명</label>
<input type="text" id="collabo_req_title" name="collabo_req_title" class="form-control" readonly="readonly" value="${list.collabo_req_title}">
<label>작성일</label>
<input type="text" class="form-control" readonly="readonly" value="${list.collabo_req_date}">
<label>상태</label>
<input type="text" class="form-control" readonly="readonly" value="${list.collabo_req_state}">
<label>수신자 </label>
<input type="text" class="form-control" readonly="readonly" value="${list.collabo_req_ID}">
<label>작성자</label>
<input type="text" class="form-control" readonly="readonly" value="${list.user_ID}">
<label>첨부파일</label>
<div class="form-control">
<a style="display: inline;" id="file_src_tag" class="w3-small" href="download.htm?p=upload&f=${list.collabo_req_filesrc}">${list.collabo_req_filesrc}</a>
<input id="collabo_req_filesrc" type="hidden" name="files[0]" value="${list.collabo_req_filesrc}">
</div>
<label>프로젝트 내용 </label>
<textarea readonly="readonly" rows="4" cols="50" class="form-control"
name="collabo_req_text" id="collabo_req_text">${list.collabo_req_text}</textarea>

<input type="hidden" id="hidden" value="${list.collabo_req_index}">
<input type="hidden" name="collabo_req_index" value="${list.collabo_req_index}">
<input type="hidden" name="collabo_req_no" value="${list.collabo_req_no}">

<div class="modal-footer" id="detail_footer">
	<!-- <input type="hidden" id="hidden"> -->
	<c:if test='${list.collabo_req_state eq "대기"}'>
		<input type="button" id="post_update" class="btn btn-primary" onclick="post_request_update()" value="수정">
		<input type="hidden" id="post_updateok" class="btn btn-primary" onclick="modify()" value="저장">
	</c:if>
	<input type="button" class="btn btn-primary" data-dismiss="modal" value="취소">
</div>

</form>
