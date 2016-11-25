<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
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

<script src='fullcalendar/js/lib/jquery.min.js'></script>
<link href='fullcalendar/css/fullcalendar.css' rel='stylesheet' />
<link href='fullcalendar/css/fullcalendar.print.css' rel='stylesheet' media='print' />
<link href='fullcalendar/css/jquery-ui.min.css' rel='stylesheet' />
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src='fullcalendar/js/lib/moment.min.js'></script>
<script src='fullcalendar/js/fullcalendar.min.js'></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<script src="fullcalendar/js/customcalendar.js" ></script>
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

	
	$('#blink').addClass("blink_me notification_count");
	$('#blink').html("5");
	
	
	//alert("메세지 : "+evt.data);
}
function onClose(evt) {
	appendMessage("연결을 끊었습니다.");
}

function send(alarm) {
/* 	var selectId="sungjun@gmail.com/mclee@gmail.com"; */

	wsocket.send(alarm);
	
}

function appendMessage(msg) {
	console.log(msg);

}


	
$(document).ready(function() {
		connect();
});
</script>

</head>
<body>
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="aside" />
	<!-- Page Content -->
	<div id="page-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<tiles:insertAttribute name="content" />
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /#page-wrapper -->

	<!-- Bootstrap Core JavaScript -->

	<!-- Metis Menu Plugin JavaScript -->
	<script src="bower_components/metisMenu/dist/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="dist/js/sb-admin-2.js"></script>
	
	
</body>
</html>