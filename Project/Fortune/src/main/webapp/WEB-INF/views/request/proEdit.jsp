<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="//cdn.ckeditor.com/4.5.11/standard/ckeditor.js"></script>
<title>Insert title here</title>
</head>
<body>
<div>
	<form action="" method="post">

		

		<dl>
			<dt>프로젝트 제목</dt>
			<dd><input name="collabo_req_title" value="${list.collabo_req_title}"></dd>
		</dl>
		
		<dl>
			<dt>프로젝트 구분자</dt>
			<dd>${list.collabo_req_index}</dd>
		</dl>
		<dl>
			<dt>프로젝트 요청번호</dt>
			<dd>${list.collabo_req_no}</dd>
		</dl>
		<dl>
			<dt>프로젝트 작성자</dt>
			<dd>${list.user_ID}</dd>
		</dl>
		<dl>
			<dt>프로젝트 날짜</dt>
			<dd>${list.collabo_req_date}</dd>
		</dl>
		<dl>
			<dt>프로젝트 내용</dt>
			<dd><textarea name="collabo_req_text">${list.collabo_req_text}</textarea>
			 <script>
                CKEDITOR.replace( 'collabo_req_text' );
            </script>
			</dd>
		
		</dl>
		
			<input type="submit" value="submit" />
			<a href="proDetail.htm?collabo_req_index=${list.collabo_req_index}">취소</a>
		
	</form>
</div>

</body>
</html>