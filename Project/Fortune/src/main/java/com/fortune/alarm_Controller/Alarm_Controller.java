/*
작성자 : 이예지
최초 작업일 : 2016/11/24
최종 수정일  : 2016/12/08

로그인 했을시 뜨는 알림 리스트를 클릭했을때 이용
*/
package com.fortune.alarm_Controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fortune.Table_DTO.Alarm_DTO;
import com.fortune.Table_DTO.Join_DTO;
import com.fortune.alarm_DAO.IAlarm;
import com.fortune.fileroom_DAO.IFileRoom;
import com.fortune.function_DTO.All_Alarm_DTO;
import com.fortune.function_DTO.Schedule_AlarmList_DTO;
import com.fortune.function_DTO.Select_Alarm_DTO;
import com.fortune.schedule_alarm_DAO.IScheduleAlarm;

@Controller
public class Alarm_Controller {
	@Autowired
	private SqlSession sqlsession;
	
	//alarm 리스트를 클릭했을때 실행되는 함수
	@RequestMapping(value="/alarmCheck.htm", method=RequestMethod.GET)
	public String alarmCheck(HttpServletRequest request,HttpSession session){
		
		
		System.out.println("Alarm_Controller/alarmCheck함수");
		
		String work_type=request.getParameter("work_type");
		
		Alarm_DTO alarm_dto = new Alarm_DTO();
		Join_DTO dto = (Join_DTO)session.getAttribute("info");
		
		alarm_dto.setUser_id(dto.getUser_id());
		alarm_dto.setWork_type(work_type);
		
		
		IAlarm alarm_DAO = sqlsession.getMapper(IAlarm.class);
		
		int result=alarm_DAO.deleteAlarm(alarm_dto);
		
		
		List<Select_Alarm_DTO> alist = new ArrayList<Select_Alarm_DTO>();
		
		alist = alarm_DAO.checkAlarmAll(dto.getUser_id());
		
		All_Alarm_DTO tatalCount = alarm_DAO.totalCount(dto.getUser_id());
		
		
		
		session.setAttribute("alarm", alist);
		
		session.setAttribute("totalCount",tatalCount.getTotal_count());
		

		
		return "home.main";
	
	}
	//header에 알림 숫자 변경해주기(로그인 되어있다면)
	//추가사항 : 헤더 스케쥴알림 리스트 변경
	@RequestMapping(value="newAlarm.htm", method = RequestMethod.POST)
    public String newAlarm(@RequestParam(value="newAlarm") String newAlarm,HttpSession session)
            throws ClassNotFoundException, SQLException{
	
		
			System.out.println("Alarm_Controller/newAlarm함수");
			
			List<Select_Alarm_DTO> alist = new ArrayList<Select_Alarm_DTO>();
			Join_DTO dto = (Join_DTO)session.getAttribute("info");
			IAlarm alarm_DAO = sqlsession.getMapper(IAlarm.class);
		
			List<Schedule_AlarmList_DTO> sch_alist=new ArrayList<Schedule_AlarmList_DTO>();
			
			alist = alarm_DAO.checkAlarmAll(dto.getUser_id());
			
			All_Alarm_DTO totalCount = alarm_DAO.totalCount(dto.getUser_id());
			
			sch_alist  = alarm_DAO.checkScheduleAlarm(dto.getUser_id());
			
			
			session.setAttribute("alarm", alist);
			session.setAttribute("totalCount", totalCount.getTotal_count());
			session.setAttribute("sch_alist", sch_alist);
			
	      return "newAlarm";
	      
	}
	//알림 디비에 저장하고 session update해주기
	@RequestMapping(value="updateAlarm.htm", method = RequestMethod.POST)
    public String updateAlarm(@RequestParam(value="selectId") String selectId,
    						  @RequestParam(value="collabo_req_no") int collabo_req_no,
    						  HttpSession session)throws ClassNotFoundException, SQLException{


			System.out.println("Alarm_Controller/updateAlarm함수");
					
			Alarm_DTO alarm_dto = new Alarm_DTO();
		
			IAlarm alarmDAO =  sqlsession.getMapper(IAlarm.class);
			
			alarm_dto.setUser_id(selectId);
			alarm_dto.setWork_type("1");
			
			
			
			
			
			alarmDAO.insertAlarm(alarm_dto);
			
			return "alarm_success";
	      
	}
	
    @RequestMapping(value="select_comment_alarm.htm", method = RequestMethod.POST)
    public String select_Comment_alarm(@RequestParam(value="schedule_no") int schedule_no,HttpSession session) 
    		throws ClassNotFoundException, SQLException{
          
        //알림 삭제하기
        System.out.println("Alarm_Controller/select_Comment_alarm함수");
				
		Join_DTO dto = (Join_DTO)session.getAttribute("info");
	
		IScheduleAlarm sche_alarm_DAO = sqlsession.getMapper(IScheduleAlarm.class);
		
		int result=sche_alarm_DAO.deleteScheAlarm(dto.getUser_id(),schedule_no);
		
		IAlarm alarm_DAO = sqlsession.getMapper(IAlarm.class);
		
		List<Select_Alarm_DTO> alist = new ArrayList<Select_Alarm_DTO>();
		
		alist = alarm_DAO.checkAlarmAll(dto.getUser_id());
		
		All_Alarm_DTO tatalCount = alarm_DAO.totalCount(dto.getUser_id());
		
		session.removeAttribute("alarm");
		session.removeAttribute("totlCount");
		session.removeAttribute("sch_alist");
		
		
		session.setAttribute("alarm", alist);
	
		session.setAttribute("totalCount",tatalCount.getTotal_count());
		
		//추가작업 일정 알림 상세 리스트
		List<Schedule_AlarmList_DTO> sch_alist=new ArrayList<Schedule_AlarmList_DTO>();
		
		sch_alist  = alarm_DAO.checkScheduleAlarm(dto.getUser_id());
	
		session.setAttribute("sch_alist", sch_alist);
		

		
		return "newAlarm";
	}
    

}
