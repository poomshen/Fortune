<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>



<script type="text/javascript">
     function proAjaxManager(a){
    	 
  	
   	 $.ajax({
   		 
 			type: "get",
 			url:  "insertmanager.htm",
 			cache: false,				
 			data:"collabo_req_index="+a,
 		    success:function(data){ //callback  
 		    	
 		    	$('#menuView').empty();
 		    
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
				<th class="collabo_no">협업번호</th>
				<th class="collabo_req_index">협업구분자</th>
				<th class="collabo_req_no">요청번호</th>
				
				
				<th class="user_ID">협업담당자</th>
				<th class="collabo_start">시작일</th>
				<th class="collabo_end">마지막일</th>
				<th class="collabo_state">진행 상태</th>
				<th class="collabo_req_id">협업수락자</th>
				<th class="collabo_cal">일정</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="n">
				<tr>
					<td class="collabo_no">${n.collabo_no}</td>
					<td class="collabo_req_index">${n.collabo_req_index}</td>
					<td class="collabo_req_no">${n.collabo_req_no}</td>
		<td class="user_ID">${n.user_ID}
<security:authorize access="hasAnyRole('ROLE_SUPERMGR')">
	<c:choose>
		<c:when test="${n.user_ID  == null}">
			<button data-toggle="modal" data-target="#myModal" onclick="proAjaxManager(${n.collabo_req_index})">담당</button>
		</c:when>
		<c:otherwise>
			<button data-toggle="modal" data-target="#myModal" onclick="proAjaxManager(${n.collabo_req_index})">담당</button>	
		</c:otherwise>
	</c:choose>
			</security:authorize>
					</td>
					
					<td class="collabo_start">${n.collabo_start}</td>
					<td class="collabo_end">${n.collabo_end}</td>
					<td class="collabo_req_state">${n.collabo_state}</td>
					<td class="collabo_req_id">${n.collabo_req_ID}</td>
					<td class="collabo_cal"><a href="schedule.htm?collabo_no=${n.collabo_no}"><button>Click</button></a></td>
					
					
				</tr>	
			</c:forEach>
			
			
			
			
			
		</tbody>
	</table>
	<div class="container">
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">협업모음 프로젝트</h4>
          
        </div>
        <div class="modal-body">
        	<div id="menuView"></div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>
	
	
	<a href="responseList.htm">리스트</a>

</body>
</html>