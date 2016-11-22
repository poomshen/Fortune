<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div>
	<h2>공지사항수정페이지</h2>
	<form action="" method="post" enctype="multipart/form-data">
		<div>
			<dl>
				<dt>제목</dt>
				<dd>
					<input name="notice_title" value="${noticeUpdate.notice_title}" />
				</dd>
			</dl>
			<dl>
				<dt>첨부파일</dt>
				<dd>${noticeUpdate.notice_filename_org}</dd>
			</dl>			
			<div>
				<textarea id="notice_text" name="notice_text">
					${noticeUpdate.notice_text}
				</textarea>
			</div>
		</div>
		<p>
			<input type="submit" value="수정하기"/> 
			<a href="noticeUpdate.htm?notice_no=${noticeUpdate.notice_no}">취소하기</a>
		</p>
	</form>
</div>
