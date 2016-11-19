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

import com.fortune.fullcalendar_DAO.IFullCalendar;
import com.fortune.function_DTO.Schedule_Work_DTO;

@Controller
public class FullCalendarController {
	
    @Autowired
    private SqlSession sqlSession;
	
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
        //아래 임시로 1로 박음
        swdto.setSchedule_start(start);
        swdto.setSchedule_end(end);
        swdto.setWork_title(title);
        swdto.setWork_text(text);
        
        int i = fullcalendarDAO.insertSchedule(swdto);
        i += fullcalendarDAO.insertWork(swdto);
        
        //users 정보값만 넘어오고 DB작업은 안함
        System.out.println(users.get(0) + "/" + users.get(1));
	
        return swdto;
	}
	

}
