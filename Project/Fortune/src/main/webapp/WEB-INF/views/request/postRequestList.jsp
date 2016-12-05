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

</style>

<script type="text/javascript">

/* 
 작성자 : 이예지
 추가작업 :카드형태의 dropdown 함수 
 작업일 : 2016/12/05
 */

$(function(){
    Profile.load();
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
        	
        	alert( $(this).attr('id'));
        	
        	$('#hidden').val($(this).attr('id'));
        	
        	detailReqCollabo($(this).attr('id'));
         	$('#social-link'+$(this).attr('id')).toggleClass('active');
            $('#about-mesocial-link'+$(this).attr('id')).toggleClass('blur');
        });
        $('.social-link').click(function(){
        	
        	alert("gg");
          	$(this).toggleClass('active');
            $('#about-me'+$(this).attr('id')).toggleClass('blur');
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
    		console.log(state);
    		$.get("listReplyRequest2.htm", {st :state}, function(data, textStatus, req) {
    		
    			$('#'+state).addClass('active');
    			$('#requestlist').html(data);
    			
    		})
    	}

     
     //검색 기능 비동기 처리로 하였습니다.
    	function searchBtn(){
    		console.log()
    		$.ajax({
  	   		 
 	 			type: "get",
 	 			url:  "listReplyRequest2.htm",
 	 			cache: false,				
 	 			data:{me : $('#memoselect').val(),
 	 				  se:$('#search').val()},
 	 		    success:function(data){ //callback  
 	 		    	console.log($('#search').val());
 	 		    	console.log($('#memoselect').val());
 	 		    
 	 		    	
 	 		    	$("#requestlist").html(data); 
 	 		    
 	 		    },
 	 			error: function(){						
 	 				alert('Error while request..'	);
 	 			}
 	 		});
    		
    		
    	}
     
    	//페이징 처리를 비동기 처리로 처리 하였습니다. << 버튼으로 처리하였습니다.
    	function pazingBtn(){
    		
    		$.ajax({
  	   		 
 	 			type: "get",
 	 			url:  "listReplyRequest2.htm",
 	 			cache: false,				
 	 			data:{pg:1,
 	 				  st: "${st_query}",
 	 				  me: "${memo}", 
 	 				  se: "${search}"},
 	 		    success:function(data){ //callback  
 	 		    	console.log('${st_query}');
 	 		    	console.log('${memo}');
 	 		    	console.log('${search}');
 	 		    	
 	 		    
 	 		    	
 	 		    	$("#requestlist").html(data); 
 	 		    
 	 		    },
 	 			error: function(){						
 	 				alert('Error while request..'	);
 	 			}
 	 		});
    		
    		
    	}
    	//페이징 처리를 비동기 처리로 처리 하였습니다. < 버튼으로 처리하였습니다.
function pazingBtn2(){
    		
    		$.ajax({
  	   		 
 	 			type: "get",
 	 			url:  "listReplyRequest2.htm",
 	 			cache: false,				
 	 			data:{pg: "${from_page-1}",
 	 				  st: "${st_query}",
 	 				  me: "${memo}", 
 	 				  se: "${search}"},
 	 		    success:function(data){ //callback  
 	 		    	console.log('${st_query}');
 	 		    	console.log('${memo}');
 	 		    	console.log('${search}');
 	 		    	
 	 		    
 	 		    	
 	 		    	$("#requestlist").html(data); 
 	 		    
 	 		    },
 	 			error: function(){						
 	 				alert('Error while request..'	);
 	 			}
 	 		});
    		
    		
    	}
//페이징 처리를 비동기 처리로 처리 하였습니다. 번호 버튼으로 처리하였습니다.
function pazing3Btn(page){
	
	$.ajax({
 		 
			type: "get",
			url:  "listReplyRequest2.htm",
			cache: false,				
			data:{pg: page,
				  st: "${st_query}",
				  me: "${memo}", 
				  se: "${search}"},
		    success:function(data){ //callback  
		    	console.log('${st_query}');
		    	console.log('${memo}');
		    	console.log('${search}');
		    	
		    
		    	
		    	$("#requestlist").html(data); 
		    
		    },
			error: function(){						
				alert('Error while request..'	);
			}
		});
	
	
}
//페이징 처리를 비동기 처리로 처리 하였습니다. > 버튼으로 처리하였습니다.
function pazing4Btn(){
	
	$.ajax({
 		 
			type: "get",
			url:  "listReplyRequest2.htm",
			cache: false,				
			data:{pg: "${to_page+1}",
				  st: "${st_query}",
				  me: "${memo}", 
				  se: "${search}"},
		    success:function(data){ //callback  
		    	console.log('${st_query}');
		    	console.log('${memo}');
		    	console.log('${search}');
		    	
		    
		    	
		    	$("#requestlist").html(data); 
		    
		    },
			error: function(){						
				alert('Error while request..'	);
			}
		});
	
	
}
//페이징 처리를 비동기 처리로 처리 하였습니다. >> 버튼으로 처리하였습니다.
function pazing5Btn(){
	
	$.ajax({
 		 
			type: "get",
			url:  "listReplyRequest2.htm",
			cache: false,				
			data:{pg: "${all_page}",
				  st: "${st_query}",
				  me: "${memo}", 
				  se: "${search}"},
		    success:function(data){ //callback  
		    	console.log('${st_query}');
		    	console.log('${memo}');
		    	console.log('${search}');
		    	
		    
		    	
		    	$("#requestlist").html(data); 
		    
		    },
			error: function(){						
				alert('Error while request..'	);
			}
		});
	
	
}

///////////////////////////////////////////////////////////////////////////////////////////////////

function modifyReqCollabo(){
	
	var a=$('#hidden').val();

   	 $.ajax({
   		 
 			type: "get",
 			url:  "proEdit.htm",
 			cache: false,				
 			data:"collabo_req_index="+a,
 		    success:function(data){ //callback
 		    	$('#detail_footer').empty();
 		    	$("#detail").html(data);
			  
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
  		<ul class="nav nav-tabs" style="width:950px">
    		<li id="대기" class="active"><a onclick="selectState('대기')" data-toggle="tab">대기</a></li>
    		<li id="수락"><a onclick="selectState('수락')" data-toggle="tab">수락</a></li>
    		<li id="거절"><a onclick="selectState('거절')" data-toggle="tab">거절</a></li>
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


<!-- 가로로 한줄 ㅁㅁㅁ 씩 채우기-->
<c:forEach items="${list}" var="n" varStatus="status">
	<c:choose>
     	<c:when test="${(status.index)%3 eq 0}">
     	<!-- 가로로 한줄 ■ㅁㅁ (첫번째)-->
     		<div class="row grid-columns" style="width:1000px; margin-top:20px">
     			<div id="row1" style="height:200px" class="col-md-4 col">
					<div class="accordion-wrap">
	   					<div class="accordion">
        					<a href="#" class="active"><i class="fa fa-user"></i>&nbsp;${n.collabo_req_ID}</a>
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
                    						
                    						
                    								
        	            						
                    					
                    						  
        <!-- card안에 간단한 상세 내역 -->
                  								
                									
        
        
        <!-- +클릭시 나오는 작은 아이콘 (나중에 구현할 css 우선 보류) -->
                <div class="social-link" id="social-link${n.collabo_req_index}">
                    <a class="link link-twitter" href="http://twitter.com/khadkamhn/" target="_blank"><i class="fa fa-twitter"></i></a>
                    <a class="link link-codepen" href="http://codepen.io/khadkamhn/" target="_blank"><i class="fa fa-codepen"></i></a>
                    <a class="link link-facebook" href="http://facebook.com/khadkamhn/" target="_blank"><i class="fa fa-facebook"></i></a>
                    <a class="link link-dribbble" href="http://dribbble.com/khadkamhn" target="_blank"><i class="fa fa-dribbble"></i></a>
                </div>
            </div>
        </div>

    </div>
</div>
				</div>
</c:when>
    <c:otherwise>
      	<div id="row2" style="height:200px" class="col-md-4 col">
						<div class="accordion-wrap">
	   					<div class="accordion">
        					<a href="#" class="active"><i class="fa fa-user"></i>&nbsp;${n.collabo_req_ID}</a>
        						<div class="sub-nav active">
            						<div class="html about-me" id="about-mesocial-link${n.collabo_req_index}">
         <!-- 대기/수락/거절 상태에 따라 원 테두리 색 변경  -->
                       					<div class="photo" style=
                
               								 <c:choose>
												<c:when test="${n.collabo_req_state == '수락'}">
              										 "border:3px solid #1e851f"
                								</c:when>
                								
                								<c:when test="${n.collabo_req_state == '거절'}">
								 					"border:3px solid #dd2d16"
												</c:when>
												<c:otherwise>
								 					"border:3px solid #ddd"
												</c:otherwise>

											</c:choose>
										>
                 							<img src="images/언니회색.jpg" style="background:no-repeat center;width:100%; height: 100%">
         <!-- 사람 아이콘에 마우스 갖다댈시에 + 모양 띄우기-->
                    							<div class="photo-overlay" >
                        							<span id="${n.collabo_req_index}" class="plus">+</span>
                    							</div>
                  						</div>
        
        <!-- card안에 간단한 상세 내역 -->
                  								<h6>제목 : ${n.collabo_req_title}</h6>
                							 	<h6 style="font-weight: inherit;">작성일:${n.collabo_req_date}</h6>
                    						
                									
        
        
        <!-- +클릭시 나오는 작은 아이콘 (나중에 구현할 css 우선 보류) -->
                <div class="social-link" id="social-link${n.collabo_req_index}">
                    <a class="link link-twitter" href="http://twitter.com/khadkamhn/" target="_blank"><i class="fa fa-twitter"></i></a>
                    <a class="link link-codepen" href="http://codepen.io/khadkamhn/" target="_blank"><i class="fa fa-codepen"></i></a>
                    <a class="link link-facebook" href="http://facebook.com/khadkamhn/" target="_blank"><i class="fa fa-facebook"></i></a>
                    <a class="link link-dribbble" href="http://dribbble.com/khadkamhn" target="_blank"><i class="fa fa-dribbble"></i></a>
                </div>
            							</div>
       								 </div>
								</div>
							</div>
						</div>
		<!-- 3으로 나눈 나머지가 2 일때 ■ ■ ■ 한줄 채워지면 div row 닫아주기 -->	
			<c:if test="${(status.index)%3 eq 2}">
			</div>
			</c:if>
    	</c:otherwise>
  		</c:choose>
  		</c:forEach>
  		<!-- container div영역 닫기 -->
  		</div>
  	
		
		<!-- 페이징 처리하기  -->
		  		<div style="text-align: center; margin-left: -80px;">
					<ul class="pagination">
						<c:if test="${pg>block}">
							<li><a href="#" onclick="pazingBtn()">««</a></li>
							<%-- <li><a href="listReplyRequest.htm?pg=1&st=${st_query}&me=${memo}&se=${search}">««</a></li> --%>
							<li><a href="#" onclick="pazingBtn2()">«</a></li>
							<%-- <li><a href="listReplyRequest.htm?pg=${from_page-1}&st=${st_query}&me=${memo}&se=${search}">«</a></li> --%>
						</c:if>
						<c:if test="${pg<=block}">
							<li><a href="#">««</a></li>
							<li><a href="#">«</a></li>
						</c:if>
						<c:forEach begin="${from_page}" end="${to_page}" var="i">
							<c:if test="${i==pg}">
								<li class="active"><a href="#">${i}</a></li>
							</c:if>
							<c:if test="${i!=pg}">
								<li><a href="#" onclick="pazing3Btn(${i})">${i}</a></li>
								<%-- <li><a href="listReplyRequest.htm?pg=${i}&st=${st_query}&me=${memo}&se=${search}">${i}</a></li> --%>
							</c:if>
						</c:forEach>
						<c:if test="${to_page<all_page}">
							<li><a href="#" onclick="pazing4Btn()">»</a></li>
							<li><a href="#" onclick="pazing5Btn()">»»</a></li>
							</c:if>
						<c:if test="${to_page>=all_page}">
							<li><a href="#">»</a></li>
							<li><a href="#">»»</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		
			
					
</div>
		<!-- 상세보기 modal 부분-->
			<div class="container">
				<div class="modal fade" id="myModal3" role="dialog">
					<div class="modal-dialog modal-lg">

					<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">

								<button type="button" class="close" data-dismiss="modal">&times;</button>

							<h4 class="modal-title">상세보기</h4>

							</div>



						<div class="modal-body" id="detail">
							
							<script src="//cdn.ckeditor.com/4.5.11/standard/ckeditor.js"></script>
							
						
						</div>
						
						<div class="modal-footer" id="detail_footer">
							<input type="text" id="hidden">
							<input type="button" class="btn btn-default" onclick="modifyReqCollabo()" value="수정">
							<button type="button" class="btn btn-default"data-dismiss="modal">Close</button>
						</div>
					</div>

				</div>
			</div>

		</div>
		


</body>
</html>