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
	<!-- 	<div class="panel panel-default"> -->
			<!-- <div class="panel-heading">안녕하세요, 관리자의 공지사항 상세보기랍니다~</div> -->
			<div class="panel-body">
				<div class="dataTable_wrapper">
					<table class="table table-striped table-bordered table-hover"
						id="dataTables-example">
						<thead>
							<tr>
								<th>제목</th>
								<th>작성일</th>
								<th>조회수</th>
								<th>첨부파일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>${noticeDetail.notice_title}</td>
								<td>${noticeDetail.notice_date}</td>
								<td>${noticeDetail.notice_hits}</td>
								<c:if test="${empty noticeDetail.notice_filename_org}">
									<td>첨부파일이 없습니다.</td>
								</c:if>
								<c:if test="${!empty noticeDetail.notice_filename_org}">
									<td>
										<%-- <input type="hidden" id="notice_no" value="${noticeDetail.notice_no}"> --%>
										<a
										href="noticeFileDownload.htm?notice_no=${noticeDetail.notice_no}&notice_filename_re=${noticeDetail.notice_filename_re}&notice_filename_org=${noticeDetail.notice_filename_org}">${noticeDetail.notice_filename_org}</a>
									</td>
								</c:if>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="4">${noticeDetail.notice_text}</td>
							</tr>
						</tfoot>
					</table>
				
			</div>
			
			<!-- /.panel-body -->
			<div class="form-group container" align="center">
				<security:authorize access="hasAnyRole('ROLE_ADMIN')">
					<a href="noticeUpdate.htm?notice_no=${noticeDetail.notice_no}"><input type="button" class="btn btn-primary" value="수정"></a>
					<a href="noticeDelete.htm?notice_no=${noticeDetail.notice_no}"><input type="button" class="btn btn-primary" value="삭제"></a>
				</security:authorize>
				<a href="noticeList.htm"><input type="button" class="btn btn-primary" value="돌아가기"></a>
			</div>
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>