<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.cke_top {
	/* border-bottom: 1px solid #b6b6b6; */
	padding: 6px 8px 2px;
	border: none;
	white-space: normal;
	box-shadow: 0 1px 0 #fff inset;
	background: rgba(51, 122, 183, 0.33);
	filter: progid:DXImageTransform.Microsoft.gradient(gradientType=0,
		startColorstr='#f5f5f5', endColorstr='#cfd1cf');
}

.cke_top, .cke_contents, .cke_bottom {
	display: block;
	overflow: hidden;
}

.cke_chrome {
	display: block;
	padding: 0;
	border: none;
	box-shadow: 0 0 3px rgba(0, 0, 0, .15);
}

.cke_bottom {
	padding: 6px 8px 2px;
	position: relative;
	border: none;
	box-shadow: 0 1px 0 #fff inset;
	background: #bbd3e7;
	filter: progid:DXImageTransform.Microsoft.gradient(gradientType=0,
		startColorstr='#ebebeb', endColorstr='#cfd1cf');
}

.btn-default {
	height: 52px;
	margin-top: 15px;
	padding: 0 20px;
	padding-top: px;
	padding-right: 20px;
	padding-bottom: 0px;
	padding-left: 20px;
	vertical-align: middle;
	background: rgb(25, 79, 137);
	border: 2;
	font-family: 'Lato', sans-serif;
	font-size: 16px;
	font-weight: 200;
	line-height: 30px;
	color: #fff;
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	border-radius: 6px;
	text-shadow: none;
	-moz-box-shadow: none;
	-webkit-box-shadow: none;
	box-shadow: darkgray;
	-o-transition: all .3s;
	-moz-transition: all .3s;
	-webkit-transition: all .3s;
	-ms-transition: all .3s;
	transition: all .3s;
	text-align: center;
	padding-top: 10px;
}

.btn-default:hover {
	color: #fff;
	background-color: #194f89;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//cdn.ckeditor.com/4.5.11/standard/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="alert_style/js/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="alert_style/css/sweetalert.css">
<script type="text/javascript">
	
	function promodify() {
		if ($('#collabo_req_title').val() == "") {
			swal("제목 입력바랍니다 ");
			$('#collabo_req_title').focus();
			return false;
			

		} else if ($('#collabo_req_text').val() == "") {
			swal("내용 입력바랍니다 ");
			$('#collabo_req_text').focus();
			return false;
			

		} else {
			
			
			
			 promodifyform.submit(); 
	
			// send($('#collabo_req_ID').val());
			
		
			return true;
		}
	}
	
	
	
</script>
<title>[효율적인업무 For春]</title>



</head>
<body>
<div class="col-lg-12">
	<h1 class="page-header">[프로젝트 생성]</h1>
</div>
	<hr>
	<div class="col-lg-12" align="left">
	<div class="panel-body" style="width: 80%;">
		<form action="" method="post" name="promodifyform" enctype="multipart/form-data">
			<!-- 새로운 요청 -->
			<div style="width: 100%;" >
				<div class="row" style="margin-top: 5px;">
					<div class="col-sm-3" style="margin-top: 10px;">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>신규 / 기존 프로젝트 </label>
					</div>
					<div class="col-sm-9">
						<select name="collabo_req_no" id="collabo_req_no" class="form-control" style="color:#666;">
							<option value="${collabo_req_no}">신규 프로젝트</option>
				 			<c:forEach var="pname" items="${pList}">
								<option value="${pname.collabo_req_no }">${pname.project_name}</option>
							</c:forEach> 
						</select>
					</div>
				</div>
			</div>
			
			<!-- 프로젝트 명 -->
			<div style="width: 100%;" >
				<div class="row" style="margin-top: 5px;">
					<div class="col-sm-3" style="margin-top: 10px;">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>프로젝트명</label>
					</div>
					<div class="col-sm-9">
						<input style="color:#666;" type="text" name="collabo_req_title" id="collabo_req_title"
							class="form-control" placeholder="프로젝트 명을 입력하세요">
					</div>
				</div>
			</div>
			
			<!-- 첨부파일 -->
			<div style="width: 100%;" >
				<div class="row" style="margin-top: 5px;">
					<div class="col-sm-3" style="margin-top: 10px;">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>첨부파일 </label>
					</div>
					<div class="col-sm-9">
						<input style="color:#666;" type="file" name="files[0]" id="collabo_req_filesrc" class="form-control">
					</div>
				</div>
			</div>
			
			<!-- 프로젝트 내용 -->
			<div style="width: 100%;" >
				<div class="row" style="margin-top: 5px;">
					<div class="col-sm-3" style="margin-top: 10px;">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>프로젝트 내용 </label>
					</div>
					<div class="col-sm-9">
						<textarea style="color:#666;" rows="4" cols="50" class="form-control" name="collabo_req_text" id="collabo_req_text"></textarea>
					</div>
				</div>
			</div>
			
			<!-- 수신자 -->
			<div style="width: 100%;" >
				<div class="row" style="margin-top: 5px;">
					<div class="col-sm-3" style="margin-top: 10px;">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>수신자</label>
					</div>
					<div class="col-sm-9">
						<select style="color:#666;" id="collabo_req_ID" name="collabo_req_ID" class="form-control">
						<c:forEach items="${list}" var="list">
							<option value="${list.user_id}">[${list.dept_name}] 부장:${list.user_name}</option>
						</c:forEach> 
					</select>
					</div>
				</div>
			</div>

				<!-- 작성자 -->
				<input type="hidden" name="user_ID" id="user_ID" class="form-control"
					value="${sessionScope.info.user_id}" readonly="readonly">



				<!-- 진행상태 -->
				<input type="hidden" name="collabo_req_state" id="collabo_req_state" value="대기"
					class="form-control" readonly>


			<div class="col-sm-1"></div>
			<div class="col-sm-6" style="text-align: right; margin-top: 5px;">
				<input type="button" class="btn btn-primary" onclick="promodify()" value="등록">
				&nbsp;&nbsp; <a href="FortuneMain.htm"><input type="button" class="btn btn-primary" value="취소"></a>
			<br> <br>
			</div>
			
		</form>
		</div>
	</div>


</body>
</html>