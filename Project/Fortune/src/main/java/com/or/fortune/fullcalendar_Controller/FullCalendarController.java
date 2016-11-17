package com.or.fortune.fullcalendar_Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.or.fortune.fullcalendar_DTO.schedule_DTO;

@Controller
public class FullCalendarController {
	
	
	@RequestMapping(value="select.ajax", method = RequestMethod.POST)
	public @ResponseBody schedule_DTO ajax(HttpServletRequest request, HttpServletResponse response){
		
		System.out.println("위치 : FullCalendarController // 내용 : 이명철, 캘린더내 ajax");
		
		schedule_DTO dto = new schedule_DTO();
		dto.setCollabo_no(request.getParameter("STtitle"));
		dto.setSchedule_start(request.getParameter("STstart"));
		dto.setSchedule_end(request.getParameter("STend"));
		dto.setSchedule_no(request.getParameter("schedule_no"));
		
		System.out.println(dto.getSchedule_start());
		System.out.println(dto.getSchedule_end());
		
		return dto;
	}
}
