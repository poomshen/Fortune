<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
//캘린더 등록, 수정, 삭제권한 체를 위한 role변수 선언
var role;
if(${role_no}==3){ 
	role= true;
}else{
	role=false;
}


$(document).ready(function() {
	
	
    $('[data-toggle="tooltip"]').tooltip();
    
    $.ajax({
    	url : 'calendarload2.ajax',
		type : 'post',
        data : { "collabo_no" : $('#collabo_no').val() },
        success : function(data) {
			$.each(data, function(index, obj) {
				if(obj.progress_or_place<10){
					if(obj.progress_or_place==1){
						var item = {
							id : obj.schedule_no,
							title : obj.wm_title,
							start : obj.schedule_start,
							end : obj.schedule_end,
							backgroundColor : 'rgba(51, 122, 183, 0.22)'
						};
						array.push(item);
					}else{
						var item = {
							id : obj.schedule_no,
							title : obj.wm_title,
							start : obj.schedule_start,
							end : obj.schedule_end,
							backgroundColor : 'rgb(51, 122, 183)'
						};
						array.push(item);
					}
				} else{
					var item = {
							id : obj.schedule_no,
							title : obj.wm_title,
							start : obj.schedule_start,
							end : obj.schedule_end,
							backgroundColor : '#23b100'
					};
					array.push(item);
				}
		        
			});
        }
    
    })
    
	
	//화면 로드시 일정을 DB에서 불러오는 코드  
	content = "<table class='table table-striped'><tr><th style='width:50px;'>구분</th><th style='width:250px; text-align:center;'>제목</th><th style='width:70px;'>진척률</th></tr>";
 	$.ajax({
		url : 'calendarload.ajax',
		type : 'post',
        data : {
			"collabo_no" : $('#collabo_no').val(),
			"year" : $('#year').val(),
			"month" : $('#month').val()
        },
		success : function(data) {
			console.log(data)
			$.each(data.schedulelist, function(index, obj) {
				if(obj.progress_or_place<10){
					if(obj.progress_or_place==1){
				        content += '<tr><td style="color:rgba(51, 122, 183, 0.22); text-decoration:line-through;">업무</td>';
				        content += '<td id=td' +obj.schedule_no+ '><a onclick="detail(' + obj.schedule_no + ",'" + obj.wm_title + "','" + obj.wm_text;
				        content += "','" + obj.schedule_start +"','" + obj.schedule_end + "','" + obj.users + "','" + obj.progress_or_place + "'";
				        content += ')">'+ obj.wm_title + '</a></td><td><div class="progress" style="margin-bottom:0px;">'
				        content += '<div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuemax="100" style="width:'+obj.progress_or_place*100;
				        content += '%;">'+ obj.progress_or_place*100 +'%</div></div></td></tr>'
					}else{

				        content += '<tr><td style="color:rgb(51, 122, 183);">업무</td>';
				        content += '<td id=td' +obj.schedule_no+ '><a onclick="detail(' + obj.schedule_no + ",'" + obj.wm_title + "','" + obj.wm_text;
				        content += "','" + obj.schedule_start +"','" + obj.schedule_end + "','" + obj.users + "','" + obj.progress_or_place + "'";
				        content += ')">'+ obj.wm_title + '</a></td><td><div class="progress" style="margin-bottom:0px;">'
				        content += '<div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuemax="100" style="width:'+obj.progress_or_place*100;
				        content += '%;">'+ obj.progress_or_place*100 +'%</div></div></td></tr>'

					}
				} else{
					content += '<tr><td style="color:#23b100;">회의</td>';
			        content += '<td id=td' +obj.schedule_no+ '><a onclick="detail2(' + obj.schedule_no + ",'" + obj.wm_title + "','" + obj.wm_text;
			        content += "','" + obj.schedule_start +"','" + obj.schedule_end + "','" + obj.users + "','" + obj.progress_or_place + "'";
			        content += ')">'+ obj.wm_title + '</a></td><td></td></tr>';
				}
		        
			});
			
		
	        $('#content').html(content)
	        
	        //fullcalendar 불러오는 함수
	        //parameter로 false,false 를 주면 캘린더에 일정수정 및 일정등록 불가함
	        //parameter로 true, true 를 주면 캘린더에 일정수정 및 일정등록 가능함
			loadCalendar(role,role);
			
	        $.each(data.new_alarm, function(index, obj) {
				
				$("#td"+obj.schedule_no).append('<img src="assets/img/alarm/new1.png"/>');
				
			});

			
			
			$('.fc-prev-button').click(function() {
				
				if($('#month').val()=="01"){
					var year = Number($('#year').val())-1
					$('#year').val(year)
					$('#month').val('12')
				}else{
					var month = Number($('#month').val()) - 1
					if( month< 10 ){
					$('#month').val("0" + month)
					}else{
						$('#month').val(month)
					}
				}
				
				fcontent();

	        });	
	        
	        $('.fc-next-button').click(function() {

				if($('#month').val()=="12"){
					var year = Number($('#year').val())+1
					$('#year').val(year)
					$('#month').val('01')
				}else{
					var month = Number($('#month').val()) + 1
					if(month<10){
						$('#month').val("0" + month)
					}else{
						$('#month').val(month)
					}
				}
				
				fcontent();
				
	        });
	        
	        
		}
	});
 	
 	
 	
	//작업자 : 이예지 
	//최종 수정일 : 2016/11/28
	//select 되어지는 사람의 이름을 즉시 보여주는 함수
	
	$(".dropdown_s dt a").on('click', function() {
	
		  $(".dropdown_s dd ul").slideToggle('fast');
		
		});

		$(".dropdown_s dd ul li a").on('click', function() {
	
		  $(".dropdown_s dd ul").hide();
		});

		function getSelectedValue(id) {
	
		  return $("#" + id).find("dt a span.value").html();
		}

		$(document).bind('click', function(e) {
		
		  var $clicked = $(e.target);
		  if (!$clicked.parents().hasClass("dropdown_s")) $(".dropdown_s dd ul").hide();
		});

		$('.mutliSelect input[type="checkbox"]').on('click', function() {
		//this.val() 이부분이 참가자목록에서 위쪽으로 id찍어주는 부분임
		  var title = $(this).closest('.mutliSelect').find('input[type="checkbox"]').attr("value2"),
		    title = $(this).attr("value2") + ",";

		  if ($(this).is(':checked')) {
			 
		    var html = '<span title="' + title + '">' + title + '</span>';
		    
		    $('.multiSel').append(html);
		    $(".hida").hide();
		  } else {
		
		    $('span[title="' + title + '"]').remove();
		    var ret = $(".hida");
		    $('.dropdown_s dt a').append(ret);

		  }
		});
 	
	
});






</script>

</head>
<body>
<input type="hidden" id="collabo_no" value="${collabo_no}">
<input type="hidden" id="year" value="2016"><input type="hidden" id="month" value="12">
<input type="hidden" id="modal_start">
<input type="hidden" id="modal_end">
<input type="hidden" id="modal_start_ms">
<input type="hidden" id="modal_end_ms">
<input type="hidden" id="check">

	<br>
	<br>
	<div class="container-fluid">
		<div class="row" style="padding-right: 0px; ">

			<!-- calendar 보여 주는 div 영역 -->
			<div class="col-sm-7" style="padding-left: 0px; padding-right: 0px;">
					<div id='calendar'></div>
			</div>



<input type="hidden" class="btn btn-primary" id="modal_btn" data-toggle="modal" data-target="#myModal">

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" style="height:500px">
        <div class="modal-content"style="height:500px">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;</button>
                <h4 class="modal-title" id="myModalLabel">
                    일반/회의 업무 등록</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-8" style="border-right: 1px dotted #C2C2C2;padding-right: 30px;">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#Login" data-toggle="tab">일반 업무</a></li>
                            <li><a href="#Registration" data-toggle="tab">회의 업무</a></li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div class="tab-pane active" id="Login">
                                <div class="form-group">
                                    <label for="title" class="col-sm-2 control-label">업무제목</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="modal_title" placeholder="제목.." />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="content" class="col-sm-2 control-label">업무내용</label>
                                    <div class="col-sm-10">
                                    <textarea rows="5" cols="30" class="form-control" id="modal_text" placeholder="내용.." ></textarea><br>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                    </div>
                                    <div class="col-sm-10" style="margin-top:50px">
                                        <button type="button" data-dismiss="modal" class="btn hvr-grow-shadow" id="modal_ok">
                                            일반업무 등록</button>
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="Registration">
                                <div class="form-group">
                                    <label for="title" class="col-sm-2 control-label">회의제목</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="modal_title2" placeholder="제목.." />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="content" class="col-sm-2 control-label">회의내용</label>
                                    <div class="col-sm-10">
                                    <textarea rows="5" cols="30" class="form-control" id="modal_text2" placeholder="내용.." ></textarea><br>
                                    </div>
                                </div>
                                <div class="row">
                                	<div class="col-sm-3">
                                		<input type="radio" id="meeting_place_10" name="place_radio" value="10">
                                		<label for="meeting_place_10" style="cursor: pointer;"><div id="div_place_10" class="dplace" title="회의실1의 설명" data-toggle="tooltip" data-placement="bottom" style="text-decoration:underline;">회의실1</div></label>
                                	</div>
                                	<div class="col-sm-3">
                                		<input type="radio" id="meeting_place_20" name="place_radio" value="20">
                                		<label for="meeting_place_20" style="cursor: pointer;"><div id="div_place_20" class="dplace" title="회의실2의 설명" data-toggle="tooltip" data-placement="bottom" style="text-decoration:underline;">회의실2</div></label>
                                	</div>
                                	<div class="col-sm-3">
                                		<input type="radio" id="meeting_place_30" name="place_radio" value="30">
                                		<label for="meeting_place_30" style="cursor: pointer;"><div id="div_place_30" class="dplace" title="회의실3의 설명" data-toggle="tooltip" data-placement="bottom" style="text-decoration:underline;">회의실3</div></label>
                                	</div>
                                	<div class="col-sm-3">
                                		<input type="radio" id="meeting_place_40" name="place_radio" value="40">
                                		<label for="meeting_place_40" style="cursor: pointer;"><div id="div_place_40" class="dplace" title="회의실4의 설명" data-toggle="tooltip" data-placement="bottom" style="text-decoration:underline;">회의실4</div></label>
                                	</div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                    </div>
                                    <div class="col-sm-10" style="margin-top:50px">
                                        <button type="button" data-dismiss="modal" class="btn btn-primary btn-sm" id="modal_ok2">
                                            회의업무 등록</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="OR" class="hidden-xs" style="color:#fff">
                              ></div>
                    </div>
                     <div class="col-md-4" style="margin-top:57px">



<dl class="dropdown_s effect2" style="margin-top: 50px;margin-left: 5px;"> 
  
    <dt>
    <a href="#"style="margin-top:5px; height: 133px;padding-right: 0px;">
      <span class="hida box" id="spantag" style="width: 253px; font-size:small;">참가자 선택<span style="margin-left:170px"><i class="fa fa-sort-desc" aria-hidden="true"></i></span></span>    
      <p class="multiSel" id="ptag" style="font-size:medium;"></p>
    </a>
    </dt>
  
    <dd>
        <div class="mutliSelect effect2" >
            <ul class="effect2" style="display: block; padding-right: 0px; height: 204px; width: 272px;">
        		<c:forEach items="${team_id}" var="obj" varStatus="status">
					<li><input type="checkbox" value="${obj.user_id}" value2="${obj.user_name}" id="${obj.user_id}" name='userchk' onclick="scheduleuser()"><label for="${obj.user_id}" style="cursor: pointer ;">${obj.user_name}</label></li>
				</c:forEach>
            </ul>
        </div>
    </dd>

</dl>
						
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


			<!-- 업무상세 보여주는 div 영역 -->
			<div class="col-sm-5" style="padding-right: 0px;">
				<div class="row" style="padding-right: 0px; margin-top: 10px; margin-bottom: 11px;">
					<select id="schedule_type" onchange="schedule_type()" style="height: 20px;">
						<option id="default_option" value="0"> 전 체 보 기 </option>
						<option value="3">내 일정 보기</option>
						<option value="1">업무일정 보기</option>
						<option value="2">회의일정 보기</option>
					</select>
				</div>

				<div id="content_parent" style="overflow: scroll; width: 100%; height: 435px; overflow-x: hidden; padding-left: 0px; padding-right: 0px;">
					<div id="content" style="padding-right:0px;">
					</div>
					<div id="content_detail" style="display: none; padding-right:0px;">
					<!-- 수정, 저장, 삭제 버튼 팀장만 보여주기 (권한처리) -->
						<c:if test="${role_no==3}">
							<!-- progress bar -->
							<div class="progress">
							    <div class="progress-bar progress-bar-striped active" value="0" id="progress_value" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width:0%">
								0%</div>
						  	</div>
						  	<!-- 아래 6개 버튼 팀장만 보여주기 (권한처리) -->
						  	<button type="button" onclick="progress_0()"> 0% </button>
						  	<button type="button" onclick="progress_20()"> 20% </button>
						  	<button type="button" onclick="progress_40()"> 40% </button>
						    <button type="button" onclick="progress_60()"> 60% </button>
						    <button type="button" onclick="progress_80()"> 80% </button>
						    <button type="button" onclick="progress_100()"> 100% </button>
						    <button type="button" onclick="update_progress()"> 등록 </button><br>
					   		<br>
							<input type="button" value="일정 수정하기" id="update_btn" onclick="work_update()">
							<input type="hidden" value="일정 저장하기" id="updateok_btn" class="btn-success" onclick="work_updateok()">
							<input type="button" value="일정 삭제하기" id="delete_btn"><br>
					    </c:if>
						<label>제목 : </label> <input type="text" id="detail_title" class="form-control" readonly="readonly" style="color: black;"><br>
						<label>내용 : </label> <textarea rows="5" cols="50" id="detail_text" class="form-control" readonly="readonly" style="color: black;"></textarea><br>
					    
					    <label>일정 담당자 : </label><br>
					    <input type="text" id="usersdiv" class="form-control" readonly="readonly" style="color: black;">
					    
							<hr>
							<input type="hidden" id="detail_id">
							<input type="hidden" id="detail_start">
							<input type="hidden" id="detail_end">
							<input type="hidden" id="detail_progress">
			
			<!-- comment 보여주는 div영역 -->
			<!-- panel-heading -->	
			<div class="chat-panel panel panel-default">
				<div class="panel-heading">
					<i class="fa fa-comments fa-fw"></i> Comment
				</div>
				<!-- panel-body -->
				<div class="panel-body">
					<!-- comment_text 내용추가 하는 영역 -->
					<ul class="chat">
					<div id="comment_text"></div>
					</ul>
				</div>
				<!-- panel-footer -->
				<div class="panel-footer">
					<div class="input-group">
                       <input id="comment_textarea" type="text" class="form-control input-sm" placeholder="Type your message here...">
                       <span class="input-group-btn">
                           <button class="btn-warning btn-sm" onclick="insert_comment()">등 록</button>
                       </span>
                   </div>
				</div>
			</div>
						
						
					</div>
					
					
					
					
					
					
					<div id="content_detail2" style="display: none; padding-right:0px;">
						<!-- 회의일정 수정, 회의일정 삭제 버튼 팀장만 보여주기 (권한처리) -->
						<c:if test="${role_no==3}">
						<input type="button" value="회의일정 수정" id="meet_update_btn" onclick="work_update2()">
						<input type="hidden" value="회의일정 저장" id="meet_updateok_btn" class="btn-success" onclick="work_updateok2()">
						<input type="button" value="회의일정 삭제" id="meet_delete_btn"><br>
						</c:if>
						<label>제목 : </label> <input type="text" class="form-control" style="color:black;" id="meet_detail_title" readonly="readonly"><br>
						<label>내용 : </label> <textarea rows="5" class="form-control" style="color:black;" cols="50" id="meet_detail_text" readonly="readonly"></textarea><br>
						<hr>
						<label>회의 참가자</label><br>
						<input type="text" id=usersdiv2 class="form-control" readonly="readonly" style="color: black;">
						<label>회의장소 : </label> <div id="place"></div> 
						<input type="hidden" id="meet_detail_id"><input type="hidden" id="meet_detail_start"><input type="hidden" id="meet_detail_end"><br>
					
					
					
					
					</div>
					
					
					
					
					
					
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>