<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">[공지사항 글쓰기]</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">안녕하세요, 공지사항을 써봅시다</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-lg-12">
						<form role="form" action="" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
								<label>제목</label> <input class="form-control"
									placeholder="제목을 작성해주세요." type="text" name="notice_title"
									id="notice_title">
							</div>
							<div class="form-group">
								<label>작성자</label>
								<p class="form-control-static">admin@fortune.com</p>
							</div>
							<div class="form-group">
								<label>첨부파일</label> <input type="file" name="file" id="File">
							</div>
							<div class="form-group">
								<label>작성내용</label>
								<textarea class="form-control" rows="3" name="notice_text"
									id="notice_text"></textarea>
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