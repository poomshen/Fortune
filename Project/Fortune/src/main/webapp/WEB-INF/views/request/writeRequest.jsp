<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

		} else if ($('#collabo_req_ID').val() == "") {
			alert("수신자 입력바랍니다. ");
			$('#collabo_req_ID').focus();
			return false;

		} else {
			alert("완료");
			 promodifyform.submit(); 
			return true;
		}
	}
	
	
	
</script>
<title>Insert title here</title>



</head>
<body>
	<div class="container">
		<form action="" method="post" name="promodifyform">
			프로젝트 제목 :<input type="text" name="collabo_req_title"
				id="collabo_req_title"><br> 프로젝트 내용 :
			<textarea rows="20" cols="20" name="collabo_req_text"></textarea>
			<script>
				CKEDITOR.replace('collabo_req_text');
			</script>

			작성자 : <input type="text" name="user_ID"
				value="${sessionScope.info.user_id}"><br> 진행 상태 :<input
				type="text" value="대기" name="collabo_req_state" readonly="readonly">&nbsp;
			<!-- 수신자 :<input type="text" name="collabo_req_ID" id="collabo_req_ID">	 -->			
			수신자 : 	<select id="collabo_req_ID" name="collabo_req_ID">
				<c:forEach items="${list}" var="list">
				<option value="${list.user_id}">${list.user_id}</option>
				</c:forEach>
				</select>
			<br>
			

			<input type="button" value="submit" onclick="promodify()"><br>
			<p>
				<a href="requestList.htm">취소하기</a>
			</p>


		</form>
	</div>
</body>
</html>