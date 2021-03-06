package com.fortune.fullcalendar_Controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fortune.Table_DTO.Join_DTO;
import com.fortune.Table_DTO.Work_Comment_DTO;
import com.fortune.alarm_DAO.IAlarm;
import com.fortune.fullcalendar_DAO.IFullCalendar;
import com.fortune.function_DTO.All_Alarm_DTO;
import com.fortune.function_DTO.Schedule_AlarmList_DTO;
import com.fortune.function_DTO.Select_Alarm_DTO;
import com.fortune.function_DTO.Team_Users_DTO;
import com.fortune.schedule_alarm_DAO.IScheduleAlarm;

@Controller
public class CommentController {
	
    @Autowired
    private SqlSession sqlSession;
    
    
    
    
    
	/* 작업자 : 이명철  // 최초 작업일 : 11.25 // 최종 작업일 : 11.25
     * 작업 내용 : 일정상세 화면의 select_comment 호출
     * 추가 내용 : 알림 삭제해주기 
     * version : v1.0
    */
	@RequestMapping(value="select_comment.ajax", method = RequestMethod.POST)
    public @ResponseBody List<Work_Comment_DTO> select_Comment(@RequestParam(value="schedule_no") int schedule_no,HttpSession session) 
    		throws ClassNotFoundException, SQLException{
        System.out.println("위치 : CommentController // 작업자: 이명철 // 내용 : comment목록 select");        
        
        IFullCalendar fullcalendarDAO = sqlSession.getMapper(IFullCalendar.class);
        
        
        
        List<Work_Comment_DTO> wcdtolist = new ArrayList<Work_Comment_DTO>();
        wcdtolist = fullcalendarDAO.selectComment(schedule_no);

        Join_DTO dto = (Join_DTO)session.getAttribute("info");
        
        List<Team_Users_DTO> tudto = fullcalendarDAO.selectTeam_id(dto.getUser_id());
        
        
        for(int i = 0; i<tudto.size(); i++){
        	for(int j =0; j<wcdtolist.size(); j++){
        		if( tudto.get(i).getUser_name().equals(wcdtolist.get(j).getUser_id()) ){
        			wcdtolist.get(j).setColor(i);
        		}
        		
        	}
        }
        
        
        //알림 삭제하기
				
	
		IScheduleAlarm sche_alarm_DAO = sqlSession.getMapper(IScheduleAlarm.class);
		
		int result=sche_alarm_DAO.deleteScheAlarm(dto.getUser_id(),schedule_no);

		IAlarm alarm_DAO = sqlSession.getMapper(IAlarm.class);
		
		List<Select_Alarm_DTO> alist = new ArrayList<Select_Alarm_DTO>();
		
		alist = alarm_DAO.checkAlarmAll(dto.getUser_id());
		
		All_Alarm_DTO tatalCount = alarm_DAO.totalCount(dto.getUser_id());
		
	
		
		session.setAttribute("alarm", alist);
		
		session.setAttribute("totalCount",tatalCount.getTotal_count());
        
		//추가 작업
		List<Schedule_AlarmList_DTO> sch_alist=new ArrayList<Schedule_AlarmList_DTO>();
		sch_alist  = alarm_DAO.checkScheduleAlarm(dto.getUser_id());
		session.setAttribute("sch_alist", sch_alist);
        
        
        return wcdtolist;
	}
    
    /*   	
		작업자 : 이예지
		최초 작업일 : 2016/12/03
    	작업내용 : 회의 선택시 new alarm삭제
    */

    
    
    
    /* 작업자 : 이명철  // 최초 작업일 : 11.26 // 최종 작업일 : 11.26
     * 작업 내용 : 상세보기에 comment insert 함수
     * 추가 내용 : 
     * version : v1.0
    */
	@RequestMapping(value="insert_comment.ajax", method = RequestMethod.POST)
	public @ResponseBody List<Work_Comment_DTO> insert_comment(@RequestParam(value="schedule_no") int schedule_no, 
		   @RequestParam(value="work_comment_text") String work_comment_text, HttpSession session) 
		   throws ClassNotFoundException, SQLException {
		System.out.println("위치 : CommentController // 작업자: 이명철 // 내용 : comment목록 insert");
        
		Join_DTO jdto = (Join_DTO) session.getAttribute("info");
		
		Work_Comment_DTO wcdto = new Work_Comment_DTO();
		wcdto.setUser_id(jdto.getUser_id());
		wcdto.setSchedule_no(schedule_no);
		wcdto.setWork_comment_text(work_comment_text);
		
	    IFullCalendar fullcalendarDAO = sqlSession.getMapper(IFullCalendar.class);
	    
	    fullcalendarDAO.insertComment(wcdto);
	    
	    List<Work_Comment_DTO> wcdtolist = new ArrayList<Work_Comment_DTO>();
	    wcdtolist = fullcalendarDAO.selectComment(schedule_no);
	    
	    
        List<Team_Users_DTO> tudto = fullcalendarDAO.selectTeam_id(jdto.getUser_id());
        
        
        for(int i = 0; i<tudto.size(); i++){
        	for(int j =0; j<wcdtolist.size(); j++){
        		if( tudto.get(i).getUser_name().equals(wcdtolist.get(j).getUser_id()) ){
        			wcdtolist.get(j).setColor(i);
        		}
        		
        	}
        }

		return wcdtolist;
	}
	
	
	
	
	/* 작업자 : 이명철  // 최초 작업일 : 11.28 // 최종 작업일 : 11.28
     * 작업 내용 : 일정상세 화면의 delete_comment 호출
     * version : v1.0
    */
	@RequestMapping(value="delete_comment.ajax", method = RequestMethod.POST)
    public @ResponseBody List<Work_Comment_DTO> delete_Comment(@RequestParam(value="work_comment_no") int work_comment_no,
    		@RequestParam(value="schedule_no") int schedule_no, HttpSession session) 
    		throws ClassNotFoundException, SQLException{
        System.out.println("위치 : CommentController // 작업자: 이명철 // 내용 : comment목록 delete");        
        
        IFullCalendar fullcalendarDAO = sqlSession.getMapper(IFullCalendar.class);
        
        fullcalendarDAO.deleteComment(work_comment_no);
        
        List<Work_Comment_DTO> wcdtolist = new ArrayList<Work_Comment_DTO>();
        wcdtolist = fullcalendarDAO.selectComment(schedule_no);
        
        
        Join_DTO dto = (Join_DTO)session.getAttribute("info");
        
        List<Team_Users_DTO> tudto = fullcalendarDAO.selectTeam_id(dto.getUser_id());
        
        
        for(int i = 0; i<tudto.size(); i++){
        	for(int j =0; j<wcdtolist.size(); j++){
        		if( tudto.get(i).getUser_name().equals(wcdtolist.get(j).getUser_id()) ){
        			wcdtolist.get(j).setColor(i);
        		}
        		
        	}
        }
        
        return wcdtolist;
	}
	

	
    
    
}
