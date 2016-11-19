package com.fortune.fullcalendar_Controller;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fortune.fullcalendar_DAO.IFullCalendar;
import com.fortune.function_DTO.Schedule_Work_DTO;

@Controller
public class FCMainController {
	
	@Autowired
	public SqlSession sqlsession;
	
	@RequestMapping(value= "/schedule.htm", method = RequestMethod.GET)
	public String schedule(ModelMap map) throws ClassNotFoundException, SQLException {
		System.out.println("위치 : FCMainController // 내용 : 캘린더 화면으로 넘어감 + DB에서 일정 가져옴 // 작업자: 이명철");
		
        
        Schedule_Work_DTO swdto = new Schedule_Work_DTO();
        IFullCalendar fullcalendarDAO = sqlsession.getMapper(IFullCalendar.class);
        
        List<Schedule_Work_DTO> schedulelist = fullcalendarDAO.selectSWList();
        map.addAttribute("sclist", schedulelist);
		
		return "schedule/schedule";
	}
	
	
	
	
    /* 작업자 : 이명철  // 최초 작업일 : 11.18 // 최종 작업일 : 11.18
     * 작업 내용 : 최초 fullcalendar 로드될 때 => DB저장된 일정 불러오기
     * 추가 내용 : 
     * version : v1.0
    */
}
