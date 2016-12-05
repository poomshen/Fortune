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
<div class="container" >
 
        <div style="padding:35px 50px; background-color: #194f89; color:white !important; text-align: center; font-size: 30px;">   
          <h4>ID/Password 찾기</h4>
        </div>
        
        <div style="padding:40px 50px;" style="margin: auto;">
        
            <table>
              <tr style="vertical-align:top">
              
                <td style="width:300px; border-right:1px solid gray; text-align:justify">
                <h3 style="color: black">ID 찾기</h3><br>
		         <label style="color: black">이름</label><input type="text" id="search_name" name="search_name" style="color: black;" placeholder="이름을 입력하세요"><br>
		         <label style="color: black">전화번호</label><input type="text" id="search_phone" name="search_phone" style="color: black;" placeholder="ex)01x-xxxx-xxxx"><br>
		         <label style="color: black">생년월일</label><input type="text" id="search_birth" name="search_birth" style="color: black;" placeholder="ex)2016-11-11"><br>
                </td>
                <td style="width:300px; padding-left:20px; text-align:justify">
                <h3 style="color: black">PWD 찾기</h3><br>
		         <label style="color: black">아이디</label><input type="text" id="search_id" name="search_id" style="color: black;" placeholder="아이디를 입력하세요"><br>
		         <label style="color: black">이름</label><input type="text" id="search_name2" name="search_name2" style="color: black;" placeholder="이름을 입력하세요"><br>
		         <label style="color: black">전화번호</label><input type="text" id="search_phone2" name="search_phone2" style="color: black;" placeholder="ex)01x-xxxx-xxxx"><br>
                </td>
              </tr>
  			</table>
		
        <div>
        <br>
            <input type="button" id="sbtn" name="sbtn" class="btn btn-primary" onclick="getid()" value="아이디 찾기">
            <input type="button" id="sbtn2" name="sbtn2" class="btn btn-primary" onclick="getpwd()" value="비밀번호 찾기">
          	<input type="button" onclick="back()" value="돌아가기">
        </div>
        
        </div>

    </div>













<!-- 	<h3>아이디 찾기^▽^/</h3>
	
<form action="">

<table>
  <tr style="vertical-align:top">
    <td style="width:190px; border-right:1px solid gray; padding-right:12px; text-align:justify">
    	이름 <input type="text" id="search_name" name="search_name" placeholder="이름을 입력하세요"><br>
		전화번호 <input type="text" id="search_phone" name="search_phone" placeholder="ex)01x-xxxx-xxxx"><br>
		생년월일 <input type="text" id="search_birth" name="search_birth" placeholder="ex)2016-11-11"><br>
	</td>
    <td style="width:190px; padding-left:12px; text-align:justify">
   		아이디 <input type="text" id="search_id" name="search_id" placeholder="아이디를 입력하세요"><br>
		이름 <input type="text" id="search_name2" name="search_name2" placeholder="이름을 입력하세요"><br>
		전화번호 <input type="text" id="search_phone2" name="search_phone2" placeholder="ex)01x-xxxx-xxxx"><br>
    </td>
  </tr>
</table>
		
	<div>
		<input type="button" id="sbtn" name="sbtn" onclick="getid()" value="아이디 찾기">
		<input type="button" id="sbtn2" name="sbtn2" onclick="getpwd()" value="비밀번호 찾기">
		<input type="button" onclick="back()" value="이전 으로">
	
	</div>
</form> -->
  
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.1.1.min.js"></script>  
<script type="text/javascript">
	$(function () {
		idsearch1 = false;
		idsearch2 = false;
		
	});
	
	
	function getid() {
		//alert($('#searchname').val());
		
		if($('#search_name').val() ==""){
			alert('이름 비었어요!');
			$('#search_name').focus();
		}else if($('#search_phone').val() ==""){
			alert('전화번호 비었어요!');
			$('#search_phone').focus();
		}else if(idsearch1 == false){
			alert('유효한 전화번호 형식이 아닙니다.');
			$('#search_phone').focus();
		}else if($('#search_birth').val() ==""){
			alert('생년월일 비었어요!');
			$('#search_birth').focus();
		}
		else{
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
					alert('ajax 제대로 안돔');
					location.href="index.htm";
				}
			});
		}
		
	}
	function getpwd() {
		//alert('버튼 누름');
		if($('#search_id').val() ==""){
			alert('아이디 비었어요!');
			$('#search_id').focus();
		}else if($('#search_name2').val() ==""){
			alert('이름 비었어요!');
			$('#search_name2').focus();
		}else if($('#search_phone2').val() ==""){
			alert('전화번호 비었어요!');
			$('#search_phone2').focus();
		}else if(idsearch2==false){
			alert('유효한 전화번호 형식이 아닙니다.');
			$('#search_phone2').focus();
		}else{
			$.ajax({
				type:"get",
				url:"pwdsearch.ajax",
				data:{"search_id":$('#search_id').val(),
					  "search_name2":$('#search_name2').val(),
					  "search_phone2":$('#search_phone2').val()},
				
				success:function(data){
					console.log("result 뭐야!?!?!?!?!!??"+data);
					if(data!=null && data!=""){
						console.log(data);
						alert('임시 비밀번호는 '+data+'입니다.');
						location.href="index.htm";
					}else if(data == 0){
						alert('해당 정보에 맞는 아이디가 없습니다. 정보를 확인해주세요');
					}else{
						alert('에러입니다. 관리자에게 문의하세요');
					}
					
				},
				error:function(){
					alert('ajax가 정상작동 안했음');
					location.href="index.htm";
				}
			
			});
		}
		
	}
	
	 $('#search_phone').keyup(function() {
		 var phoneRex = /^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$/;
	 	
		 if(phoneRex.test($('#search_phone').val())){
			 idsearch1 = true;
			 console.log(idsearch1);
	 	}else{     
	 		 idsearch1 = false;
	 		 console.log(idsearch1);
	 	}
	});
	 
	 $('#search_phone2').keyup(function() {
		 var phoneRex = /^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$/;
	 	
		 if(phoneRex.test($('#search_phone2').val())){
			 idsearch2 = true;
			 console.log(idsearch2);
	 	}else{     
	 		idsearch2 = false;
	 		 console.log(idsearch2);
	 	}
	});
	
	 function back() {
			
		location.href="index.htm";
	} 
			


































/* $(function () {
	idsearch1 = false;
	idsearch2 = false;
});

function getid() {
	//alert($('#searchname').val());
	
	if($('#search_name').val() ==""){
		alert('이름 비었어요!');
		$('#search_name').focus();
	}else if($('#search_phone').val() ==""){
		alert('전화번호 비었어요!');
		$('#search_phone').focus();
	}else if(idsearch1 == false){
		alert('유효한 전화번호 형식이 아닙니다.');
		$('#search_phone').focus();
	}else if($('#search_birth').val() ==""){
		alert('생년월일 비었어요!');
		$('#search_birth').focus();
	}
	else{
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
				alert('ajax 제대로 안돔');
				location.href="index.htm";
			}
		});
	}
	
}
function getpwd() {
	//alert('버튼 누름');
	if($('#search_id').val() ==""){
		alert('아이디 비었어요!');
		$('#search_id').focus();
	}else if($('#search_name2').val() ==""){
		alert('이름 비었어요!');
		$('#search_name2').focus();
	}else if($('#search_phone2').val() ==""){
		alert('전화번호 비었어요!');
		$('#search_phone2').focus();
	}else if(idsearch2==false){
		alert('유효한 전화번호 형식이 아닙니다.');
		$('#search_phone2').focus();
	}else{
		$.ajax({
			type:"get",
			url:"pwdsearch.ajax",
			data:{"search_id":$('#search_id').val(),
				  "search_name2":$('#search_name2').val(),
				  "search_phone2":$('#search_phone2').val()},
			
			success:function(data){
				console.log("result 뭐야!?!?!?!?!!??"+data);
				if(data!=null && data!=""){
					console.log(data);
					alert('임시 비밀번호는 '+data+'입니다.');
					location.href="index.htm";
				}else if(data == 0){
					alert('해당 정보에 맞는 아이디가 없습니다. 정보를 확인해주세요');
				}else{
					alert('에러입니다. 관리자에게 문의하세요');
				}
				
			},
			error:function(){
				alert('ajax가 정상작동 안했음');
				location.href="index.htm";
			}
		
		});
	}
	
}

 $('#search_phone').keyup(function() {
	 var phoneRex = /^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$/;
 	
	 if(phoneRex.test($('#search_phone').val())){
		 idsearch1 = true;
		 console.log(idsearch1);
 	}else{     
 		 idsearch1 = false;
 		 console.log(idsearch1);
 	}
});
 
 $('#search_phone2').keyup(function() {
	 var phoneRex = /^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$/;
 	
	 if(phoneRex.test($('#search_phone2').val())){
		 idsearch2 = true;
		 console.log(idsearch2);
 	}else{     
 		idsearch2 = false;
 		 console.log(idsearch2);
 	}
});



function back() {
	
	location.href="index.htm";
} */
	
</script>
</body>
</html>
