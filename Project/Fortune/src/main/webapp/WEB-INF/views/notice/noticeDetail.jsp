<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="content">
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
				<dd>
					<a href="download.htm?p=upload&f=${notice.fileSrc}">${notice.fileSrc}</a>
				</dd>
		</dl>		
		<div>${noticeDetail.notice_text}</div>
	</div>
	<p>
		<a href="noticeList.htm">목록으로 돌아가기</a>
		<a href="noticeUpdate.htm?notice_no=${noticeDetail.notice_no}">수정하기</a>
		<a href="noticeDelete.htm?notice_no=${noticeDetail.notice_no}">삭제하기</a>
	</p>
</div>
