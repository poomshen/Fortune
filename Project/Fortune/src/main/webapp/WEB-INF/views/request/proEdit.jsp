<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!-- 받은 요청함 상세보기(진행중 X) -->
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
                   alert("끝 날짜가 시작날짜보다 이전일수 없습니다"); 
                            
                  return false;
               
       }
        
   });



</script>



<form action="writeresponse.htm" method="post" name="proaddform" enctype="multipart/form-data">

	<!-- 요청 부서, 요청자 -->
	<div class="row" style="margin-top: 5px;">	
		<div class="col-sm-2" style="margin-top: 10px;">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>요청 부서</label>
		</div>
		<div class="col-sm-4">
			<input type="text" class="form-control" readonly="readonly" value="${requestuser_info.dept_name}">
		</div>
		<div class="col-sm-2" style="margin-top: 10px;">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>요청자</label>
		</div>
		<div class="col-sm-4">
			<input type="text" class="form-control" readonly="readonly" value="${requestuser_info.user_name}">
		</div>
	</div>
	
	<!-- 수신 부서, 수신자 -->
	<div class="row" style="margin-top: 5px;">	
		<div class="col-sm-2" style="margin-top: 10px;">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>수신 부서</label>
		</div>
		<div class="col-sm-4">
			<input type="text" class="form-control" readonly="readonly" value="${receiveuser_info.dept_name}">
		</div>
		<div class="col-sm-2" style="margin-top: 10px;">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>수신자</label>
		</div>
		<div class="col-sm-4">
			<input type="text" class="form-control" readonly="readonly" value="${receiveuser_info.user_name}">
		</div>
	</div>
	
	<!-- 작성일, 상태 -->
	<div class="row" style="margin-top: 5px;">	
		<div class="col-sm-2" style="margin-top: 10px;">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>작성일</label>
		</div>
		<div class="col-sm-4">
			<input type="text" class="form-control" readonly="readonly" value="${list.collabo_req_date}">
		</div>
		<div class="col-sm-2" style="margin-top: 10px;">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>상태</label>
		</div>
		<div class="col-sm-4">
			<input type="text" class="form-control" readonly="readonly" value="${list.collabo_req_state}">
		</div>
	</div>
	
	<!-- 첨부파일 -->
	<div class="row" style="margin-top: 5px;">
		<div class="col-sm-2" style="margin-top: 10px;">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>첨부파일</label>
		</div>
		<div class="col-sm-10">
			<div class="form-control">
				<a style="display: inline;" id="file_src_tag" class="w3-small" href="download.htm?p=upload&f=${list.collabo_req_filesrc}">${list.collabo_req_filesrc}</a>
				<input id="collabo_req_filesrc" type="hidden" name="files[0]" value="${list.collabo_req_filesrc}">
			</div>
		</div>
	</div>
	
	<!-- 프로젝트 명 -->
	<div class="row" style="margin-top: 5px;">
		<div class="col-sm-2" style="margin-top: 10px;">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>프로젝트명</label>
		</div>
		<div class="col-sm-10">
			<input type="text" id="collabo_req_title" name="collabo_req_title" class="form-control" readonly="readonly" value="${list.collabo_req_title}">
		</div>
	</div>
	
	<!-- 프로젝트 내용 -->
	<div class="row" style="margin-top: 5px;">
		<div class="col-sm-2" style="margin-top: 60px;">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>프로젝트 내용 </label>
		</div>
		<div class="col-sm-10">
			<textarea readonly="readonly" rows="8" cols="50" class="form-control"
				name="collabo_req_text" id="collabo_req_text">${list.collabo_req_text}</textarea>
		</div>
	</div>
	
	<c:if test='${list.collabo_req_state eq "대기"}'>
	<!-- 팀장, 예상 수익 -->
	<div class="row" style="margin-top: 5px;">
		<div class="col-sm-2" style="margin-top: 10px;">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>팀장</label>
		</div>
		<div class="col-sm-4">
			<select name="user_ID" class="form-control">
				<c:forEach items="${listmanager}" var="list">
					<option value="${list.user_id}">[${list.team_name}]팀장:${list.user_name}</option>
				</c:forEach>
			</select>
		</div>
		
		<div class="col-sm-2" style="margin-top: 10px;">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>예상 수익</label>
		</div>
		<div class="col-sm-4">
			<input type="text" name="collabo_sal" onkeyup="cmaComma(this);" onchange="cmaComma(this);"
                  id="collabo_sal" class="form-control" placeholder="원단위 입력하세요">
		</div>
	</div>
	
	<!-- 시작 날짜, 끝 날짜 -->
	<div class="row" style="margin-top: 5px;">
		<div class="col-sm-2" style="margin-top: 10px;">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>시작 날짜</label>
		</div>
		<div class="col-sm-4">
			<input type="text" name="collabo_start" class="form-control" id="startDate">
		</div>
		
		<div class="col-sm-2" style="margin-top: 10px;">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>끝 날짜</label>
		</div>
		<div class="col-sm-4">
			<input type="text" name="collabo_end" class="form-control" id="endDate">
		</div>
	</div>
	</c:if>
<input type="hidden" id="hidden" value="${list.collabo_req_index}">
<input type="hidden" name="collabo_req_index" value="${list.collabo_req_index}">
<input type="hidden" name="collabo_req_no" value="${list.collabo_req_no}">

<div class="modal-footer" id="detail_footer">
	<!-- <input type="hidden" id="hidden"> -->
	<c:if test='${list.collabo_req_state eq "대기"}'>
		<input type="button" class="btn btn-primary" onclick="proAdd()" value="수락">
		<input type="button" class="btn btn-primary" onclick="refuseReqCollabo(${list.collabo_req_index})" value="거절">
	</c:if>
	<input id="modal_close_btn1" type="button" class="btn btn-primary" data-dismiss="modal" value="취소">
</div>
</form>
































<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
.cke_top {
	/* border-bottom: 1px solid #b6b6b6; */
	padding: 6px 8px 2px;
	border: none;
	white-space: normal;
	box-shadow: 0 1px 0 #fff inset;
	background: rgba(51, 122, 183, 0.33);
	filter: progid:DXImageTransform.Microsoft.gradient(gradientType=0,
		startColorstr='#f5f5f5', endColorstr='#cfd1cf');
}


.cke_bottom {
	padding: 6px 8px 2px;
	position: relative;
	border: none;
	box-shadow: 0 1px 0 #fff inset;
	background: #bbd3e7;
	filter: progid:DXImageTransform.Microsoft.gradient(gradientType=0,
		startColorstr='#ebebeb', endColorstr='#cfd1cf');
}	

</style>	
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal">&times;</button>
		<h4 class="modal-title">수정하기</h4>
</div>

<div class="modal-body" id="detail">
						
<form action="proEdit.htm" method="post" name="modifyform" enctype="multipart/form-data">
<label>제목</label>
<input type="text" class="form-control" name="collabo_req_title"  placeholder="제목을 입력하세요" value="${list.collabo_req_title}">
<label>작성일</label>
<input type="text" class="form-control" readonly="readonly" value="${list.collabo_req_date}">
<label>상태</label>
<input type="text"  class="form-control" readonly="readonly" value="${list.collabo_req_state}">
<label>프로젝트 내용 </label>
<textarea rows="4" cols="50" class="form-control"
						name="collabo_req_text" id="collabo_req_text">${list.collabo_req_text}</textarea>
					<script>
	                
	                CKEDITOR.replace( 'collabo_req_text' );
	            </script>
 <label>작성자</label>
<input type="text" class="form-control" readonly="readonly" value="${list.user_ID}">
<label>수신자 </label>
<input type="text" class="form-control" readonly="readonly" value="${list.collabo_req_ID}">
 <label>첨부파일</label>
 <div  class="form-control">
<input type="file" name="files[0]" value="${list.collabo_req_filesrc}" >
 </div>

<input type="hidden" name="collabo_req_index" value="${list.collabo_req_index}">
<input type="hidden" name="collabo_req_no" value="${list.collabo_req_no}">

<div class="modal-footer" id="detail_footer">
		<button type="button" class="btn btn-default" onclick="modify()">저장</button>
		<button type="button" class="btn btn-default"data-dismiss="modal">취소</button>
	</div>
</form>
 --%>