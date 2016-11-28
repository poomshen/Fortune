<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<style type="text/css">
img {
	border-radius: 70%;
}

#pageside {
	width: 65%;
	float: left;
}

#ajaxside {
	width: 30%;
	float: left;
	margin-left: 1%;
}
</style>


<script type="text/javascript">
     function proAjaxCall(a){
    	 $("#menuView").empty();
  	
   	 $.ajax({
   		 
 			type: "get",
 			url:  "ProDetail.htm",
 			cache: false,				
 			data:"collabo_req_index="+a,
 		    success:function(data){ //callback  
				$("#menuView").append($('#menuView').html(data)); 
 		      
 		     },
 			error: function(){						
 				alert('Error while request..'	);
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
     function memoReqCollabo(a){
  		
  		$("#menuView2").empty();
  	  	
  	   	 $.ajax({
  	   		 
  	 			type: "get",
  	 			url:  "accept.htm",
  	 			cache: false,
  	 			data:"collabo_req_index="+a,
  	 		    success:function(data){ //callback  
  					$("#menuView2").append($('#menuView2').html(data)); 
  	 		      
  	 		     },
  	 			error: function(){						
  	 				alert('Error while request..'	);
  	 			}
  	 		});
  	}
     
     function refuse() {
 		if($('#collabo_req_text').val() == "") {
 			alert("거절 사유를 입력하세요. ");
 			$('#collabo_req_text').focus();
 			return false;
 		}else{
 				alert("완료");
 				refuseform.submit(); 
 				return true;
 		}
 }
 	

</script>



<title>Insert title here</title>
</head>
<body>
	<security:authorize access="hasAnyRole('ROLE_SUPERMGR','ROLE_ADMIN')">
		<a href="writerequest.htm" class="btn btn-success">요청</a>
	</security:authorize>

	<a href="listReplyRequest.htm" class="btn btn-success">작성자 리스트</a>
	<a href="requestList.htm" class="btn btn-success">답장자 리스트</a>
	<a href="listallRequest.htm" class="btn btn-success">전체 리스트</a>


	<a href="listallRequest.htm?st=대기" class="btn btn-success">대기(전체전용)</a>
	<a href="listallRequest.htm?st=수락" class="btn btn-success">수락(전체전용)</a>
	<a href="listallRequest.htm?st=거절" class="btn btn-success">거절(전체전용)</a>





	<c:forEach items="${list}" var="n">






		<div id="pageside">
			<div style="float: left;">


				<div class="w3-panel w3-card-4">
					
					<!-- 요청담당자 쪽 그림 입니다. -->
					<div style="float: left;">

						<div class="w3-card-2" style="margin: 5px" align="center">
						<br>
							<img src="images/man1.PNG" alt="Norway"
								style="width: 100px; height: 100px">
							<div class="w3-container w3-center">
								<dl>
									<dt>요청발신자 :</dt>
									<dd>${n.user_ID}</dd>
								</dl>
							</div>
						</div>

					</div>
					<!-- 중앙 글 입니다. -->

					<div style="float: left;" class="w3-panel w3-card-4">
						<div class="row">

							<dl class="col-sm-4">
								<dd>내용</dd>
								<dd class="btn btn-info" data-toggle="modal"
									data-target="#myModal"
									onclick="proAjaxCall(${n.collabo_req_index})">
									<span class="glyphicon glyphicon-blackboard"></span>
								</dd>
							</dl>

							<dl class="col-sm-4">
								<dd>번호</dd>
								<dd class="collabo_req_index">${n.collabo_req_index}</dd>
							</dl>

							<dl class="col-sm-4">
								<dd>진행상태</dd>
								<dd>${n.collabo_req_state}</dd>
							</dl>


							<dl>

								<dd class="col-sm-12">제목:${n.collabo_req_title}</dd>
							</dl>






							<dl>

								<dd class="col-sm-12">작성일: ${n.collabo_req_date}</dd>
							</dl>



						</div>
						<div class="w3-panel w3-card-2">



							
								<input type="button" 
									onclick="detailReqCollabo(${n.collabo_req_index})" value="상세보기">
								
								
								
								<input type="button" class="btn btn-info" data-toggle="modal"
									data-target="#myModal2" onclick="memoReqCollabo(${n.collabo_req_index})" value="수락"> 
								
								<a data-toggle="modal" data-target="#myModal3"
								class="btn btn-info btn-md">거절</a>

						</div>

					</div>








					<!-- 수신자 쪽 그림 입니다. -->
					<div style="float: right;">
						
						<div class="w3-card-2" align="center" style="margin: 5px">
						<br>
							<img src="images/man2.PNG" alt="Norway"
								style="width: 100px; height: 100px">
							<div class="w3-container w3-center">
								<dl>
									<dt>요청수신자 :</dt>
									<dd>${n.collabo_req_ID}</dd>
								</dl>
							</div>
						</div>

					</div>
				</div>



			</div>
		</div>
	</c:forEach>

	<div id="ajaxside">
		<div class="panel panel-default">
			<div class="panel-heading">협업 리스트</div>
			<!-- 검색폼 추가 -->
			<div id="ReqCollabo">어떻게 먹을까</div>
		</div>
	</div>



<!-- 상세 내용을 확인 할때 쓰입니다. -->
	<div class="container">
		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-lg">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">협업모음 프로젝트</h4>

					</div>
					<div class="modal-body">

						<p>
						<div id="menuView">아아</div>
									<p></p>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>

	</div>
	
	<!-- 수락  내용을 확인 할때 쓰입니다. -->
	<div class="container">
		<!-- Modal -->
		<div class="modal fade" id="myModal2" role="dialog">
			<div class="modal-dialog modal-lg">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">협업모음 프로젝트</h4>

					</div>
					<div class="modal-body">

						<div id="menuView2">아아</div>
									<p></p>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>

	</div>

<!-- 거절을 하였을때 거절 사유를 쓸 때 사용됩니다. -->
<div class="container">
		<!-- Modal -->
		<div class="modal fade" id="myModal3" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">협업모음 프로젝트</h4>

					</div>
					<div class="modal-body">
						<div>
							<!-- CSS 구성  -->
						
							<form action="refuse.htm" method="get" name="refuseform">
							<div class="col-sm-6"></div>
							<br>
							<div>
							<c:forEach items="${list}" var="n">
								<input type="hidden" name="collabo_req_index"  value="${n.collabo_req_index}">
							</c:forEach>
								<dl>
									<dt>거절 사유</dt>
									<dd>
										<textarea class="form-control" name="collabo_req_text" id="collabo_req_text" rows="3" cols="20"></textarea>
									</dd>
								</dl>
							<br/>
							
							<div class="col-sm-2"></div>
							<div class="col-sm-10">
								
							</div>
							</div>
							</form>
							
						</div>
							
						<br><br>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<input type="button"  class="btn btn-default" value="거절 완료" onclick="refuse()">
					</div>
					
				</div>

			</div>
		</div>

	</div>

</body>
</html>