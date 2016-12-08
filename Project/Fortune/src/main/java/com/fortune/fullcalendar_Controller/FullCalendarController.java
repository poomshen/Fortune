package com.fortune.fullcalendar_Controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;

import com.fortune.Table_DTO.Alarm_DTO;
import com.fortune.Table_DTO.Join_DTO;
import com.fortune.Table_DTO.Meet_Users_DTO;
import com.fortune.Table_DTO.Schedule_Alarm_DTO;
import com.fortune.Table_DTO.Schedule_DTO;
import com.fortune.Table_DTO.Work_Users_DTO;
import com.fortune.alarm_DAO.IAlarm;
import com.fortune.fullcalendar_DAO.IFullCalendar;
import com.fortune.function_DTO.All_Alarm_DTO;
import com.fortune.function_DTO.Schedule_Meeting_DTO;
import com.fortune.function_DTO.Schedule_Work_DTO;
import com.fortune.function_DTO.Schedule_Work_Meeting_DTO;
import com.fortune.function_DTO.Select_Alarm_DTO;
import com.fortune.schedule_alarm_DAO.IScheduleAlarm;



@Controller
public class FullCalendarController {
	
    @Autowired
    private SqlSession sqlSession;
    
	private View jsonview;
	
    /* 작업자 : 이명철  // 최초 작업일 : 11.16 // 최종 작업일 : 11.23
     * 작업 내용 : fullcalendar에서 select 호출 : 일반일정 추가
     * 추가 내용 : DB와 데이터 연동 ( schedule, work 테이블) /alarmDAO 접근하여 count갯수 가져오기(이예지) / work_users Insert 작업
     * 			스케줄알림 DB에 새로운 업무 알림 insert
     * version : v1.1
    */
	@RequestMapping(value="select.ajax", method = RequestMethod.POST)
    public @ResponseBody Map<String,Object> ajax(@RequestParam(value="scheduleusers") String users,
            @RequestParam(value="title") String title, @RequestParam(value="start") String start,
            @RequestParam(value="end") String end, @RequestParam(value="text") String text,
            @RequestParam(value="collabo_no") int collabo_no, @RequestParam(value="meeting_place_no") int meeting_place_no, HttpSession session)
            throws ClassNotFoundException, SQLException{
    	
		Map<String,Object> map = new HashMap();
		IFullCalendar fullcalendarDAO = sqlSession.getMapper(IFullCalendar.class);
		
		//업무 일정등록
		if(meeting_place_no==0){
			
        System.out.println("위치 : FullCalendarController // 작업자: 이명철 // 내용 : 캘린더 select함수 호출: 일반일정 insert작업");        
        
        
		Schedule_Work_DTO swdto = new Schedule_Work_DTO();
		Schedule_DTO sdto = fullcalendarDAO.selectScheduleno();
		
		Alarm_DTO adto = new Alarm_DTO();
		//추가사항 : 일반업무에 알림 DB 넣어놓기		
		//Schedule_Alarm_DTO sch_alarm_dto= new Schedule_Alarm_DTO();
		All_Alarm_DTO all_alarm_dto = new All_Alarm_DTO();
		List<Select_Alarm_DTO> sadto = new ArrayList<Select_Alarm_DTO>();
		IAlarm alarmDAO =  sqlSession.getMapper(IAlarm.class);
		IScheduleAlarm sch_alarmDAO = sqlSession.getMapper(IScheduleAlarm.class);
		////
			
		Work_Users_DTO wudto = new Work_Users_DTO();
		
		swdto.setSchedule_no(sdto.getSchedule_no());
		swdto.setCollabo_no(collabo_no);
        swdto.setSchedule_start(start);
        swdto.setSchedule_end(end);
        swdto.setWork_title(title);
        swdto.setWork_text(text);
        
        int f = fullcalendarDAO.insertSchedule(swdto);
        f += fullcalendarDAO.insertWork(swdto);
        map.put("schedule", swdto);
        
        
        String[] selectId=users.split("/");
       
        for(int i=0;i<selectId.length;i++){
        	adto.setUser_id(selectId[i]);
        	adto.setWork_type("3");
        	//추가사항 스케쥴 알림에 넣기
        	all_alarm_dto.setUser_id(selectId[i]);
        	all_alarm_dto.setSchedule_no(sdto.getSchedule_no());
        	all_alarm_dto.setCollabo_no(collabo_no);
        	////
        	alarmDAO.insertAlarm(adto);
        	sch_alarmDAO.insertScheduleAlarm(all_alarm_dto);
        	
        	sadto.add(alarmDAO.checkAlarm(adto));

           
           wudto.setUser_id(selectId[i]);
           wudto.setSchedule_no(sdto.getSchedule_no());
           
           fullcalendarDAO.insertWork_Users(wudto);
        }
        
        map.put("alarm", sadto);
		
		
		}
		
		//회의일정 등록
		else{
			
			
			System.out.println("위치 : FullCalendarController // 작업자: 이명철 // 내용 : 캘린더 select함수 호출: 회의일정 insert작업");        
	        
			Schedule_Meeting_DTO smdto = new Schedule_Meeting_DTO();
			Schedule_DTO sdto = fullcalendarDAO.selectScheduleno();
			
			//추가)스케줄 회의 알림 DB에 넣기
			All_Alarm_DTO all_alarm_dto = new All_Alarm_DTO();
			IScheduleAlarm sch_alarmDAO = sqlSession.getMapper(IScheduleAlarm.class);
			
			
			Alarm_DTO adto = new Alarm_DTO();
			List<Select_Alarm_DTO> sadto = new ArrayList<Select_Alarm_DTO>();
			IAlarm alarmDAO =  sqlSession.getMapper(IAlarm.class);
			
			Meet_Users_DTO mudto = new Meet_Users_DTO();
			
			
			smdto.setSchedule_no(sdto.getSchedule_no());
			smdto.setCollabo_no(collabo_no);
			smdto.setSchedule_start(start);
			smdto.setSchedule_end(end);
			smdto.setMeeting_title(title);
			smdto.setMeeting_text(text);
			smdto.setMeeting_place_no(meeting_place_no);
	        
	        int f = fullcalendarDAO.insertSchedule2(smdto);
	        f += fullcalendarDAO.insertMeeting(smdto);
	        map.put("schedule", smdto);
	        
	        
	        String[] selectId=users.split("/");
	    
	       
	        for(int i=0;i<selectId.length;i++){
	        	
	        	adto.setUser_id(selectId[i]);
	        	adto.setWork_type("3");
	        	//추가)스케쥴 회의알림 넣기
	        	all_alarm_dto.setUser_id(selectId[i]);
	        	all_alarm_dto.setSchedule_no(sdto.getSchedule_no());
	        	all_alarm_dto.setCollabo_no(collabo_no);
	        	////
	        	alarmDAO.insertAlarm(adto);
	        	sch_alarmDAO.insertScheduleAlarm(all_alarm_dto);
	           sadto.add(alarmDAO.checkAlarm(adto));

	           
	           mudto.setUser_id(selectId[i]);
	           mudto.setSchedule_no(sdto.getSchedule_no());
	           
	           fullcalendarDAO.insertMeet_users(mudto);
	        }
	        
	        map.put("alarm", sadto);
			
		}
        
        return map;
	}
	
	
	
    /* 작업자 : 이명철  // 최초 작업일 : 11.18 // 최종 작업일 : 11.19
     * 작업 내용 : 업무일정 삭제하기
     * 추가 내용 : comment, users 삭제내용 추가
     * version : v1.0
    */
	@RequestMapping(value="deleteSchedule.ajax", method = RequestMethod.POST)
	@ResponseBody
	public int deleteSchedule(String id) throws ClassNotFoundException, SQLException {
		System.out.println("위치 : FullCalendarController // 내용 : 일정 delete작업 // 작업자: 이명철");
        
        IFullCalendar fullcalendarDAO = sqlSession.getMapper(IFullCalendar.class);
        IScheduleAlarm IScheduleAlarm = sqlSession.getMapper(IScheduleAlarm.class);
        
        fullcalendarDAO.deleteWork_Comment(id);
        fullcalendarDAO.deleteWork_Users(id);
        fullcalendarDAO.deleteWork(id);
        IScheduleAlarm.deleteScheAll(id);
        fullcalendarDAO.deleteSchedule(id);
        System.out.println("삭제성공");
		return 1;
	}
	
	
	
	
	
    /* 작업자 : 이명철  // 최초 작업일 : 11.30 // 최종 작업일 : 11.30
     * 작업 내용 : 회의일정 삭제하기
     * 추가 내용 : 
     * version : v1.0
    */
	@RequestMapping(value="deleteMeetingSchedule.ajax", method = RequestMethod.POST)
	@ResponseBody
	public int deleteMeetingSchedule(String id) throws ClassNotFoundException, SQLException {
		System.out.println("위치 : FullCalendarController // 내용 : 회의 일정 delete작업 // 작업자: 이명철");
        
        IFullCalendar fullcalendarDAO = sqlSession.getMapper(IFullCalendar.class);
        IScheduleAlarm IScheduleAlarm = sqlSession.getMapper(IScheduleAlarm.class);
        
        
        fullcalendarDAO.deleteMeet_Users(id);
        fullcalendarDAO.deleteMeeting(id);
        IScheduleAlarm.deleteScheAll(id);
        fullcalendarDAO.deleteSchedule(id);
        System.out.println("삭제성공");
		return 1;
	}
	
	
	
	
    /* 작업자 : 이명철  // 최초 작업일 : 11.21 // 최종 작업일 : 11.21
     * 작업 내용 : 일정 제목, 내용, 참여자 update작업 // 참여자 작업안됨
     * 추가 내용 : 
     * version : v1.0
    */
	@RequestMapping(value="work_update.ajax", method = RequestMethod.POST)
	public @ResponseBody Schedule_Work_DTO update(@RequestParam(value="title") String title, 
			@RequestParam(value="text") String text, @RequestParam(value="schedule_no") int schedule_no, 
			@RequestParam(value="schedule_start") String schedule_start, @RequestParam(value="schedule_end") String schedule_end)  
			throws ClassNotFoundException, SQLException {
		System.out.println("위치 : FullCalendarController // 내용 : (일정 제목, 내용, 참여자) update작업 // 작업자: 이명철");
        
	    IFullCalendar fullcalendarDAO = sqlSession.getMapper(IFullCalendar.class);
		
	    Schedule_Work_DTO swdto = new Schedule_Work_DTO();
	    
	    swdto.setWork_title(title);
	    swdto.setWork_text(text);
	    swdto.setSchedule_no(schedule_no);
	    swdto.setSchedule_start(schedule_start);
	    swdto.setSchedule_end(schedule_end);
	    
	    int i = fullcalendarDAO.updateWork(swdto);
	    
		return swdto;
	}
	
	
	
	
	
    /* 작업자 : 이명철  // 최초 작업일 : 11.30 // 최종 작업일 : 11.30
     * 작업 내용 : 회의 제목, 내용, 참여자 update작업 // 참여자 작업안됨
     * 추가 내용 : 
     * version : v1.0
    */
	@RequestMapping(value="meeting_update.ajax", method = RequestMethod.POST)
	public @ResponseBody Schedule_Meeting_DTO meeting_update(@RequestParam(value="title") String title, 
			@RequestParam(value="text") String text, @RequestParam(value="schedule_no") int schedule_no, 
			@RequestParam(value="schedule_start") String schedule_start, @RequestParam(value="schedule_end") String schedule_end)  
			throws ClassNotFoundException, SQLException {
		System.out.println("위치 : FullCalendarController // 내용 : (회의 일정 제목, 내용, 참여자) update작업 // 작업자: 이명철"); 
        
	    IFullCalendar fullcalendarDAO = sqlSession.getMapper(IFullCalendar.class);
		
	    Schedule_Meeting_DTO smdto = new Schedule_Meeting_DTO();
	    
	    smdto.setMeeting_title(title);
	    smdto.setMeeting_text(text);
	    smdto.setSchedule_no(schedule_no);
	    smdto.setSchedule_start(schedule_start);
	    smdto.setSchedule_end(schedule_end);
	    
	    int i = fullcalendarDAO.updateMeeting(smdto);
	    
		return smdto;
	}
	
	
	
	
	
    /* 작업자 : 이명철  // 최초 작업일 : 11.21 // 최종 작업일 : 11.21
     * 작업 내용 : 드래그 할때 start, end 날짜 업데이트 update작업 // 참여자 작업안됨
     * 추가 내용 : 
     * version : v1.0
    */
	@RequestMapping(value="dragupdate.ajax", method = RequestMethod.POST)
	public @ResponseBody Schedule_Work_DTO dragupdate(@RequestParam(value="schedule_no") int schedule_no, 
			@RequestParam(value="schedule_start") String schedule_start, @RequestParam(value="schedule_end") String schedule_end)  
			throws ClassNotFoundException, SQLException {
		System.out.println("위치 : FullCalendarController // 내용 : 드래그 할 때 update작업 // 작업자: 이명철");
        
	    IFullCalendar fullcalendarDAO = sqlSession.getMapper(IFullCalendar.class);
		
	    Schedule_Work_DTO swdto = new Schedule_Work_DTO();
	    
	    swdto.setSchedule_no(schedule_no);
	    swdto.setSchedule_start(schedule_start);
	    swdto.setSchedule_end(schedule_end);
	    
	    int i = fullcalendarDAO.updateSchedule(swdto);
	    
		return swdto;
	}
	
	
	
	/* 작업자 : 이명철  // 최초 작업일 : 11.21 // 최종 작업일 : 11.21
     * 작업 내용 : fullcalendar에서 eventclick 호출 : 선택한 일정 호출
     * version : v1.0
    */
	@RequestMapping(value="eventclick.ajax", method = RequestMethod.POST)
    public @ResponseBody Schedule_Work_Meeting_DTO eventclick(@RequestParam(value="collabo_no") String collabo_no,
    	   @RequestParam(value="schedule_no") String schedule_no, @RequestParam(value="color_check") String color_check,HttpSession session)
            throws ClassNotFoundException, SQLException{
        System.out.println("위치 : FullCalendarController // 작업자: 이명철 // 내용 : 캘린더 fullcalendar함수 호출: 선택한 일정 호출");        
        IFullCalendar fullcalendarDAO = sqlSession.getMapper(IFullCalendar.class);

        Schedule_Alarm_DTO  sche_alarmDTO =new Schedule_Alarm_DTO();
        
        
        Schedule_Work_Meeting_DTO swmdto = fullcalendarDAO.selectClick(collabo_no,schedule_no);

        String[] user_ids = null;

        //추가사항 : 스케줄 알림 db에서 불러오기
        IScheduleAlarm sche_alarmDAO= sqlSession.getMapper(IScheduleAlarm.class);
	    Join_DTO dto = (Join_DTO)session.getAttribute("info");
	    System.out.println("schedule_no"+schedule_no);
	    Schedule_Work_Meeting_DTO swmdto2= sche_alarmDAO.selectScheduleAlarm_one(dto.getUser_id(),schedule_no);
	
	    
	    
        if(color_check.equals("rgb(51, 122, 183)")||color_check.equals("rgba(51, 122, 183, 0.219608)")){
        	//일반일정
        	user_ids = fullcalendarDAO.selectClick_users(schedule_no);
        }else if(color_check.equals("rgb(71, 142, 72)")){
        	user_ids = fullcalendarDAO.selectClick_users2(schedule_no);

        }
        
        
        String users ="";
        for(int i =0; i<user_ids.length; i++){
        	users += user_ids[i] + "/";
        }
        
        swmdto.setUsers(users);
        
        swmdto.setIsNew(swmdto2.getIsNew());
        
        return swmdto;
	}
	
	
	
	/* 작업자 : 이명철  // 최초 작업일 : 11.29 // 최종 작업일 : 11.29
     * 작업 내용 : progress값 update
     * version : v1.0
    */
	@RequestMapping(value="update_progress.ajax", method = RequestMethod.POST)
    public @ResponseBody int update_progress(@RequestParam(value="schedule_no") String schedule_no,
    		@RequestParam(value="work_progress") float work_progress) throws ClassNotFoundException, SQLException{
        System.out.println("위치 : FullCalendarController // 작업자: 이명철 // 내용 : progress 수치 update ");        
        System.out.println(schedule_no);
        System.out.println(work_progress);
        
        IFullCalendar fullcalendarDAO = sqlSession.getMapper(IFullCalendar.class);
        
        int i = fullcalendarDAO.updateProgress(schedule_no, work_progress);
        		
        return i;
	}
	
	
	
	
	
    /* 작업자 : 이명철  // 최초 작업일 : 11.29 // 최종 작업일 : 11.29
     * 작업 내용 : 최초 fullcalendar 로드될 때, 참가자 id도 가져옴 => DB저장된 일정 불러오기
     * 추가 내용 : 알림 new 띄우기(이예지)
     * version : v2.0
    */
	@RequestMapping(value="calendarload.ajax", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> schedule_work_meeting(@RequestParam(value="collabo_no") String collabo_no,
			@RequestParam(value="year") String year, @RequestParam(value="month") String month,
			HttpSession session) throws ClassNotFoundException, SQLException {
		System.out.println("위치 : FullCalendarController // 내용 : DB에서 (일반+회의)일정 가져옴 // 작업자: 이명철");
		String yearmonth = year + "-" + month;
		System.out.println(yearmonth);
        
	    IFullCalendar fullcalendarDAO = sqlSession.getMapper(IFullCalendar.class);
	   
        List<Schedule_Work_Meeting_DTO> schedulelist = fullcalendarDAO.selectSWMList(collabo_no, yearmonth);

        List<Work_Users_DTO> wulist = fullcalendarDAO.selectWUList(collabo_no, yearmonth);
        List<Meet_Users_DTO> mulist = fullcalendarDAO.selectMUList(collabo_no, yearmonth);
        
        //추가사항 : 스케줄 알림 db에서 불러오기
        IScheduleAlarm sche_alarmDAO= sqlSession.getMapper(IScheduleAlarm.class);
	    Join_DTO dto = (Join_DTO)session.getAttribute("info");
	    List<Schedule_Alarm_DTO> new_alarm = sche_alarmDAO.selectScheduleAlarm(dto.getUser_id());
        
        for(Schedule_Work_Meeting_DTO swm : schedulelist){
        	String userid = "";
        	String userid2 = "";
        	
        	for(Work_Users_DTO wu : wulist){

        		if(wu.getSchedule_no() == swm.getSchedule_no()){
        			userid += wu.getUser_id();
        			userid += "/";
        			swm.setUsers(userid);
        		};
        		
        	};
        	
        	for(Meet_Users_DTO mu : mulist){

        		if(mu.getSchedule_no() == swm.getSchedule_no()){
        			userid2 += mu.getUser_id();
        			userid2 += "/";
        			swm.setUsers(userid2);
        		};
        		
        	};
        	
        };
        
        
        
        Map<String,Object> map = new HashMap();
        map.put("schedulelist", schedulelist);
        //추가사항:map에 새로운알림 데이터 넣기
        map.put("new_alarm",new_alarm);
		return map;
	}
	
	
	 /* 작업자 : 이명철  // 최초 작업일 : 12.05 // 최종 작업일 : 12.05
     * 작업 내용 : 최초 fullcalendar 로드될 때, 이번달 외에도 모든 일정을 가져옴
     * version : v1.0
    */
	@RequestMapping(value="calendarload2.ajax", method = RequestMethod.POST)
	public @ResponseBody List<Schedule_Work_Meeting_DTO> schedule_work_meeting(@RequestParam(value="collabo_no") String collabo_no)
			throws ClassNotFoundException, SQLException {
		System.out.println("위치 : FullCalendarController // 내용 : DB에서 (일반+회의)일정 가져옴 -2// 작업자: 이명철");
        
	    IFullCalendar fullcalendarDAO = sqlSession.getMapper(IFullCalendar.class);
	    List<Schedule_Work_Meeting_DTO> swmdto = fullcalendarDAO.selectAllSWMList(collabo_no);
	    
		return swmdto;
	}
	
	
	
	

	
	
	
    /* 작업자 : 이명철  // 최초 작업일 : 12.01 // 최종 작업일 : 12.01
     * 작업 내용 : 예약된 회의장소 정보 select
     * 추가 내용 : 
     * version : v1.0
    */
	@RequestMapping(value="select_place.ajax", method = RequestMethod.POST)
	public @ResponseBody String[] select_place(@RequestParam(value="schedule_start") String schedule_start) throws ClassNotFoundException, SQLException {
		System.out.println("위치 : FullCalendarController // 내용 : 예약된 회의장소 정보 select // 작업자: 이명철");

		IFullCalendar fullcalendarDAO = sqlSession.getMapper(IFullCalendar.class);
	    
		String[] select_place = fullcalendarDAO.select_place(schedule_start);
	    
	    
		return select_place;
	}
	
	
	
	
	/* 작업자 : 이명철  // 최초 작업일 : 12.02 // 최종 작업일 : 12.02
     * 작업 내용 : selectbox change값에 따라 일정테이블 가져옴
     * version : v1.0
    */
	@RequestMapping(value="schedule_type.ajax", method = RequestMethod.POST)
    public @ResponseBody Map<String,Object> schedule_type(@RequestParam(value="collabo_no") String collabo_no, 
    		@RequestParam(value="schedule_type") String schedule_type, @RequestParam(value="year") String year, 
    		@RequestParam(value="month") String month, HttpSession session) throws ClassNotFoundException, SQLException{
        System.out.println("위치 : FullCalendarController // 작업자: 이명철 // 내용 : 일정 table의 selectbox onchang시 해당되는 값 select");
        String yearmonth = year + "-" + month;
        
        IFullCalendar fullcalendarDAO = sqlSession.getMapper(IFullCalendar.class);
        List<Schedule_Work_Meeting_DTO> schedulelist = new ArrayList<Schedule_Work_Meeting_DTO>();
        Map<String,Object> map = new HashMap();
        
        IScheduleAlarm sche_alarmDAO= sqlSession.getMapper(IScheduleAlarm.class);
	    Join_DTO dto = (Join_DTO)session.getAttribute("info");
	    List<Schedule_Alarm_DTO> new_alarm = sche_alarmDAO.selectScheduleAlarm(dto.getUser_id());
        
        //selectbox 전체보기 클릭시
        if(schedule_type.equals("0")){
        	System.out.println("스케줄 타입 : 0");
        	schedulelist = fullcalendarDAO.selectSWMList(collabo_no, yearmonth);
        	List<Work_Users_DTO> wulist = fullcalendarDAO.selectWUList(collabo_no, yearmonth);
        	List<Meet_Users_DTO> mulist = fullcalendarDAO.selectMUList(collabo_no, yearmonth);
        	
            for(Schedule_Work_Meeting_DTO swm : schedulelist){
            	String userid = "";
                String userid2 ="";
            	
                	for(Work_Users_DTO wu : wulist){

                		if(wu.getSchedule_no() == swm.getSchedule_no()){
                			userid += wu.getUser_id();
                			userid += "/";
                			swm.setUsers(userid);
                		};
                		
                	};
                	
                	for(Meet_Users_DTO mu : mulist){

                		if(mu.getSchedule_no() == swm.getSchedule_no()){
                			userid2 += mu.getUser_id();
                			userid2 += "/";
                			swm.setUsers(userid2);
                		};
                		
                	};
                	
                };
        
        //selectbox 일반일정보기 클릭시
        }else if(schedule_type.equals("1")){
        	System.out.println("스케줄 타입 : 1");
        	schedulelist = fullcalendarDAO.selectSWList(collabo_no, yearmonth);
        	List<Work_Users_DTO> wulist = fullcalendarDAO.selectWUList(collabo_no, yearmonth);
        	
            for(Schedule_Work_Meeting_DTO swm : schedulelist){
            	String userid = "";
                	
	            	for(Work_Users_DTO wu : wulist){
	
	            		if(wu.getSchedule_no() == swm.getSchedule_no()){
	            			userid += wu.getUser_id();
	            			userid += "/";
	            			swm.setUsers(userid);
	            		};
	            		
	            	};
                	
               };
        	
        	
        //selectbox 회의일정보기 클릭시
        }else if(schedule_type.equals("2")){
        	System.out.println("스케줄 타입 : 2");
        	
        	schedulelist = fullcalendarDAO.selectSMList(collabo_no, yearmonth);
        	List<Meet_Users_DTO> mulist = fullcalendarDAO.selectMUList(collabo_no, yearmonth);
        	
            for(Schedule_Work_Meeting_DTO swm : schedulelist){
            	String userid = "";
                	
            	for(Meet_Users_DTO mu : mulist){

            		if(mu.getSchedule_no() == swm.getSchedule_no()){
            			userid += mu.getUser_id();
            			userid += "/";
            			swm.setUsers(userid);
            		};
            		
            	};
                	
            };
        	
        	
        //selectbox 내 일정보기 클릭시
        }else if(schedule_type.equals("3")){
        	System.out.println("스케줄 타입 : 3");
        	Join_DTO jdto = (Join_DTO) session.getAttribute("info");
        	schedulelist = fullcalendarDAO.selectMySWMList(collabo_no, jdto.getUser_id(), yearmonth);
        	List<Work_Users_DTO> wulist = fullcalendarDAO.selectWUList(collabo_no, yearmonth);
        	List<Meet_Users_DTO> mulist = fullcalendarDAO.selectMUList(collabo_no, yearmonth);
        	
            for(Schedule_Work_Meeting_DTO swm : schedulelist){
            	String userid = "";
                String userid2 ="";
            	
                	for(Work_Users_DTO wu : wulist){

                		if(wu.getSchedule_no() == swm.getSchedule_no()){
                			userid += wu.getUser_id();
                			userid += "/";
                			swm.setUsers(userid);
                		};
                		
                	};
                	
                	for(Meet_Users_DTO mu : mulist){

                		if(mu.getSchedule_no() == swm.getSchedule_no()){
                			userid2 += mu.getUser_id();
                			userid2 += "/";
                			swm.setUsers(userid2);
                		};
                		
                	};
                	
                };
        }
        
        map.put("schedulelist", schedulelist);
        map.put("new_alarm",new_alarm);
        
        return map;
	}
	
	
	
	
	

}
