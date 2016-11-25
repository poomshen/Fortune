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

<title>공지사항 작성</title>


<!-- DataTables CSS -->
<link
	href="../bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="../bower_components/datatables-responsive/css/dataTables.responsive.css"
	rel="stylesheet">

</head>

<body>

	<div id="wrapper">
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Forms</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">공지사항 작성하기</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-6">
									<form role="form" action="" method="post" enctype="multipart/form-data">
										<div class="form-group">
											<label>제목</label> 
											<input class="form-control" placeholder="제목을 작성해주세요." type="text" name="notice_title" id="notice_title">
										</div>
										<div class="form-group">
											<label>작성자</label>
											<p class="form-control-static">admin@fortune.com</p>
										</div>
										<div class="form-group">
											<label>첨부파일</label> 
											<input type="file" name="file" id="File">
										</div>
										<div class="form-group">
											<label>작성내용</label>
											<textarea class="form-control" rows="3" name="notice_text" id="notice_text"></textarea>
										</div>
										<button type="submit" class="btn btn-default">저장</button>
										<a href="notice.noticeList.htm">공지사항 목록보기</a>
									</form>
								</div>
							</div>
							<!-- /.row (nested) -->
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
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





<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
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
 --%>