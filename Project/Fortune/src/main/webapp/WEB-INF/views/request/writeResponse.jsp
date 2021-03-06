<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <script src="alert_style/js/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="alert_style/css/sweetalert.css">
<script type="text/javascript">
                  $(function(){
                     
                     
                     $('#startDate').datepicker({
                             dateFormat: 'yy-mm-dd',
                            prevText: '이전 달',
                            nextText: '다음 달',
                            monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                            monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                            dayNames: ['일','월','화','수','목','금','토'],
                            dayNamesShort: ['일','월','화','수','목','금','토'],
                            dayNamesMin: ['일','월','화','수','목','금','토'],
                            showMonthAfterYear: true,
                            changeMonth: true,
                            changeYear: true,
                            yearSuffix: '년',
                            
                           minDate : 0,
                           onClose: function( selectedDate ) {    
                              // 시작일(fromDate) datepicker가 닫힐때
                                // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                                
                                $("#endDate").datepicker( "option", "minDate", selectedDate );
                             
                            
                              $('#endDate').datepicker("option","beforeShow", function(){
                              var td = $('#startDate').val().split("-");
                              td[1] = td[1]-1;
                              
                              var mDate = new Date(td[0], td[1],td[2]);
                              var nDate = new Date(td[0], td[1],td[2]);
                            
                              nDate.setDate(mDate.getDate() + 2000); //몇일까지 정하기
                                $("#endDate").datepicker( "option", "maxDate", nDate );
                              
                              });
                                
                           }
                     });

                     $('#endDate').datepicker({
                        dateFormat: 'yy-mm-dd',
                         prevText: '이전 달',
                         nextText: '다음 달',
                         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                         monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                         dayNames: ['일','월','화','수','목','금','토'],
                         dayNamesShort: ['일','월','화','수','목','금','토'],
                         dayNamesMin: ['일','월','화','수','목','금','토'],
                         showMonthAfterYear: true,
                         changeMonth: true,
                         changeYear: true,
                         yearSuffix: '년',
                     
                        onClose: function( selectedDate ) {
                               // 종료일(toDate) datepicker가 닫힐때
                               // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                               $("#startDate").datepicker( "option", "maxDate", selectedDate );
                           }       

                     });
                     

                        //캘린더 유효성검사
                            var date  = new Date($("#startDate").datepicker("getDate"));
                         var date1 = new Date($("#startDate").datepicker("getDate"));
                          var date2 = new Date($("#endDate").datepicker("getDate"));
                          $('#datecount').val((( date2 - date1 ) / (60*60*24*1000))+1); 
                        
                            if(date2 - date1 < 0){
                                     swal("끝 날짜가 시작날짜보다 이전일수 없습니다"); 
                                              
                                    return false;
                                 
                         }
                          
                     });
                  
                  
                  
                  </script>

<form action="writeresponse.htm" method="post" name="proaddform">
   <input type="hidden" name="collabo_req_index" value="${acceptlist.collabo_req_index}"> 
    <input type="hidden" name="collabo_req_no" value="${acceptlist.collabo_req_no}">

   <div class="col-sm-1"></div>
   <div class="col-sm-11">

      <br> <br>
      <div class="form-group ">

         <div>
            <label>수락자 :</label> <input type="text" name="collabo_req_ID"
               id="collabo_req_ID" class="form-control"
               value="${acceptlist.collabo_req_ID}" readonly="readonly">
         </div>
      </div>
      <br>
      <div class="form-group ">
            <label>팀장 선택 :</label> 
             <select name="user_ID" class="form-control">
            <c:forEach items="${listmanager}" var="list">
               <option value="${list.user_id}">[${list.team_name}]팀장:${list.user_name}</option>
            </c:forEach>
               </select>
         </div>

      <br>
      <div class="form-group ">
         <label>시작 날짜 :</label> <input type="text" name="collabo_start"
            class="form-control" id="startDate">
      </div>
      <div class="form-group ">
         <label>끝 날짜 :</label> <input type="text" name="collabo_end"
            class="form-control" id="endDate">
      </div>
      <br>
      <div >
         <label>진행 상태 :</label> <input type="text" name="collabo_state"
            class="form-control" value="대기" readonly="readonly">
      </div>
      <br>
      
    
      <div class="form-group ">
            <label>예상 수익 :</label> <input type="text" name="collabo_sal"
              onkeyup="cmaComma(this);" onchange="cmaComma(this);"
                  id="collabo_sal" class="form-control" placeholder="원단위 입력하세요">
         </div>
      <br>
      
      <br>
      


   </div>

   <div class="col-sm-1"></div>
   <div class="col-sm-11" style="text-align: right">
      <br> <input type="button" class="btn btn-default" value="완료" onclick="proAdd()">
   </div>
   
   <br> <br>
   
</form>