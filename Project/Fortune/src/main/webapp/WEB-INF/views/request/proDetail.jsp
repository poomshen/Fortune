<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>



<script type="text/javascript">
     function regAjaxCall(a){

   	 $.ajax({
 			type: "get",
 			url:  "accept.htm",
 			cache: false,				
 			data:"collabo_req_index="+a,
 		    success:function(data){ //callback  
 		    	 console.log(data);
 		    	 $("#menuView2").empty();
 		        
 		        $("#menuView2").append($('#menuView2').html(data)); 
 		         
 		     },
 			error: function(){						
 				alert('Error while request..'	);
 			}
 		});
		 
	 }   
 
</script>


<title>Insert title here</title>
</head>
<body>

<div>
	<dl>
		<dt>프로젝트 제목</dt>
		<dd>${list.collabo_req_title}</dd>
	</dl>
	<dl>
		<dt>프로젝트 내용</dt>
		<dd>${list.collabo_req_text}</dd>
	</dl>
	<dl>
		<dt>프로젝트 작성자</dt>
		<dd>${list.user_ID}</dd>
	</dl>
	<dl>
		<dt>프로젝트 작성일</dt>
		<dd>${list.collabo_req_date}</dd>
	</dl>
	<dl>
		<dt>프로젝트 진행상태</dt>
		<dd>${list.collabo_req_state}</dd>
	</dl>
	
	<p><a href="requestList.htm">목록</a></p>
	<p><a href="accept.htm?collabo_req_index=${list.collabo_req_index}" name="collabo_req_state">수락</a></p> 
	<p><a data-toggle="modal" data-target="#myModal2" onclick="regAjaxCall(${list.collabo_req_index})">수락</a></p>
	<p><a  href="refuse.htm?collabo_req_index=${list.collabo_req_index}" name="collabo_req_state">거절</a></p>
	
	
	<div class="container">
  <!-- Modal -->
  <div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">협업모음 프로젝트</h4>
          
        </div>
        <div class="modal-body">
        
               <p><div id="menuView2">아아</div></p>
                          
              
               
               
        
        <p></p>
          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>
	

</div>

</body>
</html>