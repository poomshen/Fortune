<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">[공지사항]</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<!-- <div class="panel panel-default"> -->
	<!-- 		<div class="panel-heading">안녕하세요, 관리자의 공지사항공간이랍니다~</div> -->
			<!-- 검색폼 추가 -->
			<div style="margin-top: 10px; margin-left: 15px;">
				<form name="searchform" id="searchform" action="noticeSearch.htm" method="get">
					<select name="selectvalue" id="selectvalue" class="cd-select form-control" style="width: 8%; display: inline; font-size: 12px;">
						<option style="text-align: center" value="notice_title">제목</option>
						<option style="text-align: center" value="notice_text">내용</option>
					</select> 
					<input type="text" name="searchvalue" class="form-control" style="width: 20%; display: inline; font-size: 12px;"> 
					<input type="submit" class="btn btn-primary" id="search_btn" value="검색">
					<security:authorize access="hasAnyRole('ROLE_ADMIN')">
                    	<div style="float: right; margin-right: 15px;">
							<a href="noticeInsert.htm"><input type="button" class="btn btn-primary" value="글쓰기"></a>
						</div>
					</security:authorize>
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
				<!-- Pagination 추가 시작 -->
				<!-- to_page 보여줄 페이지 끝, all_page 끝 페이지, from_page 보여줄 페이지의 시작, block 5 -->
				<div class="container" style="text-align: center; margin-left: -80px;">
					<ul class="pagination">
						<c:if test="${pg != 1}">
							<c:if test="${pg == from_page}">
								<li><a href="noticeList.htm?pg=1">««</a></li>
								<li><a href="noticeList.htm?pg=${from_page-1}">«</a></li>
							</c:if>
							<c:if test="${pg > from_page}">
								<li><a href="noticeList.htm?pg=1">««</a></li>
								<li><a href="noticeList.htm?pg=${pg - 1}">«</a></li>
							</c:if>
						</c:if>
						<c:forEach begin="${from_page}" end="${to_page}" var="i">
							<c:if test="${i == pg}"><li class="active"><a href="#">${i}</a></li></c:if>
							<c:if test="${i != pg}">
								<li><a href="noticeList.htm?pg=${i}">${i}</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${noticelist.size() != 0}">
							<c:if test="${pg < to_page || pg != all_page}">
								<li><a href="noticeList.htm?pg=${pg + 1}">»</a></li>
								<li><a href="noticeList.htm?pg=${all_page}">»»</a></li>
							</c:if>
							<c:if test="${to_page > all_page && pg != all_page}">
								<li><a href="noticeList.htm?pg=${to_page + 1}">»</a></li>
								<li><a href="noticeList.htm?pg=${all_page}">»»</a></li>
							</c:if>
						</c:if>
					</ul>
				</div>
				<!-- Pagination 추가 끝 -->

			</div>
			<!-- /.panel-body -->

		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>








<%-- 

<div id="contents">
	<h1 class="page-header">공지사항</h1>
	<div class="conInner">
		<!-- 토탈넘버 구하고싶어... -->
		<!-- <div class="group">
			<div class="tableTotalNum">
				<p>
					총 게시물 <span class="orangePoint"></span>건
				</p>
			</div>
		</div> -->
		<!-- 토탈넘버 구하고싶어... -->
		<!-- 검색 -->
		<div class="searchDiv" style="margin: auto;">
				<form id="searchform" name="searchform"
					action="noticeSearch.htm" method="get">
					<div class="searchBox" style="margin-left: 750px;">
					<div class="insearchBox" style="float: left; margin-right: 30px; margin-top: 13px;">
						<select id="selectvalue" name="selectvalue" title="검색 구분">
							<option value="all">전체</option>
							<option value="notice_title">제목</option>
							<option value="notice_text">내용</option>
						</select>					
						<input id="searchvalue" name="searchvalue" title="검색어 입력"
							type="text" value="" /> <input type="submit"
							class="btn btn-primary" id="search_btn" value="검색">
					</div>
					</div>
				</form>		
		</div>
		<table class="table table-striped table-bordered table-hover">
			<colgroup>
				<col width="10.91%" />
				<col width="*" />
				<col width="7.45%" />
				<col width="13.43%" />
				<col width="10%" />
				<col width="11.96%" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">첨부파일</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
					<th scope="col">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${noticelist}" var="noticedto">
					<tr>
						<td>${noticedto.notice_no}</td>
						<td><a
							href="noticeDetail.htm?notice_no=${noticedto.notice_no}">${noticedto.notice_title}</a></td>
						<c:if test="${!empty noticedto.notice_filename_org}">
							<td>Y</td>
						</c:if>
						<c:if test="${empty noticedto.notice_filename_org}">
							<td>N</td>
						</c:if>
						<td>관리자</td>
						<td>${noticedto.notice_date}</td>
						<td>${noticedto.notice_hits}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
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
</div>
<!-- //contents --> --%>