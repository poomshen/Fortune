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
	
	function detailReqCollabo(a){
		 $("#menuView2").empty();
    		 $("#ReqCollabo").empty();
	  	
	   	 $.ajax({
	   		 
	 			type: "get",
	 			url:  "ProDetail.htm",
	 			cache: false,				
	 			data:"collabo_req_index="+a,
	 		    success:function(data){ //callback  
	 		    	$("#ReqCollabo").append("<div>");
					$("#ReqCollabo").append($('#ReqCollabo').html(data)); 
					$("#ReqCollabo").append("<div>");
	 		      
	 		     },
	 			error: function(){						
	 				alert('Error while request..'	);
	 			}
	 		});
	}
	
	function ctionQuestion(collabo){
		$("#modaldivs").html("<button type='button' class='btn btn-default'"
				+"onclick='collaboComplete("+collabo+")' >수락</button>"
				+"<button type='button' class='btn btn-default' data-dismiss='modal'>취소</button>"		
		);
	}
	
	function collaboComplete(collabo){
		$.get("collaboComplet.htm", {collabo_no:collabo }, function(data, textStatus, req) {
			$("#responsbody").html(data);
		})
			$("#myModal").modal("hide");
	}
	
	//스크롤 페이지 처리 하기 
 	function selectListForm()  {
 		 $("div#lastPostsLoader").html("<div  class='btn btn-primary btn-lg btn-block'><h1style='color: white;'>로딩중..</h1></div>");
 		 $.get("responseListFrom.htm?pg="+ $(".responseFrom:last").attr("id"), function(data, textStatus, req) {
 		        if (data != "") {  
 		        $(".responseFrom:last").after(data);             
 		        }  
 		 
 		 })
 	}

 	$(window).scroll(function(){  
        if  ($(window).scrollTop() == $(document).height() - $(window).height()){  
        	selectListForm();  
        }  
});  
</script>
<style type="text/css">
#pageside {
	width: 55%;
	float: left;
}
#ajaxside{
	width: 40px;
	float: left;
	margin-left: 1%;
}
#cardLeft{
	float: left;
}
#footerCard{
	float: left;
}
.btnDivs a{
	width: 100%;
}
.btnDivs{
	float: left;
	margin-left :2%;
	width:48%;
}
#responsbody{
	margin-left: 3%;
}
.responseFrom{
	margin: 2% 0 2% 1% ;
}
</style>

<title>[효율적인업무 For春]</title>
</head>
<body>
<div id ="responsbody">

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">[협업 목록]</h1>
		</div>
		<!-- /.col-lg-12 -->
	<div id="pageside">
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">협업 리스트</div>
					<!-- 검색폼 추가 -->
					<div class="w3-card-4"></div>
						<c:forEach items="${list}" var="n">
							<div class="w3-card-4 responseFrom" id="${n.num}"
								style="width: 98%; ">
							<div id="cardLeft" >
								<header class="w3-container "> 
								번호: ${n.collabo_no} 기간: ${n.collabo_start} ~ ${n.collabo_end}
								<h1>${n.collabo_req_title}</h1>
								<c:choose>
										<c:when test="${n.collabo_sal  == null}">
										</c:when>
										<c:otherwise>
											예상 수익: ${n.collabo_sal}￦
										</c:otherwise>
									</c:choose>
								<br>
								팀장 : ${n.user_ID}
								<br>
								부장 : ${n.collabo_req_ID}
								<h5>${n.collabo_state}
								<security:authorize access="hasAnyRole('ROLE_SUPERMGR')">
								<a data-toggle="modal" data-target="#myModal"  class="btn btn-primary" onclick="ctionQuestion(${n.collabo_no })" >완료</a>
								</security:authorize>
								</h5>
								 </header>
								</div>
								<footer class="w3-container " >
								<br>
								<div >
								<div class="btnDivs">
									<a href="schedule.htm?collabo_no=${n.collabo_no}" class="btn btn-primary">
									<i class="glyphicon glyphicon-calendar"></i><br>일정</a>
								</div>
								<div class="btnDivs">
									<a href="mainfile.htm?collabo_no=${n.collabo_no}" class="btn btn-primary">
									<i class="glyphicon  glyphicon-cloud"></i><br>자료실</a>
								</div>
								<br>
								<div class="btnDivs">
									<a  onclick="detailReqCollabo(${n.collabo_req_index})" class="btn btn-primary"> 
									<i class="glyphicon  glyphicon-th-list"></i><br>상세 보기</a>
								</div>
								<div class="btnDivs">
									<a href="historyList.htm?collabo_req_no=${n.collabo_req_no }" class="btn btn-primary"> 
									<i class="glyphicon  glyphicon-th-list"></i><br>히스토리보기</a>
								</div>
								</div> 
								</footer>
							</div>
							<!-- 여기에서 CSS 제공 -->
						</c:forEach>
				<br>
					<div id="lastPostsLoader"></div>
				<br>
					</div>
				</div>
			</div>
		</div>
		<div  id="ajaxside">
		<div class="panel panel-default"  style="position: fixed; ">
			<div class="panel-heading">협업 리스트</div>
			<!-- 검색폼 추가 -->
			<div  id="ReqCollabo" style="overflow: auto;"></div>
			</div>
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
						<h4 class="modal-title">정말 프로젝트가 완료 되었습니까?</h4>
					</div>
					<div class="modal-footer">
						<span id="modaldivs">
						</span>
					</div>
				</div>

			</div>
		</div>

	</div>
	</div>
</body>
</html>