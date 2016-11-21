//캘린더 호출시 필요한 초기 변수 선언
var content = "<table class='table table-striped'><tr><th>구분</th><th>제목</th><th>일정상세</th></tr>";
var array = [];

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
	        //$(this).css('background-color', 'green'); //일정의 스타일을 바꿀 수 있음 ex) border-color, background-color ...
			
			console.log(calEvent);
		},
		// 작업자: 이명철  // 최근 수정일: 16-11-21 --------------------- E N D ------------------------
	    
	    
	    
	    
	    
	    
		// 작업자: 이명철  // 최근 수정일: 16-11-21 ---------------------S T A R T------------------------
		// 작업내용: 커스텀 버튼 함수 ( insert, delete, update .... 등등 )
	    customButtons: {
	        
	    	//일정 삭제 함수
	    	//********************DB연동 작업 전******************
	    	deleteEvent: {
	            click: $('#detail_modal_delete').click(function(){
	            	
	            	var check = confirm('일정을 삭제 하시겠습니까?');
	            	if(check){

	            		var id = $('#detail_modal_id').val()
	            		calendar.fullCalendar('removeEvents', id);
	            		
	            		$('#tr'+id).remove();
	            		
	            		$.ajax({
							type: 'post',
							url: 'delete.ajax',
							data: "id="+id,
							success : function(data) {
								console.log('삭제성공');
							}
						});		
	            		
	            	}

	            })
	        },
	        
	        
	        //업데이트 함수
	        updateEvent: {
	            click: $('#detail_modal_update').click(function(){
	            	
	            	var check = confirm('일정을 수정 하시겠습니까?');
	            	if(check){
	            		
	            		var id = $('#detail_modal_id').val()
	            		console.log(array[0].title)
	            		console.log(array[0])
	            		//array[0].title = '업데이트야'
	            		//$('#calendar').fullCalendar('updateEvent', events);
	            	}
	            	
	            })
	        },
	        
	        //일정등록 함수
	    	insertEvent: {
	    		click: $('#modal_ok').click(function(){
	    			var eventData;
					var scheduleusers = [];
					$("input[name='uesrchk']:checked").each(function(i){
						scheduleusers.push($(this).val());
					});

					var newschedule = {
							"title": $('#modal_title').val(),
							"text": $('#modal_text').val(),
							"start": $('#modal_start').val(),
							"end": $('#modal_end').val(),
							"scheduleusers": scheduleusers
					}
					
					$.ajax({
						type: 'post',
						url: 'select.ajax',
						data: newschedule,
						success : function(data) {
							eventData = {
									id: data.schedule_no,
									title: data.work_title,
									start: data.schedule_start,
									end: data.schedule_end
							}
							var title = data.work_title
							var text = data.work_text
					        content += '<tr id=tr' +data.schedule_no+ '><td>**일정(미구현)</td><td>' + title;
					        content += '</td><td><a href="#" data-toggle="modal" data-target="#myModal2"'; 
					        content += ' onclick="test(' + data.schedule_no;
					        content += ",'" + title + "','" + text +"'";
					        content += ')" >상세보기</a></td></tr>';
					        
					        
					        
					        $('#content').html(content)
							calendar.fullCalendar('renderEvent', eventData , true);
						}
					});						
				})
	    	}
	    },
	 // 작업자: 이명철  // 최근 수정일: 16-11-21 --------------------- E N D ------------------------

	 
	    
	    
	    
	 // 캘린더 초기 호출시 뷰단에 뿌려줄 일정데이터
		events: array
	});

}