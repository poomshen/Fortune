var content = "";
var array = [];


array.push(
		{
		title: 'All Day Event',
		start: '2016-11-01',
		backgroundColor: 'red',
		borderColor: 'blue'
		}
	)



function loadCalendar() {
		
	var calendar = $('#calendar').fullCalendar({
		theme: true,
		defaultDate: '2016-11-03',
		editable: true,
		eventLimit: false, // allow "more" link when too many events
		selectable: true,
		selectHelper: true,

		
		// 작업자: 이명철  // 최근 수정일: 16-11-10 ---------------------S T A R T------------------------
		// 작업내용: 드래그로 일정등록 하는 내용 소스 분석 중
		// 11월 10일: 여러번 일정등록시 일정등록 함수가 여러번 호출됨
		//        -> [$('#calendar').fullCalendar('renderEvent', eventData, true);] 이 속성 때문에 그런거 같음
		//			-> 나중에 DB연동 할땐, 위 속성 말고 events를 DB에서 불러와야 함, 그 때 고려해야될 사안임
		select: function(start, end) {
			var eventData;
			var check = true;
			//모달 띄우는 함수
			var test = $('#modal_btn').click();
			
			$('#modal_ok').click(function(){
				if(check){
					eventData = {
						title: $('#modal_title').val(),
						start: start,
						end: end
					}
				
					$.ajax({
						type: 'post',
						url: 'select.ajax',
						data: 'STtitle='+eventData.title+'&STstart='+eventData.start+'&STend='+eventData.end,
						success : function(data) {
							eventData = {
									title: data.collabo_no,
									start: data.schedule_start,
									end: data.schedule_end
							}
							alert('controller 타고온 데이터 : ' + eventData.title)
							
						}
					});
					
				check=false;
				$('#calendar').fullCalendar('renderEvent', eventData , false);
				}
			});
			
			calendar.fullCalendar('unselect');

		},
			
		// 작업자: 이명철  // 최근 수정일: 16-11-10 --------------------- E N D ------------------------
		
		
		
		
		
		
		// 작업자: 이명철  // 최근 수정일: 16-11-10 ---------------------S T A R T------------------------
		// 작업내용: 일정 클릭했을 때 이벤트 발생 함수
		// 11월10일: 켈린더 오른쪽에 클릭한 일정의 title값을 찍어줌(테이블형태로)
		eventClick: function(calEvent, jsEvent, view) {
	        //alert('Event: ' + calEvent.title); //일정의 정보 표현 ex) ~.title, ~.start, ~.end 값등 사용가능
	        //alert('View: ' + view.name); //달력의 정보 표현 ex) view.name = november 2016, view.title = month
	        //$(this).css('background-color', 'green'); //일정의 스타일을 바꿀 수 있음 ex) border-color, background-color ...
			
	        content += '<table class="table table-hover"><tr><th>제목</th></tr><tr><td>' + calEvent.title + '</td></tr></table>'
	        $('#content').html(content)
	        

	        
	    },
	 // 작업자: 이명철  // 최근 수정일: 16-11-10 --------------------- E N D ------------------------

	 
		events: array	
	});

}
	
	
//}); //jquery 끝