<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="//cdn.ckeditor.com/4.5.11/standard/ckeditor.js"></script>

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
			<!-- <div class="panel-heading">안녕하세요, 공지사항을 써봅시다</div> -->
			<div class="panel-body">
				<div class="row">
					<div class="col-lg-12">
						<form:form role="form" action="" method="post" enctype="multipart/form-data">
							<div class="form-group">
								<input class="form-control" placeholder="제목을 작성해주세요." type="text" name="notice_title" id="notice_title" style="color: #666;">
									<form:errors path="notice_title"/>
							</div>
							<!-- <div class="form-group">
								<p class="form-control-static">admin@fortune.com</p>
							</div> -->
							<div class="form-group">
							<input type="file" name="file" id="File">
							</div>
							<div class="form-group">
								<textarea name="notice_text" id="notice_text"></textarea>
								<form:errors path="notice_text"/>
								<script>
								CKEDITOR.replace('notice_text',{
									filebrowserImageUploadUrl: '${contextPath}/noticeImageUpload.htm'
								});
								</script>								
							</div>
							<div class="form-group container" align="center">
								<input type="submit" class="btn btn-primary" value="저장">
								<input type="button" class="btn btn-primary" onclick="history.go(-1)" value="취소">
							</div>
						</form:form>
					</div>
				</div>
				<!-- /.row (nested) -->
			
			<!-- /.panel-body -->
		
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>