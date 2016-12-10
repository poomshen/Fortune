<!-- 
작성자  : 김지현
최초작업일 : 2016/12/10
최종수정일 : 2016/12/10
작업내용 : ID/PWD를 찾을 수 있다
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Riona - One Page Bootstrap Business Template</title>

<!-- CSS -->
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lato:400,700">
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/animate.css">
<link rel="stylesheet" href="assets/css/magnific-popup.css">
<link rel="stylesheet" href="assets/css/form-elements.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/media-queries.css">
<link rel="stylesheet" href="assets/css/hover.css">

<!-- Favicon and touch icons -->
<link rel="shortcut icon" href="assets/ico/four_leaf_clover2.png">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="assets/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="assets/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="assets/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="assets/ico/apple-touch-icon-57-precomposed.png">
	
<script src="alert_style/js/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="alert_style/css/sweetalert.css">
<style type="text/css">
.wrap-loading{ /*화면 전체를 어둡게 합니다.*/
	position: fixed;
	left:0;
	right:0;
	top:0;
	bottom:0;
 	/* background: rgba(33,33,33,0.09);*/ /*not in ie */
 	
 	/* 2016.12.07 김지현 
 	로딩 이미지 돌아가는동안 비활성화/화면 어둡게 하는 코드 추가*/
 	
 	background-color :  rgba(0,0,0,0.3);
	z-index : 100;

	filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#08212121', endColorstr='#08212121');    /* ie */
 }
.wrap-loading div{ /*로딩 이미지*/
	position: fixed;
	top:50%;
	left:50%;
	margin-left: -21px;
	margin-top: -21px;
}
.display-none{ /*감추기*/
	display:none;
}  
</style>


</head>
<body>
<!-- 로딩 gif화면 -->
<div class="wrap-loading display-none">
    <div><img src="./images/default.gif" style="width: 50; height: 50px;" /></div>
</div>
	<!-- Loader -->
	<div class="loader" style="display: none;">
		<div class="loader-img" style="display: none;"></div>
	</div>


	<!-- Top content -->
	<div class="top-content" style="position: relative; z-index: 0; background: none;">
		<div class="top-content-text wow fadeInUp animated" style="visibility: visible; animation-name: fadeInUp;"><br>
			<h3><a href="" style="color: rgba(255, 255, 255, 0.58);">ID/Password 찾기</a></h3>

			<div style="padding: 40px 0px; text-align: center; margin: auto;">
				<table style="margin: auto;">
					<tr style="vertical-align: top">
						<td style="width: 300px; padding-right: 30px; border-right: 1px solid white; text-align: justify">
							<h3 style="color: rgba(255, 255, 255, 0.6); text-align: center;">ID 찾기</h3>
							<br>

							<div class="input-group">
								<span class="addon"><i class="glyphicon glyphicon-font"
									aria-hidden="true"></i></span>
								<div class="form-group">
									<label class="sr-only" for="r-form-1-email">이름</label> 
									<input type="text" id="search_name" name="search_name" style="background-color: transparent; color: white;"
										class="form-control hvr-glow" placeholder="이름을 입력하세요"><br>
								</div>
							</div>
							
							<div class="input-group">
								<span class="addon"><i class="glyphicon glyphicon-phone"
									aria-hidden="true"></i></span>
								<div class="form-group">
									<label class="sr-only" for="r-form-1-email">전화번호</label><input
										type="text" id="search_phone" name="search_phone"
										style="background-color: transparent; color: white;"
										class="form-control hvr-glow" placeholder="ex)01x-xxxx-xxxx"><br>
								</div>
							</div>
							<div class="input-group">
								<span class="addon"><i
									class="glyphicon glyphicon-calendar" aria-hidden="true"></i></span>
								<div class="form-group">
									<label class="sr-only" for="r-form-1-email">생년월일</label><input
										type="text" id="search_birth" name="search_birth"
										style="background-color: transparent; color: white;"
										class="form-control hvr-glow" placeholder="생년월일 ex)2016-11-11"><br>
								</div>
							</div>
						</td>
						<td style="width: 300px; padding-left: 20px; text-align: justify">
							<h3 style="color: rgba(255, 255, 255, 0.6); text-align: center;">PWD 찾기</h3>
							<br>

							<div class="input-group">
								<span class="addon"><i class="glyphicon glyphicon-user"
									aria-hidden="true"></i></span>
								<div class="form-group">
									<label class="sr-only" for="r-form-1-email">아이디</label><input
										type="text" id="search_id" name="search_id"
										style="background-color: transparent; color: white;"
										class="form-control hvr-glow" placeholder="아이디를 입력하세요"><br>
								</div>
							</div>

							<div class="input-group">
								<span class="addon"><i class="glyphicon glyphicon-font"
									aria-hidden="true"></i></span>
								<div class="form-group">
									<label class="sr-only" for="r-form-1-email">이름</label><input
										type="text" id="search_name2" name="search_name2"
										style="background-color: transparent; color: white;"
										class="form-control hvr-glow" placeholder="이름을 입력하세요"><br>
								</div>
							</div>

							<div class="input-group">
								<span class="addon"><i class="glyphicon glyphicon-phone"
									aria-hidden="true"></i></span>
								<div class="form-group">
									<label class="sr-only" for="r-form-1-email">전화번호</label><input
										type="text" id="search_phone2" name="search_phone2"
										style="background-color: transparent; color: white;"
										class="form-control hvr-glow" placeholder="ex)01x-xxxx-xxxx"><br>
								</div>
							</div>
						</td>
					</tr>
				</table>

				<!-- search button -->
				<div>
					<br>
					<button id="sbtn" name="sbtn" style="margin-left: 10%"
						class="btn hvr-forward" onclick="getid()">
						<span class="glyphicon glyphicon-search">&nbsp;ID찾기</span>
					</button>
					<button id="sbtn2" name="sbtn2" style="margin-left: 30%"
						class="btn hvr-forward" onclick="getpwd()">
						<span class="glyphicon glyphicon-search">&nbsp;PWD찾기</span>
					</button>
					<br><br><br>
					<button class="btn hvr-forward" style="margin-left: 10%" onclick="back()">
						<span class="glyphicon glyphicon-repeat" aria-hidden="true">&nbsp;Back</span>
					</button>
				</div>

			</div>
		</div>
	</div>

	<div class="backstretch"
		style="left: 0px; top: 0px; overflow: hidden; margin: 0px; padding: 0px; height: 609px; width: 972px; z-index: -999998; position: absolute;">
		<img src="assets/img/backgrounds/1.jpg"
			style="position: absolute; margin: 0px; padding: 0px; border: none; width: 1082.67px; height: 609px; max-height: none; max-width: none; z-index: -999999; top: 0px; left: -55.3333px;">
	</div>

<!-- Javascript -->
<script src="assets/js/jquery-1.11.1.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/jquery.backstretch.min.js"></script>
<script src="assets/js/wow.min.js"></script>
<script src="assets/js/jquery.magnific-popup.min.js"></script>
<script src="assets/js/masonry.pkgd.min.js"></script>
<script src="assets/js/scripts.js"></script>
<script type="text/javascript">
	$(function () {
		idsearch1 = false;
		idsearch2 = false;
		
	});
		
	function getid() {
		//alert($('#searchname').val());
		
		if($('#search_name').val() ==""){
			swal('이름 비었어요!');
			$('#search_name').focus();
		}else if($('#search_phone').val() ==""){
			swal('전화번호 비었어요!');
			$('#search_phone').focus();
		}else if(idsearch1 == false){
			swal('유효한 전화번호 형식이 아닙니다.');
			$('#search_phone').focus();
		}else if($('#search_birth').val() ==""){
			swal('생년월일 비었어요!');
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
						//swal('아이디는 : '+ data + '입니다');
						swal({
				        	   title: "아이디는 "+data+" 입니다 ",

				        	   type: "success",
				        	   showCancelButton: false,
				        	   confirmButtonColor: "#194f89",
				        	   confirmButtonText: "확인",
				        	   closeOnConfirm: false
				        	 },
				        	 function(){
					           location.href="index.htm";
				        	 });
						
					}else if(data == ""){
						swal('해당 정보에 맞는 아이디가 없습니다. 정보를 확인해주세요');
					}else{
						swal('에러입니다. 관리자에게 문의하세요');
					}
					
				},
				beforeSend:function(){
			           $('.wrap-loading').removeClass('display-none');
			    },
			    complete:function(){
			    	   $('.wrap-loading').addClass('display-none');
			    	   
			    },
				error:function(){
					swal('비밀번호 찾기ajax 제대로 안돔');
					//location.href="index.htm";
				}
			});
		}
		
	}
	function getpwd() {
		//alert('버튼 누름');
		if($('#search_id').val() ==""){
			swal('아이디 비었어요!');
			$('#search_id').focus();
		}else if($('#search_name2').val() ==""){
			swal('이름 비었어요!');
			$('#search_name2').focus();
		}else if($('#search_phone2').val() ==""){
			swal('전화번호 비었어요!');
			$('#search_phone2').focus();
		}else if(idsearch2==false){
			swal('유효한 전화번호 형식이 아닙니다.');
			$('#search_phone2').focus();
		}else{
			$.ajax({
				type:"get",
				url:"pwdsearch.ajax",
				data:{"search_id":$('#search_id').val(),
					  "search_name2":$('#search_name2').val(),
					  "search_phone2":$('#search_phone2').val()},
				
				success:function(data){
					//console.log("result 뭐야!?!?!?!?!!??"+data);
					if(data!=null && data!=""){
						//console.log(data);					
						
					}else if(data == 0){
						swal('해당 정보에 맞는 계정이 없습니다. 정보를 확인해주세요');
					}else{
						swal('에러입니다. 관리자에게 문의하세요');
					}
					
				},
			      beforeSend:function(){
			           $('.wrap-loading').removeClass('display-none');
			       },
			       complete:function(){
			           $('.wrap-loading').addClass('display-none');
			           swal({
			        	   title: "메일로 임시 비밀번호를 보냈습니다",

			        	   type: "success",
			        	   showCancelButton: false,
			        	   confirmButtonColor: "#194f89",
			        	   confirmButtonText: "확인",
			        	   closeOnConfirm: false
			        	 },
			        	 function(){
				           location.href="index.htm";
			        	 });
			       },
				error:function(){
					swal('ajax가 정상작동 안했음');
					//location.href="index.htm";
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

</script>

</body>
</html>
