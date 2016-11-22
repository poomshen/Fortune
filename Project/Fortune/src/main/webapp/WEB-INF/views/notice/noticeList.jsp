<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 목록</title>
</head>
<body>

	<%-- 
	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>조회수</th>
			<th>작성일</th>
		</tr>
		<c:forEach items="${noticelist}" var="noticedto">
			<tr>
				<td>${noticedto.notice_no}</td>
				<td><a href="noticeDetail.htm?notice_no=${noticedto.notice_no}">${noticedto.notice_title}</a></td>
				<td>${noticedto.notice_hits}</td>
				<td>${noticedto.notice_date}</td>
			</tr>
		</c:forEach>
	</table>
	<table width="500">
		<tr>
			<td align="center"><c:if test="${pg>block}">
						[<a href="noticeList.htm?pg=1">◀◀</a>]
						[<a href="noticeList.htm?pg=${from_page-1}">◀</a>]		
					</c:if> <c:if test="${pg<=block}">
						[<span style="color: gray">◀◀</span>]	
						[<span style="color: gray">◀</span>]
					</c:if> <c:forEach begin="${from_page}" end="${to_page}" var="i">
					<c:if test="${i==pg}">[${i}]</c:if>
					<c:if test="${i!=pg}">
							[<a href="noticeList.htm?pg=${i}">${i}</a>]
						</c:if>
				</c:forEach> <c:if test="${to_page<all_page}">
						[<a href="noticeList.htm?pg=${to_page+1}">▶</a>]
						[<a href="noticeList.htm?pg=${all_page}">▶▶</a>]
					</c:if> <c:if test="${to_page>=all_page}">
						[<span style="color: gray">▶</span>]
						[<span style="color: gray">▶▶</span>]
					</c:if></td>
		</tr>
	</table>
	<p>
		<a href="noticeInsert.htm">글작성하기</a>
 
	</p>--%>


	<div id="page-wrapper">
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
						<!-- /.table-responsive -->
						<div class="well">
							<h4>DataTables Usage Information</h4>
							<p>
								DataTables is a very flexible, advanced tables plugin for
								jQuery. In SB Admin, we are using a specialized version of
								DataTables built for Bootstrap 3. We have also customized the
								table headings to use Font Awesome icons in place of images. For
								complete documentation on DataTables, visit their website at <a
									target="_blank" href="https://datatables.net/">https://datatables.net/</a>.
							</p>
							<a class="btn btn-default btn-lg btn-block" target="_blank"
								href="https://datatables.net/">View DataTables Documentation</a>
						</div>
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
	</div>
	<!-- /#page-wrapper -->

</body>
</html>