<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Bootstrap Admin Theme</title>


<!-- DataTables CSS -->
<link
	href="../bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="../bower_components/datatables-responsive/css/dataTables.responsive.css"
	rel="stylesheet">



<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	<div id="wrapper">
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
						<!-- 검색폼 추가 -->
						<div>
							<form name="searchform" id="searchform" action="noticeSearch.htm" method="get">
								<select name="selectvalue" id="selectvalue" class="cd-select">
									<option style="text-align:center" value="notice_title">제목</option>
									<option style="text-align:center" value="notice_text">내용</option>
								</select>
								<input type="text" name="searchvalue">
								<input type="submit" class="btn btn-primary" id="search_btn" value="검색">
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
							<div>
								<table>
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
	</div>
	<!-- /#wrapper -->




	<!-- DataTables JavaScript -->
	<script
		src="../bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
	<script
		src="../bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>


	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>
		$(document).ready(function() {
			$('#dataTables-example').DataTable({
				responsive : true
			});
		});
	</script>

</body>

</html>
