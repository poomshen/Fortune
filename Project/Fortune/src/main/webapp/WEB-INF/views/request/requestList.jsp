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
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.1.1.min.js"></script>	
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">


#pageside {
	width: 65%;
	
}

#ajaxside {
	width: 45%;
	float: right;
	margin: 1%;
	
}
</style>


<script type="text/javascript">



     //상세 정보를 보여주는 ajax 입니다.
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
 					$("#ReqCollabo").append("</div>");
 	 		      
 	 		     },
 	 			error: function(){						
 	 				alert('Error while request..'	);
 	 			}
 	 		});
 	}
     
     
     //수락을 하였을 때 비동기 처리로 하였습니다.
     function memoReqCollabo(a){
    	 
  		
  		 
  		 $.ajax({
 	   		 
	 			type: "get",
	 			url:  "accept.htm",
	 			cache: false,				
	 			data:{"collabo_req_index" : a,
	 				  "dept_no":${sessionScope.info.dept_no}},
	 		    success:function(data){ //callback  
	 		    	//alert(a);
	 		    	//console.log(data);
	 		    	
	 		    	$("#meneview").append($('#meneview').html(data)); 
	 		    
	 		    },
	 			error: function(){						
	 				alert('Error while request..'	);
	 			}
	 		});
  		
  	   	
  	}
     //거절 사유를 val 로 받아서 사용하였습니다.
     function refuseReqCollabo(a){
    	 $("#menuView2").empty();
   		 $("#refuseindex").val(a); 
}
   	
</script>



<title>협업 리스트</title>
</head>
<body>


	<div class="w3-panel w3-card-4">
<!-- 요청 입니다. -->
		<security:authorize access="hasAnyRole('ROLE_SUPERMGR','ROLE_ADMIN')">
			<div class="w3-dropdown-hover w3-left">
				<button onclick="myFunction()" class="w3-btn w3-light-grey"
					style="margin-right: 5px">요청</button>
				<div id="Demo"
					class="w3-dropdown-content w3-card-4  w3-animate-zoom">
					<a href="writerequest.htm" class="btn btn-primary">프로젝트 요청</a>
				</div>

			</div>
		</security:authorize>

<!-- 발신자 진행상황입니다. -->
		<div class="w3-dropdown-hover w3-left">
			<button onclick="myFunction()" class="w3-btn w3-light-grey">발신자
				진행상황</button>
			<div id="Demo" class="w3-dropdown-content w3-card-4  w3-animate-zoom">
				<a href="listReplyRequest.htm?st=대기" class="btn btn-primary">대기</a>
				<a href="listReplyRequest.htm?st=수락" class="btn btn-primary">수락</a>
				<a href="listReplyRequest.htm?st=거절" class="btn btn-primary">거절</a>
			</div>

		</div>

		<!-- 수신자 진행상황입니다. -->
		<div class="w3-dropdown-hover w3-left">
			<button onclick="myFunction()" class="w3-btn w3-light-grey"
				style="margin-left: 5px">수신자 진행상황</button>
			<div id="Demo" class="w3-dropdown-content w3-card-4  w3-animate-zoom">
				<a href="requestList.htm?st=대기" class="btn btn-primary">대기</a> <a
					href="requestList.htm?st=수락" class="btn btn-primary">수락</a> <a
					href="requestList.htm?st=거절" class="btn btn-primary">거절</a>
			</div>
		</div>

	</div>



<!-- 이곳은  w3-card-4 전체에 잡고 있습니다. CSS  -->
	<div class="w3-panel w3-card-4">
		<div id="ajaxside">
			<div class="panel panel-default"  style="position: fixed;">
				<div class="panel-heading">협업 리스트</div>
				<!-- 검색폼 추가 -->
				<div class="panel-body" id="ReqCollabo"></div>
			</div>
		</div>


		<c:forEach items="${list}" var="n">


			<div id="pageside" class="w3-small">
				<div style="float: left;">


					<div class="w3-panel w3-card-4">



						<!-- 요청담당자 쪽 그림 입니다. -->
						<div style="float: left;">

							<div class="w3-card-2" style="margin: 3px" align="center">
								<br> <img src="images/man1.PNG" alt="Norway"
									style="width: 100px; height: 100px; border-radius: 70%;" >
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
							<div class="w3-panel w3-card-2" align="center">
							
							<input type="button" class="btn btn-primary " 
										onclick="detailReqCollabo(${n.collabo_req_index})"
										value="상세보기"></input>
							
								<c:choose>
									<c:when test="${n.collabo_req_state == '수락'}">
										<input type="button" class="btn btn-primary disabled" value="수락완료" readonly="readonly">
									</c:when>
									<c:when test="${n.collabo_req_state == '거절'}"></c:when>

									<c:otherwise>
										<c:if test="${sessionScope.info.user_id == n.collabo_req_ID}">
											<input type="button" class="btn btn-primary" data-toggle="modal"
												data-target="#myModal2"
												onclick="memoReqCollabo(${n.collabo_req_index})" value="수락">

											<input type="button" data-toggle="modal"
												data-target="#myModal3"
												onclick="refuseReqCollabo(${n.collabo_req_index})"
												class="btn btn-primary" value="거절">
										</c:if>
										<c:if test="${sessionScope.info.user_id == n.user_ID}">
											<security:authorize
												access="hasAnyRole('ROLE_ADMIN','ROLE_SUPERMGR')">
												<a class="btn btn-primary"
													href="proEdit.htm?collabo_req_index=${n.collabo_req_index}">수정</a>
											</security:authorize>
										</c:if>
									</c:otherwise>

									





									<%-- <a href="proDel.htm?collabo_req_index=${n.collabo_req_index}">삭제</a>  --%>

								</c:choose>

							</div>

						</div>


						<!-- 수신자 쪽 그림 입니다. -->
						
						
						
						<div style="float: right;">

							<div class="w3-card-2" align="center" style="margin: 3px">
								<br> <img src="images/man2.PNG" alt="Norway"
									style="width: 100px; height: 100px; border-radius: 70%; ">
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


		<!-- 거절을 하였을때 거절 사유를 쓸 때 사용됩니다.-모델 창입니다. -->
		
		
		
		<div class="container">
			<!-- Modal -->
			<div class="modal fade" id="myModal3" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">거절 사유</h4>

						</div>
						
						<div class="modal-body">
						
						
						
			<!-- 거절사유를 사용해서 유효성 검사를 해놓았습니다. -->
<script type="text/javascript">

function refuse() {
	 
	
	 
	if($('#collabo_req_text').val() == "") {
		alert("거절 사유를 입력하세요. ");
		$('#collabo_req_text').focus();
		return false;
	}else{
			alert("완료");
			refusemenform.submit(); 
			return true;
	}
	
}

</script>
							<div id="menuView3">
								<!-- CSS 구성  -->
								<form action="refuse.htm" method="get" name="refusemenform">
								
									<div class="col-sm-6"></div>
									<br>
									<div>
									
										<input type="hidden" name="collabo_req_index" id="refuseindex">

										<dl>
											<dt>거절 사유</dt>
											<dd>
												<textarea class="form-control" name="collabo_req_text" 
													id="collabo_req_text" rows="3" cols="20"></textarea>
											</dd>
										</dl>
										<br />
										
										<div class="col-sm-2"></div>
										<div class="col-sm-10"></div>
									</div>
									
									<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
								<input type="button" class="btn btn-primary" value="거절 완료"
								onclick="refuse()">
							
						</div>
							
						</form>	
							</div>

							
						</div>
						

					</div>

				</div>
			</div>

		</div>


		<!-- 수락  내용을 확인 할때 쓰입니다. -->
		<!-- Modal -->
		<div class="container">
			<div class="modal fade" id="myModal2" role="dialog">
				<div class="modal-dialog modal-lg">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">

							<button type="button" class="close" data-dismiss="modal">&times;</button>

							<h4 class="modal-title">수락</h4>

						</div>
						
						
						
						<div class="modal-body">
						<!-- 날짜 유효성 검사를 한 곳입니다. -->
						<script type="text/javascript">
						 function proAdd(){
						     	if($('#startDate').val() == ""){
						     		alert(" 날짜 입력해주세요");
						     		$('#startDate').focus();
						     		return false;
						     	}
						     	else if($('#endDate').val() == "" ){
						     		alert(" 날짜 입력해주세요");
						     		$('#endDate').focus();
						     		return false;
						     	}else if($('#collabo_sal').val() == "" ){
						     		alert("예상수익 입력해주세요");
						     		$('#collabo_sal').focus();
						     		return false;
						     	}else {
						     		alert("완료");
						     		proaddform.submit();
						     		return true;
						     	}
						     	
						     	
						     }
						
						</script>
						<!-- 비동기 처리로 불렀습니다 .. lord -->
							<div id="meneview"></div>
					
							

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>

				</div>
			</div>

		</div>
	</div>


</body>
</html>