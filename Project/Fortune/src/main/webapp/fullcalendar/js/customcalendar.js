//캘린더 호출시 필요한 초기 변수 선언
var content = "<table class='table table-striped'><tr><th>구분</th><th>제목</th><th>일정상세</th></tr>";
var array = [];



function fcontent() {
	
	var content2 = "";
	content2 += "<table class='table table-striped'><tr><th>구분</th><th>제목</th><th>일정상세</th></tr>";
	$('#content').empty();
	$.ajax({
		url : 'calendarload.ajax',
		type : 'post',
		data : 'collabo_no='+$('#collabo_no').val(),
		success : function(data) {
			console.log(data)
			$.each(data.schedulelist, function(index, obj) {
				var userid ="";
				
		        content2 += '<tr id=tr' +obj.schedule_no+ '><td>**일정(미구현)</td><td>' + obj.work_title;
		        content2 += '</td><td><a';
		        content2 += ' onclick="detail(' + obj.schedule_no;
		        content2 += ",'" + obj.work_title + "','" + obj.work_text;
		        content2 += "','" + obj.schedule_start +"','" + obj.schedule_end;
		        content2 += "','" + obj.users + "'" ;
		        content2 += ')" >상세보기</a></td></tr>';
			});
			$('#content_detail').css("display", "none");
	        $('#content').html(content2)
		} 
	});
}




function loadCalendar() {
	//캘린더 호출
	var calendar = $('#calendar').fullCalendar({
		//캐린더의 기본 속성값 지정
		theme: true,
		editable: true,
		eventLimit: false, // allow "more" link when too many events
		selectable: true,
		selectHelper: true,
	    
		//캘린더 헤더 부분 css요소
		header: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'month,agendaWeek,agendaDay'
	    },

		
		// 작업자: 이명철  // 최근 수정일: 16-11-21 ---------------------S T A R T------------------------
		// 작업내용: 드래그로 일정등록 하는 소스 , 사용한 함수 호출횟수 만큼 반복되어 실행되는 에러 발생
	    // 처리결과: start, end 값만 html에 기재하고, customBotton속성 함수에서 일정등록 코드 진행 + 재호출시 기존에 입력된 값 초기화 작업.
	    	select: function(start, end) {
			//모달 띄우는 함수
			var test = $('#modal_btn').click();
			$('#modal_title').val("");
			$('#modal_text').val("");
			$('#modal_start').val(start.format("YYYY-MM-DD"));
			$('#modal_end').val(end.format("YYYY-MM-DD"))
			
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
			
			
			//모든 일정의 배경색을 reg(58, 135, 173)으로 설정
			$('.fc-event-container').children().css('background-color', 'rgb(58, 135, 173)');
			
			//클릭된 일정의 배경색을 red로 설정
			$(this).css('background-color', 'red');
			
			
			
			var content3 = "";
			content3 += "<table class='table table-striped'><tr><th>구분</th><th>제목</th><th>일정상세</th></tr>";
			$.ajax({
				url : 'eventclick.ajax',
				type : 'post',
	            data : {
					"schedule_no": calEvent.id,
	            },
				success : function(obj) {
					console.log(obj)
					content3 += '<tr id=tr' +obj.schedule_no+ '><td>**일정(미구현)</td><td>' + obj.work_title;
					content3 += '</td><td><a';
					content3 += ' onclick="detail(' + obj.schedule_no;
					content3 += ",'" + obj.work_title + "','" + obj.work_text +"','" + obj.schedule_start +"','" + obj.schedule_end;
					content3 += "','" + obj.users + "'";
					content3 += ')" >상세보기</a></td></tr>';
					$('#content_detail').css("display", "none");
			        $('#content').html(content3)
				}
			});

			
			

		},
		// 작업자: 이명철  // 최근 수정일: 16-11-21 --------------------- E N D ------------------------
		
		
		
		
		
		
		// 작업자: 이명철  // 최근 수정일: 16-11-21 ---------------------S T A R T------------------------
		// 작업내용: 날짜 드래그 이벤트
		eventDrop : function(calevent) {
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

	      },
		// 작업자: 이명철  // 최근 수정일: 16-11-21 --------------------- E N D ------------------------		
		
	    
	      
	      
	      
	    
		// 작업자: 이명철  // 최근 수정일: 16-11-21 ---------------------S T A R T------------------------
		// 작업내용: 날짜 늘리는 이벤트
		eventResize : function(calevent) {
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
		},
		// 작업자: 이명철  // 최근 수정일: 16-11-21 --------------------- E N D ------------------------	
		
		
		
	    
	    
		// 작업자: 이명철  // 최근 수정일: 16-11-21 ---------------------S T A R T------------------------
		// 작업내용: 커스텀 버튼 함수 ( insert, delete, update .... 등등 )
	    customButtons: {
	        
	    	//일정 삭제 함수
	    	//********************DB연동 작업 전******************
	    	deleteEvent: {
	            click: $('#delete_btn').click(function(){
	            	
	            	var check = confirm('일정을 삭제 하시겠습니까?');
	            	if(check){

	            		var id = $('#detail_id').val();
	            		calendar.fullCalendar('removeEvents', id);
	            		
	            		$.ajax({
							type: 'post',
							url: 'deleteSchedule.ajax',
							data: {"id" : id},
							success : function(data) {
								console.log("삭제성공");
							}
						});
	            		fcontent();
	            		
	            	}

	            })
	        },
	        
	        // 작업자: 이명철  // 최근 수정일: 16-11-21 ---------------------S T A R T------------------------
	        //업데이트 함수
	        updateEvent: {
	            click: $('#updateok_btn').click(function(){
	            	
	            	var check = confirm('일정을 수정 하시겠습니까?');
	            	if(check){
	            		var id = $('#detail_id').val();
	            		var calEvent;
	            		for(var i=0; i<calendar.fullCalendar( 'getEventSources' )[0].events.length; i++){
	            			if(calendar.fullCalendar( 'getEventSources' )[0].events[i].id == id){
	            				calEvent = calendar.fullCalendar( 'getEventSources' )[0].events[i];
	            				calendar.fullCalendar( 'getEventSources' )[0].events[i].title =$('#detail_title').val();
	            				calendar.fullCalendar('updateEvent', calEvent);
	            				var j = i;
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
							//fcontent();
						}
					});
            		
            		
	            	}
	            	
	            })
	        },
	        
	        // 작업자: 이명철  // 최근 수정일: 16-11-21 ---------------------S T A R T------------------------
	        //일정등록 함수
	    	insertEvent: {
	    		click: $('#modal_ok').click(function(){
	    			var eventData;
					var scheduleusers="";
					var count=",";
					var work_type="";
					$("input[name='userchk']:checked").each(function(i){

						scheduleusers += $(this).val()+"/";
					
					});

					var newschedule = {
							"title": $('#modal_title').val(),
							"text": $('#modal_text').val(),
							"start": $('#modal_start').val(),
							"end": $('#modal_end').val(),
							"collabo_no" : $('#collabo_no').val(),
							"scheduleusers": scheduleusers
					}
					
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
									end: data.schedule.schedule_end
							}

							
							
							calendar.fullCalendar('renderEvent', eventData , true);
							console.log('insert 성공')
							fcontent();
							
							
						      $.each(data.alarm, function (i, item) {
	                                console.log(item.count);
	                                count+=item.count+"/";
	                                work_type=item.work_type;
						      
						      });
							
							console.log(data.alarm);
							//var count =","+data.count.join(' / ');
							
							console.log(count);
							
							send(scheduleusers+count+","+work_type);
							
							
						}
					});
				})
	    	}
	    },
	 // 작업자: 이명철  // 최근 수정일: 16-11-21 --------------------- E N D ------------------------
	 // ------------------------------------------------------------------------------------
	 
	    
	    
	    
	 // 캘린더 초기 호출시 뷰단에 뿌려줄 일정데이터
		events: array
	});

}