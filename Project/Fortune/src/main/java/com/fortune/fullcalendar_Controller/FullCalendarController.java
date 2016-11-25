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
import com.fortune.Table_DTO.Schedule_DTO;
import com.fortune.Table_DTO.Work_Users_DTO;
import com.fortune.alarm_DAO.IAlarm;
import com.fortune.fullcalendar_DAO.IFullCalendar;
import com.fortune.function_DTO.Schedule_Work_DTO;
import com.fortune.function_DTO.Select_Alarm_DTO;



@Controller
public class FullCalendarController {
	
    @Autowired
    private SqlSession sqlSession;
    
	private View jsonview;
	
    /* 작업자 : 이명철  // 최초 작업일 : 11.16 // 최종 작업일 : 11.23
     * 작업 내용 : fullcalendar에서 select 호출 : 일반일정 추가
     * 추가 내용 : DB와 데이터 연동 ( schedule, work 테이블) /alarmDAO 접근하여 count갯수 가져오기(이예지) / work_users Insert 작업
     * version : v1.1
    */
	@RequestMapping(value="select.ajax", method = RequestMethod.POST)
    public @ResponseBody Map<String,Object> ajax(@RequestParam(value="scheduleusers") String users,
            @RequestParam(value="title") String title, @RequestParam(value="start") String start,
            @RequestParam(value="end") String end, @RequestParam(value="text") String text,HttpSession session)
            throws ClassNotFoundException, SQLException{
    	
		//Schedule_Work_DTO
    	
        System.out.println("위치 : FullCalendarController // 작업자: 이명철 // 내용 : 캘린더 select함수 호출: 일정 insert작업");        
        
        IFullCalendar fullcalendarDAO = sqlSession.getMapper(IFullCalendar.class);
        
		Schedule_Work_DTO swdto = new Schedule_Work_DTO();
		Schedule_DTO sdto = fullcalendarDAO.selectScheduleno();
		
		Alarm_DTO adto = new Alarm_DTO();
		List<Select_Alarm_DTO> sadto = new ArrayList<Select_Alarm_DTO>();
		IAlarm alarmDAO =  sqlSession.getMapper(IAlarm.class);
		
		Work_Users_DTO wudto = new Work_Users_DTO();
		
		swdto.setSchedule_no(sdto.getSchedule_no());
        swdto.setSchedule_start(start);
        swdto.setSchedule_end(end);
        swdto.setWork_title(title);
        swdto.setWork_text(text);
        
        Map<String,Object> map = new HashMap();
        
        int f = fullcalendarDAO.insertSchedule(swdto);
        f += fullcalendarDAO.insertWork(swdto);
        map.put("schedule", swdto);
       
        
        
        String[] selectId=users.split("/");
    
       
        for(int i=0;i<selectId.length;i++){
        	adto.setUser_id(selectId[i]);
        	adto.setWork_type("2");
        	alarmDAO.insertAlarm(adto);

           sadto.add(alarmDAO.checkAlarm(adto));

           
           wudto.setUser_id(selectId[i]);
           wudto.setSchedule_no(sdto.getSchedule_no());
           
           fullcalendarDAO.insertWork_Users(wudto);
        }
        
        map.put("alarm", sadto);
        
		
        
        

        
        
        
    
        return map;
	}
	
	
	
	
    /* 작업자 : 이명철  // 최초 작업일 : 11.18 // 최종 작업일 : 11.23
     * 작업 내용 : 최초 fullcalendar 로드될 때 => DB저장된 일정 불러오기
     * 추가 내용 : 최초내용 + 참가자 id도 가져옴
     * version : v1.0
    */
	@RequestMapping(value="calendarload.ajax", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> schedule() throws ClassNotFoundException, SQLException {
		System.out.println("위치 : FullCalendarController // 내용 : DB에서 일정 가져옴 // 작업자: 이명철");
        
	    IFullCalendar fullcalendarDAO = sqlSession.getMapper(IFullCalendar.class);

        List<Schedule_Work_DTO> schedulelist = fullcalendarDAO.selectSWList();

        List<Work_Users_DTO> wulist = fullcalendarDAO.selectWUList();
        
        for(Schedule_Work_DTO sw : schedulelist){
    	String userid = "";
        	
        	for(Work_Users_DTO wu : wulist){

        		if(wu.getSchedule_no() == sw.getSchedule_no()){
        			userid += wu.getUser_id();
        			userid += "/";
        			sw.setUsers(userid);
        		};
        		
        	};
        	
        };
        
        Map<String,Object> map = new HashMap();
        map.put("schedulelist", schedulelist);
        
		return map;
	}
	
	
	
	
    /* 작업자 : 이명철  // 최초 작업일 : 11.18 // 최종 작업일 : 11.19
     * 작업 내용 : 최초 fullcalendar 로드될 때 => DB저장된 일정 불러오기
     * 추가 내용 : 
     * version : v1.0
    */
	@RequestMapping(value="delete.ajax", method = RequestMethod.POST)
	public View delete(String id) throws ClassNotFoundException, SQLException {
		System.out.println("위치 : FullCalendarController // 내용 : 일정 delete작업 // 작업자: 이명철");
        
        IFullCalendar fullcalendarDAO = sqlSession.getMapper(IFullCalendar.class);
        int i = fullcalendarDAO.deleteWork(id);
        int j = fullcalendarDAO.deleteSchedule(id);
        
		return jsonview;
	}
	
	
	
    /* 작업자 : 이명철  // 최초 작업일 : 11.21 // 최종 작업일 : 11.21
     * 작업 내용 : 일정 제목, 내용, 참여자 update작업 // 참여자 작업안됨
     * 추가 내용 : 
     * version : v1.0
    */
	@RequestMapping(value="update.ajax", method = RequestMethod.POST)
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
    public @ResponseBody Schedule_Work_DTO eventclick(@RequestParam(value="schedule_no") String schedule_no)
            throws ClassNotFoundException, SQLException{
        System.out.println("위치 : FullCalendarController // 작업자: 이명철 // 내용 : 캘린더 fullcalendar함수 호출: 선택한 일정 호출");        
        
        IFullCalendar fullcalendarDAO = sqlSession.getMapper(IFullCalendar.class);
        
        Schedule_Work_DTO swdto = fullcalendarDAO.selectClick(schedule_no);
	
        return swdto;
	}

}
