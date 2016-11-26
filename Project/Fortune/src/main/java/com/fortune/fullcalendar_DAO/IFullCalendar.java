package com.fortune.fullcalendar_DAO;

import java.sql.SQLException;
import java.util.List;

import com.fortune.Table_DTO.Schedule_DTO;
import com.fortune.Table_DTO.Work_Comment_DTO;
import com.fortune.Table_DTO.Work_Users_DTO;
import com.fortune.function_DTO.Schedule_Work_DTO;


public interface IFullCalendar {
	//일정등록(schedule + work + work_users) 등록
	public int insertSchedule(Schedule_Work_DTO swdto) throws ClassNotFoundException, SQLException;
	public int insertWork(Schedule_Work_DTO swdto) throws ClassNotFoundException, SQLException;
	public Schedule_DTO selectScheduleno() throws ClassNotFoundException, SQLException;
	public int insertWork_Users(Work_Users_DTO wudto) throws ClassNotFoundException, SQLException;
	
	//모든 일정내용 호출
	public List<Schedule_Work_DTO> selectSWList(String collabo_no) throws ClassNotFoundException, SQLException;
	public List<Work_Users_DTO> selectWUList(String collabo_no) throws ClassNotFoundException, SQLException;
	
	//일정 삭제
	public int deleteWork(String id) throws ClassNotFoundException, SQLException;
	public int deleteSchedule(String id) throws ClassNotFoundException, SQLException;
	public int deleteWork_Users(String id) throws ClassNotFoundException, SQLException;
    
	//일정 업데이트
	public int updateWork(Schedule_Work_DTO swdto) throws ClassNotFoundException, SQLException;
		
	//일정 드래그(일정 이동, 일정 늘리기) 업데이트 dragupdate
	public int updateSchedule(Schedule_Work_DTO swdto) throws ClassNotFoundException, SQLException;
	
	//클릭한 일정내용 호출
	public Schedule_Work_DTO selectClick(String id) throws ClassNotFoundException, SQLException;
	
	//일정 상세보기의 comment내용 호출
	public List<Work_Comment_DTO> selectComment(String id) throws ClassNotFoundException, SQLException;
	
	
}
