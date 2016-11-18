package com.or.fortune.fullcalendar_Controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.or.fortune.fullcalendar_DTO.schedule_DTO;

@Controller
public class FullCalendarController {
	
	
	//@RequestParam(value="checkArray[]") List<string> arrayParams, @RequestParam(value="userId") String userId
	
	
	
	@RequestMapping(value="select.ajax", method = RequestMethod.POST)
	public @ResponseBody schedule_DTO ajax(@RequestParam(value="scheduleusers[]") List<String> users,
			@RequestParam String title, @RequestParam String start, @RequestParam String end){
		
		System.out.println("위치 : FullCalendarController // 내용 : 이명철, 캘린더내 ajax");
		
		schedule_DTO dto = new schedule_DTO();
		//dto.setCollabo_no(start);
		dto.setSchedule_start(start);
		dto.setSchedule_end(end);
		
		
		System.out.println(dto.getSchedule_start());
		System.out.println(dto.getSchedule_end());
		System.out.println(title);
		
		System.out.println(users.get(0));
		System.out.println(users.get(1));
		
		return dto;
	}
}
