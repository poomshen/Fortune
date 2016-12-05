<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
function modify() {
	 $('#menuView3').empty();
	 
	if($('#collabo_req_title').val() == "") {
		alert("협업 제목을 입력하세요 ");
		$('#collabo_req_title').focus();
		return false;
	}else{
			alert("완료");
			modifyform.submit(); 
			return true;
	}
	
}

</script>
<title>Insert title here</title>
</head>
<body>



<div class="container">
	<form action="proEdit.htm" method="post" name="modifyform" enctype="multipart/form-data">
		<div class="col-sm-1"></div>
		<div class="col-sm-7">
			
			<br>
			<br>
			<div class="form-group has-success">
			<input type="hidden" name="collabo_req_index" value="${list.collabo_req_index}">
			<input type="hidden" name="collabo_req_no" value="${list.collabo_req_no}">
			
			
				<div>
					<label>협업 제목 :</label>
					 <input type="text"
						name="collabo_req_title" id="collabo_req_title"
						class="form-control" placeholder="제목을 입력하세요" value="${list.collabo_req_title}">
				</div>
			</div>
			<div class="form-group has-success">
				<div>
					<label>첨부파일 :</label>
					 <input type="file" name="files[0]" class="form-control" value="${list.collabo_req_filesrc}">
				</div>
			</div>

			<div class="form-group has-success">
			
				<label>협업 내용 :</label>
				<textarea rows="4" cols="50" class="form-control"
					name="collabo_req_text" id="collabo_req_text">${list.collabo_req_text}</textarea>
				<script>
                
                CKEDITOR.replace( 'collabo_req_text' );
            </script>
			</div>
			<br>
			<div class="form-group has-success">
				<label>요청발신자 :</label>
				 <input type="text" 
					class="form-control" value="${list.user_ID}" readonly="readonly" >
			</div>
			<div class="form-group has-success">
				<label>협업 날짜</label>
				 <input type="text" 
					class="form-control" value="${list.collabo_req_date}" readonly="readonly" >
			</div>
			<br>
			
					</div>

		<div class="col-sm-1"></div>
		<div class="col-sm-5" style="text-align: right" >
			<br> 
			<input type="button" class="btn btn-default" value="저장" onclick="modify()">
			<a  class="btn btn-default" href="listReplyRequest.htm" >취소하기</a>
			
			
		</div>
		<br>
		<br>
	</form>
</div>



</body>
</html>