<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//cdn.ckeditor.com/4.5.11/standard/ckeditor.js"></script>
<title>Insert title here</title>



</head>
<body>
<div class="container">
<form action="" method="post">
프로젝트 제목 :<input type="text" name="collabo_req_title"><br>
프로젝트 내용 :<textarea rows="20" cols="20" name="collabo_req_text"></textarea>
            <script>
                CKEDITOR.replace( 'collabo_req_text' );
            </script>

작성자 : <input type="text" name="user_ID"><br>
진행 상태 :<input type="text" value="대기" name="collabo_req_state" readonly="readonly"><br>


<input type="submit" value="submit"><br>
<p><a href="requestList.htm">취소하기</a></p>


</form>
</div>
</body>
</html>