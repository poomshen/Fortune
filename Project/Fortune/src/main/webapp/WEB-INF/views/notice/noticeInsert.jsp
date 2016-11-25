<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div>
	<h2>공지사항 등록페이지</h2>
	<form action="" method="post" enctype="multipart/form-data">
		<div>
			<dl>
				<dt>제목</dt>
				<dd>
					<input type="text" name="notice_title" id="notice_title" />
				</dd>
			</dl>
			<dl>
				<dt>첨부파일</dt>
				<dd>
					<input type="file" name="file" id="File"/>
				</dd>
			</dl>
			<div>
				<textarea name="notice_text" id="notice_text"></textarea>
			</div>

		</div>
		<p>
			<input type="submit" value="저장" /> 
			<a href="notice.noticeList.htm">공지사항 목록보기</a>
		</p>
	</form>
</div>
