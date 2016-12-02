/*
 작성자 : 이예지
최초 작업일 : 2016/11/23
최종 수정일 : 2016/11/24
*/
package com.fortune.schedule_alarm_DAO;

import java.util.ArrayList;
import java.util.List;

import com.fortune.Table_DTO.Alarm_DTO;
import com.fortune.Table_DTO.Schedule_Alarm_DTO;
import com.fortune.function_DTO.All_Alarm_DTO;
import com.fortune.function_DTO.Select_Alarm_DTO;

public interface IScheduleAlarm {

	
	
	//알림 해줘야 할것을 넣어주기
	public int insertScheduleAlarm(All_Alarm_DTO dto);
	
	public int selectScheduleAlarm(String user_id);
	
}
