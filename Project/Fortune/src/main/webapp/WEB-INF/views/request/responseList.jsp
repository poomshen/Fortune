<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 성준 추가 UI  -->

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">




<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script type="text/javascript">
	function proAjaxManager(a) {
		$.ajax({
			type : "get",
			url : "insertmanager.htm",
			cache : false,
			data : {"collabo_req_index=" : a,"dept_no" : ${sessionScope.info.dept_no}},
			success : function(data) { //callback  

				$('#menuView').empty();

				$("#menuView").append($('#menuView').html(data));

			},
			error : function() {
				alert('Error while request..');
			}
		});

	}
	
	function detailReqCollabo(a){
		
		$("#menuView").empty();
	  	
	   	 $.ajax({
	   		 
	 			type: "get",
	 			url:  "ProDetail.htm",
	 			cache: false,				
	 			data:"collabo_req_index="+a,
	 		    success:function(data){ //callback  
					$("#ReqCollabo").append($('#ReqCollabo').html(data)); 
	 		      
	 		     },
	 			error: function(){						
	 				alert('Error while request..'	);
	 			}
	 		});
	}
</script>
<style type="text/css">
#pageside {
	width: 55%;
	float: left;
}
#ajaxside{
	width: 400px;
	float: left;
	margin-left: 1%;
}
#cardLeft{
	float: left;
}
#footerCard{
	float: left;
}
</style>

<title>Insert title here</title>
</head>
<body>

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">[협업 목록]</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<div id="pageside">
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">협업 리스트</div>
					<!-- 검색폼 추가 -->
						<c:forEach items="${list}" var="n">
							<div class="w3-card-2"
								style="width: 98%; margin-top: 1%; margin-left: 1%; margin-bottom: 1%;">
						<div id="cardLeft" >
								<header class="w3-container "> 
								번호: ${n.collabo_no} 기간: ${n.collabo_start} ~ ${n.collabo_end}<br>
								
								
								<c:choose>
										<c:when test="${n.collabo_sal  == null}">
											
										</c:when>
										<c:otherwise>
											예상 수익: ${n.collabo_sal}　만원
										</c:otherwise>
									</c:choose>
								
								<h1>프로젝트 제목</h1>
								팀장 :<%--  <security:authorize
									access="hasAnyRole('ROLE_SUPERMGR')">
									<c:choose>
										<c:when test="${n.user_ID  == null}">
											<a data-toggle="modal" data-target="#myModal"
												class="btn btn-default btn-md"
												onclick="proAjaxManager(${n.collabo_req_index})">담당</a>
										</c:when>
										<c:otherwise>
											<a data-toggle="modal" data-target="#myModal"
												class="btn btn-default btn-md"
												onclick="proAjaxManager(${n.collabo_req_index})">담당</a>
										</c:otherwise>
									</c:choose>
								
								</security:authorize> --%> ${n.user_ID}
								<br>
								부장 ${n.collabo_req_ID}
								<h5>${n.collabo_state}</h5>
								
								 </header>
								</div>
								<footer class="w3-container " >
								<div style="float: right;">
								<div>
									<a href="schedule.htm?collabo_no=${n.collabo_no}" class="btn btn-primary">
									<i class="glyphicon glyphicon-calendar"></i><br>일정</a>
								</div>
								<div>
									<a href="mainfile.htm?collabo_no=${n.collabo_no}" class="btn btn-primary">
									<i class="glyphicon  glyphicon-cloud"></i><br>자료실</a>
								</div>
								<div>
									<a href="#" onclick="detailReqCollabo(${n.collabo_req_index})" class="btn btn-primary"> 
									<i class="glyphicon  glyphicon-th-list"></i><br>상세 보기</a>
								</div>
								</div> 
								</footer>
							</div>
							<!-- 여기에서 CSS 제공 -->
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	<div  id="ajaxside">
		<div class="panel panel-default">
		
			<div class="panel-heading">협업 리스트</div>
			<!-- 검색폼 추가 -->
			<div id="ReqCollabo"></div>
			</div>
		
	</div>



	<div class="container">
		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">협업모음 프로젝트</h4>

					</div>
					<div class="modal-body">
						<div id="menuView"></div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>

	</div>


	<a href="responseList.htm">리스트</a>
</body>
</html>