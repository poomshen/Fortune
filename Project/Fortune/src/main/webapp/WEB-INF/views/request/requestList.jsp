<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>



<script type="text/javascript">
     function proAjaxCall(a){
    	 $("#menuView").empty();
  	
   	 $.ajax({
   		 
 			type: "get",
 			url:  "ProDetail.htm",
 			cache: false,				
 			data:"collabo_req_index="+a,
 		    success:function(data){ //callback  
				$("#menuView").append($('#menuView').html(data)); 
 		      
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
<table class="article-list margin-small">
		<caption class="hidden">공지사항</caption>
		<thead>
			<tr>
				<th class="collabo_req_index">번호</th>
				
				<th class="title">제목</th>
				<th class="user_ID">작성자</th>
				
				<th class="collabo_req_date">작성일</th>
				<th class="collabo_req_ID">답장자</th>
				<th class="collabo_req_state">진행상태</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="n">
				<tr>
				<td class="collabo_req_index">${n.collabo_req_index} </td>
				
				<td><a data-toggle="modal" data-target="#myModal" onclick="proAjaxCall(${n.collabo_req_index})">${n.collabo_req_title}</a></td>					
					
				
				
					
					<td class="user_ID">${n.user_ID}</td>
					
					<td class="collabo_req_date">${n.collabo_req_date}</td>
					<td class="collabo_req_ID">${n.collabo_req_ID}</td>
					<td class="collabo_req_state">${n.collabo_req_state}</td>
					
					
				</tr>	
			</c:forEach>
			
			
			
			
			
		</tbody>
	</table>
	<div class="container">
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">협업모음 프로젝트</h4>
          
        </div>
        <div class="modal-body">
        
               <p><div id="menuView">아아</div></p>
                          
              
               
               
        
        <p></p>
          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>
	
	
	<a href="requestList.htm">요청</a>

</body>
</html>