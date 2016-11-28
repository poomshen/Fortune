package com.fortune.fullcalendar_Controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fortune.Table_DTO.Join_DTO;
import com.fortune.Table_DTO.Work_Comment_DTO;
import com.fortune.fullcalendar_DAO.IFullCalendar;

@Controller
public class CommentController {
	
    @Autowired
    private SqlSession sqlSession;
    
    
    
    
    
	/* 작업자 : 이명철  // 최초 작업일 : 11.25 // 최종 작업일 : 11.25
     * 작업 내용 : 일정상세 화면의 select_comment 호출
     * version : v1.0
    */
	@RequestMapping(value="select_comment.ajax", method = RequestMethod.POST)
    public @ResponseBody List<Work_Comment_DTO> select_Comment(@RequestParam(value="schedule_no") String schedule_no) 
    		throws ClassNotFoundException, SQLException{
        System.out.println("위치 : FullCalendarController // 작업자: 이명철 // 내용 : 일정상세 화면의 select_comment 호출");        
        
        IFullCalendar fullcalendarDAO = sqlSession.getMapper(IFullCalendar.class);
        
        List<Work_Comment_DTO> wcdtolist = new ArrayList<Work_Comment_DTO>();
        wcdtolist = fullcalendarDAO.selectComment(schedule_no);
        
        return wcdtolist;
	}
    
    
    
    
    
    
    
    /* 작업자 : 이명철  // 최초 작업일 : 11.26 // 최종 작업일 : 11.26
     * 작업 내용 : 상세보기에 comment insert 함수
     * 추가 내용 : 
     * version : v1.0
    */
	@RequestMapping(value="insert_comment.ajax", method = RequestMethod.POST)
	public @ResponseBody Work_Comment_DTO schedule(@RequestParam(value="schedule_no") int schedule_no, 
		   @RequestParam(value="work_comment_text") String work_comment_text, HttpSession session) 
		   throws ClassNotFoundException, SQLException {
		System.out.println("위치 : FullCalendarController // 내용 : DB에서 일정 가져옴 // 작업자: 이명철");
        
		Join_DTO jdto = (Join_DTO) session.getAttribute("info");
		
		Work_Comment_DTO wcdto = new Work_Comment_DTO();
		wcdto.setUser_id(jdto.getUser_id());
		wcdto.setSchedule_no(schedule_no);
		wcdto.setWork_comment_text(work_comment_text);
		
	    IFullCalendar fullcalendarDAO = sqlSession.getMapper(IFullCalendar.class);
	    
	    fullcalendarDAO.insertComment(wcdto);
	    wcdto = fullcalendarDAO.selectComment1();

		return wcdto;
	}
	
    
    
}
