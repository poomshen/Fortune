package com.fortune.alarm_DAO;

import java.util.ArrayList;

import com.fortune.Table_DTO.Alarm_DTO;
import com.fortune.function_DTO.Select_Alarm_DTO;

public interface IAlarm {

	//해당 아이디를 넘겨주어 그 아이디와 업무에 해당하는 알람을 체크 
	public Select_Alarm_DTO checkAlarm(Alarm_DTO dto);	
	
	//알림 해줘야 할것을 넣어주기
	public int insertAlarm(Alarm_DTO dto);
	
	//알림 확인할시에 해당 알림 지워주기 
	public int deleteAlarm(Alarm_DTO dto);
}
