<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<label>상태</label>
<input type="text" class="form-control" readonly="readonly" value="${list.collabo_req_state}">
<label>작성일</label>
<input type="text" class="form-control" readonly="readonly" value="${list.collabo_req_date}">
<label>프로젝트명</label>
<input type="text" class="form-control" readonly="readonly" value="${list.collabo_req_title}">
<label>프로젝트 내용 </label>
<div class="form-control" style="height: 200px; overflow: auto;" >
${list.collabo_req_text}
</div>
 <label>작성자</label>
<input type="text" class="form-control" readonly="readonly" value="${list.user_ID}">
<label>수신자 </label>
<input type="text" class="form-control" readonly="readonly" value="${list.collabo_req_ID}">
<label>예상 수익 </label>
<input type="text" class="form-control" id="sal" readonly="readonly" value="${mylist.collabo_sal}">
<label>프로젝트 기간 </label>
<input type="text" class="form-control" readonly="readonly" value="${mylist.collabo_start} - ${mylist.collabo_end}">
 <label>첨부파일</label>
 <div  class="form-control">
 <a class="w3-small " href="download.htm?p=upload&f=${list.collabo_req_filesrc}">${list.collabo_req_filesrc}</a>
</div>
<div class="modal-footer" id="detail_footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>