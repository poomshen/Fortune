<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
hr.hor{height: 50px; width:0px; border-right:0px;}
</style>
<title>Insert title here</title>
</head>
<body>
	<h3>아이디 찾기^▽^/</h3>
	
<form action="">
		<!-- 이름 <input type="text" id="search_name" name="search_name"><br>
		전화번호 <input type="text" id="search_phone" name="search_phone"><br>
		생년월일 <input type="text" id="search_birth" name="search_birth"><br> -->
<table>
  <tr style="vertical-align:top">
    <td style="width:190px; border-right:1px solid gray; padding-left:20px; padding-right:12px; text-align:justify">
    	이름 <input type="text" id="search_name" name="search_name"><br>
		전화번호 <input type="text" id="search_phone" name="search_phone"><br>
		생년월일 <input type="text" id="search_birth" name="search_birth"><br>
	</td>
    <td style="width:190px; padding-left:20px; text-align:justify">
   		아이디 <input type="text" id="search_id" name="search_id"><br>
	<!-- 	이름 <input type="text" id="search_name2" name="search_name2"><br>
		전화번호 <input type="text" id="search_phone2" name="search_phone2"><br> -->
    </td>
  </tr>
</table>
		
	<div>
		<input type="button" id="sbtn" name="sbtn" onclick="getid()" value="아이디 찾기">
		<input type="button" id="sbtn2" name="sbtn2" onclick="getpwd()" value="비밀번호 찾기">
		<input type="button" onclick="back()" value="이전 으로">
	
	</div>
</form>
  
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.1.1.min.js"></script>  
<script type="text/javascript">
function getid() {
	//alert($('#searchname').val());
	$.ajax({
		type:"get",
		url:"idsearch.ajax",
		data:{"search_name":$('#search_name').val(),
			  "search_phone":$('#search_phone').val(),
			  "search_birth":$('#search_birth').val()},
		success:function(data){
			//console.log('>'+data+'<');
			if(data != null && data != ""){
				//alert('null 값임?');
				alert('아이디는 : '+ data + '입니다');
				location.href = "index.htm";
			}else if(data == ""){
				alert('해당 정보에 맞는 아이디가 없습니다. 정보를 확인해주세요');
			}else{
				alert('에러입니다. 관리자에게 문의하세요');
			}
			
		},
		error:function(){
			alert('에러에요');
			location.href="index.htm";
		}
	});
}
function getpwd() {
	//alert('버튼 누름');
	
	$.ajax({
		type:"get",
		url:"pwdsearch.ajax",
		data:{"search_id":$('#search_id').val()},
		
		success:function(data){
			console.log(data);
			alert('임시 비밀번호는 '+data+'입니다.');
		},
		error:function(){
			alert('에러');
		}
	
	});
}

function back() {
	
	location.href="index.htm";
}
	
</script>
</body>
</html>
