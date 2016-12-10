<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
 
<form action="#" method="post" enctype="multipart/form-data">

	<div class="row" style="margin-top: 5px;">
		<div class="col-sm-2" style="margin-top: 10px;" align="left"><lable>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;요청 부서</lable></div>
		<div class="col-sm-4"><input type="text" class="form-control" readonly="readonly" value="${requestuser_info.dept_name}"></div>
		<div class="col-sm-2" style="margin-top: 10px;" align="center"><lable>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;요청자</lable></div>
		<div class="col-sm-4"><input type="text" class="form-control" readonly="readonly" value="${requestuser_info.user_name}"></div>
	</div>
	<div class="row" style="margin-top: 5px;">
		<div class="col-sm-2" style="margin-top: 10px;" align="left"><lable>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수신 부서</lable></div>
		<div class="col-sm-4"><input type="text" class="form-control" readonly="readonly" value="${receiveuser_info.dept_name}"></div>
		<div class="col-sm-2" style="margin-top: 10px;" align="center"><lable>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수신자</lable></div>
		<div class="col-sm-4"><input type="text" class="form-control" readonly="readonly" value="${receiveuser_info.user_name}"></div>
	</div>
	<div class="row" style="margin-top: 5px;">
		<div class="col-sm-2" style="margin-top: 10px;" align="left"><lable>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작성일</lable></div>
		<div class="col-sm-4"><input type="text" class="form-control" readonly="readonly" value="${list.collabo_req_date}"></div>
		<div class="col-sm-2" style="margin-top: 10px;" align="center"><lable>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상태</lable></div>
		<div class="col-sm-4"><input type="text" class="form-control" readonly="readonly" value="${list.collabo_req_state}"></div>
	</div>
	<div class="row" style="margin-top: 5px;">
		<div class="col-sm-2" style="margin-top: 10px;" align="left"><lable>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;첨부파일</lable></div>
		<div class="col-sm-4"><a style="display: inline;" id="file_src_tag" class="w3-small" href="download.htm?p=upload&f=${list.collabo_req_filesrc}">${list.collabo_req_filesrc}</a></div>
		<div class="col-sm-2" style="margin-top: 10px;" align="center"><lable>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;프로젝트 기간</lable></div>
		<div class="col-sm-4"><input type="text" class="form-control" readonly="readonly" value="${mylist.collabo_start} ~ ${mylist.collabo_end}"></div>
	</div>
	
	<div class="row" style="margin-top: 5px;">
		<div class="col-sm-2" style="margin-top: 10px;" align="left"><lable>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;프로젝트명</lable></div>
		<div class="col-sm-10"><input type="text" class="form-control" readonly="readonly" value="${list.collabo_req_title}"></div>
	</div>
	<div class="row" style="margin-top: 5px;">
		<div class="col-sm-2" style="margin-top: 60px;" align="left"><lable>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;프로젝트 내용</lable></div>
		<div class="col-sm-10"><textarea readonly="readonly" rows="8" cols="50" class="form-control">${list.collabo_req_text}</textarea></div>
	</div>
	<div class="modal-footer" id="detail_footer">
		<input type="button" class="btn btn-primary" data-dismiss="modal" value="취소">
	</div>
</form>
<%-- 
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
						
 --%>						
