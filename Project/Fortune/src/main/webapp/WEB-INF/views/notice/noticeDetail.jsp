<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="content">
	<h2>공지사항</h2>
	<h3 class="hidden">방문페이지위치</h3>
	<ul id="breadscrumb" class="block_hlist">
		<li id="home"><a href="">HOME</a></li>
		<li><a href="">고객센터</a></li>
		<li><a href="">공지사항</a></li>
	</ul>
	<div id="notice-article-detail" class="article-detail margin-large">
		<dl class="article-detail-row">
			<dt class="article-detail-title">제목</dt>
			<dd class="article-detail-data">${notice.title}</dd>
		</dl>
		<dl class="article-detail-row">
			<dt class="article-detail-title">작성일</dt>
			<dd class="article-detail-data">${notice.regdate}</dd>
		</dl>
		<dl class="article-detail-row half-row">
			<dt class="article-detail-title">작성자</dt>
			<dd class="article-detail-data half-data">${notice.writer}</dd>
		</dl>
		<dl class="article-detail-row half-row">
			<dt class="article-detail-title">조회수</dt>
			<dd class="article-detail-data half-data">${notice.hit}</dd>
		</dl>
		<dl class="article-detail-row">
			<dt class="article-detail-title">첨부파일_1</dt>
			<dd class="article-detail-data">
				<a href="download.htm?p=upload&f=${notice.fileSrc}">${notice.fileSrc}</a>
			</dd>
		</dl>
		<dl class="article-detail-row">
			<dt class="article-detail-title">첨부파일_2</dt>
			<dd class="article-detail-data">
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
	<div class="margin-small" style="border-top: 1px solid #dfdfdf;">
		<dl class="article-detail-row">
			<dt class="article-detail-title">▲ 다음글</dt>
			<dd class="article-detail-data">다음 글이 없습니다.</dd>
		</dl>
		<dl class="article-detail-row">
			<dt class="article-detail-title">▼ 이전글</dt>
			<dd class="article-detail-data">1회 경진대회</dd>
		</dl>
	</div>
</div>
