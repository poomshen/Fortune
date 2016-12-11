<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
   request.setCharacterEncoding("UTF-8");
%>

<script src="alert_style/js/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="alert_style/css/sweetalert.css">
<script>
var wsocket;
var msg 
function connect() {
	/* alert("소켓연결!"); */
	
	wsocket = new WebSocket("ws://sasystem.iptime.org:8081/Fortune//chat-ws.htm");
	wsocket.onopen = onOpen;
	wsocket.onmessage = onMessage;
	wsocket.onclose = onClose;

}
function disconnect() {
	wsocket.close();
}
function onOpen(evt) {
	
	appendMessage("연결되었습니다.");
}
function onMessage(evt) {

	console.log("받은 메세지 내용은??"+evt.data);
	 
	$.ajax({
		  
		  type:"post",
		  dataType: "html",
		  url:"newAlarm.htm",
		  data:{"newAlarm": evt.data},
		  success:function(data){
			  
			  console.log("헤더 업데이트 성공");
			  console.log(data);
			  $('#alarm').empty();  
			  $('#alarm').html(data);
		
		  }
	  });	
	

}
function onClose(evt) {
	appendMessage("연결을 끊었습니다.");
}

function send(selectId) {

	console.log("메세지 받을 사람~?"+selectId);
	
	wsocket.send(selectId);
	
	
}

function appendMessage(msg) {
	console.log(msg);

}


	
$(document).ready(function() {
		connect();
		
	

});



</script>
<!-- 로딩 gif style태그 -->
<style type="text/css" >
.wrap-loading{ /*화면 전체를 어둡게 합니다.*/
	position: fixed;
	left:0;
	right:0;
	top:0;
	bottom:0;
 	/* background: rgba(33,33,33,0.09);*/ /*not in ie */
 	
 	/* 2016.12.07 김지현 
 	로딩 이미지 돌아가는동안 비활성화/화면 어둡게 하는 코드 추가*/
 	
 	background-color :  rgba(0,0,0,0.5);
	z-index : 100;

	filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#08212121', endColorstr='#08212121');    /* ie */
 }
.wrap-loading div{ /*로딩 이미지*/
	position: fixed;
	top:50%;
	left:50%;
	margin-left: -21px;
	margin-top: -21px;
}
.display-none{ /*감추기*/
	display:none;
}  
</style>
<!-- 로딩 gif화면 -->
<div class="wrap-loading display-none">
    <div><img src="./images/spin (3).gif" style="width: 100px; height: 100px;" /></div>
</div>



 <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0;border-color:#f8f8f8;background-color:rgba(248,248,248,0);box-shadow: 2px 2px 5px hsla(0,0%,0%,0.58);height: 41px;">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!-- 11.30 왼쪽최상단 기업명? 변경 (지율) -->
                <a class="navbar-brand" href="FortuneMain.htm"><i><img src="${pageContext.request.contextPath}/images/clover.png" alt="아이콘" style="img size: 18px;">&nbsp;Fortune</i></a>                
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
            <span>${sessionScope.info.user_name} 님 환영합니다</span>
                 <!-- /.dropdown -->
                
                
                
                
             <li id="alarm" class="dropdown">
   				<a class="dropdown-toggle" style="color:#194f89" data-toggle="dropdown" href="#">
                	<i class="fa fa-bell fa-fw hvr-pop">
                       <span id="blink" <c:if test="${sessionScope.alarm.size()>0}">class="blink_me notification_count"</c:if> > 
                       		<c:if test="${sessionScope.totalCount>0}">${sessionScope.totalCount}</c:if></span>
                   	</i>  
                    
                    <i class="fa fa-caret-down"></i>
                </a>
          
				<c:if test="${sessionScope.alarm.size()>0}">
              
                <ul id="alarmList" class="dropdown-menu dropdown-alerts">
               	
               	<c:forEach var="alarm" items="${sessionScope.alarm}"> 
                        
                	<li id="${alarm.work_type}">
                    	
                                
                   		<c:choose>
                   			<c:when test="${alarm.work_type==1}">
                     			<a href="requestList.htm">
                    				<i class="fa fa-file-o fa-fw"></i>	프로젝트[받은 요청]               
                    					<span class="pull-right text-muted small" style="padding: 3px 7px 3px 7px;background: #cc0000;color: #ffffff;font-weight: bold;border-radius: 9px;">
 										${alarm.count}</span>
 								</a>
 								   <li class="divider"></li>
                   			</c:when>
                   			
                   			                 
                   			<c:when test="${alarm.work_type==2}">
                   				<a href="responseList_ver1.htm">
                  	     			<i class="fa fa-file-text-o fa-fw"></i> MY 프로젝트
                  	     				<span class="pull-right text-muted small" style="padding: 3px 7px 3px 7px;background: #cc0000;color: #ffffff;font-weight: bold;border-radius: 9px;">
 										${alarm.count}</span>
                  	 			</a>
                  	 			     <li class="divider"></li>
                   			</c:when>               
                   
                   			<c:when test="${alarm.work_type==3}">
                   				<a>
                      			<i class="fa fa-file-word-o fa-fw"></i>	새로운 일정              
                      				<span class="pull-right text-muted small"style="padding: 3px 7px 3px 7px;background: #cc0000;color: #ffffff;font-weight: bold;border-radius: 9px;">
 										${alarm.count}</span>
 								</a>		
 										
            
                    		    <c:forEach var="scheduleAlarmList" items="${sessionScope.sch_alist}"> 
                   					 <li id="${scheduleAlarmList.collabo_no}">  
                   			 			<a href="schedule.htm?collabo_no=${scheduleAlarmList.collabo_no}">프로젝트[${scheduleAlarmList.collabo_req_title}]
                   		 			     	<span class="pull-right text-muted small" style="padding: 3px 7px 3px 7px;background:#ffff;color: #cc0000;font-weight: bold;border-radius: 9px;">
 										${scheduleAlarmList.total_collabo}건</span>
                   			 			</a>
                   		 			</li>
                    		
                   	 			</c:forEach>
         
                   			</c:when>                 
                        
                      </c:choose>
                      
                       
                      	</li>
                            
             		</c:forEach>	
             	
               
                    </ul>
                 </c:if>
               </li>
            
               <!-- /.dropdown-alerts -->    
                
                
                
                
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" style="color:#194f89;;" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw hvr-pop"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="updateMember.htm"><i class="fa fa-user fa-fw"></i> Edit Profile</a>
                        </li>
                        <!-- <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li> -->
                        <li class="divider"></li>
                        <li><a href="logOut.htm"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->
            </nav>