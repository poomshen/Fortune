<!-- 
작성자  : 김지현
최초작업일 : 2016/12/10
최종수정일 : 2016/12/10
작업내용 : 회원 정보를 db에 넣는다
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("UTF-8");
%>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입 페이지</title>

<!-- CSS -->
<link rel="stylesheet"
   href="http://fonts.googleapis.com/css?family=Lato:400,700">
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
   href="assets/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/animate.css">
<link rel="stylesheet" href="assets/css/magnific-popup.css">
<link rel="stylesheet" href="assets/css/form-elements.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/media-queries.css">
<link rel="stylesheet" href="assets/css/hover.css">
 <link rel="stylesheet" href="assets/css/style6.css">
      


<!-- Favicon and touch icons -->
<link rel="shortcut icon" href="assets/ico/favicon.png">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
   href="assets/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
   href="assets/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
   href="assets/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
   href="assets/ico/apple-touch-icon-57-precomposed.png">

<link href="http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900" rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800" rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<link href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.css" rel="stylesheet" type="text/css">

<script src="alert_style/js/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="alert_style/css/sweetalert.css">
<style type="text/css">
.button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 5px 5px; 
    text-align: right;
    text-decoration: none;
    display: inline-block;
    font-size: 10px;
    
    }
    
</style>

</head>

<body>

   <div class="backstretch" style="left: 0px;top: 0px;overflow: hidden;margin: 0px;padding: 0px; height: 1200px;width: 1600px; z-index: -999998;position: absolute;">
   <img src="assets/img/backgrounds/1.jpg" style="position: absolute;margin: 0px;padding: 0px;border: none;width: 1700px;height: 1200px;max-height: none;max-width: none;z-index: -999999;left: -51.6984px;top: 0px;"></div>
 
 
   <!-- Loader -->
   <div class="loader" style="display: none;">
      <div class="loader-img" style="display: none;"></div>
   </div>


   <!-- Top content -->
   <div class="con" style="position: relative;z-index: 0;background: none;padding-bottom: 0px;">
   <!--       <div class="moco"> -->
              
                    <h3 class="modal-title" id="modal-login-label">JOIN</h3>
             
                 <div class="moco-body">
                 <!--     <div class="container"> -->

<form class="form-horizontal" action="JoinSubmit.htm" method="post" id="contact_form">
<fieldset>
  
<!-- 아이디  입력-->

<div class="form-group">
	<div class="inner-addon left-addon" style="margin-left:37%">
		<span class="field">
			<span class="addon" style="padding-bottom: 0px;"><i class="glyphicon glyphicon-user"></i></span>
			    <input type="text" id="id" name="user_id" class="form-control" style="width: 340px;margin-left:20px;" required="required">
			    <label id="idselect" class="col-md-4 control-label" style="text-align:center;margin-left:38px;color: rgba(255, 255, 255, 0.53);" for="id">아이디 입력</label> 
			  	<br><br>
			  <input type="button" id="idchk" name="idchk" style="width: 180px; margin-left: 100px; height:50; font-size: 15px; display: inline-block;" class="col-sm-3 btn hvr-forward" value="이메일 중복확인" onclick="idchkclk()"> 		  	
		</span>
	</div>
</div>
  

<!-- 비밀번호  입력-->
<div class="form-group">
	<div class="inner-addon left-addon" style="margin-left:37%">
		<span class="field">
		 <span class="addon" style=" padding-bottom: 0px;"><i class="glyphicon glyphicon-lock"></i></span> 
		    <input type="password" style="background-color:transparent; color:#fff; border: none; border-bottom: 1.5px solid rgba(255, 255, 255, 0.56); width: 340px; margin-left:20px;" class="form-control"
				 name="user_password" id="user_password" required="required">
		    <label class="col-md-4 control-label" style="text-align:center;margin-left:38px;color: rgba(255, 255, 255, 0.53);" for="pwd">비밀번호 입력</label>
		</span>
	</div>
</div>

<!-- 비밀번호  확인-->
<div class="form-group">
	<div class="inner-addon left-addon" style="margin-left:37%">
		<span class="field">
		 <span class="addon" style=" padding-bottom: 0px;"><i class="glyphicon glyphicon-lock"></i></span> 
		    <input type="password" name="user_password_chk" id="user_password_chk" class="form-control" style="
		    background-color:transparent; color:#fff; border: none; border-bottom: 1.5px solid rgba(255, 255, 255, 0.56); width: 340px;margin-left:20px;" required="required">
		    <label id="pwdchklb" class="col-md-4 control-label" style="text-align:center;margin-left:38px;color: rgba(255, 255, 255, 0.53);" for="pwd">비밀번호 확인</label>
		</span>
	</div>
</div>

<!-- 이름 입력-->
<div class="form-group">
	<div class="inner-addon left-addon" style="margin-left:37%">
		<span class="field">
			<span class="addon" style="padding-bottom: 0px;"><i class="glyphicon glyphicon-font"></i></span> 
			<input type="text" name="user_name" id="name" class="form-control" style="width: 340px;margin-left:20px;" required="required">
			<label class="col-md-4 control-label" style="text-align:center;margin-left:38px;color: rgba(255, 255, 255, 0.53);" for="pwd">이름 입력</label>
		</span>
	</div>
</div>

<!--성별 입력-->
<div class="form-group">
<div class="inner-addon left-addon" style="margin-left:2%">
<span class="field">


<input type="radio" name="user_gender" id="gender" value="male" checked="">남자
<input type="radio" name="user_gender" id="gender" value="female">여자<br>    
         
 <label class="col-md-4 control-label" style="text-align:center;margin-left:32%;color: rgba(255, 255, 255, 0.53);" for="gender">성별 입력</label>
 </span>
 </div>
       
       </div>

<!-- 생년월일 입력-->
      
<div class="form-group">
	<div class="inner-addon left-addon row" style="margin-left:35%">
		<span class="field">	 
		   <div class="col-sm-2">
		   	<!-- <input type="text" name="year" id="year" size="5" class="form-control hvr-glow" required="required">생년 -->	   	
		   	<select style="width: 100px;" name="year" id="year" required="required">
			   	<option value="-1">생년 선택 </option>
			   		<c:forEach var="i" begin="1970" end="2000">
			   			<option style="background-color:transparent;" value="${i}">${i}</option>
			   		</c:forEach>
		  	</select>년
		  	</div>
		  	
		   <div class="col-sm-2">
		   	<!-- <input type="text" name="month" id="month" size="5" class="form-control hvr-glow" required="required">월 -->
		   	<select style="width: 100px" name="month" id="month" required="required">
			   	<option value="-1">월 선택</option>
			   		<c:forEach var="i" begin="1" end="12">
			   			<option value="${i}">${i}</option>
			   		</c:forEach>   	
		  	</select>월
		   </div>  
		   
		   <div class="col-sm-2">
		   	<!-- <input type="text" name="day" id="day" size="5" class="form-control hvr-glow" required="required">일 -->
		   	<select style="width: 100px" name="day" id="day" required="required">
			   	<option value="-1">일 선택</option>
			   		<c:forEach var="i" begin="1" end="31">
			   			<option value="${i}">${i}</option>
			   		</c:forEach>	   	
		  	</select>일
		   </div>
		   <input type="hidden" name="user_date" id="birthday">
		  <!--  <input type="button" onclick="birth()" value="생일값"> -->
		   <label class="col-md-4 control-label" style="text-align:center;margin-left:32%;color: rgba(255, 255, 255, 0.53);">생년월일 입력</label> 	
		</span>	     
    </div>
</div>

<!-- 전화번호 입력 -->
<div class="form-group">
	<div class="inner-addon left-addon" style="margin-left:37%">
		<span class="field">
			<span class="addon" style="padding-bottom: 0px;"><i class="glyphicon glyphicon-phone"></i></span> 
			<input type="text" name="user_phone" id="phone" class="form-control" style="width: 340px;margin-left:20px;" required="required"> 
			<!-- <input type="button" id="phonebtn" value="전화번호체크" onclick="phonechk()" > -->
			<label class="col-md-4 control-label" style="text-align:center;margin-left:38px;color: rgba(255, 255, 255, 0.53);" for="phone" id="phonelbl">핸드폰 번호 입력</label>
		</span>
	</div>
</div>

<!-- 입사일 입력-->
<div class="form-group">
	<div class="inner-addon left-addon" style="margin-left:37%">
		<span class="field">
			<span class="addon" style="padding-bottom: 0px;"><i class="glyphicon glyphicon-calendar"></i></span> 
				<input type="date" name="user_join" id="enterdate" class="form-control" style="width: 340px;margin-left:20px;" required="required"> 
				<label class="col-md-4 control-label" style="text-align:center;margin-left:38px;color: rgba(255, 255, 255, 0.53);" for="enterdate">입사일 입력</label>
		</span>
	</div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="control-label"></label>
    <button type="button" name="joinbtn" id="joinbtn" onclick="joinchk();" class="btn hvr-forward" style="margin-top: 50px;"><span class="glyphicon glyphicon-ok" > Join</span></button>&nbsp; &nbsp; 
    <button type="button" class="btn hvr-forward" style="margin-top: 50px;" onclick="history.go(-1)"><span class="glyphicon glyphicon-repeat" aria-hidden="true"> Back</span></button>
</div>

</fieldset>
</form>
</div>
</div>

<!-- Javascript -->
   <script src="assets/js/jquery-1.11.1.min.js"></script>
   <script src="assets/bootstrap/js/bootstrap.min.js"></script>
   <script src="assets/js/jquery.backstretch.min.js"></script>
   <script src="assets/js/wow.min.js"></script>
   <script src="assets/js/retina-1.1.0.min.js"></script>
   <script src="assets/js/jquery.magnific-popup.min.js"></script>
   <script src="assets/js/masonry.pkgd.min.js"></script>
   <script src="assets/js/scripts.js"></script>
   <script src="assets/js/modernizr.custom.63321.js"></script>
   <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>  
   <script src="ios-7-date-picker.js"></script>
   <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
   <script type="text/javascript" src="assets/js/jquery.dropdown.js"></script>
   <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>

   <script type="text/javascript">
         
      $( function() {
    	
    	 $('#idchk').hide();
    	 joinchk1 = false;
    	 joinchk2 = false;
    	 joinchk3 = false;

      });
     
      //년,월,일 합치기
      function birth(){
         
         var y = document.getElementById("year").value;
         var m = document.getElementById("month").value;
         var d = document.getElementById("day").value;
        
         if(m<10){
        	
        	 if(d<10){
        		 var b = y+'-0'+m+'-0'+d;
        	 }
        	 else{
        		 var b = y+'-0'+m+'-'+d;
        	 }
         }else{
        	 if(d<10){
        		 var b = y+'-'+m+'-0'+d;
        	 }
        	 else{
        		 var b = y+'-'+m+'-'+d;
        	 }
         }
     
         document.getElementById("birthday").value = b;
      }   
      
      //아이디 중복 검사
      function idchkclk() { 
    		
    	    	  $.ajax({
    	    		  type:"get",
    	    		  url:"idchk.ajax",
    	    		  data:{"user_id": $('#id').val().toLowerCase()},
    	    		  success:function(data){
    	    			
    	    			  if(data == "yes"){
    	    				
    	    			  	$("#idselect").html("중복되는 아이디입니다"); 
    	    			  	$('#id').focus();
    	    			    joinchk1 = false;
    	    			 
    	    			
    	    			  }else{
    	    				
    	    				 $("#idselect").html("사용가능한 아이디 입니다");
    	    				 $('#id').focus();
    	    				
    	    				 joinchk1 = true;
    	    				
    	    			  }
    	    		  },
    	    		  error:function(){
    	    			  $("#idselect").html("에러 입니다");	
    	    		  }
    	    	  });	
    		}
    
    //아이디 이메일 형식 검사
    $('#id').keyup(function(){
	var idRex = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
    	
    	if(idRex.test($('#id').val())){
    		$('#idselect').html("이메일 중복검사 버튼을 눌러주세요");
    		$('#idchk').show();		  		
    	}else{
    		$('#idselect').html("알맞은 이메일 형식으로 작성해주세요");
    		$('#idchk').hide();
    	} 
    });

    //password 두개 일치하는지 확인
    $('#user_password_chk').keyup(function(){
    	
		$.ajax({
			type:"get",
			url:"pwdchk.ajax",
			data:{"user_password":$('#user_password').val(),
				"user_password_chk":$('#user_password_chk').val()},		
			success:function(data){

					if(data=="ok"){
						$('#pwdchklb').html("비밀번호 통과");
						joinchk2=true;
					}else{
						$('#pwdchklb').html("비밀번호가 일치하지 않습니다");
						joinchk2=false;
					}
				},
				error:function(){
					$('#pwdchklb').html("에러에요");
				}	
		});

    });

    //핸드폰번호 유효성 검사
     $('#phone').keyup(function(){

    	 var phoneRex = /^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$/;
    	 
    		if(phoneRex.test($('#phone').val())){
    			$('#phonelbl').html("전화번호가 유효합니다");
    			joinchk3 = true;
        	}else{
        		$('#phonelbl').html("ex)01x-xxxx-xxxx 형식으로 작성해주세요");     
        		joinchk3 = false;
        	}
    		
    	});
    	
  	//유효성 검사로 join 막기
 	function joinchk() {				
		if(joinchk1 == false){
			swal('아이디 유효성을 확인해주세요');
			$('#id').focus();
		}else if(joinchk2 == false){
			swal('비밀번호 유효성을 확인해주세요');
			$('#user_password').focus();
		}else if($('#name').val() == null||$('#name').val() == "" ){		
			swal('이름을 작성해주세요');
			$('#name').focus();
		}else if($('#year').val() == '-1'){
			swal('년도를 선택해주세요');
			$('#year').focus();
		}else if($('#month').val() == '-1'){
			swal('월을 선택해주세요');
			$('#month').focus();
		}else if($('#day').val() == '-1'){
			swal('일을 선택해주세요');
			$('#day').focus();
		}else if(joinchk3 == false){
			swal('핸드폰 번호 유효성을 확인해주세요');
			$('#phone').focus();
		}else if($('#enterdate').val() == null||$('#enterdate').val() == "" ){
			swal('입사일을 입력해주세요');
			$('#enterdate').focus();
		}else{
			 swal({
	        	   title: "회원가입 완료!",

	        	   type: "success",
	        	   showCancelButton: false,
	        	   confirmButtonColor: "#194f89",
	        	   confirmButtonText: "확인",
	        	   closeOnConfirm: false
	        	   
	        	 },
	        	 function(isConfirm){
	        		  if (isConfirm) {
	        			  location.href="index.htm";
	        			  birth(); 
	        				$('#contact_form').submit();
	        		  }
				 }
	    );
		}
  	}
	</script>

</body>
</html>