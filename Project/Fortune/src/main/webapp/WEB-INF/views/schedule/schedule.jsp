<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>





$(document).ready(function() {

//화면 로드시 일정을 DB에서 불러오는 코드 
 	$.ajax({
		url : 'calendarload.ajax',
		type : 'post',
		success : function(data) {
			console.log(data)
			$.each(data, function(index, obj) {
				var item = {
						id : obj.schedule_no,
						title : obj.work_title,
						start : obj.schedule_start,
						end: obj.schedule_end
				};
				array.push(item);
				
		        content += '<tr id=tr' +obj.schedule_no+ '><td>**일정(미구현)</td><td>' + obj.work_title;
		        content += '</td><td><a href="#" data-toggle="modal" data-target="#myModal2"';
		        content += ' onclick="test(' + obj.schedule_no;
		        content += ",'" + obj.work_title + "','" + obj.work_text +"','" + obj.schedule_start +"','" + obj.schedule_end +"'";
		        content += ')" >상세보기</a></td></tr>';
			});
	        $('#content').html(content)
	        //fullcalendar 불러오는 함수
			loadCalendar();
		}
	});
});

function test(id, title, text, start, end){
	$('#detail_modal_id').val(id);
	$('#detail_modal_title').val(title);
	$('#detail_modal_text').val(text);
	$('#detail_modal_start').val(start);
	$('#detail_modal_end').val(end);
}


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


			<!-- 일정등록 버튼 -->
			<input type="hidden" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" id="modal_btn" >

			<!-- 일정등록 내용 Modal -->
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
							<input type="hidden" id="modal_start">
							<input type="hidden" id="modal_end">
						</div>
					</div>

				</div>
			</div>
			
			
			
			<!-- 상세보기 내용 Modal -->
			<div class="modal fade" id="myModal2" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">일 정 상 세</h4>
						</div>
						<div class="modal-body">
							<label>일정 제목 : </label> <input type="text" id="detail_modal_title"><br>
							<label>일정 내용 : </label> <textarea rows="5" cols="30" id="detail_modal_text"></textarea><br>
							<label>참가 인원 : </label> <input type="text" id="detail_modal_users"><br>
							<label>id값 (hidden처리 예정) : </label> <input type="text" id="detail_modal_id"><br>
							<label>start값 (hidden처리 예정) : </label> <input type="text" id="detail_modal_start"><br>
							<label>end값 (hidden처리 예정) : </label> <input type="text" id="detail_modal_end"><br>
							
							<button type="button" class="btn btn-default" id="detail_modal_update"
								data-dismiss="modal">수정</button>
							<button type="button" class="btn btn-default" id="detail_modal_delete"
								data-dismiss="modal">삭제</button>
						</div>
					</div>

				</div>
			</div>			



			<!-- 업우상세 보여주는 div 영역 -->
			<div class="col-sm-5">
				<div class="row">
					<label> 일반 / 회의 (선택 미구현)</label>
				</div>

				<div id="content"></div>
			</div>
		</div>
	</div>
	
</body>
</html>