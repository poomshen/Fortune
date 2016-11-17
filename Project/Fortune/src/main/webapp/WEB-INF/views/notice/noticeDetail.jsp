<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="content">
	<h2>공지사항</h2>
	<div>
		<dl>
			<dt>제목</dt>
			<dd>${notice.title}</dd>
		</dl>
		<dl>
			<dt>작성일</dt>
			<dd>${notice.regdate}</dd>
		</dl>
		<dl class="article-detail-row half-row">
			<dt>작성자</dt>
			<dd class="article-detail-data half-data">${notice.writer}</dd>
		</dl>
		<dl class="article-detail-row half-row">
			<dt>조회수</dt>
			<dd class="article-detail-data half-data">${notice.hit}</dd>
		</dl>
		<dl>
			<dt>첨부파일_1</dt>
			<dd>
				<a href="download.htm?p=upload&f=${notice.fileSrc}">${notice.fileSrc}</a>
			</dd>
		</dl>
		<dl>
			<dt>첨부파일_2</dt>
			<dd>
				<a href="download.htm?p=upload&f=${notice.fileSrc2}">${notice.fileSrc2}</a>
			</dd>
		</dl>
		<div class="article-content">${notice.content}</div>
	</div>
	<p class="article-comment margin-small">
		<a class="btn-list button" href="notice.htm">목록</a> <a
			class="btn-edit button" href="noticeEdit.htm?seq=${notice.seq}">수정</a>
		<a class="btn-del button" href="noticeDel.htm?seq=${notice.seq}">삭제</a>
	</p>
</div>
