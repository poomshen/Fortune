package com.fortune.fullcalendar_Controller;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;

import com.fortune.Table_DTO.Schedule_DTO;
import com.fortune.fullcalendar_DAO.IFullCalendar;
import com.fortune.function_DTO.Schedule_Work_DTO;

@Controller
public class FullCalendarController {
	
    @Autowired
    private SqlSession sqlSession;
    
	private View jsonview;
	
    /* 작업자 : 이명철  // 최초 작업일 : 11.16 // 최종 작업일 : 11.18
     * 작업 내용 : fullcalendar에서 select 호출 : 일반일정 추가
     * 추가 내용 : DB와 데이터 연동 ( schedule, work 테이블) // ********* work_users 테이블은 아직 미구현상태 **********
     * version : v1.1
    */
	@RequestMapping(value="select.ajax", method = RequestMethod.POST)
    public @ResponseBody Schedule_Work_DTO ajax(@RequestParam(value="scheduleusers[]") List<String> users,
            @RequestParam(value="title") String title, @RequestParam(value="start") String start,
            @RequestParam(value="end") String end, @RequestParam(value="text") String text)
            throws ClassNotFoundException, SQLException{
        System.out.println("위치 : FullCalendarController // 작업자: 이명철 // 내용 : 캘린더 select함수 호출: 일정 insert작업");        
        
        IFullCalendar fullcalendarDAO = sqlSession.getMapper(IFullCalendar.class);
        
		Schedule_Work_DTO swdto = new Schedule_Work_DTO();
		Schedule_DTO sdto = fullcalendarDAO.selectScheduleno();
		
		swdto.setSchedule_no(sdto.getSchedule_no());
        swdto.setSchedule_start(start);
        swdto.setSchedule_end(end);
        swdto.setWork_title(title);
        swdto.setWork_text(text);
        
        int i = fullcalendarDAO.insertSchedule(swdto);
        i += fullcalendarDAO.insertWork(swdto);
        
        //users 정보값만 넘어오고 DB작업은 안함
        //System.out.println(users.get(0) + "/" + users.get(1));
	
        return swdto;
	}
	
	
	
	
    /* 작업자 : 이명철  // 최초 작업일 : 11.18 // 최종 작업일 : 11.19
     * 작업 내용 : 최초 fullcalendar 로드될 때 => DB저장된 일정 불러오기
     * 추가 내용 : 
     * version : v1.0
    */
	@RequestMapping(value="calendarload.ajax", method = RequestMethod.POST)
	public @ResponseBody List<Schedule_Work_DTO> schedule() throws ClassNotFoundException, SQLException {
		System.out.println("위치 : FullCalendarController // 내용 : DB에서 일정 가져옴 // 작업자: 이명철");
        
	    IFullCalendar fullcalendarDAO = sqlSession.getMapper(IFullCalendar.class);
		
        Schedule_Work_DTO swdto = new Schedule_Work_DTO();
        
        List<Schedule_Work_DTO> schedulelist = fullcalendarDAO.selectSWList();
		
		return schedulelist;
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
	

}
