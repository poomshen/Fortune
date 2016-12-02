<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	/* int role = Integer.parseInt(request.getParameter("role_no")); */
%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Riona - One Page Bootstrap Business Template</title>

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


</head>

<body>

	<!-- Loader -->
	<div class="loader" style="display: none;">
		<div class="loader-img" style="display: none;"></div>
	</div>


	<!-- Top content -->
	<div class="top-content"
		style="position: relative; z-index: 0; background: none;">
		<div class="top-content-text wow fadeInUp animated"
			style="visibility: visible; animation-name: fadeInUp;">

			<br /><!-- 
			<img src="assets/img/logo/fortune.png"/> -->
			<h1>
				<a href="">fortune</a>
			</h1>
			

			<div class="top-content-bottom-link">
				
				<form role="form" action="" method="post" name ="f">
					<div class="col-sm-12 form-group container"	style="margin-left: 19%">
						<label class="sr-only" for="r-form-1-first-name">First name</label>

						<div class="input-group">
							<span class="addon"><i class="glyphicon glyphicon-user" aria-hidden="true"></i></span>
							<div class="form-group">
								<label class="sr-only" for="r-form-1-email">id</label> 
								<input type="text" name="user_id" style="background-color:transparent;" class="form-control hvr-glow" id="user_id" tabindex="1">
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
						<input type="button" onclick="joins()" class="btn hvr-forward" tabindex="4" value="join">

						&nbsp; &nbsp; &nbsp;						
						<button type="submit"  class="btn hvr-forward" tabindex="3" >login</button>
					</div>

				</form>
				<!-- 
					</div>

				</div>
			</div>
 -->
		</div>
		<span><a href="SearchIdPage.htm">아이디/패스워드를 잊어버리셨나요?</a></span>
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
				<div
					class="col-sm-12 what-we-do section-description wow fadeIn animated"
					style="visibility: visible; animation-name: fadeIn;">
					<h2>What we do</h2>
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


	<!-- Clients -->


	<!-- Counters -->


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
					<p>Ut wisi enim ad minim veniam, quis gostrud exerci tation
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
				<div class="col-sm-7 footer-copyright">
					© Riona Bootstrap Template by <a href="http://azmind.com">Azmind</a>.
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

	<script src="assets/js/jquery.magnific-popup.min.js"></script>
	<script src="assets/js/masonry.pkgd.min.js"></script>
	<script src="assets/js/scripts.js"></script>
	<script type="text/javascript">
	function joins() {
		location.href="sign.htm";
	}
	<%-- $(function() {
		alert(<%=role%>);
		if(<%=role%> == 1){
			alert('권한이 없습니다.');
		}
	}); --%>
	</script>

</body>
</html>