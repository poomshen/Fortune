<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<script src="//cdn.ckeditor.com/4.5.11/standard/ckeditor.js"></script>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">[공지사항 목록]</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">안녕하세요, 관리자의 공지사항 수정페이지랍니다~</div>
			<div class="panel-body">
				<form action="" method="post" enctype="multipart/form-data">
					<div>
						<dl>
							<dt>제목 : <input name="notice_title" value="${noticeUpdate.notice_title}" /></dt>
						</dl>
						<dl>
							<dt>첨부파일 : ${noticeUpdate.notice_filename_org}</dt>
						</dl>
						<div class="form-group">
								<textarea id="notice_text" name="notice_text">${noticeUpdate.notice_text}</textarea>
								<script>
								CKEDITOR.replace('notice_text',{
									filebrowserImageUploadUrl: '${contextPath}/noticeImageUpload.htm'
								});
								</script>	
						</div>
					</div>
					<div class="form-group container" align="center">
						<input type="submit" class="btn btn-primary" value="수정">
						<input type="button" class="btn btn-primary" onclick="history.go(-1)" value="취소">
					</div>
						<%-- <a href="noticeUpdate.htm?notice_no=${noticeUpdate.notice_no}">취소하기</a> --%>
				</form>
			</div>
		</div>
	</div>
</div>