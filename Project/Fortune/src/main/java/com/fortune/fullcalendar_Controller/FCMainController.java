package com.fortune.fullcalendar_Controller;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fortune.fullcalendar_DAO.IFullCalendar;
import com.fortune.function_DTO.Schedule_Work_DTO;

@Controller
public class FCMainController {
	
	@Autowired
	public SqlSession sqlsession;
	
	
    /* 작업자 : 이명철  // 최초 작업일 : 11.19 // 최종 작업일 : 11.19
     * 작업 내용 : Controller 패키지 위치 변경
     * version : v1.0
    */
	@RequestMapping(value= "/schedule.htm", method = RequestMethod.GET)
	public String schedule(Model model,@RequestParam(value="collabo_no") int collabo_no) throws ClassNotFoundException, SQLException {
		System.out.println("위치 : FCMainController // 내용 : 캘린더 화면으로 넘어가는 부분 // 작업자: 이명철");
		
		model.addAttribute("collabo_no", collabo_no);
		
		return "schedule.schedule";
	}
	
	
	
	

}
