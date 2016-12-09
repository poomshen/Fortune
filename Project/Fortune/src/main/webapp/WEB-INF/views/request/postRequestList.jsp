<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!-- 
작성자 : 이예지
최초작업일 : 2016/12/05
최종수저일 : 2016/12/05
추가작업 : css 변경 및 상세보기 -> modal로 변경
 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
h6 {
    color: #777;
    font-weight: bolder;
}

.tg  {border-collapse:collapse;border-spacing:0;width:100%;height:350px}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
.tg .tg-baqh{text-align:center;}
.tg .title{text-align:center;font-weight:900;}

</style>
<%
   request.setCharacterEncoding("UTF-8");
   String selectId = (String)request.getAttribute("selectId");
%>

<script type="text/javascript">

/* 
 작성자 : 이예지
 추가작업 :카드형태의 dropdown 함수 
 작업일 : 2016/12/05
 */


$(function(){
	//성준 추가
	$("#${state}").addClass('active');
	$("#states").val('${state}');

    Profile.load();

   	console.log('<%=selectId%>');
   	var select = '<%=selectId%>';
    if(select!='null')
    {
    	setTimeout(function(){
    		
    		console.log("setTimeout / "+select)
    		send(select)
    			
    	
    	}, 3000); 
    }

    
    
    
});

Profile = {
    load:function(){
        this.links();
        this.social();
        this.accordion();
    },
    links:function(){
        $('a[href="#"]').click(function(e){
            e.preventDefault();
        });
    },
    social:function(){
        $('.plus').click(function(){
        	
        	$('#hidden').val($(this).attr('id'));
        	
        	detailReqCollabo($(this).attr('id'));
         	$('#social-link'+$(this).attr('id')).toggleClass('active');
        });
        $('.social-link').click(function(){
        	
        	alert("gg");
          	$(this).toggleClass('active');
        });
    },
    accordion:function(){
        var subMenus = $('.accordion .sub-nav').hide();
        $('.accordion > a').each(function(){
            if($(this).hasClass('active')){
                $(this).next().slideDown(100);
            }
        });
        $('.accordion > a').click(function(){
            $this = $(this);
            $target =  $this.next();
            $this.siblings('a').removeAttr('class');
            $this.addClass('active');
            if(!$target.hasClass('active')){
                subMenus.removeClass('active').slideUp(100);
                $target.addClass('active').slideDown(100);
            }
            return false;
        });
    }
}

	//수정 ) modal 상세보기 수정시 사용되는 함수
	function modify() {
	 
	if($('#collabo_req_title').val() == "") {
		alert("협업 제목을 입력하세요 ");
		$('#collabo_req_title').focus();
		return false;
	}else{
			alert("완료");
			modifyform.submit(); 
			return true;
		}
	
	}




     //상세 정보를 보여주는 ajax 입니다.
     function detailReqCollabo(a){
		
		//modal body 부분 비워주기
 	   	 $.ajax({
 	   		 
 	 			type: "get",
 	 			url:  "ProDetail.htm",
 	 			cache: false,				
 	 			data:"collabo_req_index="+a,
 	 		    success:function(data){ //callback  
 	 		    	
 	 		    	console.log(data);
 	 		    	
 	 		    	
 	 		    	//modal body 부분에 ajax로 부른 상세 테이블 붙이고 modal 띄우기
 					$("#detail").html(data); 
 					$('#myModal3').modal('show');
 					
 	 		      
 	 		     },
 	 			error: function(){						
 	 				alert('Error while request..'	);
 	 			}
 	 		});
 	}
     //대기 수락 거절을 비동기 처리로 사용하였다.
     function selectState(state){
    		if(state == '전체'){
    	 	$.get("listReplyRequest2.htm", function(data, textStatus, req) {
    			$('.requestpage').html(data);
    			$('#'+state).addClass('active');
    			$("#states").val(state);
    	 		});
    		}else{
    	 	$.get("listReplyRequest2.htm", {st :state,state:state}, function(data, textStatus, req) {
    			
    			$('.requestpage').html(data);
    			$('#'+state).addClass('active');
    			$("#states").val(state);
    			
    		});
    		}
    	}

     
     //검색 기능 비동기 처리로 하였습니다.
    	function searchBtn(){
    		$.ajax({
  	   		 
 	 			type: "get",
 	 			url:  "listReplyRequest2.htm",
 	 			cache: false,				
 	 			data:{
 	 				me : $('#memoselect').val(),
 	 				  se:$('#search').val()},
 	 		    success:function(data){ //callback 
 	 		    	$(".requestpage").html(data); 
 	 		    	$("#전체").addClass('active');
 	 				$("#states").val('전체');
 	 		    
 	 		    },
 	 			error: function(){						
 	 				alert('Error while request..'	);
 	 			}
 	 		});
    		
    		
    	}
     
    	//페이징 처리를 비동기 처리로 처리 하였습니다. << 버튼으로 처리하였습니다.
    	function pazingBtn(page,searchval,memoval){
    		console.log('페이지 :' + searchval);
		    console.log('페이지 :' + memoval);
		    console.log("상태 : " + '${st_query}');
		    console.log("상태 : " + $("#states").val());
    		if($("#states").val() == '전체'){
        	 	$.get("listReplyRequest2.htm",{pg:page,
	 				  st: '${st_query}',
	 				  me: memoval,
	 				  se: searchval,
	 				  /* me: "${memo}",
	 				  se: "${search}", */
	 				state:$("#states").val()}, function(data, textStatus, req) {
        			$('.requestpage').html(data);
        			$("#${state}").addClass('active');
        			$("#states").val('${state}');
        	 		});
        		}else if($("#states").val() == '대기' || $("#states").val() == '수락' || $("#states").val() == '거절' || $("#states").val() == '완료'){
            		
            		$.ajax({
          	   		 
         	 			type: "get",
         	 			url:  "listReplyRequest2.htm",
         	 			cache: false,				
         	 			data:{pg:page,
         	 				  st: $("#states").val(),
         	 				  me: "${memo}", 
         	 				  se: "${search}",
         	 				state:$("#states").val()},
         	 		    success:function(data){ //callback  
         	 		    	
         	 		    	$(".requestpage").html(data); 
         	 		    	$("#${state}").addClass('active');
         	 			$("#states").val('${state}');
         	 				
         	 		    
         	 		    },
         	 			error: function(){						
         	 				alert('Error while request..'	);
         	 			}
         	 		});
                		}else{
                    		
                    		$.ajax({
                  	   		 
                 	 			type: "get",
                 	 			url:  "listReplyRequest2.htm",
                 	 			cache: false,				
                 	 			data:{pg:page,
                 	 				  st: '${st_query}',
                 	 				  me: "${memo}", 
                 	 				  se: "${search}",
                 	 				state:$("#states").val()},
                 	 		    success:function(data){ //callback  
                 	 		    	
                 	 		    	$(".requestpage").html(data); 
                 	 		    	$("#${state}").addClass('active');
                 	 			$("#states").val('${state}');
                 	 				
                 	 		    
                 	 		    },
                 	 			error: function(){						
                 	 				alert('Error while request..'	);
                 	 			}
                 	 		});
                        		}
    		
    	}


function modifyReqCollabo(){
	
	var a=$('#hidden').val();

   	 $.ajax({
   		 
 			type: "get",
 			url:  "proEdit.htm",
 			cache: false,				
 			data:"collabo_req_index="+a,
 		    success:function(data){ //callback
 		    	//$('#detail_footer').empty();
 		    	$("#detail2").html(data);
			  
 		     },
 			error: function(){						
 				alert('Error while request..'	);
 			}
 		});
}

     
     
</script>

<!-- 
작성자 : 이예지
작성일 : 2016/12/05
추가내용 : css 전체적으로 변경
 -->

<title>Insert title here</title>
</head>
<body>

<!--전체 div영역 -->
<div class="container" id="requestlist" style="margin-top:20px">

<!--대기/수락/거절 tab영역 -->

<div class="tab-container">
		<input type="hidden" id="states">
  		<ul class="nav nav-tabs" style="width:950px">
  		<li id="전체"><a onclick="selectState('전체')" data-toggle="tab">전체</a></li>
    		<li id="대기"><a onclick="selectState('대기')" data-toggle="tab">대기</a></li>
    		<li id="수락"><a onclick="selectState('수락')" data-toggle="tab">수락</a></li>
    		<li id="거절"><a onclick="selectState('거절')" data-toggle="tab">거절</a></li>
    		<li id="완료"><a onclick="selectState('완료')" data-toggle="tab">완료</a></li>
  		</ul>
	<div class="tab-content">
    	<div class="tab-pane" ></div>
    	<div class="tab-pane" ></div>
    	<div class="tab-pane" ></div>
	</div>
</div>
<!-- 보낸 요청함 card 띄워주는 영역 -->
<!-- 검색영역   -->
<div class="row grid-columns"style="width:1000px; height:20px; margin-top:2px">
     <div id="row" style="height:20px;margin-left: 700px;" class="col-md-6 col">
		
		<select id="memoselect">
			<option value="collabo_req_title">제목</option>
			<option value="collabo_req_text">내용</option>
		</select>
		
		<input type="text" id="search" placeholder="Search" >
		
		<button onclick="searchBtn()">검색</button>
	</div>
</div>


<div class="col-lg-12" style="width:1000px; margin-top:20px">
<!-- 가로로 한줄 ㅁㅁㅁ 씩 채우기-->
<c:forEach items="${list}" var="n" varStatus="status">

     	<!-- 가로로 한줄 ■ㅁㅁ (첫번째)-->
    			<div id="row1" style="height:200px" class="col-md-4 col">
					<div class="accordion-wrap">
	   					<div class="accordion">
        					<a href="#" class="active"><i class="fa fa-user"></i>&nbsp;[${n.dept_name}]${n.user_name}</a>
        						<div class="sub-nav active">
            						<div class="html about-me" id="about-mesocial-link${n.collabo_req_index}">
         <!-- 대기/수락/거절 상태에 따라 원 테두리 색 변경  -->
                       					<div class="photo" style=
                
               								 <c:choose>
												<c:when test="${n.collabo_req_state == '수락'}">
              										 "border:3px solid #1e851f; margin-right:0px"
                								</c:when>
                								
                								<c:when test="${n.collabo_req_state == '거절'}">
								 					"border:3px solid #dd2d16"
												</c:when>
												<c:otherwise>
								 					"border:3px solid #ddd; margin-right:0px"
												</c:otherwise>

											</c:choose>
										>
                 							<img src="images/언니회색.jpg" style="background:no-repeat center;width:100%; height: 100%">
         <!-- 사람 아이콘에 마우스 갖다댈시에 + 모양 띄우기-->
                    							<div class="photo-overlay" >
                        							<span id="${n.collabo_req_index}" class="plus">+</span>
                    							</div>
           		         						
	                    						</div>
	                    						<h6>제목 : ${n.collabo_req_title}</h6>
                							 	<h6 style="font-weight: inherit;">작성일:${n.collabo_req_date}</h6>
                    						

            </div>
        </div>

    </div>
</div>
				</div>

  		</c:forEach>
  		</div>
  		<!-- container div영역 닫기 -->
  			<div class="row grid-columns"style="width:1000px; height:100px; margin-top:2px">
  		  		<!-- 페이징 처리하기  -->
		  		<div style="text-align: center; margin-left: -80px;">
					<ul class="pagination">
							<c:if test="${pg != 1}">
								<c:if test="${pg == from_page}">
									<li><a href="#" onclick="pazingBtn('1','${search}','${memo}')">««</a></li>
									<li><a href="#" onclick="pazingBtn('${from_page-1}','${search}','${memo}')">«</a></li>
								</c:if>
								<c:if test="${pg > from_page}">
									<li><a href="#" onclick="pazingBtn('1','${search}','${memo}')">««</a></li>
									<li><a href="#" onclick="pazingBtn('${pg - 1}','${search}','${memo}')">«</a></li>
								</c:if>
							</c:if>
								<c:forEach begin="${from_page}" end="${to_page}" var="i">
									<c:if test="${i==pg}">
										<li class="active"><a href="#">${i}</a></li>
									</c:if>
									<c:if test="${i!=pg}">
										<li><a href="#" onclick="pazingBtn('${i}','${search}','${memo}')">${i}</a></li>
									</c:if>
								</c:forEach>
								<!-- 다음 페이지 -->
							<c:if test="${list.size() != 0}">
								<c:if test="${pg < to_page || pg != all_page}">
									<li><a href="#" onclick="pazingBtn('${pg + 1}','${search}','${memo}')">»</a></li>
									<li><a href="#" onclick="pazingBtn('${all_page}','${search}','${memo}')">»»</a></li>
								</c:if>
								<c:if test="${to_page > all_page && pg != all_page}">
									<li><a href="#" onclick="pazingBtn('${to_page + 1}','${search}','${memo}')">»</a></li>
									<li><a href="#" onclick="pazingBtn('${all_page}','${search}','${memo}')">»»</a></li>
								</c:if>
							</c:if>
						</ul>
					</div>
				</div>
			<!--container div닫아주기 -->	
			</div>
			
	

		<!-- 상세보기 modal 부분-->
			<div class="container">
				<div class="modal fade " id="myModal3" role="dialog">
					<div class="modal-dialog modal-lg">

					<!-- Modal content-->
						<div class="modal-content" id="detail2">
							<div class="modal-header">

								<button type="button" class="close" data-dismiss="modal">&times;</button>

							<h4 class="modal-title">상세보기</h4>
						</div>
						
						<div class="modal-body" id="detail">
						<script src="//cdn.ckeditor.com/4.5.11/standard/ckeditor.js"></script>	
						</div>
						
						
					</div>

				</div>
			</div>

		</div>

</body>
</html>