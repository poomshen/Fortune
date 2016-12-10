//캘린더 호출시 필요한 초기 변수 선언
var content = "";
var array = [];
var clickobject;
var clickobjectcolor= "";
var scheduleusers;
var before_text ="";
var before_text2 ="";
var before_progress ="";
var test;


function schedule_type(){
	if($('#schedule_type').val()=="4"){
	}else{
	content = "<table class='table table-striped'><tr><th style='width:80px;'>시작일</th><th style='width:50px;'>구분</th><th style='width:250px; text-align:center;'>제목</th><th style='width:70px;'>진척률</th></tr>";
	$.ajax({
		url : 'schedule_type.ajax',
		type : 'post',
        data : { "collabo_no" : $('#collabo_no').val(),
				 "schedule_type" : $('#schedule_type').val(),
				 "year" : $('#year').val(),
				 "month" : $('#month').val()
		        },
				success : function(data) {
					$.each(data.schedulelist, function(index, obj) {
						if(obj.progress_or_place<10){
							if(obj.progress_or_place==1){
						        content += '<tr><td>'+obj.schedule_start.substring(5,7)+'월 '+obj.schedule_start.substring(8,10)+'일</td><td style="color:rgba(51, 122, 183, 0.22); text-decoration:line-through;">업무</td>';
						        content += '<td id=td' +obj.schedule_no+ '><a onclick="detail(' + obj.schedule_no + ",'" + obj.wm_title + "','" + obj.wm_text;
						        content += "','" + obj.schedule_start +"','" + obj.schedule_end + "','" + obj.users + "','" + obj.progress_or_place + "'";
						        content += ')">'+ obj.wm_title + '</a></td><td><div class="progress" style="margin-bottom:0px;">'
						        content += '<div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuemax="100" style="width:'+obj.progress_or_place*100;
						        content += '%;">'+ obj.progress_or_place*100 +'%</div></div></td></tr>'
							}else{
						        content += '<tr><td>'+obj.schedule_start.substring(5,7)+'월 '+obj.schedule_start.substring(8,10)+'일</td><td style="color:rgb(51, 122, 183);">업무</td>';
						        content += '<td id=td' +obj.schedule_no+ '><a onclick="detail(' + obj.schedule_no + ",'" + obj.wm_title + "','" + obj.wm_text;
						        content += "','" + obj.schedule_start +"','" + obj.schedule_end + "','" + obj.users + "','" + obj.progress_or_place + "'";
						        content += ')">'+ obj.wm_title + '</a></td><td><div class="progress" style="margin-bottom:0px;">'
						        content += '<div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuemax="100" style="width:'+obj.progress_or_place*100;
						        content += '%;">'+ obj.progress_or_place*100 +'%</div></div></td></tr>'
							}
						} else{
							content += '<tr><td>'+obj.schedule_start.substring(5,7)+'월 '+obj.schedule_start.substring(8,10)+'일</td><td style="color:rgb(71, 142, 72);">회의</td>';
					        content += '<td id=td' +obj.schedule_no+ '><a onclick="detail2(' + obj.schedule_no + ",'" + obj.wm_title + "','" + obj.wm_text;
					        content += "','" + obj.schedule_start +"','" + obj.schedule_end + "','" + obj.users + "','" + obj.progress_or_place + "'";
					        content += ')">'+ obj.wm_title + '</a></td><td></td></tr>';
						}
				        
					});
					
					$('#content_detail').css("display", "none");
					$('#content_detail2').css("display", "none");
					$('#update_btn').attr('type','hidden');
					$('#updateok_btn').attr('type','hidden');
					$('#meet_update_btn').attr('type','hidden');
					$('#meet_updateok_btn').attr('type','hidden');
					$('#delete_btn').attr('type','hidden');
					$('#meet_delete_btn').attr('type','hidden');
					$('#content').html(content);
					if(clickobject != null){
						clickobject.css('background-color',clickobjectcolor);
					}
					
					$.each(data.new_alarm, function(index, obj) {
						
						$("#td"+obj.schedule_no).append('<img style="width: 28px;height: 16px" src="assets/img/alarm/new1.png"/>');
						
					});
				},
				beforeSend:function(){
			        $('.wrap-loading').removeClass('display-none');
			    },
			    complete:function(){
			        $('.wrap-loading').addClass('display-none');
			    }
	}); 
	}
}



function detail(id, title, text, start, end, userids, progress_or_place){
	//온클릭 함수에 가져올 데이터들
		if(progress_or_place==1){
			swal('완료된 일정입니다.')
		}
		$('#delete_btn').attr('type','button');
		$('#update_btn').attr('type','button');
		$('#updateok_btn').attr('type','hidden');
		document.getElementById("detail_title").readOnly = true;
		document.getElementById("detail_text").readOnly = true;
		$('#progress_value').text(progress_or_place*100+"%");
		$('#progress_value').css("width",progress_or_place*100+"%");
		$('#content').empty();
		$('#comment_text').empty();
		$('#content_detail').css("display", "block");
	 	$('#detail_id').val(id);
		$('#detail_title').val(title);
		$('#detail_text').val(text);
		$('#detail_start').val(start);
		$('#detail_end').val(end);
		$('#detail_progress').val(progress_or_place);
		$('#check').val("check");
		$('#default_option').attr("selected","selected");
		
		
		before_progress = progress_or_place;
		
		//상세보기 내용에 참가자 인원 뿌려주는 코드
		var userid = userids.split("/");
		var contentck = "";
		
		for(var i =0; i<userid.length-1; i++){
			contentck += userid[i] + " "
		}
		
	 	$('#usersdiv').val(contentck);
	 	
	 	
	 	//상세보기 내용에 comment 뿌려주는 내용
	 	$.ajax({
			url : 'select_comment.ajax',
			type : 'post',
			data : 'schedule_no='+ id,
			success : function(data) {
				var comment_text = "";
	 			$.each(data, function(index, obj) {
	 				if(index%2==0){
	 					comment_text += '<li class="left clearfix"><span class="pull-left"><img src="images/언니회색.jpg" style="background:no-repeat center; width:50px; height: 50px; padding: 3px 3px 3px 3px;">';
	 					comment_text += '<br><strong class="primary-font"> &nbsp;&nbsp;'+obj.user_id+'</strong></span><div class="chat-body clearfix"><div class="header">';
	 					comment_text += '<small class="pull-right text-muted"><i class="fa fa-clock-o fa-fw"></i>등록시간 : '+obj.work_comment_date +' &nbsp;&nbsp;&nbsp;'
	 					comment_text += '<button type="button" onclick="delete_comment('+obj.work_comment_no+')" class="btn-xs" style="border:0px;"><i class="fa fa-times"></i></button></small></div>'
	 					comment_text += '<br><p style="word-break:break-all; width:241px;">'+obj.work_comment_text+'</p></div></li>';
	 				}else{
	 					comment_text += '<li class="right clearfix"><span class="pull-right"><img src="images/언니회색.jpg" style="background:no-repeat center; width:50px; height: 50px; padding: 3px 3px 3px 3px;">';
	 					comment_text += '<br><strong class="pull-right primary-font">'+obj.user_id+'&nbsp;&nbsp;</strong></span><div class="chat-body clearfix"><div class="header">'
	 					comment_text += '<small class=" text-muted"><button type="button" onclick="delete_comment('+obj.work_comment_no;
	 					comment_text += ')" class="btn-xs" style="border:0px;"><i class="fa fa-times"></i></button>&nbsp;&nbsp;<i class="fa fa-clock-o fa-fw"></i>등록시간 : '+obj.work_comment_date;
	 					comment_text += '</small></div><p style="word-break:break-all; width:241px; margin-left:28px;">'+obj.work_comment_text+'</p></div></li>'
	 				}
				});
	 			$('#comment_text').html(comment_text);
			}
		});
	 	
		 
		$.ajax({
			  
			  type:"post",
			  dataType: "html",
			  url:"newAlarm.htm",
			  data:{"newAlarm": "삭제"},
			  success:function(data){
				  
				  console.log("헤더 업데이트 성공");
				  console.log(data);
				  $('#alarm').empty();  
				  $('#alarm').html(data);
			
			  }
		  });	
}


//회의일정의 상세보기 페이지
function detail2(id, title, text, start, end, userids, progress_or_place){
	
	$('#meet_delete_btn').attr('type','button');
	$('#meet_update_btn').attr('type','button');
	$('#meet_updateok_btn').attr('type','hidden');
	document.getElementById("meet_detail_title").readOnly = true;
	document.getElementById("meet_detail_text").readOnly = true;
	$('#content').empty(); //테이블형태 UI 비우기
	$('#content_detail2').css("display", "block");
 	$('#meet_detail_id').val(id);
	$('#meet_detail_title').val(title);
	$('#meet_detail_text').val(text);
	$('#meet_detail_start').val(start);
	$('#meet_detail_end').val(end);
	$('#check').val("check");
	$('#default_option').attr("selected","selected");
	
	//상세보기 내용에 참가자 인원 뿌려주는 코드
	var userid = userids.split("/");
	var contentck = "";
	
	for(var i =0; i<userid.length-1; i++){
		contentck += userid[i] + " "
	}
	
	if(progress_or_place==10){
		$('#place').html("회의실1")
	}else if(progress_or_place==20){
		$('#place').html("회의실2")
	}else if(progress_or_place==30){
		$('#place').html("회의실3")
	}else if(progress_or_place==40){
		$('#place').html("회의실4")
	}
	
	
	
 	$('#usersdiv2').val(contentck)
 	
 	//회의 상세보기 클릭시 알림 delete
 	$.ajax({
		url : 'select_comment_alarm.ajax',
		type : 'post',
		data : 'schedule_no='+ id,
		success : function(data) {
			
			console.log("회의 알림 삭제!");
 	
		}
	});
 	
	 
	$.ajax({
		  
		  type:"post",
		  dataType: "html",
		  url:"newAlarm.htm",
		  data:{"newAlarm": "삭제"},
		  success:function(data){
			  
			  console.log("헤더 업데이트 성공");
			  console.log(data);
			  $('#alarm').empty();  
			  $('#alarm').html(data);
		
		  }
	  });	
 	
	
	
}




//수정하기 버튼 클릭시 readonly속성 없애줌
function work_update(){
	before_text=$('#detail_title').val();
	if($('#detail_progress').val()==1){
		swal('완료된 일정입니다.')
	}else{
		$('#update_btn').attr('type','hidden');
		$('#updateok_btn').attr('type','button');
		document.getElementById("detail_title").readOnly = false;
		document.getElementById("detail_text").readOnly = false;
	}
}

//저장하기 버튼 클릭시 DB에 update작업
function work_updateok(){
	$('#update_btn').attr('type','button');
	$('#updateok_btn').attr('type','hidden');
	document.getElementById("detail_title").readOnly = true;
	document.getElementById("detail_text").readOnly = true;
}

//회의일정 수정 버튼 클릭시 readonly속성 없애줌
function work_update2(){
	before_text2=$('#meet_detail_title').val();
	$('#meet_update_btn').attr('type','hidden');
	$('#meet_updateok_btn').attr('type','button');
	document.getElementById("meet_detail_title").readOnly = false;
	document.getElementById("meet_detail_text").readOnly = false;
}

//회의일정 저장 버튼 클릭시 DB에 update작업
function work_updateok2(){
	$('#meet_update_btn').attr('type','button');
	$('#meet_updateok_btn').attr('type','hidden');
	document.getElementById("meet_detail_title").readOnly = true;
	document.getElementById("meet_detail_text").readOnly = true;
}

//comment 등록 버튼 클릭시 insert 작업
function insert_comment(){
 	$.ajax({
		url : 'insert_comment.ajax',
		type : 'post',
		data : {"schedule_no" : $('#detail_id').val(),
				"work_comment_text" : $('#comment_textarea').val()
				},
		success : function(data) {
			var comment_text = "";
			console.log('comment 등록 성공')
 			$.each(data, function(index, obj) {
 				if(index%2==0){
 					comment_text += '<li class="left clearfix"><span class="pull-left"><img src="images/언니회색.jpg" style="background:no-repeat center; width:50px; height: 50px; padding: 3px 3px 3px 3px;">';
 					comment_text += '<br><strong class="primary-font"> &nbsp;&nbsp;'+obj.user_id+'</strong></span><div class="chat-body clearfix"><div class="header">';
 					comment_text += '<small class="pull-right text-muted"><i class="fa fa-clock-o fa-fw"></i>등록시간 : '+obj.work_comment_date +' &nbsp;&nbsp;&nbsp;'
 					comment_text += '<button type="button" onclick="delete_comment('+obj.work_comment_no+')" class="btn-xs" style="border:0px;"><i class="fa fa-times"></i></button></small></div>'
 					comment_text += '<br><p style="word-break:break-all; width:241px;">'+obj.work_comment_text+'</p></div></li>';
 				}else{
 					comment_text += '<li class="right clearfix"><span class="pull-right"><img src="images/언니회색.jpg" style="background:no-repeat center; width:50px; height: 50px; padding: 3px 3px 3px 3px;">';
 					comment_text += '<br><strong class="pull-right primary-font">'+obj.user_id+'&nbsp;&nbsp;</strong></span><div class="chat-body clearfix"><div class="header">'
 					comment_text += '<small class=" text-muted"><button type="button" onclick="delete_comment('+obj.work_comment_no;
 					comment_text += ')" class="btn-xs" style="border:0px;"><i class="fa fa-times"></i></button>&nbsp;&nbsp;<i class="fa fa-clock-o fa-fw"></i>등록시간 : '+obj.work_comment_date;
 					comment_text += '</small></div><p style="word-break:break-all; width:241px; margin-left:28px;">'+obj.work_comment_text+'</p></div></li>'
 				}
			});
			$('#comment_text').html(comment_text);
			$('#comment_textarea').val("");
		}
	});
}

//comment 삭제버튼 클릭시 delete 작업
function delete_comment(commend_id){
 	$.ajax({
		url : 'delete_comment.ajax',
		type : 'post',
		data : {"schedule_no" : $('#detail_id').val(),
				"work_comment_no" : commend_id},
		success : function(data) {
			var comment_text = "";
			console.log(' cocmment 삭제 성공')
 			$.each(data, function(index, obj) {
 				if(index%2==0){
 					comment_text += '<li class="left clearfix"><span class="pull-left"><img src="images/언니회색.jpg" style="background:no-repeat center; width:50px; height: 50px; padding: 3px 3px 3px 3px;">';
 					comment_text += '<br><strong class="primary-font"> &nbsp;&nbsp;'+obj.user_id+'</strong></span><div class="chat-body clearfix"><div class="header">';
 					comment_text += '<small class="pull-right text-muted"><i class="fa fa-clock-o fa-fw"></i>등록시간 : '+obj.work_comment_date +' &nbsp;&nbsp;&nbsp;'
 					comment_text += '<button type="button" onclick="delete_comment('+obj.work_comment_no+')" class="btn-xs" style="border:0px;"><i class="fa fa-times"></i></button></small></div>'
 					comment_text += '<br><p style="word-break:break-all; width:241px;">'+obj.work_comment_text+'</p></div></li>';
 				}else{
 					comment_text += '<li class="right clearfix"><span class="pull-right"><img src="images/언니회색.jpg" style="background:no-repeat center; width:50px; height: 50px; padding: 3px 3px 3px 3px;">';
 					comment_text += '<br><strong class="pull-right primary-font">'+obj.user_id+'&nbsp;&nbsp;</strong></span><div class="chat-body clearfix"><div class="header">'
 					comment_text += '<small class=" text-muted"><button type="button" onclick="delete_comment('+obj.work_comment_no;
 					comment_text += ')" class="btn-xs" style="border:0px;"><i class="fa fa-times"></i></button>&nbsp;&nbsp;<i class="fa fa-clock-o fa-fw"></i>등록시간 : '+obj.work_comment_date;
 					comment_text += '</small></div><p style="word-break:break-all; width:241px; margin-left:28px;">'+obj.work_comment_text+'</p></div></li>'
 				}
			});
			$('#comment_text').html(comment_text);
		}
	});
 	
}

function progress_0(){
	$('#progress_value').text("0%");
	$('#progress_value').css("width","0%");
	$('#progress_value').attr("value","0");
}

function progress_20(){
	$('#progress_value').text("20%");
	$('#progress_value').css("width","20%");
	$('#progress_value').attr("value","0.2");
}
function progress_40(){
	$('#progress_value').text("40%");
	$('#progress_value').css("width","40%");
	$('#progress_value').attr("value","0.4");
}

function progress_60(){
	$('#progress_value').text("60%");
	$('#progress_value').css("width","60%");
	$('#progress_value').attr("value","0.6");
}

function progress_80(){
	$('#progress_value').text("80%");
	$('#progress_value').css("width","80%");
	$('#progress_value').attr("value","0.8");
}

function progress_100(){
	$('#progress_value').text("100%");
	$('#progress_value').css("width","100%");
	$('#progress_value').attr("value","1");
}


//추가작업 : 알림DB NEW 가져오기
function fcontent() {
	content = "<table class='table table-striped'><tr><th style='width:80px;'>시작일</th><th style='width:50px;'>구분</th><th style='width:250px; text-align:center;'>제목</th><th style='width:70px;'>진척률</th></tr>";
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
				        content += '<tr><td>'+obj.schedule_start.substring(5,7)+'월 '+obj.schedule_start.substring(8,10)+'일</td><td style="color:rgba(51, 122, 183, 0.22); text-decoration:line-through;">업무</td>';
				        content += '<td id=td' +obj.schedule_no+ '><a onclick="detail(' + obj.schedule_no + ",'" + obj.wm_title + "','" + obj.wm_text;
				        content += "','" + obj.schedule_start +"','" + obj.schedule_end + "','" + obj.users + "','" + obj.progress_or_place + "'";
				        content += ')">'+ obj.wm_title + '</a></td><td><div class="progress" style="margin-bottom:0px;">'
				        content += '<div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuemax="100" style="width:'+obj.progress_or_place*100;
				        content += '%;">'+ obj.progress_or_place*100 +'%</div></div></td></tr>'
					} else{
				        content += '<tr><td>'+obj.schedule_start.substring(5,7)+'월 '+obj.schedule_start.substring(8,10)+'일</td><td style="color:rgb(51, 122, 183);">업무</td>';
				        content += '<td id=td' +obj.schedule_no+ '><a onclick="detail(' + obj.schedule_no + ",'" + obj.wm_title + "','" + obj.wm_text;
				        content += "','" + obj.schedule_start +"','" + obj.schedule_end + "','" + obj.users + "','" + obj.progress_or_place + "'";
				        content += ')">'+ obj.wm_title + '</a></td><td><div class="progress" style="margin-bottom:0px;">'
				        content += '<div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuemax="100" style="width:'+obj.progress_or_place*100;
				        content += '%;">'+ obj.progress_or_place*100 +'%</div></div></td></tr>'
					}
				} else{
					content += '<tr><td>'+obj.schedule_start.substring(5,7)+'월 '+obj.schedule_start.substring(8,10)+'일</td><td style="color:rgb(71, 142, 72);">회의</td>';
			        content += '<td id=td' +obj.schedule_no+ '><a onclick="detail2(' + obj.schedule_no + ",'" + obj.wm_title + "','" + obj.wm_text;
			        content += "','" + obj.schedule_start +"','" + obj.schedule_end + "','" + obj.users + "','" + obj.progress_or_place + "'";
			        content += ')">'+ obj.wm_title + '</a></td><td></td></tr>'
				}
			});
			$('#content_detail').css("display", "none");
			$('#content_detail2').css("display", "none");
			$('#update_btn').attr('type','hidden');
			$('#updateok_btn').attr('type','hidden');
			$('#meet_update_btn').attr('type','hidden');
			$('#meet_updateok_btn').attr('type','hidden');
			$('#delete_btn').attr('type','hidden');
			$('#meet_delete_btn').attr('type','hidden');
			$('#content').empty();	        
	        $('#content').html(content)

	        $.each(data.new_alarm, function(index, obj) {
				
				$("#td"+obj.schedule_no).append('<img style="width: 28px;height: 16px" src="assets/img/alarm/new1.png"/>');
				
			});
		},
		beforeSend:function(){
	        $('.wrap-loading').removeClass('display-none');
	    },
	    complete:function(){
	        $('.wrap-loading').addClass('display-none');
	    }
	});
}


function scheduleuser(){
	
	scheduleusers="";
	
	$("input[name='userchk']:checked").each(function(i){

		scheduleusers += $(this).val()+"/";
	
	});
	
}




function loadCalendar(role1,role2) {
	//캘린더 호출
	var calendar = $('#calendar').fullCalendar({
		//캐린더의 기본 속성값 지정
		theme: false,
		editable: role1, //스케줄 기간 늘이고, 위치 움직이는 함수
		eventLimit: false, // allow "more" link when too many events
		selectable: role2, //insert할 select 이벤트
		selectHelper: true, //???
	    
		
		//캘린더 헤더 부분 css요소
		header: {
	        left: 'prev,next,today, fileroombtn',
	        center: '', //
	        right: 'title'
	    },

		
		// 작업자: 이명철  // 최근 수정일: 16-11-21 ---------------------S T A R T------------------------
		// 작업내용: 드래그로 일정등록 하는 소스 , 사용한 함수 호출횟수 만큼 반복되어 실행되는 에러 발생
	    // 처리결과: start, end 값만 html에 기재하고, customBotton속성 함수에서 일정등록 코드 진행 + 재호출시 기존에 입력된 값 초기화 작업.
	    
	    select: function(start, end) {
			//모달 띄우는 함수
	    	
	    	var test = $('#modal_btn').click();
	    	$('#ptag').empty();
	    	$('#spantag').css("display","inline")
	    	$('#modal_title').val(""); $('#modal_title2').val("");
			$('#modal_text').val(""); $('#modal_text2').val("");
			$('#modal_start').val(start.format("YYYY-MM-DD"));
			$('#modal_start_ms').val(start._d-1);
			$('#modal_end').val(end.format("YYYY-MM-DD"));
			$('#modal_end_ms').val(end._d-86400001);
			$("input[type='checkbox']").prop("checked", false);
			$("input[type='radio']").prop("checked", false);
			$("input[type='radio']").attr("onclick","return true");
			$('.dplace').css("color","#858585");
			$('#check').val('check');
			
			
			
			$.ajax({
				url : 'select_place.ajax',
				type : 'post',
				data :  'schedule_start='+start.format("YYYY-MM-DD") ,
				success : function(data) {
				      $.each(data, function (index, obj) {
							if(obj=='10'){
								$('#meeting_place_10').attr("onclick","return false");
								$('#div_place_10').css("color","rgba(0,0,0,0.2)")
							}else if(obj=='20'){
								$('#meeting_place_20').attr("onclick","return false");
								$('#div_place_20').css("color","rgba(0,0,0,0.2)")
							}else if(obj=='30'){
								$('#meeting_place_30').attr("onclick","return false");
								$('#div_place_30').css("color","rgba(0,0,0,0.2)")
							}else if(obj=='40'){
								$('#meeting_place_40').attr("onclick","return false");
								$('#div_place_40').css("color","rgba(0,0,0,0.2)")
							}
				      });
				      
				}
			});
			
			
			
			calendar.fullCalendar('unselect');
		},
		// 작업자: 이명철  // 최근 수정일: 16-11-21 --------------------- E N D ------------------------
		
		
		
		
		
		
		// 작업자: 이명철  // 최근 수정일: 16-11-21 ---------------------S T A R T------------------------
		// 작업내용: 일정 클릭했을 때 이벤트 발생 함수
		// 처리결과: 일정마다 css적인 요소를 적용할 예정이나 미작업 함
		eventClick: function(calEvent, jsEvent, view) {
	        //alert('Event: ' + calEvent.title); //일정의 정보 표현 ex) ~.title, ~.start, ~.end 값등 사용가능
	        //alert('View: ' + view.name); //달력의 정보 표현 ex) view.name = november 2016, view.title = month
			//$(this).css('background-color', 'rgb(58, 135, 173)'); //일정의 스타일을 바꿀 수 있음 ex) border-color, background-color ...
			
			//기존에 클릭했던 object의 주소가 있으면 그 객체의 색상을 기존 색상으로 바꿈
			if(clickobject){
				clickobject.css('background-color', clickobjectcolor);
			}
			
			
			//클릭된 일정의 객체주소를 변수에 담음
			clickobject = $(this)
			//클릭된 일정의 객체 배경색 값을 변수에 담음
			clickobjectcolor = $(this).css('background-color');
			
			//클릭된 일정의 배경색을 red로 설정
			$(this).css('background-color', 'rgba(237,0,0,0.66)');
			
			
			content = "<table class='table table-striped'><tr><th style='width:80px;'>시작일</th><th style='width:50px;'>구분</th><th style='width:250px; text-align:center;'>제목</th><th style='width:70px;'>진척률</th></tr>";
			$.ajax({
				url : 'eventclick.ajax',
				type : 'post',
	            data : {
					"schedule_no": calEvent.id,
					"collabo_no" : $('#collabo_no').val(),
					"color_check" : clickobjectcolor
	            },
				success : function(obj) {
					if(obj.progress_or_place<10){
						if(obj.progress_or_place==1){
					        content += '<tr><td>'+obj.schedule_start.substring(5,7)+'월 '+obj.schedule_start.substring(8,10)+'일</td><td style="color:rgba(51, 122, 183, 0.22); text-decoration:line-through;">업무</td>';
					        content += '<td id=td' +obj.schedule_no+ '><a onclick="detail(' + obj.schedule_no + ",'" + obj.wm_title + "','" + obj.wm_text;
					        content += "','" + obj.schedule_start +"','" + obj.schedule_end + "','" + obj.users + "','" + obj.progress_or_place + "'";
					        content += ')">'+ obj.wm_title + '</a></td><td><div class="progress" style="margin-bottom:0px;">'
					        content += '<div class="progress-bar progress-bar-striped active" role="progressbar" style="width:'+obj.progress_or_place*100;
					        content += '%;">'+ obj.progress_or_place*100 +'%</div></div></td></tr>'
						} else{
					        content += '<tr><td>'+obj.schedule_start.substring(5,7)+'월 '+obj.schedule_start.substring(8,10)+'일</td><td style="color:rgb(51, 122, 183);">업무</td>';
					        content += '<td id=td' +obj.schedule_no+ '><a onclick="detail(' + obj.schedule_no + ",'" + obj.wm_title + "','" + obj.wm_text;
					        content += "','" + obj.schedule_start +"','" + obj.schedule_end + "','" + obj.users + "','" + obj.progress_or_place + "'";
					        content += ')">'+ obj.wm_title + '</a></td><td><div class="progress" style="margin-bottom:0px;">'
					        content += '<div class="progress-bar progress-bar-striped active" role="progressbar" style="width:'+obj.progress_or_place*100;
					        content += '%;">'+ obj.progress_or_place*100 +'%</div></div></td></tr>'
						}
					} else{
						content += '<tr><td>'+obj.schedule_start.substring(5,7)+'월 '+obj.schedule_start.substring(8,10)+'일</td><td style="color:rgb(71, 142, 72);">회의</td>';
				        content += '<td id=td' +obj.schedule_no+ '><a onclick="detail2(' + obj.schedule_no + ",'" + obj.wm_title + "','" + obj.wm_text;
				        content += "','" + obj.schedule_start +"','" + obj.schedule_end + "','" + obj.users + "','" + obj.progress_or_place + "'";
				        content += ')">'+ obj.wm_title + '</a></td><td></td></tr>'
					}
					$('#content_detail').css("display", "none");
					$('#content_detail2').css("display", "none");
					$('#update_btn').attr('type','hidden');
					$('#updateok_btn').attr('type','hidden');
					$('#meet_update_btn').attr('type','hidden');
					$('#meet_updateok_btn').attr('type','hidden');
					$('#delete_btn').attr('type','hidden');
					$('#meet_delete_btn').attr('type','hidden');
					$('#content').html(content)
					
					//새로왔다면 new이미지 붙이기
					if(obj.isNew){
						
						$("#td"+obj.schedule_no).append('<img style="width: 28px;height: 16px"src="assets/img/alarm/new1.png"/>');
						
					}
				},
			      beforeSend:function(){
			           $('.wrap-loading').removeClass('display-none');
			       },
			       complete:function(){
			           $('.wrap-loading').addClass('display-none');
			       }
			});

			
			

		},
		// 작업자: 이명철  // 최근 수정일: 16-11-21 --------------------- E N D ------------------------
		
		
		
		
		
		
		// 작업자: 이명철  // 최근 수정일: 16-11-21 ---------------------S T A R T------------------------
		// 작업내용: 날짜 드래그 이벤트
		eventDrop : function(calevent, delta, revertFunc) {
			if(calevent.backgroundColor == 'rgba(51, 122, 183, 0.22)'){
				swal('완료된 일정입니다.');
				revertFunc();
			}else{
		         $.ajax({
		        	type : 'post',
		        	url : 'dragupdate.ajax',
		        	data : {
		        	"schedule_no": calevent.id,
		        	"schedule_start" : calevent.start.format('YYYY-MM-DD'),
		        	"schedule_end" : calevent.end.format('YYYY-MM-DD')
		        	},
		        	success : function(data) {
		        		console.log("날짜이동성공");
		        	fcontent();
		           }
		        });
			}

	      },
		// 작업자: 이명철  // 최근 수정일: 16-11-21 --------------------- E N D ------------------------		
		
	    
		// 작업자: 이명철  // 최근 수정일: 16-12-08 ---------------------S T A R T------------------------
		// 작업내용: 회의일정 + 완료된 일정의 날짜를 늘리기 전의 초기값을 저장해 놓기 위한 이벤트
		eventResizeStart : function(event, jsEvent, ui, view){
			if(event.backgroundColor == "rgb(71, 142, 72)"){
				test = event.end;
			}else if(event.backgroundColor == 'rgba(51, 122, 183, 0.22)'){
				test = event.end;
			}
		},
		// 작업자: 이명철  // 최근 수정일: 16-12-08 --------------------- E N D ------------------------  
	      
	    
		// 작업자: 이명철  // 최근 수정일: 16-11-21 ---------------------S T A R T------------------------
		// 작업내용: 날짜 늘리는 이벤트
		eventResize : function(calevent) {
			var id = calevent.id;
			var calEvent2 = null;
			
	    	  if(calevent.backgroundColor == "rgb(71, 142, 72)"){
	    		  swal('회의 일정은 1일만 선택 가능합니다.')
        		  for(var i=0; i<calendar.fullCalendar( 'getEventSources' )[0].events.length; i++){
        			  if(calendar.fullCalendar( 'getEventSources' )[0].events[i].id == id){
        				  calEvent2 = calendar.fullCalendar( 'getEventSources' )[0].events[i]
        				  calendar.fullCalendar( 'getEventSources' )[0].events[i].end = test;
        				  //calendar.fullCalendar('updateEvent', calEvent2);
        			  }
        		  }
	    	  
	    	  
	    	  }else if(calevent.backgroundColor == 'rgba(51, 122, 183, 0.22)'){
	    		  swal('완료된 일정입니다.')
        		  for(var i=0; i<calendar.fullCalendar( 'getEventSources' )[0].events.length; i++){
        			  if(calendar.fullCalendar( 'getEventSources' )[0].events[i].id == id){
        				  calEvent2 = calendar.fullCalendar( 'getEventSources' )[0].events[i]
        				  calendar.fullCalendar( 'getEventSources' )[0].events[i].end = test;
        				  //calendar.fullCalendar('updateEvent', calEvent2);
        			  }
        		  }
	    	  }
			
			
			else{
			     $.ajax({
		        	type : 'post',
		            url : 'dragupdate.ajax',
		            data : {
						"schedule_no": calevent.id,
		            	"schedule_start" : calevent.start.format('YYYY-MM-DD'),
		                "schedule_end" : calevent.end.format('YYYY-MM-DD')
		            },
		            success : function(data) {
		            console.log("날짜 길이 조정 성공");
		            fcontent();
		            }
			     });
			 }
		},
		// 작업자: 이명철  // 최근 수정일: 16-11-21 --------------------- E N D ------------------------	
		
		
		
	    
	    
		// 작업자: 이명철  // 최근 수정일: 16-11-21 ---------------------S T A R T------------------------
		// 작업내용: 커스텀 버튼 함수 ( insert, delete, update .... 등등 )
	    customButtons: {
	        
	    	// 작업자: 이명철  // 최근 수정일: 16-11-21 ---------------------S T A R T------------------------
	    	//일정 삭제 함수
	    	deleteEvent: {
	            click: $('#delete_btn').click(function(){
	            	if( $('#check').val() ){
	            		var check = swal({
	            			  title: "일정을 삭제 하시겠습니까?",
	            			  text: "삭제된 데이터는 복구할 수 없습니다.",
	            			  type: "warning",
	            			  showCancelButton: true,
	            			  confirmButtonColor: "#DD6B55",
	            			  confirmButtonText: "삭제",
	            			  cancelButtonText: "취소",
	            			  showLoaderOnConfirm: true,
	            			  closeOnConfirm: false
	            			},
	            			function(){
	            			  var id = $('#detail_id').val();
	            			  calendar.fullCalendar('removeEvents', id);
	            			  $.ajax({
	            				  type: 'post',
	            				  url: 'deleteSchedule.ajax',
	            				  data: {"id" : id},
	            				  success : function(data) {
	            					  console.log("삭제성공");
	            					  fcontent();
	            					  setTimeout(function(){
	            						  swal("삭제 성공!", "선택된 일정이 삭제되었습니다.", "success");
	            					  }, 0);
	            				  },
	            				  error:function(){
	            					  swal("삭제 실패!","error발생", "error");
	            				  }
	            			  });
	            			  
	            			  $('#check').val("")
	            			});
	            		
	            	}//check if문 끝
	            })
	        },
	        
	        
	        // 작업자: 이명철  // 최근 수정일: 16-11-21 ---------------------S T A R T------------------------
	    	//회의 일정 삭제 함수
	    	deleteEvent2: {
	            click: $('#meet_delete_btn').click(function(){
	            	if( $('#check').val() ){
	            		var check = swal({
	            			  title: "일정을 삭제 하시겠습니까?",
	            			  text: "삭제된 데이터는 복구할 수 없습니다.",
	            			  type: "warning",
	            			  showCancelButton: true,
	            			  confirmButtonColor: "#DD6B55",
	            			  confirmButtonText: "삭제",
	            			  cancelButtonText: "취소",
	            			  showLoaderOnConfirm: true,
	            			  closeOnConfirm: false
	            			},
	            			function(){
			            		var id = $('#meet_detail_id').val();
			            		calendar.fullCalendar('removeEvents', id);
		            			  $.ajax({
		            				  type: 'post',
		            				  url: 'deleteMeetingSchedule.ajax',
		            				  data: {"id" : id},
		            				  success : function(data) {
		            					  console.log("삭제성공");
		            					  fcontent();
		            					  setTimeout(function(){
		            						  swal("삭제 성공!", "선택된 일정이 삭제되었습니다.", "success");
		            					  }, 0);
		            				  },
		            				  error:function(){
		            					  swal("삭제 실패!","error발생", "error");
		            				  }
		            			  });
		            			  
		            			  $('#check').val("")
		            			}
	            			);
	            	}//check if문 끝
	            })
	        },
	        
	        
	        
	        // 작업자: 이명철  // 최근 수정일: 16-11-21 ---------------------S T A R T------------------------
	        // 일반업무 업데이트 함수
	        updateEvent: {
	            click: $('#updateok_btn').click(function(){
	            	
	            	swal({
	            		  title: "수정 하시겠습니까?",
	            		  text: "효율적인 업무 fortune",
	            		  type: "info",
	            		  showCancelButton: true,
	            		  confirmButtonColor: "#DD6B55",
	            		  confirmButtonText: "수정하기",
	            		  cancelButtonText: "취소",
	            		  closeOnConfirm: false,
	            		  closeOnCancel: true
	            		},
	            		function(isConfirm){
		            		if(isConfirm){
		            		  swal("수정이 완료되었습니다.", "효율적인 업무 fortune", "success");
		            		  
		            		  var id = $('#detail_id').val();
		            		  var calEvent;
		            		  
		            		  for(var i=0; i<calendar.fullCalendar( 'getEventSources' )[0].events.length; i++){
		            			  if(calendar.fullCalendar( 'getEventSources' )[0].events[i].id == id){
		            				  calEvent = calendar.fullCalendar( 'getEventSources' )[0].events[i];
		            				  calendar.fullCalendar( 'getEventSources' )[0].events[i].title =$('#detail_title').val();
		            				  calendar.fullCalendar('updateEvent', calEvent);
		            			  }
		            		  }
		            		  
		            		  var updateschedule = {
		            				  "title": $('#detail_title').val(),
		            				  "text": $('#detail_text').val(),
		            				  "schedule_no": $('#detail_id').val(),
		            				  "schedule_start" : $('#detail_start').val(),
		            				  "schedule_end" : $('#detail_end').val()
		            		  }
		            		  
		            		  $.ajax({
		            			  type: 'post',
		            			  url: 'work_update.ajax',
		            			  data: updateschedule,
		            			  success : function(data) {
		            				  console.log('업데이트 성공');
		            			  }
		            		  });
		            		  
		            		}else{
		            			$("#detail_title").val(before_text);
		            		}
	            		}	
	            	);
	            })
	        },

	        // 작업자: 이명철  // 최근 수정일: 16-11-30 ---------------------S T A R T------------------------
	        // 회의업무 업데이트 함수
	        updateEvent: {
	            click: $('#meet_updateok_btn').click(function(){
	            
	            	
	            	swal({
	            		  title: "수정 하시겠습니까?",
	            		  text: "효율적인 업무 fortune",
	            		  type: "info",
	            		  showCancelButton: true,
	            		  confirmButtonColor: "#DD6B55",
	            		  confirmButtonText: "수정하기",
	            		  cancelButtonText: "취소",
	            		  closeOnConfirm: false,
	            		  closeOnCancel: true
	            		},
	            		function(isConfirm){
		            		if(isConfirm){
		            			swal("수정이 완료되었습니다.", "효율적인 업무 fortune", "success");
		            			
			            		var id = $('#meet_detail_id').val();
			            		var calEvent;
			            		
			            		for(var i=0; i<calendar.fullCalendar( 'getEventSources' )[0].events.length; i++){
			            			if(calendar.fullCalendar( 'getEventSources' )[0].events[i].id == id){
			            				calEvent = calendar.fullCalendar( 'getEventSources' )[0].events[i];
			            				calendar.fullCalendar( 'getEventSources' )[0].events[i].title =$('#meet_detail_title').val();
			            				calendar.fullCalendar('updateEvent', calEvent);
			            			}
				            	}
				            		
								var updateschedule = {
									"title": $('#meet_detail_title').val(),
									"text": $('#meet_detail_text').val(),
									"schedule_no": $('#meet_detail_id').val(),
					                "schedule_start" : $('#meet_detail_start').val(),
					                "schedule_end" : $('#meet_detail_end').val(),
								}
			            		
			            		$.ajax({
									type: 'post',
									url: 'meeting_update.ajax',
									data: updateschedule,
									success : function(data) {
										console.log('업데이트 성공');
									}
								});
		            		}else{
		            			$('#meet_detail_title').val(before_text2)
		            		}
	            		}
	            	);
	            	
            		
	            })
	        },
	        

	        // 작업자: 이명철  // 최근 수정일: 16-12-07 ---------------------S T A R T------------------------
	        // progress업데이트
	        updateEvent: {
	        	
	            click: $('#update_progress').click(function(){
	            if(before_progress==1){
	            	swal('완료된 일정입니다.')
	            }else{
	            
	            	swal({
	            		  title: "등록 하시겠습니까?",
	            		  text: "효율적인 업무 fortune",
	            		  type: "info",
	            		  showCancelButton: true,
	            		  confirmButtonColor: "#DD6B55",
	            		  confirmButtonText: "등록하기",
	            		  cancelButtonText: "취소",
	            		  closeOnConfirm: false,
	            		  closeOnCancel: true
	            		},
	            		function(isConfirm){
		            		if(isConfirm){
		            			var id = $('#detail_id').val();
		            			var calEvent;
		            			
		            			if($('#progress_value').attr("value")==1){
				            		for(var i=0; i<calendar.fullCalendar( 'getEventSources' )[0].events.length; i++){
				            			if(calendar.fullCalendar( 'getEventSources' )[0].events[i].id == id){
				            				calEvent = calendar.fullCalendar( 'getEventSources' )[0].events[i];
				            				calendar.fullCalendar( 'getEventSources' )[0].events[i].backgroundColor ='rgba(51, 122, 183, 0.22)';
				            				calendar.fullCalendar('updateEvent', calEvent);
				            			}
					            	}
		            			}else{
		            				for(var i=0; i<calendar.fullCalendar( 'getEventSources' )[0].events.length; i++){
				            			if(calendar.fullCalendar( 'getEventSources' )[0].events[i].id == id){
				            				calEvent = calendar.fullCalendar( 'getEventSources' )[0].events[i];
				            				calendar.fullCalendar( 'getEventSources' )[0].events[i].backgroundColor ='rgb(51, 122, 183)';
				            				calendar.fullCalendar('updateEvent', calEvent);
				            			}
					            	}
		            			}
		            			
								$.ajax({
									url : 'update_progress.ajax',
									type : 'post',
									data : {"schedule_no": $('#detail_id').val(),
											"work_progress" : $('#progress_value').attr("value")
											},
									success : function(data) {
										swal("등록성공", "효율적인 업무 fortune", "success")
									}
								});
		            		}
	            		}
	            	);
	            	
	            }
	            })
	        	
	        },
	        
	        // 작업자: 이명철  // 최근 수정일: 16-11-21 ---------------------S T A R T------------------------
	        //일정등록 함수
	        //추가 작업 : new 알림 가져오기
	    	insertEvent: {
	    		click: $('#modal_ok').click(function(){

	    			if( $('#modal_title').val() == null || $('#modal_title').val() =="" ){
	    				swal('제목을 입력하세요.');
	    				$('#modal_title').focus();
	    			}else if($('#modal_text').val() == null || $('#modal_text').val() ==""){
	    				swal('내용을 입력하세요.');
	    				$('#modal_text').focus();
	    			}else if( scheduleusers == null || scheduleusers == ""){
	    				swal('참가자를 1명이상 선택하세요.');
	    			}else{

	    				
	    			if( $('#check').val() ){
	    				
		    			var eventData;
						var count=",";
						var work_type="";
						
						var newschedule = {
								"title": $('#modal_title').val(),
								"text": $('#modal_text').val(),
								"start": $('#modal_start').val(),
								"end": $('#modal_end').val(),
								"collabo_no" : $('#collabo_no').val(),
								"scheduleusers" : scheduleusers,
								"meeting_place_no" : "0"
						}
						
		    			$('#modal_close').click();
						
						$.ajax({
							type: 'post',
							url: 'select.ajax',
							data: newschedule,
							success : function(data) {
								console.log(data);
								eventData = {
										id: data.schedule.schedule_no,
										title: data.schedule.work_title,
										start: data.schedule.schedule_start,
										end: data.schedule.schedule_end,
										backgroundColor : 'rgb(51, 122, 183)'
								}
								
								calendar.fullCalendar('renderEvent', eventData , true);
								fcontent();
								console.log('insert 성공')
								
								
							      $.each(data.alarm, function (i, item) {
		                                console.log(item.count);
		                                count+=item.count+"/";
		                                work_type=item.work_type;
							      
							      });
								
								console.log(data.alarm); 
								//var count =","+data.count.join(' / ');
								
								console.log(count);
								
								send(scheduleusers+count+","+work_type);
								
								
				    			$('input[type="checkbox"]').prop("checked",false);
				    			$('.multiSel').text("");
								},
								beforeSend:function(){
							        $('.wrap-loading').removeClass('display-none');
							    },
							    complete:function(){
							        $('.wrap-loading').addClass('display-none');
							    }
			    		});
						
						
	    				$('#check').val("");
	    			}
	    			}
		    	})
	    	},
	 // 작업자: 이명철  // 최근 수정일: 16-11-21 --------------------- E N D ------------------------
	 // ------------------------------------------------------------------------------------
	 
	    
	    
	    
	    
        // 작업자: 이명철  // 최근 수정일: 16-11-29 ---------------------S T A R T------------------------
        // 회의업무 등록함수
	    //추가 작업 : new 알림 가져오기
    	insertEvent2: {
    		click: $('#modal_ok2').click(function(){
    			
    			if( $('#modal_title2').val() == null || $('#modal_title2').val() =="" ){
    				swal('제목을 입력하세요.');
    				$('#modal_title2').focus();
    			}else if($('#modal_text2').val() == null || $('#modal_text2').val() ==""){
    				swal('내용을 입력하세요.');
    				$('#modal_text2').focus();
    			}else if( scheduleusers == null || scheduleusers == ""){
    				swal('참가자를 1명이상 선택하세요.');
    			}else if( $('input[type=radio]:checked').val() == null || $('input[type=radio]:checked').val() == "" ){
    				swal('회의실을 선택하세요.');
    			}else{
    			
    			
    			if( $('#check').val() ){ 
    			
	    			console.log( $('#modal_start_ms').val() )
	    			console.log( $('#modal_end_ms').val() )
	    			
	    			if( $('#modal_start_ms').val() != $('#modal_end_ms').val() ){
	    				swal('회의 일정은 1일만 가능합니다.','기간을 1일로 설정해 주세요.')
	    			}else{
	    			
		    			var eventData;
						var count=",";
						var work_type="";
	
						var newschedule = {
								"title": $('#modal_title2').val(),
								"text": $('#modal_text2').val(),
								"start": $('#modal_start').val(),
								"end": $('#modal_end').val(),
								"collabo_no" : $('#collabo_no').val(),
								"scheduleusers" : scheduleusers,
								"meeting_place_no" : $('input[type=radio]:checked').val(),
						}
		
						$('#modal_close').click();
						
						$.ajax({
							type: 'post',
							url: 'select.ajax',
							data: newschedule,
							success : function(data) {
								eventData = {
										id: data.schedule.schedule_no,
										title: data.schedule.meeting_title,
										start: data.schedule.schedule_start,
										end: data.schedule.schedule_end,
										backgroundColor: 'rgb(71, 142, 72)'
								}
								
								
								calendar.fullCalendar('renderEvent', eventData , true);
								
								fcontent();
								console.log('회의업무 insert 성공')
								
								
							      $.each(data.alarm, function (i, item) {
		                                console.log(item.count);
		                                count+=item.count+"/";
		                                work_type=item.work_type;
							      
							      });
								
								console.log(data.alarm); 
								//var count =","+data.count.join(' / ');
								
								console.log(count);
								
								send(scheduleusers+count+","+work_type);
								
								
				    			$('input[type="checkbox"]').prop("checked",false);
				    			$('.multiSel').text("");
				    			
								},
								beforeSend:function(){
							        $('.wrap-loading').removeClass('display-none');
							    },
							    complete:function(){
							        $('.wrap-loading').addClass('display-none');
							    }
							});
						
										
		    			}
					$('#check').val("");
    			}
    			}
    			})
	    	},
	    	// 작업자: 이명철  // 최근 수정일: 16-11-29 --------------------- E N D ------------------------
	    	// ------------------------------------------------------------------------------------    
	    	fileroombtn : {
	    		text :'자료실',
	    		click : function(){
	    			location.href='mainfile.htm?collabo_no='+$("#collabo_no").val();
	    		}
	    	}
	    	
	    	
	    	
	    }, //custombutton 끝
	    
	    
	 
	    
	    
	 // 캘린더 초기 호출시 뷰단에 뿌려줄 일정데이터
		events: array
	});
	

}
	
	

