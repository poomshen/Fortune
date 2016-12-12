<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
   uri="http://www.springframework.org/security/tags"%>

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
        //$("#menuView2").empty();
        //$("#ReqCollabo").empty();
         
        
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
                 alert('Error while request..'   );
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
                 
                 $("#meneview").append($('#meneview').html(data)); 
              
              },
             error: function(){                  
                alert('Error while request..'   );
             }
          });
        
           
     }
     //거절 사유를 val 로 받아서 사용하였습니다.
     function refuseReqCollabo(a){
        $("#menuView2").empty();
          $("#refuseindex").val(a); 
}
     //대기 수락 거절을 비동기 처리로 사용하였다.
      function selectState(state){
         
         $.get("requestList2.htm",{st :state}, function(data, textStatus, req) {
            $('#requestlist').html(data);
         });
      }
     //검색 기능 비동기 처리로 하였습니다.
      function searchBtn(){
         $.ajax({
              
             type: "get",
             url:  "requestList2.htm",
             cache: false,            
             data:{me : $('#memoselect').val(),
                  se:$('#search').val()},
              success:function(data){ //callback  
                 
                 $("#requestlist").html(data); 
              
              },
             error: function(){                  
                alert('Error while request..'   );
             }
          });
         
         
      }

     
////////////////////////////////////////////////////////////////////////////////////////////////////////////
//페이징 처리를 비동기 처리로 처리 하였습니다. << 버튼으로 처리하였습니다.
function pazingBtn(){

$.ajax({

         type: "get",
         url:  "requestList2.htm",
         cache: false,            
         data:{pg:1,
            st: "${st_query}",
            me: "${memo}", 
            se: "${search}"},
         success:function(data){ //callback  

         $("#requestlist").html(data); 

      },
         error: function(){                  
            alert('Error while request..'   );
      }
});


}
//페이징 처리를 비동기 처리로 처리 하였습니다. < 버튼으로 처리하였습니다.
function pazingBtn2(){

$.ajax({

         type: "get",
         url:  "requestList2.htm",
         cache: false,            
         data:{pg: "${from_page-1}",
            st: "${st_query}",
            me: "${memo}", 
            se: "${search}"},
         success:function(data){ //callback  

         $("#requestlist").html(data); 

      },
         error: function(){                  
            alert('Error while request..'   );
      }
});


}
//페이징 처리를 비동기 처리로 처리 하였습니다. 번호 버튼으로 처리하였습니다.
function pazing3Btn(page){

$.ajax({

         type: "get",
         url:  "requestList2.htm",
         cache: false,            
         data:{pg: page,
            st: "${st_query}",
            me: "${memo}", 
            se: "${search}"},
         success:function(data){ //callback  



         $("#requestlist").html(data); 

      },
         error: function(){                  
         alert('Error while request..'   );
   }
});


}
//페이징 처리를 비동기 처리로 처리 하였습니다. > 버튼으로 처리하였습니다.
function pazing4Btn(){

$.ajax({

      type: "get",
      url:  "requestList2.htm",
      cache: false,            
      data:{pg: "${to_page+1}",
         st: "${st_query}",
         me: "${memo}", 
         se: "${search}"},
      success:function(data){ //callback  

      $("#requestlist").html(data); 

   },
      error: function(){                  
         alert('Error while request..'   );
   }
});


}
//페이징 처리를 비동기 처리로 처리 하였습니다. >> 버튼으로 처리하였습니다.
function pazing5Btn(){

   $.ajax({

         type: "get",
         url:  "requestList2.htm",
         cache: false,            
         data:{pg: "${all_page}",
            st: "${st_query}",
            me: "${memo}", 
            se: "${search}"},
         success:function(data){ //callback  


$("#requestlist").html(data); 

},
error: function(){                  
alert('Error while request..'   );
}
});


}


</script>



<title>[효율적인업무 For春]</title>
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
                       <a href="#" class="active"><i class="fa fa-user"></i>&nbsp;[${n.dept_name}]${n.user_name}{${n.collabo_req_ID}}</a>
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
                    <a class="link link-twitter" href="detailReqCollabo(${n.collabo_req_index})" target="_blank"><i class="fa fa-twitter"></i></a>
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
                       <a href="#" class="active"><i class="fa fa-user"></i>&nbsp;[${n.dept_name}]${n.user_name}{${n.collabo_req_ID}}</a>
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
                    <a class="link link-twitter" href="detailReqCollabo(${n.collabo_req_index})" target="_blank"><i class="fa fa-twitter"></i></a>
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
















 <!-- ---------------------------------------          변경 전            ---------------------------------------------------------- -->

   <%-- <div id="requestlist">

   

   <div class="w3-panel w3-card-4">

      <div class="w3-dropdown-hover w3-left">
         <a onclick="selectState('대기')" class="btn btn-primary">대기</a> 
         <a onclick="selectState('수락')" class="btn btn-primary">수락</a> 
         <a onclick="selectState('거절')" class="btn btn-primary">거절</a>
      </div>
      
      
      <!-- 검색 기능 쪽입니다. -->
      <div class="w3-dropdown-hover w3-right">
      
      <select id="memoselect">
      <option value="collabo_req_title">제목</option>
      <option value="collabo_req_text">내용</option>
      </select>
      <input type="text" id="search" placeholder="Search" >
      <button onclick="searchBtn()">검색</button>
      </div>
      
      
   </div>

   <!-- 이곳은  w3-card-4 전체에 잡고 있습니다. CSS  -->
   <div class="w3-panel w3-card-4">
   
      <div id="ajaxside">
         <div class="panel panel-default" style="position: fixed;">
            <div class="panel-heading">협업 리스트1</div>
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
                           style="width: 100px; height: 100px; border-radius: 70%;">
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
                           onclick="detailReqCollabo(${n.collabo_req_index})" value="상세보기"></input>

                        <c:choose>
                           <c:when test="${n.collabo_req_state == '수락'}">
                              <input type="button" class="btn btn-primary disabled"
                                 value="수락완료" readonly="readonly">
                           </c:when>
                           <c:when test="${n.collabo_req_state == '거절'}"></c:when>

                           <c:otherwise>
                              <c:if test="${sessionScope.info.user_id == n.collabo_req_ID &&n.collabo_req_state != '완료' }">
                                 <input type="button" class="btn btn-primary"
                                    data-toggle="modal" data-target="#myModal2"
                                    onclick="memoReqCollabo(${n.collabo_req_index})" value="수락">

                                 <input type="button" data-toggle="modal"
                                    data-target="#myModal3"
                                    onclick="refuseReqCollabo(${n.collabo_req_index})"
                                    class="btn btn-primary" value="거절">
                              </c:if>
                           </c:otherwise>


                        </c:choose>

                     </div>

                  </div>


                  <!-- 수신자 쪽 그림 입니다. -->



                  <div style="float: right;">

                     <div class="w3-card-2" align="center" style="margin: 3px">
                        <br> <img src="images/man2.PNG" alt="Norway"
                           style="width: 100px; height: 100px; border-radius: 70%;">
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
--%>
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
                        }
                          else {
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
<%-- <div class="w3-panel w3-card-4">
<!-- Pagination 추가 시작 -->
            <div class="container" style="text-align: center; margin-left: -80px;">
               <ul class="pagination">
                  <c:if test="${pg>block}">
                     <li><a href="#" onclick="pazingBtn()">««</a></li>
                     <li><a href="requestList.htm?pg=1&st=${st_query}&me=${memo}&se=${search}">««</a></li>
                     <li><a href="#" onclick="pazingBtn2()">«</a></li>
                     <li><a href="requestList.htm?pg=${from_page-1}&st=${st_query}&me=${memo}&se=${search}">«</a></li>
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
                        <li><a href="requestList.htm?pg=${i}&st=${st_query}&me=${memo}&se=${search}">${i}</a></li>
                     </c:if>
                  </c:forEach>
                  <c:if test="${to_page<all_page}">
                     <li><a href="#" onclick="pazing4Btn()">»</a></li>
                     <li><a href="#" onclick="pazing5Btn()">»»</a></li>
                     
                     <li><a href="requestList.htm?pg=${to_page+1}&st=${st_query}&me=${memo}&se=${search}">»</a></li>
                     <li><a href="requestList.htm?pg=${all_page}&st=${st_query}&me=${memo}&se=${search}">»»</a></li>
                  </c:if>
                  <c:if test="${to_page>=all_page}">
                     <li><a href="#">»</a></li>
                     <li><a href="#">»»</a></li>
                  </c:if>
               </ul>
            </div>
            <!-- Pagination 추가 끝 -->

   </div> --%>
</body>
</html>