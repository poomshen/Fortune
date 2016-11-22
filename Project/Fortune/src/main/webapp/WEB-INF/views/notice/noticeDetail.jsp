<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
    $(document).ready(function(){
        $("a[name='file']").on("click", function(e){ //파일 이름
            e.preventDefault();
            fn_noticeDownloadFile($(this));
        });
    });     
    function fn_noticeDownloadFile(obj){
        var notice_no = obj.parent().find("#notice_no").val();
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("<c:url value='noticeFileDownload.htm' />");
        comSubmit.addParam("notice_no", notice_no);
        comSubmit.submit();
    }
</script>	
<div>
	<h2>공지사항상세페이지</h2>
	<div>
		<dl>
			<dt>제목</dt>
			<dd>${noticeDetail.notice_title}</dd>
		</dl>
		<dl>
			<dt>작성일</dt>
			<dd>${noticeDetail.notice_date}</dd>
		</dl>
		<dl>
			<dt>조회수</dt>
			<dd>${noticeDetail.notice_hits}</dd>
		</dl>
		<dl>
			<dt>첨부파일</dt>
			<c:if test="${empty noticeDetail.notice_filename_org}">
				<dd>
					첨부파일이 없습니다.
				</dd>
			</c:if>
				<c:if test="${!empty noticeDetail.notice_filename_org}">
				<dd>
					<%-- <input type="hidden" id="notice_no" value="${noticeDetail.notice_no}"> --%>
					<a href="noticeFileDownload.htm?notice_no=${noticeDetail.notice_no}&notice_filename_re=${noticeDetail.notice_filename_re}&notice_filename_org=${noticeDetail.notice_filename_org}" id="file" name="file">${noticeDetail.notice_filename_org}</a> 
				</dd>
			</c:if>
		</dl>		
		<div>${noticeDetail.notice_text}</div>
	</div>
	<p>
		<a href="noticeList.htm">목록으로 돌아가기</a>
		<a href="noticeUpdate.htm?notice_no=${noticeDetail.notice_no}">수정하기</a>
		<a href="noticeDelete.htm?notice_no=${noticeDetail.notice_no}">삭제하기</a>
	</p>
</div>
