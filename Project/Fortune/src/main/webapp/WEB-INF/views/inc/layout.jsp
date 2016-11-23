<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="bower_components/metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="bower_components/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<link rel="stylesheet" href="assets/css/hover.css">
</head>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.1.1.min.js"></script>
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

	alert("메세지"+evt.data);
}
function onClose(evt) {
	appendMessage("연결을 끊었습니다.");
}

function send(selectId) {
/* 	var selectId="sungjun@gmail.com/mclee@gmail.com"; */
	console.log(msg);
	wsocket.send(selectId);
	
}

function appendMessage(msg) {
	console.log(msg);

}


	
$(document).ready(function() {
		connect();
	/* 
	console.log(msg);
	
	
	if(msg!=null){send();};*/


	/* $('#alarm').click(function(){
		
		var selectId=[];
		
		$("input[name='selectId']:checked").each(function(i){
		
			selectId.push($(this).val());//체크된것만 뽑아서 배열에 넣어주기
		
		});
		alert(selectId+$('#work_type').val());
	 	  $.ajax({
	 	      url : 'ws.ajax',
	 	      type : 'post',
	 	      data :{
	 	    	  
	 	    	  selectId:selectId,
	 	    	  
	 	    	  work_type:$('#work_type').val()
	 	    	  
	 	      		},
	 	      
	 	      success : function(data) {
	 	      
	 	  
	 	  		send(selectId);
	 	      		
	 	      }
	});
	 	   */
	 	  
	 	  
	 	  
/* 	  $.ajax({
      url : 'ws.ajax',
      type : 'post',
      success : function(data) {
      
    	  //selectId에는 check한 id가 들어가야함
    	  //ex)var selectId="sungjun@gmail.com/mclee@gmail.com";
    	  send(selectId);
      		
      }
	 
	  }); */
	  
  

});



</script>

<body>


	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="aside" />
	<!-- Page Content -->
	<div id="page-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<form>
					<input type="checkbox" value="a" name="selectId">
					
					<input type="checkbox" value="b" name="selectId">
					
					<input type="checkbox" value="c" name="selectId">
					
					<input type="text" id="work_type" name="work_type">
					<input type="button" onclick='alarm();' name="alarm" id="alarm" value="alarm">
					</form>
					<tiles:insertAttribute name="content" />
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /#page-wrapper -->

	<!-- jQuery -->
	<script src="bower_components/jquery/dist/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="bower_components/metisMenu/dist/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="dist/js/sb-admin-2.js"></script>

	
</body>
</html>