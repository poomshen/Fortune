package com.fortune.fullcalendar_DAO;

import java.sql.SQLException;

import com.fortune.function_DTO.Schedule_Work_DTO;

public interface IFullCalendar {
	//일정등록(work) 등록
	public int insertSchedule(Schedule_Work_DTO swdto) throws ClassNotFoundException, SQLException;
	public int insertWork(Schedule_Work_DTO swdto) throws ClassNotFoundException, SQLException;
    
}
