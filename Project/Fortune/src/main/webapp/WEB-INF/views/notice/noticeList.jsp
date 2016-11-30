<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">[공지사항 목록]</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">안녕하세요, 관리자의 공지사항공간이랍니다~</div>
			<!-- 검색폼 추가 -->
			<div>
				<form name="searchform" id="searchform" action="noticeSearch.htm"
					method="get">
					<select name="selectvalue" id="selectvalue" class="cd-select">
						<option style="text-align: center" value="notice_title">제목</option>
						<option style="text-align: center" value="notice_text">내용</option>
					</select> <input type="text" name="searchvalue"> <input
						type="submit" class="btn btn-primary" id="search_btn" value="검색">
				</form>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="dataTable_wrapper">
					<table class="table table-striped table-bordered table-hover"
						id="dataTables-example">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>조회수</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${noticelist}" var="noticedto">
								<tr>
									<td>${noticedto.notice_no}</td>
									<td><a
										href="noticeDetail.htm?notice_no=${noticedto.notice_no}">${noticedto.notice_title}</a></td>
									<td>${noticedto.notice_hits}</td>
									<td>${noticedto.notice_date}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- Pagination 추가 시작 -->
				<div class="container" style="text-align: center; margin-left: -80px;">
					<ul class="pagination">
						<c:if test="${pg>block}">
							<li><a href="noticeList.htm?pg=1">««</a></li>
							<li><a href="noticeList.htm?pg=${from_page-1}">«</a></li>
						</c:if>
						<c:if test="${pg<=block}">
							<li><a href="#">««</a></li>
							<li><a href="#">«</a></li>
						</c:if>
						<c:forEach begin="${from_page}" end="${to_page}" var="i">
							<c:if test="${i==pg}">
								<li><a href="#">${i}</a></li>
							</c:if>
							<c:if test="${i!=pg}">
								<li><a href="noticeList.htm?pg=${i}">${i}</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${to_page<all_page}">
							<li><a href="noticeList.htm?pg=${to_page+1}">»</a></li>
							<li><a href="noticeList.htm?pg=${all_page}">»»</a></li>
						</c:if>
						<c:if test="${to_page>=all_page}">
							<li><a href="#">»</a></li>
							<li><a href="#">»»</a></li>
						</c:if>
					</ul>
				</div>
				<!-- Pagination 추가 끝 -->

			</div>
			<!-- /.panel-body -->
			<p>
				<a href="noticeInsert.htm">공지사항 작성하기</a>
			</p>
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>