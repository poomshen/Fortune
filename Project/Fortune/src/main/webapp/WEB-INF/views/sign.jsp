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

<body style="
    height: 800px;
">



   <div class="backstretch" style="left: 0px;top: 0px;overflow: hidden;margin: 0px;padding: 0px;height: 1000px;width: 1600px;z-index: -999998;position: absolute;">
   <img src="assets/img/backgrounds/1.jpg" style="position: absolute;margin: 0px;padding: 0px;border: none;width: 1500px;height: 1200px;max-height: none;max-width: none;z-index: -999999;left: -51.6984px;top: 0px;"></div>
   
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
			    <input type="button" id="idchk" name="idchk" class="button" value="아이디 중복확인" onclick="idchkclk()" style="display: none;">
			   
			    <label id="idselect" class="col-md-4 control-label" style="text-align:center;margin-left:38px;color: rgba(255, 255, 255, 0.53);" for="id">아이디 입력</label>
				<!-- <input type="hidden" id="nextchk" value="다음걸로 못넘어가게하는거">  -->
		</span>
	</div>
</div>

<!-- 비밀번호  입력-->
<div class="form-group">
	<div class="inner-addon left-addon" style="margin-left:37%">
		<span class="field">
		 <span class="addon" style=" padding-bottom: 0px;"><i class="glyphicon glyphicon-lock"></i></span> 
		    <input type="text" name="user_password" id="user_password" class="form-control" style="
		    width: 340px;margin-left:20px;" required="required">
		    <label class="col-md-4 control-label" style="text-align:center;margin-left:38px;color: rgba(255, 255, 255, 0.53);" for="pwd">비밀번호 입력</label>
		</span>
	</div>
</div>

<!-- 비밀번호  확인-->
<div class="form-group">
	<div class="inner-addon left-addon" style="margin-left:37%">
		<span class="field">
		 <span class="addon" style=" padding-bottom: 0px;"><i class="glyphicon glyphicon-lock"></i></span> 
		    <input type="text" name="user_password_chk" id="user_password_chk" class="form-control" style="
		    width: 340px;margin-left:20px;" required="required">
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
		   	<select style="width: 100px" name="year" id="year" required="required">
			   	<option value="-1">생년 선택 </option>
			   			   	
			    	<option value="1970">1970</option>	
			   			   	
			    	<option value="1971">1971</option>	
			   			   	
			    	<option value="1972">1972</option>	
			   			   	
			    	<option value="1973">1973</option>	
			   			   	
			    	<option value="1974">1974</option>	
			   			   	
			    	<option value="1975">1975</option>	
			   			   	
			    	<option value="1976">1976</option>	
			   			   	
			    	<option value="1977">1977</option>	
			   			   	
			    	<option value="1978">1978</option>	
			   			   	
			    	<option value="1979">1979</option>	
			   			   	
			    	<option value="1980">1980</option>	
			   			   	
			    	<option value="1981">1981</option>	
			   			   	
			    	<option value="1982">1982</option>	
			   			   	
			    	<option value="1983">1983</option>	
			   			   	
			    	<option value="1984">1984</option>	
			   			   	
			    	<option value="1985">1985</option>	
			   			   	
			    	<option value="1986">1986</option>	
			   			   	
			    	<option value="1987">1987</option>	
			   			   	
			    	<option value="1988">1988</option>	
			   			   	
			    	<option value="1989">1989</option>	
			   			   	
			    	<option value="1990">1990</option>	
			   			   	
			    	<option value="1991">1991</option>	
			   			   	
			    	<option value="1992">1992</option>	
			   			   	
			    	<option value="1993">1993</option>	
			   			   	
			    	<option value="1994">1994</option>	
			   			   	
			    	<option value="1995">1995</option>	
			   			   	
			    	<option value="1996">1996</option>	
			   			   	
			    	<option value="1997">1997</option>	
			   			   	
			    	<option value="1998">1998</option>	
			   			   	
			    	<option value="1999">1999</option>	
			   			   	
			    	<option value="2000">2000</option>	
			   	
		  	</select>년
		  	</div>
		  	
		   <div class="col-sm-2">
		   	<!-- <input type="text" name="month" id="month" size="5" class="form-control hvr-glow" required="required">월 -->
		   	<select style="width: 100px" name="month" id="month" required="required">
			   	<option value="-1">월 선택</option>
			   			   	
			    	<option value="1">1</option>	
			   			   	
			    	<option value="2">2</option>	
			   			   	
			    	<option value="3">3</option>	
			   			   	
			    	<option value="4">4</option>	
			   			   	
			    	<option value="5">5</option>	
			   			   	
			    	<option value="6">6</option>	
			   			   	
			    	<option value="7">7</option>	
			   			   	
			    	<option value="8">8</option>	
			   			   	
			    	<option value="9">9</option>	
			   			   	
			    	<option value="10">10</option>	
			   			   	
			    	<option value="11">11</option>	
			   			   	
			    	<option value="12">12</option>	
			   	
		  	</select>월
		   </div>  
		   
		   <div class="col-sm-2">
		   	<!-- <input type="text" name="day" id="day" size="5" class="form-control hvr-glow" required="required">일 -->
		   	<select style="width: 100px" name="day" id="day" required="required">
			   	<option value="-1">일 선택</option>
			   			   	
			    	<option value="1">1</option>	
			   			   	
			    	<option value="2">2</option>	
			   			   	
			    	<option value="3">3</option>	
			   			   	
			    	<option value="4">4</option>	
			   			   	
			    	<option value="5">5</option>	
			   			   	
			    	<option value="6">6</option>	
			   			   	
			    	<option value="7">7</option>	
			   			   	
			    	<option value="8">8</option>	
			   			   	
			    	<option value="9">9</option>	
			   			   	
			    	<option value="10">10</option>	
			   			   	
			    	<option value="11">11</option>	
			   			   	
			    	<option value="12">12</option>	
			   			   	
			    	<option value="13">13</option>	
			   			   	
			    	<option value="14">14</option>	
			   			   	
			    	<option value="15">15</option>	
			   			   	
			    	<option value="16">16</option>	
			   			   	
			    	<option value="17">17</option>	
			   			   	
			    	<option value="18">18</option>	
			   			   	
			    	<option value="19">19</option>	
			   			   	
			    	<option value="20">20</option>	
			   			   	
			    	<option value="21">21</option>	
			   			   	
			    	<option value="22">22</option>	
			   			   	
			    	<option value="23">23</option>	
			   			   	
			    	<option value="24">24</option>	
			   			   	
			    	<option value="25">25</option>	
			   			   	
			    	<option value="26">26</option>	
			   			   	
			    	<option value="27">27</option>	
			   			   	
			    	<option value="28">28</option>	
			   			   	
			    	<option value="29">29</option>	
			   			   	
			    	<option value="30">30</option>	
			   			   	
			    	<option value="31">31</option>	
			   	
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



<!--부서명 입력-->
<!--select id 변경 : 변경불가 -->
<div class="form-group">
<div class="col-sm-3 col-sm-offset-1" style="margin-left:10%">
         <section class="main clearfix">
               <div class="fleft">
               <select name="dept_no" id="cd-dropdown" class="cd-select">
                <option value="-1" selected="">부서명을 선택하세요</option>
            	            
                   <option style="text-align:center" value="10">개발부</option>
                            
                   <option style="text-align:center" value="20">영업부</option>
                            
                   <option style="text-align:center" value="30">품질관리부</option>
                            
                   <option style="text-align:center" value="40">디자인부</option>
                 
               </select>
            </div>
         </section>
</div>

<div class="col-sm-3">
         <section class="main clearfix">
               <div class="fleft">
               <select name="team_no" id="cd-dropdown2" class="cd-select">
                  <option value="-1" selected="">팀을 선택하세요</option>
            
                     <option style="text-align:center" value="101">개발1팀</option>
                  
                     <option style="text-align:center" value="102">개발2팀</option>
                  
                     <option style="text-align:center" value="103">개발3팀</option>
                  
                     <option style="text-align:center" value="201">영업1팀</option>
                  
                     <option style="text-align:center" value="202">영업2팀</option>
                  
                     <option style="text-align:center" value="203">영업3팀</option>
                  
                     <option style="text-align:center" value="301">품질관리1팀</option>
                  
                     <option style="text-align:center" value="302">품질관리2팀</option>
                  
                     <option style="text-align:center" value="303">품질관리3팀</option>
                  
                     <option style="text-align:center" value="401">디자인1팀</option>
                  
                     <option style="text-align:center" value="402">디자인2팀</option>
                  
                     <option style="text-align:center" value="403">디자인3팀</option>
                  
                     <option style="text-align:center" value="404">디자인4팀</option>
                  
         
               </select>
            </div>
         </section>
</div>

<div class="col-sm-3">
         <section class="main clearfix">
               <div class="fleft">
               <select name="position_no" id="cd-dropdown3" class="cd-select">
                  <option value="-1" selected="">직급을 선택하세요</option>
               
                     <option style="text-align:center" value="1">사원</option>
                  
                     <option style="text-align:center" value="2">대리</option>
                  
                     <option style="text-align:center" value="3">과장</option>
                  
                     <option style="text-align:center" value="4">차장</option>
                  
                     <option style="text-align:center" value="5">부장</option>
                     
         
               </select>
            </div>
         </section>
</div>





</div>

<!-- Button -->
<div class="form-group">
  <label class="control-label"></label>  
    <button type="submit" name="joinbtn" id="joinbtn" onclick="birth();" class="btn hvr-forward" style="margin-top: 50px;">join</button>
</div>

</fieldset>
</form>
</div>
   <!-- /.container -->
  
                       
                 </div>

   <!-- Footer -->
   


   <!-- Javascript -->
    <script src="assets/js/jquery-1.11.1.min.js"></script>
   <script src="assets/bootstrap/js/bootstrap.min.js"></script>
   <script src="assets/js/jquery.backstretch.min.js"></script>
   <script src="assets/js/wow.min.js"></script>
  <!--  <script src="assets/js/retina-1.1.0.min.js"></script> -->
   <script src="assets/js/jquery.magnific-popup.min.js"></script>
 <!--   <script src="assets/js/masonry.pkgd.min.js"></script> -->
<!--    <script src="assets/js/scripts.js"></script> -->
<!--    <script src="assets/js/modernizr.custom.63321.js"></script> -->
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>  
   <!-- <script src="ios-7-date-picker.js"></script>
    --><script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
   <!-- <script type="text/javascript" src="assets/js/jquery.dropdown.js"></script>
    --><script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
   
   <script type="text/javascript">
         
      $( function() {
    	
    	 $('#idchk').hide();
         
      /*    $( '#cd-dropdown' ).dropdown( {
            gutter : 5,
            stack : false,
            delay : 100,
            slidingIn : 100
         } );
         $( '#cd-dropdown2' ).dropdown( {
            gutter : 5,
            stack : false,
            delay : 100,
            slidingIn : 100
         } );
         
         $( '#cd-dropdown3' ).dropdown( {
            gutter : 5,
            stack : false,
            delay : 100,
            slidingIn : 100
         } ); */
      });
      
      //년,월,일 합치기
      function birth(){
         
         var y = document.getElementById("year").value;
         var m = document.getElementById("month").value;
         var d = document.getElementById("day").value;
         var b = y+'-'+m+'-'+d;
         
         document.getElementById("birthday").value = b;
         //alert(document.getElementById("birthday").value);
      }   
      
      //아이디 중복 검사
      function idchkclk() { 
    			//alert($('#id').val().toLowerCase());
    			//console.log($('#id').val().toLowerCase());
    			
    	    	  $.ajax({
    	    		  type:"get",
    	    		  url:"idchk.ajax",
    	    		  data:{"user_id": $('#id').val().toLowerCase()},
    	    		  success:function(data){
    	    			  //console.log(data);
    	    			  if(data == "yes"){
    	    			  	/* $("#idselect").html("중복되는 아이디입니다"); */
    	    			  	alert('중복되는 아이디입니다');
    	    			  }else{
    	    				/* $("#idselect").html("사용가능한 아이디 입니다"); */
    	    				  /* $('#nextchk').val()= "okay"; */
    	    				alert('사용가능한 아이디 입니다'); 
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
	//console.log($('#id').val());
    	
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
    	//alert('keydown test');
    	
		$.ajax({
			type:"get",
			url:"pwdchk.ajax",
			data:{"user_password":$('#user_password').val(),
				"user_password_chk":$('#user_password_chk').val()},		
			success:function(data){
				console.log(data);
					if(data=="ok"){
						$('#pwdchklb').html("비밀번호 통과");
					}else{
						$('#pwdchklb').html("비밀번호가 일치하지 않습니다");
					}
				},
				error:function(){
					$('#pwdchklb').html("에러에요");
				}	
		});
		/* console.log( "처음값 :>"+ $('#user_password').val()+"<");
		console.log( "두번째값 :>"+ $('#user_password_chk').val()+"<");	
		 */
    });
    

    
    //핸드폰번호 유효성 검사
     $('#phone').keyup(function(){

    	 var phoneRex = /^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$/;
    	 
    	 //console.log("phone value: " + $('#phone').val());
    		if(phoneRex.test($('#phone').val())){
    			$('#phonelbl').html("전화번호가 유효합니다");	
        	}else{
        		$('#phonelbl').html("ex)010-xxxx-xxxx 형식으로 작성해주세요");       	
        	}
    		
    	});
  
    

      </script>



</body>
</html>