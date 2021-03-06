<!-- 
작성자  : 김지현
최초작업일 : 2016/12/10
최종수정일 : 2016/12/10
작업내용 : 로그인/조원 소개 페이지
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	int message = (Integer)request.getAttribute("msg");
%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>[효율적인업무 For春]</title>

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


</head>

<body>

	<!-- Loader -->
	<div class="loader" style="display: none;">
		<div class="loader-img" style="display: none;"></div>
	</div>

	<!-- Top content -->
	<div class="top-content"
		style="position: relative;z-index: 0;background: none;padding-top: 150px;">
		<div class="top-content-text wow fadeInUp animated"
			style="visibility: visible; animation-name: fadeInUp;">

			<br />
			<h1>
				<a href=""><img src="assets/img/logo/fortune_final.png"/></a>
			</h1>
			

			<div class="top-content-bottom-link">
				
				<form role="form" action="" method="post" name ="f">
					<div class="col-sm-12 form-group container"	style="margin-left: 19%">
						<label class="sr-only" for="r-form-1-first-name">First name</label>

						<div class="input-group">
							<span class="addon"><i class="glyphicon glyphicon-user" aria-hidden="true"></i></span>
							<div class="form-group">
								<label class="sr-only" for="r-form-1-email">id</label> 
								<input type="text" name="user_id" style="background-color:transparent; color:white;" class="form-control hvr-glow" id="user_id" tabindex="1">
							</div>
						</div>
						<div class="input-group">
							<span class="addon"><i class="glyphicon glyphicon-lock" ></i></span>
							<div class="form-group">
								<label class="sr-only" for="r-form-1-email">pwd</label> 
								<input type="password" name="user_password" style="background-color:transparent; color:#fff; border: none; border-bottom: 1.5px solid rgba(255, 255, 255, 0.56);" class="form-control hvr-glow" id="user_password" tabindex="2">
									<c:if test="${param.error != null}">
                                    <div>
                                   		    로그인 실패 <br>
                                    </div>
                                 </c:if>
							</div>
						</div>
					</div>

					<div style="margin-left: -3%">
						<button type="button" onclick="joins()" class="btn hvr-forward" tabindex="4"><span class="glyphicon glyphicon-pencil"> Join</span></button>
						&nbsp; &nbsp; &nbsp;						
						<button type="submit" class="btn hvr-forward" tabindex="3" ><span class="glyphicon glyphicon-log-in"> Login</span></button>
					</div>
				</form>
		</div>
		<a href="searchpage.htm" style="color: rgba(255, 255, 255, 0.58); text-decoration: underline;"> ID/Password를 잊어버리셨나요?</a>

	</div>
	
</div>

	<div class="backstretch"
		style="left: 0px; top: 0px; overflow: hidden; margin: 0px; padding: 0px; height: 609px; width: 972px; z-index: -999998; position: absolute;">
		<img src="assets/img/backgrounds/1.jpg"
			style="position: absolute; margin: 0px; padding: 0px; border: none; width: 1082.67px; height: 609px; max-height: none; max-width: none; z-index: -999999; top: 0px; left: -55.3333px;">
	</div>

	<!-- What we do -->
	<div class="what-we-do-container section-container">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 what-we-do section-description wow fadeIn animated" style="visibility: visible; animation-name: fadeIn;">
					<h2>What we aim</h2>
					<div class="divider-1 wow fadeInUp animated" style="visibility: visible; animation-name: fadeInUp;">
					<span></span>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 what-we-do-box wow fadeInUp animated" style="visibility: visible; animation-name: fadeInUp;">
					<div class="what-we-do-box-icon">
						<i class="fa fa-share-alt"></i>
					</div>
					<h3><font color="black">캘린더 공유</font></h3>
					<p><font color="#aaaaaa">같은 프로젝트 진행중인 팀원 간<br>업무 캘린더 / 자료실 공유</font></p>
				</div>
				<div class="col-sm-4 what-we-do-box wow fadeInDown animated" style="visibility: visible; animation-name: fadeInDown;">
					<div class="what-we-do-box-icon">
						<i class="fa fa-eye"></i>
					</div>
					<h3><font color="black">업무의 시각화</font></h3>
					<p><font color="#aaaaaa">한눈에 보는 업무 진행상황</font></p>
				</div>
				<div class="col-sm-4 what-we-do-box wow fadeInUp animated"
					style="visibility: visible; animation-name: fadeInUp;">
					<div class="what-we-do-box-icon">
						<i class="fa fa-user"></i>
					</div>
					<h3><font color="black">UI / UX</font></h3>
					<p><font color="#aaaaaa">사용자 중심적 Interface</font></p>
				</div>
			</div>
		</div>
	</div>

	<!-- Portfolio -->
	<div class="portfolio-container section-container">
		<div class="container">
			<div class="row">
				<div
					class="col-sm-12 portfolio section-description wow fadeIn animated"
					style="visibility: visible; animation-name: fadeIn;">
					<h2>Preview</h2>
					<div class="divider-1 wow fadeInUp animated"
						style="visibility: visible; animation-name: fadeInUp;">
						<span></span>
					</div>
					
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12 portfolio-filters wow fadeInUp animated"
					style="visibility: visible; animation-name: fadeInUp;">
					<!--<a href="#" class="filter-all active">All</a> /
					 <a href="#" class="filter-design">Admin</a> / 
					<a href="#" class="filter-development">SuperManager</a> / 
					<a href="#" class="filter-branding">Manager</a> -->
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12 portfolio-masonry" style="position: relative; height: 700px;">
			<!-- Power Point 1 -->
					<div class="portfolio-box branding" style="position: absolute; left: 495px; top: 0px;">
						<img src="assets/img/portfolio/pt1.png" alt="" data-at2x="assets/img/portfolio/3.jpg">
						<div class="portfolio-box-text-container">
							<div class="portfolio-box-text">
								<p>
									<a href="#">주제 선정 배경</a>
								</p>
							</div>
						</div>
					</div>
			<!-- 일정 처음 들어간 부분 -->
					<div class="portfolio-box branding" style="position: absolute; left: 495px; top: 0px;">
						<img src="assets/img/portfolio/fortune1-1.png" alt="" data-at2x="assets/img/portfolio/3.jpg">
						<div class="portfolio-box-text-container">
							<div class="portfolio-box-text">
								<p>
									<a href="#">공유 캘린더</a>
								</p>
							</div>
						</div>
					</div>
			<!-- 일정 상세 페이지 -->
					<div class="portfolio-box development" style="position: absolute; left: 495px; top: 175px;">
						<img src="assets/img/portfolio/fortune3-4.png" alt="" data-at2x="assets/img/portfolio/6.jpg">
						<div class="portfolio-box-text-container">
							<div class="portfolio-box-text">
								<p>
									<a href="#">공유 캘린더에서의 의사소통</a>
								</p>
							</div>
						</div>
					</div>
			<!-- 차트 이미지 -->
					<div class="portfolio-box design" style="position: absolute; top: 0px;">
						<img src="assets/img/portfolio/fortune2-1.png" alt="" data-at2x="assets/img/portfolio/1.jpg">
						<div class="portfolio-box-text-container">
							<div class="portfolio-box-text">
								<p>
									<a href="#">차트화</a>
								</p>
							</div>
						</div>
					</div>
			<!-- 히스토리 이미지 -->		
					<div class="portfolio-box development" style="position: absolute; left: 15px; top: 175px;">
						<img src="assets/img/portfolio/fortune2-2.png" alt="" data-at2x="assets/img/portfolio/4.jpg">
						<div class="portfolio-box-text-container">
							<div class="portfolio-box-text">
								<p>
									<a href="#">업무 히스토리</a>
								</p>
							</div>
						</div>
					</div>
			<!-- 와이브릿지 처음 화면 -->		
					<div class="portfolio-box design" style="position: absolute; left: 255px; top: 175px;">
						<img src="assets/img/portfolio/Ybridge3-1.png" alt="" data-at2x="assets/img/portfolio/5.jpg">
						<div class="portfolio-box-text-container">
							<div class="portfolio-box-text">
								<p>
									<a href="#">벤치마킹한 와이브릿지 메인</a>
								</p>
							</div>
						</div>
					</div>
			<!-- 공지사항  -->		
					<div class="portfolio-box design" style="position: absolute; left: 255px; top: 175px;">
						<img src="assets/img/portfolio/fortune3-2.png" alt="" data-at2x="assets/img/portfolio/5.jpg">
						<div class="portfolio-box-text-container">
							<div class="portfolio-box-text">
								<p>
									<a href="#">화면을 나눔으로써 시각적 불편함 개선</a>
								</p>
							</div>
						</div>
					</div>
			<!-- 와이브릿지 일정 -->		
					<div class="portfolio-box design" style="position: absolute; left: 255px; top: 175px;">
						<img src="assets/img/portfolio/Ybridge3-3.png" alt="" data-at2x="assets/img/portfolio/5.jpg">
						<div class="portfolio-box-text-container">
							<div class="portfolio-box-text">
								<p>
									<a href="#">와이브릿지 일정</a>
								</p>
							</div>
						</div>
					</div>
			<!-- Power Point 2  -->		
					<div class="portfolio-box design" style="position: absolute; left: 15px; top: 350px;">
						<img src="assets/img/portfolio/pt2.png" alt="" data-at2x="assets/img/portfolio/7.jpg">
						<div class="portfolio-box-text-container">
							<div class="portfolio-box-text">
								<p>
									<a href="#">작업 환경</a>
								</p>
							</div>
						</div>
					</div>
			<!-- 에센스  -->		
					<div class="portfolio-box design" style="position: absolute; left: 15px; top: 350px;">
						<img src="assets/img/portfolio/fortune4.png" alt="" data-at2x="assets/img/portfolio/7.jpg">
						<div class="portfolio-box-text-container">
							<div class="portfolio-box-text">
								<p>
									<a href="#">수정을 고려한 에센스 구성</a>
								</p>
							</div>
						</div>
					</div>
			<!-- 사용 시스템 환경 -->		
					<div class="portfolio-box development" style="position: absolute; left: 255px; top: 350px;">
						<img src="assets/img/portfolio/fortune5.png" alt="" data-at2x="assets/img/portfolio/8.jpg">
						<div class="portfolio-box-text-container">
							<div class="portfolio-box-text">
								<p>
									<a href="#">시스템 구성</a>
								</p>
							</div>
						</div>
					</div>
			<!-- 사용기술1 -->		
					<div class="portfolio-box development" style="position: absolute; left: 495px; top: 175px;">
						<img src="assets/img/portfolio/usedskills.png" alt="" data-at2x="assets/img/portfolio/6.jpg">
						<div class="portfolio-box-text-container">
							<div class="portfolio-box-text">
								<p>
									<a href="#">사용 기술</a>
								</p>
							</div>
						</div>
					</div>	
			<!-- log -->		
					<div class="portfolio-box development" style="position: absolute; left: 495px; top: 175px;">
						<img src="assets/img/portfolio/log.png" alt="" data-at2x="assets/img/portfolio/6.jpg">
						<div class="portfolio-box-text-container">
							<div class="portfolio-box-text">
								<p>
									<a href="#">로그 코드</a>
								</p>
							</div>
						</div>
					</div>						
			<!-- 유즈케이스(admin) -->		
					<div class="portfolio-box development" style="position: absolute; left: 495px; top: 175px;">
						<img src="assets/img/portfolio/admin_use.PNG" alt="" data-at2x="assets/img/portfolio/6.jpg">
						<div class="portfolio-box-text-container">
							<div class="portfolio-box-text">
								<p>
									<a href="#">관리자 UseCase</a>
								</p>
							</div>
						</div>
					</div>
			<!-- 유즈케이스(super mgr) -->		
					<div class="portfolio-box development" style="position: absolute; left: 495px; top: 175px;">
						<img src="assets/img/portfolio/smgr_use.PNG" alt="" data-at2x="assets/img/portfolio/6.jpg">
						<div class="portfolio-box-text-container">
							<div class="portfolio-box-text">
								<p>
									<a href="#">부장 UseCase</a>
								</p>
							</div>
						</div>
					</div>
			<!-- 유즈케이스(mgr) -->		
					<div class="portfolio-box development" style="position: absolute; left: 495px; top: 175px;">
						<img src="assets/img/portfolio/mgr_use.PNG" alt="" data-at2x="assets/img/portfolio/6.jpg">
						<div class="portfolio-box-text-container">
							<div class="portfolio-box-text">
								<p>
									<a href="#">팀장 UseCase</a>
								</p>
							</div>
						</div>
					</div>
			<!-- 유즈케이스(user) -->		
					<div class="portfolio-box development" style="position: absolute; left: 495px; top: 175px;">
						<img src="assets/img/portfolio/user_use.png" alt="" data-at2x="assets/img/portfolio/6.jpg">
						<div class="portfolio-box-text-container">
							<div class="portfolio-box-text">
								<p>
									<a href="#">일반 사용자 UseCase</a>
								</p>
							</div>
						</div>
					</div>																		
			<!-- db1 -->		
					<div class="portfolio-box branding" style="position: absolute; left: 495px; top: 350px;">
						<img src="assets/img/portfolio/fortune6-1.png" alt="" data-at2x="assets/img/portfolio/9.jpg">
						<div class="portfolio-box-text-container">
							<div class="portfolio-box-text">
								<p>
									<a href="#">사용자 테이블</a>
								</p>
							</div>
						</div>
					</div>
			<!-- db2 -->		
					<div class="portfolio-box design" style="position: absolute; left: 15px; top: 525px;">
						<img src="assets/img/portfolio/fortune6-2.png" alt="" data-at2x="assets/img/portfolio/10.jpg">
						<div class="portfolio-box-text-container">
							<div class="portfolio-box-text">
								<p>
									<a href="#">알림 테이블</a>
								</p>
							</div>
						</div>
					</div>
			<!-- db3 -->		
					<div class="portfolio-box design" style="position: absolute; left: 15px; top: 525px;">
						<img src="assets/img/portfolio/trigger.JPG" alt="" data-at2x="assets/img/portfolio/10.jpg">
						<div class="portfolio-box-text-container">
							<div class="portfolio-box-text">
								<p>
									<a href="#">Trigger code</a>
								</p>
							</div>
						</div>
					</div>		
			<!-- db3 -->		
					<div class="portfolio-box development" style="position: absolute; left: 255px; top: 525px;">
						<img src="assets/img/portfolio/fortune6-3.png" alt="" data-at2x="assets/img/portfolio/11.jpg">
						<div class="portfolio-box-text-container">
							<div class="portfolio-box-text">
								<p>
									<a href="#">업무/회의 테이블</a>
								</p>
							</div>
						</div>
					</div>
			<!-- transaction code -->		
					<div class="portfolio-box development" style="position: absolute; left: 255px; top: 525px;">
						<img src="assets/img/portfolio/tranCode.png" alt="" data-at2x="assets/img/portfolio/11.jpg">
						<div class="portfolio-box-text-container">
							<div class="portfolio-box-text">
								<p>
									<a href="#">Transaction Code</a>
								</p>
							</div>
						</div>
					</div>
			<!-- 플로우차트1 -->		
					<div class="portfolio-box branding" style="position: absolute; left: 495px; top: 525px;">
						<img src="assets/img/portfolio/flowchart1.png" alt="" data-at2x="assets/img/portfolio/12.jpg">
						<div class="portfolio-box-text-container">
							<div class="portfolio-box-text">
								<p>
									<a href="#">웹소켓 Flow chart</a>
								</p>
							</div>
						</div>
					</div>
			<!-- 코드 1 -->		
					<div class="portfolio-box branding" style="position: absolute; left: 495px; top: 525px;">
						<img src="assets/img/portfolio/code1.png" alt="" data-at2x="assets/img/portfolio/12.jpg">
						<div class="portfolio-box-text-container">
							<div class="portfolio-box-text">
								<p>
									<a href="#">웹소켓 Code 1</a>
								</p>
							</div>
						</div>
					</div>
			<!-- 코드 2 -->		
					<div class="portfolio-box branding" style="position: absolute; left: 495px; top: 525px;">
						<img src="assets/img/portfolio/code2.png" alt="" data-at2x="assets/img/portfolio/12.jpg">
						<div class="portfolio-box-text-container">
							<div class="portfolio-box-text">
								<p>
									<a href="#">웹소켓 Code 2</a>
								</p>
							</div>
						</div>
					</div>				
			<!-- 플로우차트2 -->		
					<div class="portfolio-box branding" style="position: absolute; left: 495px; top: 525px;">
						<img src="assets/img/portfolio/flowchart2.png" alt="" data-at2x="assets/img/portfolio/12.jpg">
						<div class="portfolio-box-text-container">
							<div class="portfolio-box-text">
								<p>
									<a href="#">일정/차트 Flow chart</a>
								</p>
							</div>
						</div>
					</div>		
			<!-- 일정 -->		
					<div class="portfolio-box branding" style="position: absolute; left: 495px; top: 525px;">
						<img src="assets/img/portfolio/fortune8.png" alt="" data-at2x="assets/img/portfolio/12.jpg">
						<div class="portfolio-box-text-container">
							<div class="portfolio-box-text">
								<p>
									<a href="#">일정 관리</a>
								</p>
							</div>
						</div>
					</div>
			<!-- Power Point 3  -->		
					<div class="portfolio-box design" style="position: absolute; left: 15px; top: 350px;">
						<img src="assets/img/portfolio/pt3.png" alt="" data-at2x="assets/img/portfolio/7.jpg">
						<div class="portfolio-box-text-container">
							<div class="portfolio-box-text">
								<p>
									<a href="#">시연</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Team members -->
	<div class="team-container section-container">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 team section-description wow fadeIn animated"
					style="visibility: visible; animation-name: fadeIn;">
					<h2>Team members</h2>
					<div class="divider-1 wow fadeInUp animated"
						style="visibility: visible; animation-name: fadeInUp;">
						<span></span>
					</div>
				</div>
			</div>
			<div class="row">
			
			<div class="col-sm-4 team-box wow fadeInUp animated"
					style="visibility: visible; animation-name: fadeInUp;">
					<h3><font color="black">이성준</font></h3>
					<p>Project Manager</p>				
				</div>
				<div class="col-sm-4 team-box wow fadeInUp animated"
					style="visibility: visible; animation-name: fadeInUp;">
					<h3><font color="black">김지율</font></h3>
					<p>Admin / Notice</p>				
				</div>
				<div class="col-sm-4 team-box wow fadeInUp animated"
					style="visibility: visible; animation-name: fadeInUp;">
					<h3><font color="black">이명철</font></h3>
					<p>DB Modeling / Calendar</p>		
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 team-box wow fadeInUp animated"
					style="visibility: visible; animation-name: fadeInUp;">
					<h3><font color="black">김중완</font></h3>
					<p>DB Modeling / File Room</p>		
				</div>
				<div class="col-sm-4 team-box wow fadeInUp animated"
					style="visibility: visible; animation-name: fadeInUp;">
					<h3><font color="black">김지현</font></h3>
					<p>User Info / UI</p>		
				</div>
				<div class="col-sm-4 team-box wow fadeInUp animated"
					style="visibility: visible; animation-name: fadeInUp;">
					<h3><font color="black">이예지</font></h3>
					<p>Web Socket / Chart</p>		
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 team-box wow fadeInUp animated"
					style="visibility: visible; animation-name: fadeInUp;">
					<h3><font color="black">이승훈</font></h3>
					<p>Project Request/Response</p>		
				</div>
			</div>	
			
		</div>
	</div>

	<!-- Scroll to top -->
	<div class="section-container section-container-gray">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="scroll-to-top">
						<a class="scroll-link" href="#top-content"><i
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
				<div class="col-sm-12">
					<p style=" color: gray;" >Copyright © 2016 Fortune. All rights reserved.</p>
				</div>
			</div>
		</div>
	</footer>


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

	function moveSearchpage() {
		location.href="searchpage.htm";
	}
	

	function joins() {
		
		location.href="sign.htm";
	}
	
	$(function() {
		var message1 = <%=message%>;
		
		if(message1 == 1){
			swal('권한이 없습니다.');
		}
	});
	</script>

</body>
</html>