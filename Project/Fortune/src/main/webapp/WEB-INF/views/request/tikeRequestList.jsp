<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="security"
   uri="http://www.springframework.org/security/tags"%>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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

<script type="text/javascript">
<%
String selectId = (String)request.getSession().getAttribute("real_accept_selectId");
%>

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
           
           $('#hidden').val($(this).attr('id'));
           
            $('#social-link'+$(this).attr('id')).toggleClass('active');
            $('#about-mesocial-link'+$(this).attr('id')).toggleClass('blur');
        });
        
      $('.social-link').click(function(){
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
             
                  $("#detail").html(data); 
                $('#myModal3').modal('show');
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
                 //alert(a);
                 console.log(data);
                 
                 $("#meneview").html(data); 
                   $('#myModal2').modal('show');
              
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
         console.log(state)
         
         $.get("requestList2.htm",{st :state}, function(data, textStatus, req) {
            $('#requestlist').html(data);
            $('#'+state).addClass('active');
            
            //console.log(data);
         });
      }
     //검색 기능 비동기 처리로 하였습니다.
      function searchBtn(){
         console.log()
         $.ajax({
              
             type: "get",
             url:  "requestList2.htm",
             cache: false,            
             data:{me : $('#memoselect').val(),
                  se:$('#search').val()},
              success:function(data){ //callback  
                 console.log($('#search').val());
                 console.log($('#memoselect').val());
              
                 
                 $("#requestlist").html(data); 
              
              },
             error: function(){                  
                alert('Error while request..'   );
             }
          });
         
         
      }
      function linkdetail(index){
         console.log(index);
         detailReqCollabo(index);
    }
     
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
            console.log('${st_query}');
            console.log('${memo}');
            console.log('${search}');



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
            console.log('${st_query}');
            console.log('${memo}');
            console.log('${search}');



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
            console.log('${st_query}');
            console.log('${memo}');
            console.log('${search}');



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
         console.log('${st_query}');
         console.log('${memo}');
         console.log('${search}');



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
            console.log('${st_query}');
            console.log('${memo}');
            console.log('${search}');



$("#requestlist").html(data); 

},
error: function(){                  
alert('Error while request..'   );
}
});


}

///////////////////////////////////////////////////////////////////////////////////////////////////
function cmaComma(obj) {
    var firstNum = obj.value.substring(0,1); // 첫글자 확인 변수
    var strNum = /^[/,/,0,1,2,3,4,5,6,7,8,9,/]/; // 숫자와 , 만 가능
    var str = "" + obj.value.replace(/,/gi,''); // 콤마 제거  
    var regx = new RegExp(/(-?\d+)(\d{3})/);  
    var bExists = str.indexOf(".",0);  
    var strArr = str.split('.');  
 
   /*  if (!strNum.test(obj.value)) {
        alert("숫자만 입력하십시오.\n\n특수문자와 한글/영문은 사용할수 없습니다.");
        obj.value = 1;
        obj.focus();
        return false;
    }
 
    if ((firstNum < "0" || "9" < firstNum)){
        alert("숫자만 입력하십시오.");
        obj.value = 1;
        obj.focus();
        return false;
    } */
 
    while(regx.test(strArr[0])){  
        strArr[0] = strArr[0].replace(regx,"$1,$2");  
    }  
    if (bExists > -1)  {
        obj.value = strArr[0] + "." + strArr[1];  
    } else  {
        obj.value = strArr[0]; 
    }
}
     
 

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



<title>Insert title here</title>
</head>
<body>
<!--전체 div영역 -->
<div class="container" id="requestlist" style="margin-top:20px">


<!--대기/수락/거절 tab영역 -->
<div class="tab-container">
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
                       <a href="#" class="active"><i class="fa fa-user"></i>&nbsp;[${n.dept_name}]${n.user_name}
                       <c:set value="${n.collabo_req_index}" var="req"/>
                       <c:if test="${fn:endsWith(req,'n')}">
                    <img src="assets/img/alarm/new1.png"/>
                       <c:set value="${fn:substringBefore(req,'n')}" var="req"/> 
                       </c:if>
                      </a>
                          <div class="sub-nav active">
                              <div class="html about-me" id="about-mesocial-link${req}">
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
                                             <span id="${req}" class="plus">+</span>
                                         </div>
                                            
                                         </div>
                                         <h6>제목 : ${n.collabo_req_title}</h6>
                                         <h6 style="font-weight: inherit;">작성일:${n.collabo_req_date}</h6>
                                             
        <%-- <input type="hidden" id="hiddendetail${n.collabo_req_index}" value="${n.collabo_req_index}"><input type="hidden" id="hiddendetailvalue" value="${n.collabo_req_index}"> --%>
        
        <!-- +클릭시 나오는 작은 아이콘 (나중에 구현할 css 우선 보류) -->
                <div class="social-link" id="social-link${req}">
                    <!-- 상세보기 --><a class="link link-twitter" onclick="detailReqCollabo(${req})" target="_blank"><i class="fa fa-twitter"></i></a>
                    <!-- 수락 --><a  data-toggle="modal" class="link link-codepen" onclick="memoReqCollabo(${req})" target="_blank"><i class="fa fa-codepen"></i></a>
                    <!-- 거절 --><a  data-toggle="modal" data-target="#myModal4" class="link link-facebook" onclick="refuseReqCollabo(${req})" target="_blank"><i class="fa fa-facebook"></i></a>
                </div>
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
                     <c:if test="${pg>block}">
                        <li><a href="#" onclick="pazingBtn()">««</a></li>
                        <li><a href="#" onclick="pazingBtn2()">«</a></li>
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
         <!--container div닫아주기 -->   
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
                  
                  </div>
                  
                  <div class="modal-footer" id="detail_footer">
                      <input type="hidden" id="hidden">
                      <button type="button" class="btn btn-default"data-dismiss="modal">Close</button>
                  </div>
               </div>

            </div>
         </div>

      </div>
         
         
         
      <!-- 거절을 하였을때 거절 사유를 쓸 때 사용됩니다.-모델 창입니다. -->



      <div class="container">
         <!-- Modal -->
         <div class="modal fade" id="myModal4" role="dialog">
            <div class="modal-dialog">

               <!-- Modal content-->
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal">&times;</button>
                     <h4 class="modal-title">거절 사유</h4>

                  </div>

                  <div class="modal-body">

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



                  <div class="modal-body"  style="height:500px">
      
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
      
      
      
      
      
      
      
</body>
</html>