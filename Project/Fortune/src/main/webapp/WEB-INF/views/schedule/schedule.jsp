<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src='fullcalendar/js/lib/jquery.min.js'></script>
<link href='fullcalendar/css/fullcalendar.css' rel='stylesheet' />
<link href='fullcalendar/css/fullcalendar.print.css' rel='stylesheet' media='print' />
<link href='fullcalendar/css/jquery-ui.min.css' rel='stylesheet' />
<script src='fullcalendar/js/lib/moment.min.js'></script>
<script src='fullcalendar/js/fullcalendar.min.js'></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<script src="fullcalendar/js/customcalendar.js" ></script>
<script>
$(document).ready(function() {
	
/* 	$.ajax({
		url : 'calendarload.ajax',
		type : 'post',
		success : function(data) {
			$.each(data, function(index, obj) {
				var item = {
						id : obj.schedule_no,
						title : obj.work_title,
						start : obj.schedule_start,
						end: obj.schedule_end
				};
				array.push(item);
			});
			console.log(array)
			console.log('aa')
		}
	}); */
	
 	<c:forEach items="${sclist}" var="scdto">
		var vid = ${scdto.schedule_no};
		var vtitle = ${scdto.work_title};
		var vstart = String(${scdto.schedule_start});
		var vend = String(${scdto.schedule_end});
		
		var item = 	{
				id: vid,
				title: String(vtitle),
				start: String(vstart),
				end: String(vend)
			}
 		array.push(item)
		
	</c:forEach>
		console.log(array);


	
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




			<input type="hidden" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" id="modal_btn" >
			
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
							<label>일정 내용 : </label> <textarea rows="5" cols="30" id="modal_text"></textarea><br>
							<label>참가 인원 : </label>
								<input type="checkbox" name="uesrchk" value="이명철1">AA
								<input type="checkbox" name="uesrchk" value="이명철2">BB
							<br>
							<button type="button" class="btn btn-default" id="modal_ok"
								data-dismiss="modal">등록</button>
						</div>
					</div>

				</div>
			</div>



			<!-- 업우상세 보여주는 div 영역 -->
			<div class="col-sm-5">
				<label> 일 정 </label>
				<button id="update">수정</button><button id="delete">삭제</button>
				<div id="content"></div>
			</div>
		</div>
	</div>
</body>
</html>