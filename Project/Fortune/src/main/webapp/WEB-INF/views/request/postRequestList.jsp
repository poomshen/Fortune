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
	width: 100%;
	
}

#ajaxside {
	width: 40%;
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
     //대기 수락 거절을 비동기 처리로 사용하였다.
     function selectState(state){
    		console.log(state)
    		$.get("listReplyRequest2.htm", {st :state}, function(data, textStatus, req) {
    			$('#requestlist').html(data)
    		})
    	}


</script>



<title>Insert title here</title>
</head>
<body>
	<div id="requestlist">
	
	<div class="w3-panel w3-card-4">

		<div class="w3-dropdown-hover w3-left">
				<a onclick="selectState('대기')" class="btn btn-primary">대기</a>
				<a onclick="selectState('수락')" class="btn btn-primary">수락</a>
				<a onclick="selectState('거절')" class="btn btn-primary">거절</a>
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

<div class="w3-panel w3-card-4" style="float: left;">
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
									<c:if test="${sessionScope.info.user_id == n.user_ID}">
											<security:authorize
												access="hasAnyRole('ROLE_ADMIN','ROLE_SUPERMGR')">
												<a class="btn btn-primary"
													href="proEdit.htm?collabo_req_index=${n.collabo_req_index}">수정</a>
											</security:authorize>
									</c:if>
									</c:otherwise>

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
</div>
		
		
		
		</div>
<div class="w3-panel w3-card-4">
		<!-- Pagination 추가 시작 -->
				<div class="container" style="text-align: center; margin-left: -80px;">
					<ul class="pagination">
						<c:if test="${pg>block}">
							<li><a href="listReplyRequest.htm?pg=1&st=${st_query}">««</a></li>
							<li><a href="listReplyRequest.htm?pg=${from_page-1}&st=${st_query}">«</a></li>
						</c:if>
						<c:if test="${pg<=block}">
							<li><a href="#">««</a></li>
							<li><a href="#">«</a></li>
						</c:if>
						<c:forEach begin="${from_page}" end="${to_page}" var="i">
							<c:if test="${i==pg}">
								<li><a href="#">${i}</a></li>
							</c:if>
							<c:if test="${i!=pg}">
								<li><a href="listReplyRequest.htm?pg=${i}&st=${st_query}">${i}</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${to_page<all_page}">
							<li><a href="listReplyRequest.htm?pg=${to_page+1}&st=${st_query}">»</a></li>
							<li><a href="listReplyRequest.htm?pg=${all_page}&st=${st_query}">»»</a></li>
						</c:if>
						<c:if test="${to_page>=all_page}">
							<li><a href="#">»</a></li>
							<li><a href="#">»»</a></li>
						</c:if>
					</ul>
				</div>
				<!-- Pagination 추가 끝 -->
</div>
</div>

</body>
</html>