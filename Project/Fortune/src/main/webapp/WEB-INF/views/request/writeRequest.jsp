<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//cdn.ckeditor.com/4.5.11/standard/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
	
	function promodify() {
		if ($('#collabo_req_title').val() == "") {
			alert("제목 입력바랍니다 ");
			$('#collabo_req_title').focus();
			return false;
			

		} else {
			alert("완료"+$('#collabo_req_ID').val());
			
			send($('#collabo_req_ID').val());
			 promodifyform.submit(); 
			return true;
		}
	}
	
	
	
</script>
<title>Insert title here</title>



</head>
<body>
	<div class="container">
	<form action="" method="post" name="promodifyform" enctype="multipart/form-data">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			
			<br>
			<br>
			<div class="form-group has-success">

				<div>
					<label>프로젝트 제목 :</label>
					 <input type="text"
						name="collabo_req_title" id="collabo_req_title"
						class="form-control" placeholder="제목을 입력하세요" >
				</div>
			</div>
			<div class="form-group has-success">
				<div>
					<label>첨부파일 :</label>
					 <input type="file" name="files[0]" id="collabo_req_filesrc" class="form-control">
				</div>
			</div>

			<div class="form-group has-success">
			
				<label>프로젝트 내용 :</label>
				<textarea rows="4" cols="50" class="form-control"
					name="collabo_req_text" id="collabo_req_text" ></textarea>
				<script>
                
                CKEDITOR.replace( 'collabo_req_text' );
            </script>
			</div>
			<br>
			<div class="form-group has-success">
				<label>작성자 :</label>
				 <input type="text" name="user_ID"
					class="form-control" value="${sessionScope.info.user_id}" readonly="readonly" >
			</div>
			<br>
			<div class="form-group has-success">
				<label>진행 상태 :</label>
				 <input type="text" name="collabo_req_state" value="대기"
					class="form-control" readonly>
			</div>
			<br>
			<div class="form-group has-success">
				<label>수신자 :</label>
				 <select id="collabo_req_ID" name="collabo_req_ID" 
									class="form-control">
				<c:forEach items="${list}" var="list">
					<option value="${list.user_id}">${list.user_id}</option>
				</c:forEach>
					</select>
			</div>
			<br>
		</div>

		<div class="col-sm-2"></div>
		<div class="col-sm-7" style="text-align: right" >
			<br> 
			<input type="button" class="btn btn-default" value="저장" onclick="promodify()">
			
			<a href="requestList.htm" class="btn btn-default">취소하기</a>
		</div>
		<br>
		<br>
	</form>
</div>

			
					
</body>
</html>