<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
.cke_top {
	/* border-bottom: 1px solid #b6b6b6; */
	padding: 6px 8px 2px;
	border: none;
	white-space: normal;
	box-shadow: 0 1px 0 #fff inset;
	background: rgba(51, 122, 183, 0.33);
	filter: progid:DXImageTransform.Microsoft.gradient(gradientType=0,
		startColorstr='#f5f5f5', endColorstr='#cfd1cf');
}


.cke_bottom {
	padding: 6px 8px 2px;
	position: relative;
	border: none;
	box-shadow: 0 1px 0 #fff inset;
	background: #bbd3e7;
	filter: progid:DXImageTransform.Microsoft.gradient(gradientType=0,
		startColorstr='#ebebeb', endColorstr='#cfd1cf');
}	

</style>	
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal">&times;</button>
		<h4 class="modal-title">수정하기</h4>
</div>

<div class="modal-body" id="detail">
						
<form action="proEdit.htm" method="post" name="modifyform" enctype="multipart/form-data">
<label>상태</label>
<input type="text" class="form-control"  placeholder="제목을 입력하세요" value="${list.collabo_req_title}">
<label>작성일</label>
<input type="text" class="form-control" readonly="readonly" value="${list.collabo_req_date}">
<label>제목</label>
<input type="text" name="collabo_req_title" class="form-control" readonly="readonly" value="${list.collabo_req_title}">
<label>프로젝트 내용 </label>
<textarea rows="4" cols="50" class="form-control"
						name="collabo_req_text" id="collabo_req_text">${list.collabo_req_text}</textarea>
					<script>
	                
	                CKEDITOR.replace( 'collabo_req_text' );
	            </script>
 <label>작성자</label>
<input type="text" class="form-control" readonly="readonly" value="${list.user_ID}">
<label>수신자 </label>
<input type="text" class="form-control" readonly="readonly" value="${list.collabo_req_ID}">
 <label>첨부파일</label>
 <div  class="form-control">
<input type="file" name="files[0]" value="${list.collabo_req_filesrc}" >
 </div>

<input type="hidden" name="collabo_req_index" value="${list.collabo_req_index}">
<input type="hidden" name="collabo_req_no" value="${list.collabo_req_no}">

<div class="modal-footer" id="detail_footer">
		<button type="button" class="btn btn-default" onclick="modify()">저장</button>
		<button type="button" class="btn btn-default"data-dismiss="modal">취소</button>
	</div>
</form>
