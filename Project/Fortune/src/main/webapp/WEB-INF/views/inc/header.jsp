<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
   request.setCharacterEncoding("UTF-8");
%>

<script>
var wsocket;
var msg 
function connect() {
	/* alert("소켓연결!"); */
	
	wsocket = new WebSocket("ws://192.168.0.3:8090/fortune/chat-ws.htm");
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

	console.log("evt.data"+evt.data);
	
	$.ajax({
		  
		  type:"post",
		  dataType: "html",
		  url:"newAlarm.htm",
		  data:{"newAlarm": evt.data},
		  success:function(data){
		  
			  
			  console.log("성공");
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
/* 	var selectId="sungjun@gmail.com/mclee@gmail.com"; */
	console.log("보낼 메세지:"+selectId);
	wsocket.send(selectId);
	
}

function appendMessage(msg) {
	console.log(msg);

}


	
$(document).ready(function() {
		connect();
		
		$("#alarmList li").click(function() {
		    alert(this.id); 
		    
		    window.location.href = "alarmCheck.htm?work_type="+this.id;
		});

});



</script>


  
  <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0; border-color:#f8f8f8; background-color:rgba(248,248,248,0); box-shadow: 2px 2px 5px hsla(0,0%,0%,0.58);">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="main.htm">SB Admin v2.0</a>
                
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
               
                    <a class="dropdown-toggle" style="color:#194f89;" data-toggle="dropdown" href="#">
                        <i class="fa fa-envelope fa-fw hvr-pop"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-messages">
                        <li>
                            <a href="alarm.htm">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>Read All Messages</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-messages -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" style="color:#194f89;" data-toggle="dropdown" href="#">
                        <i class="fa fa-tasks fa-fw hvr-pop"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-tasks">
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 1</strong>
                                        <span class="pull-right text-muted">40% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                            <span class="sr-only">40% Complete (success)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 2</strong>
                                        <span class="pull-right text-muted">20% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                            <span class="sr-only">20% Complete</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 3</strong>
                                        <span class="pull-right text-muted">60% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                            <span class="sr-only">60% Complete (warning)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 4</strong>
                                        <span class="pull-right text-muted">80% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                            <span class="sr-only">80% Complete (danger)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Tasks</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-tasks -->
                </li>
                <!-- /.dropdown -->
                <li id="alarm" class="dropdown">
                                 
                    <a class="dropdown-toggle" style="color:#194f89;" data-toggle="dropdown" href="#">
                       <i class="fa fa-bell fa-fw hvr-pop"><span id="blink"  <c:if test="${sessionScope.alarm.size()>0}"> class="blink_me notification_count" </c:if> > <c:if test="${sessionScope.totalCount>0}"> ${sessionScope.totalCount}</c:if></span></i>  <i class="fa fa-caret-down"></i>
                    </a>
                
                  <c:if test="${sessionScope.alarm.size()>0}">
                  
               
              
                   <ul id="alarmList" class="dropdown-menu dropdown-alerts">
                   	   <c:forEach var="alarm" items="${sessionScope.alarm}"> 
                  		
                        <li id="${alarm.work_type}">
                       
                            <a href="#">
                                <div> 
                                
                   <c:choose>
                   <c:when test="${alarm.work_type==1}">
                    	<i class="fa fa-file-o fa-fw"></i>	새 프로젝트 요청 
                   </c:when>                 
                   <c:when test="${alarm.work_type==2}">
                  	     <i class="fa fa-file-text-o fa-fw"></i>  기존 프로젝트 요청
                   </c:when>               
                   <c:when test="${alarm.work_type==3}">
                      <i class="fa fa-file-word-o fa-fw"></i>	새로운 업무 요청
                   </c:when>                 
                   <c:when test="${alarm.work_type==4}">
                   		 <i class="fa fa-comment-o fa-fw"></i>	새로운 댓글 
                   </c:when>                
                      </c:choose>
                                    <span class="pull-right text-muted small" 
                                    style="padding: 3px 7px 3px 7px;background: #cc0000;color: #ffffff;font-weight: bold;border-radius: 9px;">
 										${alarm.count}</span>
                                </div>
                         
                         
                            </a>
                      
                        </li>
                        
                            <li class="divider"></li>
                            
             			</c:forEach>	
             			

                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Alerts</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    
               
                    </ul>
                    
                  
                    </c:if>
           
                    <!-- /.dropdown-alerts -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" style="color:#194f89;;" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw hvr-pop"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="updateMember.htm"><i class="fa fa-user fa-fw"></i> Edit Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="logOut.htm"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="deleteMemember.htm"><i class="fa fa-times fa-fw"></i> delete ID</a>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->