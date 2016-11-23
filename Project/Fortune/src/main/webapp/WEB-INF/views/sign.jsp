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
<link rel="stylesheet"
   href="path/to/font-awesome/css/font-awesome.min.css">
   

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

<body>



   <div class="backstretch" style="left: 0px; top: 0px; overflow: hidden; margin: 0px; padding: 0px; height: 1500px; width: 1600px; z-index: -999998; position: absolute;">
   <img src="assets/img/backgrounds/1.jpg" style="position: absolute; margin: 0px; padding: 0px; border: none; width: 1500px; height: 980px; max-height: none; max-width: none; z-index: -999999; left: -51.6984px; top: 0px;"></div>
   
   <!-- Loader -->
   <div class="loader" style="display: none;">
      <div class="loader-img" style="display: none;"></div>
   </div>


   <!-- Top content -->
   <div class="con"
      style="position: relative; z-index: 0; background: none;">
   <!--       <div class="moco"> -->
              
                    <h3 class="modal-title" id="modal-login-label">JOIN</h3>
             
                 <div class="moco-body">
                 <!--     <div class="container"> -->

<form class="form-horizontal" action="JoinSubmit.htm" method="post"  id="contact_form">
<fieldset>

<!-- 아이디  입력-->

<div class="form-group">
	<div class="inner-addon left-addon" style="margin-left:37%">
		<span class="field">
			<span class="addon" style="padding-bottom: 0px;"><i class="glyphicon glyphicon-user"></i></span>
			    <input type="text" id="id" name="user_id" class="form-control" style="width: 340px;margin-left:20px;" required="required"> 
			    <input type="button" id="idchk" name="idchk" class="button" value="아이디 중복확인" onclick="idchkclk()">
			   
			    <label id="idselect" class="col-md-4 control-label" style="text-align:center;margin-left:38px;color: rgba(255, 255, 255, 0.53);" for="id">아이디 입력</label>
				<!-- <input type="hidden" id="nextchk" value="다음걸로 못넘어가게하는거">  -->
		</span>
	</div>
</div>

<!-- 비밀번호  입력-->
<div class="form-group">
	<div class="inner-addon left-addon" style="margin-left:37%">
		<span class="field">
		 <span class="addon"style=" padding-bottom: 0px;"><i class="glyphicon glyphicon-lock"></i></span> 
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
		 <span class="addon"style=" padding-bottom: 0px;"><i class="glyphicon glyphicon-lock"></i></span> 
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
			<span class="addon"style="padding-bottom: 0px;"><i class="glyphicon glyphicon-font"></i></span> 
			<input type="text" name="user_name" id="name" class="form-control" style="width: 340px;margin-left:20px;" required="required">
			<label class="col-md-4 control-label"style="text-align:center;margin-left:38px;color: rgba(255, 255, 255, 0.53);" for="pwd">이름 입력</label>
		</span>
	</div>
</div>

<!--성별 입력-->
<div class="form-group">
<div class="inner-addon left-addon" style="margin-left:2%">
<span class="field">


<input type="radio" name="user_gender" id="gender" value="male" checked >남자
<input type="radio" name="user_gender" id="gender" value="female">여자<br>    
         
 <label class="col-md-4 control-label"style="text-align:center;margin-left:32%;color: rgba(255, 255, 255, 0.53);" for="gender">성별 입력</label>
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
			   	<c:forEach var="i" begin="1970" end="2000">		   	
			    	<option value="${i}">${i}</option>	
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
		   <label class="col-md-4 control-label"style="text-align:center;margin-left:32%;color: rgba(255, 255, 255, 0.53);">생년월일 입력</label> 	
		</span>	     
    </div>
</div>

<!-- 전화번호 입력 -->
<div class="form-group">
	<div class="inner-addon left-addon" style="margin-left:37%">
		<span class="field">
			<span class="addon"style="padding-bottom: 0px;"><i class="glyphicon glyphicon-phone"></i></span> 
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
			<span class="addon"style="padding-bottom: 0px;"><i class="glyphicon glyphicon-calendar"></i></span> 
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
                <option value="-1" selected>부서명을 선택하세요</option>
            	<c:forEach var="i" items="${dept}">            
                   <option style="text-align:center" value="${i.dept_no}">${i.dept_name}</option>
                </c:forEach> 
               </select>
            </div>
         </section>
</div>

<div class="col-sm-3">
         <section class="main clearfix">
               <div class="fleft">
               <select name="team_no" id="cd-dropdown2" class="cd-select">
                  <option value="-1" selected>팀을 선택하세요</option>
            <c:forEach var="i" items="${team}">
                     <option style="text-align:center" value="${i.team_no}">${i.team_name}</option>
                  </c:forEach>
         
               </select>
            </div>
         </section>
</div>

<div class="col-sm-3">
         <section class="main clearfix">
               <div class="fleft">
               <select name="position_no"  id="cd-dropdown3" class="cd-select">
                  <option value="-1" selected>직급을 선택하세요</option>
               <c:forEach var="i" items="${position}">
                     <option style="text-align:center" value="${i.position_no}">${i.position_name}</option>
                  </c:forEach>   
         
               </select>
            </div>
         </section>
</div>





</div>

<!-- Button -->
<div class="form-group">
  <label class="control-label"></label>  
    <button type="submit" name="joinbtn" id="joinbtn" onclick='birth();' class="btn hvr-forward" style="margin-top:200px" >join</button>
</div>

</fieldset>
</form>
</div>
   <!-- /.container -->
  
                       
                 </div>

<!-- What we do -->
   <div class="what-we-do-container section-container">
      <div class="container">
         <div class="row">
            <div
               class="col-sm-12 what-we-do section-description wow fadeIn animated"
               style="visibility: visible; animation-name: fadeIn;">
               <h2>What we do</h2>
               <div class="divider-1 wow fadeInUp animated"
                  style="visibility: visible; animation-name: fadeInUp;">
                  <span></span>
               </div>
               <p>이예지 바보</p>
            </div>
         </div>
         <div class="row">
            <div class="col-sm-4 what-we-do-box wow fadeInUp animated"
               style="visibility: visible; animation-name: fadeInUp;">
               <div class="what-we-do-box-icon">
                  <i class="fa fa-pencil"></i>
               </div>
               <h3>Web design</h3>
               <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                  sed do eiusmod tempor incididunt ut labore.</p>
            </div>
            <div class="col-sm-4 what-we-do-box wow fadeInDown animated"
               style="visibility: visible; animation-name: fadeInDown;">
               <div class="what-we-do-box-icon">
                  <i class="fa fa-gears"></i>
               </div>
               <h3>Development</h3>
               <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                  sed do eiusmod tempor incididunt ut labore.</p>
            </div>
            <div class="col-sm-4 what-we-do-box wow fadeInUp animated"
               style="visibility: visible; animation-name: fadeInUp;">
               <div class="what-we-do-box-icon">
                  <i class="fa fa-twitter"></i>
               </div>
               <h3>Social media</h3>
               <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                  sed do eiusmod tempor incididunt ut labore.</p>
            </div>
         </div>
      </div>
   </div>

   <!-- Our process -->


   <!-- Portfolio -->
   <div class="portfolio-container section-container">
      <div class="container">
         <div class="row">
            <div
               class="col-sm-12 portfolio section-description wow fadeIn animated"
               style="visibility: visible; animation-name: fadeIn;">
               <h2>Portfolio</h2>
               <div class="divider-1 wow fadeInUp animated"
                  style="visibility: visible; animation-name: fadeInUp;">
                  <span></span>
               </div>
               <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                  sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                  Ut enim ad minim veniam, quis nostrud exercitation.</p>
            </div>
         </div>
         <div class="row">
            <div class="col-sm-12 portfolio-filters wow fadeInUp animated"
               style="visibility: visible; animation-name: fadeInUp;">
               <a href="#" class="filter-all active">All</a> / <a href="#"
                  class="filter-design">Design</a> / <a href="#"
                  class="filter-development">Development</a> / <a href="#"
                  class="filter-branding">Branding</a>
            </div>
         </div>
         <div class="row">
            <div class="col-sm-12 portfolio-masonry"
               style="position: relative; height: 700px;">
               <div class="portfolio-box design"
                  style="position: absolute; left: 15px; top: 0px;">
                  <img src="assets/img/portfolio/1.jpg" alt=""
                     data-at2x="assets/img/portfolio/1.jpg">
                  <div class="portfolio-box-text-container">
                     <div class="portfolio-box-text">
                        <p>
                           <a href="#">Lorem website</a>
                        </p>
                     </div>
                  </div>
               </div>
               <div class="portfolio-box development"
                  style="position: absolute; left: 255px; top: 0px;">
                  <img src="assets/img/portfolio/2.jpg" alt=""
                     data-at2x="assets/img/portfolio/2.jpg">
                  <div class="portfolio-box-text-container">
                     <div class="portfolio-box-text">
                        <p>
                           <a href="#">Sit amet logo</a>
                        </p>
                     </div>
                  </div>
               </div>
               <div class="portfolio-box branding"
                  style="position: absolute; left: 495px; top: 0px;">
                  <img src="assets/img/portfolio/3.jpg" alt=""
                     data-at2x="assets/img/portfolio/3.jpg">
                  <div class="portfolio-box-text-container">
                     <div class="portfolio-box-text">
                        <p>
                           <a href="#">Ipsum social</a>
                        </p>
                     </div>
                  </div>
               </div>
               <div class="portfolio-box development"
                  style="position: absolute; left: 15px; top: 175px;">
                  <img src="assets/img/portfolio/4.jpg" alt=""
                     data-at2x="assets/img/portfolio/4.jpg">
                  <div class="portfolio-box-text-container">
                     <div class="portfolio-box-text">
                        <p>
                           <a href="#">Etiam processus dynamicus</a>
                        </p>
                     </div>
                  </div>
               </div>
               <div class="portfolio-box design"
                  style="position: absolute; left: 255px; top: 175px;">
                  <img src="assets/img/portfolio/5.jpg" alt=""
                     data-at2x="assets/img/portfolio/5.jpg">
                  <div class="portfolio-box-text-container">
                     <div class="portfolio-box-text">
                        <p>
                           <a href="#">Processus dynamicus logo</a>
                        </p>
                     </div>
                  </div>
               </div>
               <div class="portfolio-box development"
                  style="position: absolute; left: 495px; top: 175px;">
                  <img src="assets/img/portfolio/6.jpg" alt=""
                     data-at2x="assets/img/portfolio/6.jpg">
                  <div class="portfolio-box-text-container">
                     <div class="portfolio-box-text">
                        <p>
                           <a href="#">Mirum est notare</a>
                        </p>
                     </div>
                  </div>
               </div>
               <div class="portfolio-box design"
                  style="position: absolute; left: 15px; top: 350px;">
                  <img src="assets/img/portfolio/7.jpg" alt=""
                     data-at2x="assets/img/portfolio/7.jpg">
                  <div class="portfolio-box-text-container">
                     <div class="portfolio-box-text">
                        <p>
                           <a href="#">March notare site</a>
                        </p>
                     </div>
                  </div>
               </div>
               <div class="portfolio-box development"
                  style="position: absolute; left: 255px; top: 350px;">
                  <img src="assets/img/portfolio/8.jpg" alt=""
                     data-at2x="assets/img/portfolio/8.jpg">
                  <div class="portfolio-box-text-container">
                     <div class="portfolio-box-text">
                        <p>
                           <a href="#">Sit amet logo</a>
                        </p>
                     </div>
                  </div>
               </div>
               <div class="portfolio-box branding"
                  style="position: absolute; left: 495px; top: 350px;">
                  <img src="assets/img/portfolio/9.jpg" alt=""
                     data-at2x="assets/img/portfolio/9.jpg">
                  <div class="portfolio-box-text-container">
                     <div class="portfolio-box-text">
                        <p>
                           <a href="#">Lorem website</a>
                        </p>
                     </div>
                  </div>
               </div>
               <div class="portfolio-box design"
                  style="position: absolute; left: 15px; top: 525px;">
                  <img src="assets/img/portfolio/10.jpg" alt=""
                     data-at2x="assets/img/portfolio/10.jpg">
                  <div class="portfolio-box-text-container">
                     <div class="portfolio-box-text">
                        <p>
                           <a href="#">Mirum est notare</a>
                        </p>
                     </div>
                  </div>
               </div>
               <div class="portfolio-box development"
                  style="position: absolute; left: 255px; top: 525px;">
                  <img src="assets/img/portfolio/11.jpg" alt=""
                     data-at2x="assets/img/portfolio/11.jpg">
                  <div class="portfolio-box-text-container">
                     <div class="portfolio-box-text">
                        <p>
                           <a href="#">Etiam processus social</a>
                        </p>
                     </div>
                  </div>
               </div>
               <div class="portfolio-box branding"
                  style="position: absolute; left: 495px; top: 525px;">
                  <img src="assets/img/portfolio/12.jpg" alt=""
                     data-at2x="assets/img/portfolio/12.jpg">
                  <div class="portfolio-box-text-container">
                     <div class="portfolio-box-text">
                        <p>
                           <a href="#">Sit website logo</a>
                        </p>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>



   <!-- The team -->
   <div class="team-container section-container">
      <div class="container">
         <div class="row">
            <div class="col-sm-12 team section-description wow fadeIn animated"
               style="visibility: visible; animation-name: fadeIn;">
               <h2>The team</h2>
               <div class="divider-1 wow fadeInUp animated"
                  style="visibility: visible; animation-name: fadeInUp;">
                  <span></span>
               </div>
               <p>Ut wisi enim ad minim veniam, quis nostrud exerci tation
                  ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo
                  consequat. Ut wisi enim ad minim veniam, quis nostrud.</p>
            </div>
         </div>
         <div class="row">
            <div class="col-sm-4 team-box wow fadeInUp animated"
               style="visibility: visible; animation-name: fadeInUp;">
               <div class="team-photo">
                  <img src="assets/img/about/1.jpg" alt=""
                     data-at2x="assets/img/about/1.jpg">
               </div>
               <h3>John Doe</h3>
               <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                  sed do eiusmod.</p>
               <div class="team-social">
                  <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
                     class="fa fa-dribbble"></i></a> <a href="#"><i
                     class="fa fa-twitter"></i></a>
               </div>
            </div>
            <div class="col-sm-4 team-box wow fadeInDown animated"
               style="visibility: visible; animation-name: fadeInDown;">
               <div class="team-photo">
                  <img src="assets/img/about/2.jpg" alt=""
                     data-at2x="assets/img/about/2.jpg">
               </div>
               <h3>Tim Brown</h3>
               <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                  sed do eiusmod.</p>
               <div class="team-social">
                  <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
                     class="fa fa-dribbble"></i></a> <a href="#"><i
                     class="fa fa-twitter"></i></a>
               </div>
            </div>
            <div class="col-sm-4 team-box wow fadeInUp animated"
               style="visibility: visible; animation-name: fadeInUp;">
               <div class="team-photo">
                  <img src="assets/img/about/3.jpg" alt=""
                     data-at2x="assets/img/about/3.jpg">
               </div>
               <h3>Sarah Red</h3>
               <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                  sed do eiusmod.</p>
               <div class="team-social">
                  <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
                     class="fa fa-dribbble"></i></a> <a href="#"><i
                     class="fa fa-twitter"></i></a>
               </div>
            </div>
         </div>
      </div>
   </div>

   <!-- Contact us -->


   <!-- Scroll to top -->
   <div class="section-container section-container-gray">
      <div class="container">
         <div class="row">
            <div class="col-sm-12">
               <div class="scroll-to-top">
                  <a class="scroll-link" href="#top-content2"><i
                     class="fa fa-chevron-up"></i></a>
               </div>
            </div>
         </div>
      </div>
   </div>

   <!-- Footer -->
   <footer>
      <div class="container">
         <div class="row">
            <div class="col-sm-7 footer-copyright">
               Â© Riona Bootstrap Template by <a href="http://azmind.com">Azmind</a>.
            </div>
            <div class="col-sm-5 footer-social">
               <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
                  class="fa fa-dribbble"></i></a> <a href="#"><i
                  class="fa fa-twitter"></i></a> <a href="#"><i
                  class="fa fa-google-plus"></i></a> <a href="#"><i
                  class="fa fa-pinterest"></i></a>
            </div>
         </div>
      </div>
   </footer>


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
   <script src='http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js'></script> 
   <script src="ios-7-date-picker.js"></script>
   <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
   <script type="text/javascript" src="assets/js/jquery.dropdown.js"></script>
   <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
   
   <script type="text/javascript">
         
      $( function() {
    	
    	 $('#idchk').hide();
         
         $( '#cd-dropdown' ).dropdown( {
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
         } );
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