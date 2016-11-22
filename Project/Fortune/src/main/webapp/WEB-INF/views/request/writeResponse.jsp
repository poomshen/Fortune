<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">




  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>

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
	}
	else{
		proaddform.submit();
		return true;
	}
	
	
}


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
			    
			      nDate.setDate(mDate.getDate() + 365); //몇일까지 정하기
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

</head>
<body>


<form action="writeresponse.htm" method="post" name="proaddform">
<input type="hidden" name="collabo_req_index" value="${list.collabo_req_index}">
<input type="hidden" name="collabo_req_no" value="${list.collabo_req_no}">

수락자 : <input type="text" name="collabo_req_ID" value="${list.collabo_req_ID}" readonly="readonly"><br>
끝  날짜 : <input type="text" name="collabo_start" id="startDate">
- <input type="text" name="collabo_end" id="endDate"><br>  
진행 상태 :<input type="text" value="대기" name="collabo_state" readonly="readonly"><br>

<input type="button" value="submit" onclick="proAdd()">
<p><a href="requestList.htm">취소하기</a></p>
</form>


</body>
</html>