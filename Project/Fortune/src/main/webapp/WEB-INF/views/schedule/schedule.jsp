<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script src='fullcalendar/js/lib/jquery.min.js'></script>
<link href='fullcalendar/css/fullcalendar.css' rel='stylesheet' />
<link href='fullcalendar/css/fullcalendar.print.css' rel='stylesheet'
	media='print' />
<link href='fullcalendar/css/jquery-ui.min.css' rel='stylesheet' />
<script src='fullcalendar/js/lib/moment.min.js'></script>

<script src='fullcalendar/js/fullcalendar.min.js'></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="fullcalendar/js/customcalendar.js" />
<script language="javascript">
	var f = getFormWarpRequest();
	var list = f._oLstChoicesTTTT;
	list.remove(1);  
	list.remove(0); 
	list.removeAttribute("hasLabel");
</script>
<script>
$(document).ready(function() {
	
	//fullcalendar 불러오는 함수
	loadCalendar();	
	
});
</script>


<style>
body {
	margin: 0px 0px;
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 90%;
	margin: 0 auto;
}

</style>
</head>
<body>
	<br>
	<br>
	<div class="container-fluid">
		<div class="row">

			<!-- calendar 보여 주는 div 영역 -->
			<div class="col-sm-7">
					<div id='calendar'></div>
			</div>




			<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" id="modal_btn" >
			</button>
			
			<!-- Modal -->
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">일 정 내 용</h4>
						</div>
						<div class="modal-body">
							<input type="radio" name="worktype"> 업무 일정 <input type="radio" name="worktype"> 회의 일정 <br>
							<label>일정 제목 : </label> <input type="text" id="modal_title"><br>
							<label>일정 내용  : </label> <textarea rows="5" cols="30"></textarea><br>
							<button type="button" class="btn btn-default" id="modal_ok"
								data-dismiss="modal">등록</button>
						</div>
					</div>

				</div>
			</div>



			<!-- 업우상세 보여주는 div 영역 -->
			<div class="col-sm-5">
				<h3>일 정</h3>
				<div id="content"></div>
			</div>
		</div>
	</div>
</body>
</html>