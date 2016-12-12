<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
   uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="button_style/buttons.css">
<script type="text/javascript" src="button_style/buttons.js"></script>
<html>
<style type="text/css">
h6 {
   color: #777;
   font-weight: bolder;
}

.tg {
   border-collapse: collapse;
   border-spacing: 0;
   width: 100%;
   height: 350px
}

.tg td {
   font-family: Arial, sans-serif;
   font-size: 14px;
   padding: 10px 5px;
   border-style: solid;
   border-width: 1px;
   overflow: hidden;
   word-break: normal;
}

.tg th {
   font-family: Arial, sans-serif;
   font-size: 14px;
   font-weight: normal;
   padding: 10px 5px;
   border-style: solid;
   border-width: 1px;
   overflow: hidden;
   word-break: normal;
}

.tg .tg-baqh {
   text-align: center;
}

.tg .title {
   text-align: center;
   font-weight: 900;
}
</style>
<body>
   <script type="text/javascript">
      $(function() {
         Profile.load();
      });
   
      Profile = {
         load : function() {
            this.links();
            this.social();
            this.accordion();
         },
         links : function() {
            $('a[href="#"]').click(function(e) {
               e.preventDefault();
            });
         },
         social : function() {
            /*    
            
               $('.plus').click(function() {
               
               $(this)
   
               $('#hidden').val($(this).attr('id'));
                detailReqCollabo($(this).attr('id'));
            }); */

         },
         accordion : function() {
            var subMenus = $('.accordion .sub-nav').hide();
            $('.accordion > a').each(function() {
               if ($(this).hasClass('active')) {
                  
                  $(this).next().slideDown(100);
                  
               }
            });
            $('.accordion > a').click(function() {
               
               $this = $(this);
               $target = $this.next();
               $this.siblings('a').removeAttr('class');
               $this.addClass('active');
               if (!$target.hasClass('active')) {
                  
                  subMenus.removeClass('active').slideUp(100);
                  $target.addClass('active').slideDown(100);
               }
               return false;
            });
         }
      }
      
      
      //추가사항) detail누를 때 알림 삭제
      function detail(req,collabo_no){
       
         
         $('#img'+collabo_no+'n').css("display","none");
       
   
  			  
  	         
  	         $.ajax({
  	                
  	                type: "post",
  	                url:  "MyProDetail.htm",
  	                cache: false,            
  	                data:{
  	                
  	                   "collabo_req_index":req,
  	                   "collabo_no":collabo_no
  	                },
  	                 success:function(data){ 
  	                  $("#detail").html(data); 
  	                  $('#myModal3').modal('show');
  	                  
  	              	$.ajax({
  	          		  
  	          		  type:"post",
  	          		  dataType: "html",
  	          		  url:"newAlarm.htm",
  	          		  data:{"newAlarm": "상세 삭제"},
  	          		  success:function(data){
  	          			  
  	          			  $('#alarm').empty();  
  	          			  $('#alarm').html(data);  
  	                  
  	          		  }
  	                  
  	               });	
  	                
  	                  },
  	                error: function(){                  
  	                   alert('Error while request..'   );
  	                },
  	                beforeSend:function(){
  	                    $('.wrap-loading').removeClass('display-none');
  	                },
  	                complete:function(){
  	                    $('.wrap-loading').addClass('display-none');
  	                }
  	             });
  			  
  			  
  		
  		  }
  	 
  	
         

         
      
      
      
      //비동기 상세 보기를 위한 함수   
      function detailReqCollabo(a){
      
      
          $.ajax({
             
             type: "get",
             url:  "ProDetail.htm",
             cache: false,            
             data:"collabo_req_index="+a,
              success:function(data){ //callback  
               $("#detail").html(data); 
               $('#myModal3').modal('show');
               },
             error: function(){                  
                alert('Error while request..'   );
             }
          });
      }
      // 완료하기  수락 버튼 함수
      function ctionQuestion(collabo){
    	  
    	  
          swal({
              title: "프로젝트를 완료하시겠습니까?",
              type: "info",
              showCancelButton: true,
              confirmButtonColor: "#DD6B55",
              confirmButtonText: "완료",
              cancelButtonText: "취소",
              showLoaderOnConfirm: false,
              closeOnConfirm: false
            },
            function(){
            	
            	collaboComplete(collabo);
            	swal("완료!", "완료된 프로젝트에서 확인해주세요", "success");
          
               }
            );
      }  
    	  

      
      //완료후 비동기 처리
      function collaboComplete(collabo){
         $.get("collaboComplet.htm", {collabo_no:collabo }, function(data, textStatus, req) {
            $(".requestpage").html(data);
         })
            $("#myModal").modal("hide");
      }
      
      //페이징 처리를 비동기 처리로 처리 하였습니다. 
      function pazingBtn(pg){

      $.ajax({

               type: "get",
               url:  "responseList2.htm",
               cache: false,            
               data:{pg:pg},
               success:function(data){ //callback  
               $(".requestpage").html(data); 

            },
               error: function(){                  
                  alert('Error while request..'   );
            }
      });
      }

      //////
      //대기 수락 거절 메뉴 비동기 위한 함수
      //대기 수락 거절을 비동기 처리로 사용하였다.
      function selectState(state){
         if(state == "전체"){
           $.get("requestList2.htm", function(data, textStatus, req) {
             $('.requestpage').html(data);
             $('#'+state).addClass('active');
              });   
          }else{
         if(state == "수락"){
            $.get("responseList2.htm", function(data, textStatus, req) {
               $('.requestpage').html(data);
               $('#'+state).addClass('active');
            })
         }else{
         $.get("requestList2.htm",{st :state}, function(data, textStatus, req) {
            $('.requestpage').html(data);
            $('#'+state).addClass('active');
            
         });
         }
          }
      }
      
      function goSchedule(collabo_no){
    	  
    	  location.href="schedule.htm?collabo_no="+collabo_no;       
    	  
      }
   
  	 function goHistory(collabo_req_no){
    	  
    	  location.href="historyList.htm?collabo_req_no="+collabo_req_no;      
    	  
      }
   </script>
   <!--전체 div영역 -->
   <div class="container" id="collaboList" style="margin-top: 20px">
         <security:authorize access="hasAnyRole('ROLE_SUPERMGR')">

         <!--대기/수락/거절 tab영역 -->
         <div class="tab-container">
            
            <ul class="nav nav-tabs" style="width: 950px">
               <li id="전체"><a onclick="selectState('전체')" data-toggle="tab">전체</a></li>
               <li id="수락"><a onclick="selectState('수락')" data-toggle="tab">진행중</a></li>
               <li id="대기"><a onclick="selectState('대기')" data-toggle="tab">대기</a></li>
               <li id="거절"><a onclick="selectState('거절')" data-toggle="tab">거절</a></li>
               <li id="완료"><a onclick="selectState('완료')" data-toggle="tab">완료</a></li>
            </ul>
            <div class="tab-content">
               <div class="tab-pane"></div>
               <div class="tab-pane"></div>
               <div class="tab-pane"></div>
            </div>
         </div>
         <div class="row grid-columns"style="width:1000px; height:20px; margin-top:2px">
     <div id="row" style="height:20px;margin-left: 620px;" class="col-md-6 col">
		
		<select id="memoselect" class="form-control" style="width: 20%; display: inline; font-size: 12px; color: #666;">
			<option value="collabo_req_title">제목</option>
			<option value="collabo_req_text">내용</option>
		</select>
		
		<input type="text" id="search" placeholder="Search" class="form-control" style="width: 35%; display: inline; font-size: 12px; color: #666;">
		
		<input class="btn btn-primary" onclick="searchBtn()" value="검색" style="width: 60px;">
	</div>
</div>
         </security:authorize>
         <security:authorize access="hasAnyRole('ROLE_MGR','ROLE_USER')">
         <div class="row">
            <div class="col-lg-12">
               <h6 class="page-header">[협업 목록]</h6>
            </div>
            <!-- /.col-lg-12 -->
            <div id="pageside">
         </security:authorize>

               <div class="col-lg-12" style="width: 1000px; margin-top: 20px">
                  <!-- 가로로 한줄 ㅁㅁㅁ 씩 채우기-->
                  <c:forEach items="${list}" var="n" varStatus="status">

                     <!-- 가로로 한줄 ■ㅁㅁ (첫번째)-->
                     <div id="row1" style="height: 230px" class="col-md-4 col">
                  
                        
                        <div class="accordion-wrap" style="height:180px">
                           <div class="accordion" style="height:180px">
                                 
                       
                              <a href="#" class="active"><i class="fa fa-user"></i>
                                 [${teamName[status.index].team_name}]${teamName[status.index].user_name}<c:set value="${n.collabo_no}"
                                    var="collabo_no" /> <c:if test="${fn:endsWith(collabo_no,'n')}">
                                    <img id="img${collabo_no}"style="width: 28px;height: 16px"src="assets/img/alarm/new1.png" />
                                    <c:set value="${fn:substringBefore(collabo_no,'n')}" var="collabo_no" />
                                 </c:if> </a>
                        <div class="sub-nav active">
                        <div class="html about-me" style="height:150px" id="about-mesocial-link${n.collabo_req_index}">
                        
                        <div class="row" style="margin-bottom: 0px;padding-bottom: 10px;">
                   
                          <div class="col-sm-2" style="margin-left: 4px;">
                          
                          <input type="button" style="color:#194f89;background-color: #f8f8f8;width: 41px;height: 24px;padding-left: 5px;padding-top: 3px;padding-right: 5px;"class="btn btn-primary hvr-ripple-out" onclick="goSchedule('${collabo_no}')" value="일정">
                          </div>
                       
                          <div class="col-sm-3" style="margin-left: 4px;">
                          
                          <input type="button" style="color:#194f89;background-color: #f8f8f8;width: 60px;height: 24px;padding-left: 5px;padding-top: 3px;padding-right: 5px;"class="btn btn-primary hvr-ripple-out" onclick="goHistory(${n.collabo_req_no})" value="history">
                          </div>
                         
                         <div class="col-sm-1" style="margin-left:4px">
                          <security:authorize access="hasAnyRole('ROLE_SUPERMGR')">
                          <input type="button" style="color:#194f89;background-color: #f8f8f8;width: 41px;height: 24px;padding-left: 5px;padding-top: 3px;padding-right: 5px;"class="btn btn-primary hvr-ripple-out"  onclick="ctionQuestion(${collabo_no})" value="완료">
                        
                         </security:authorize>
                   		 </div>
                          </div>
                              <!-- 대기/수락/거절 상태에 따라 원 테두리 색 변경  -->
                                    <div class="photo"
                                       style="border: 3px solid #1e851f; margin-right: 0px">
                                     	<img src="images/회색돋보기.png" style="background:no-repeat center;width: 30px;height: 40px;padding-top: 10px;">
                                       <!-- 사람 아이콘에 마우스 갖다댈시에 + 모양 띄우기-->
                                       <div class="photo-overlay">
                                          <span id="${n.collabo_req_index}" onclick="detail(${n.collabo_req_index},${collabo_no})" class="plus">+</span>
                                       </div>

                                    </div>
                                    
                                    <h6>제목 : ${n.collabo_req_title}</h6>
                                         <h6 style="font-weight: inherit;">기간 ${n.collabo_start}-${n.collabo_end}</h6>

                                 </div>
                              </div>

                             </div>
                        </div>
                     </div>
                  </c:forEach>

               </div>
               <!-- container div영역 닫기 -->
               <c:if test="${collabo_null != 777}">
               <div class="row grid-columns"
                  style="width: 1000px; height: 100px; margin-top: 2px">
                  <!-- 페이징 처리하기  -->
                  <div style="text-align: center; margin-left: -80px;">
                     <ul class="pagination">
                        <c:if test="${pg != 1}">
							<c:if test="${pg == from_page}">
                           		<li><a href="#" onclick="pazingBtn('1')">««</a></li>
                           		<li><a href="#" onclick="pazingBtn('${from_page-1}')">«</a></li>
                        	</c:if>
                        <c:if test="${pg > from_page}">
							<li><a href="#" onclick="pazingBtn('1')">««</a></li>
							<li><a href="#" onclick="pazingBtn('${pg - 1}')">«</a></li>
                        </c:if>
                     </c:if>
                        <c:forEach begin="${from_page}" end="${to_page}" var="i">
                           <c:if test="${i==pg}">
                              <li class="active"><a href="#">${i}</a></li>
                           </c:if>
                           <c:if test="${i!=pg}">
                              <li><a href="#" onclick="pazingBtn('${i}')">${i}</a></li>
                           </c:if>
                        </c:forEach>
                        <!-- 다음 페이지 -->
                     <c:if test="${list.size() != 0}">
                        <c:if test="${pg < to_page || pg != all_page}">
                           <li><a href="#" onclick="pazingBtn('${pg + 1}')">»</a></li>
                           <li><a href="#" onclick="pazingBtn('${all_page}')">»»</a></li>
                        </c:if>
                        <c:if test="${to_page > all_page && pg != all_page}">
                           <li><a href="#" onclick="pazingBtn('${to_page + 1}')">»</a></li>
                           <li><a href="#" onclick="pazingBtn('${all_page}')">»»</a></li>
                        </c:if>
                     </c:if>
                     </ul>
                  </div>
               </div>
               </c:if>
               <!--container div닫아주기 -->
            </div>





      <!-- 상세보기 modal 부분 -->
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

               </div>

            </div>
         </div>

      </div>

   </div>

</body>
</html>