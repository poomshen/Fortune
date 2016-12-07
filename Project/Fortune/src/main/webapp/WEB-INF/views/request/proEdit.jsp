<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal">&times;</button>
		<h4 class="modal-title">수정하기</h4>
</div>

<div class="modal-body" id="detail">
						
<form action="proEdit.htm" method="post" name="modifyform" enctype="multipart/form-data">
<input type="hidden" name="collabo_req_index" value="${list.collabo_req_index}">
<input type="hidden" name="collabo_req_no" value="${list.collabo_req_no}">

<table class="tg">
  <tr>
    <th class="title">상태</th>
    <th class="tg-baqh">${list.collabo_req_state}</th>
    <th class="title">작성일</th>
    <th class="tg-baqh">${list.collabo_req_date}</th>
  
  </tr>
  <tr>
    <td class="title">제목</td>
    <td class="tg-baqh"> 
    	<input type="text" name="collabo_req_title" style="border:none;"id="collabo_req_title" placeholder="제목을 입력하세요" value="${list.collabo_req_title}"></td>
    <td class="title">작성자</td>
    <td class="tg-baqh">${list.user_ID}</td>
 
  </tr>
  <tr>
    <td class="title" rowspan="3"><br><br><br>내용</td>
    <td class="tg-baqh" colspan="3" rowspan="3">
    	<textarea rows="4" cols="50" class="form-control"name="collabo_req_text" id="collabo_req_text">${list.collabo_req_text}</textarea>
	</td>

  </tr>
  <tr>
  </tr>
  <tr>
   
  </tr>
  <tr>
    <td class="title">수신자</td>
    <td class="tg-baqh">${list.collabo_req_ID}</td>
    <td class="title">첨부파일</td>
    <td class="tg-baqh"><input type="file" name="files[0]" class="form-control" value="${list.collabo_req_filesrc}" ></td>
	
  </tr>
</table>

</div>
	<div class="modal-footer" id="detail_footer">
		<input type="button" class="btn btn-default" value="저장" onclick="modify()">
		<a  class="btn btn-default" href="listReplyRequest.htm" >취소하기</a>
	</div>
</form>
