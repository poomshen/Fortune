package com.fortune.fullcalendar_DAO;

import java.sql.SQLException;
import java.util.List;

import com.fortune.function_DTO.Schedule_Work_DTO;

public interface IFullCalendar {
	//일정등록(schedule + work) 등록
	public int insertSchedule(Schedule_Work_DTO swdto) throws ClassNotFoundException, SQLException;
	public int insertWork(Schedule_Work_DTO swdto) throws ClassNotFoundException, SQLException;
	
	//모든 일정내용 호출
	public List<Schedule_Work_DTO> selectSWList() throws ClassNotFoundException, SQLException;
    
}
