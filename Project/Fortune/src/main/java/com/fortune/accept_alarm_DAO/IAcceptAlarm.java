/*
 작성자 : 이예지
최초 작업일 : 2016/11/23
최종 수정일 : 2016/11/24
*/
package com.fortune.accept_alarm_DAO;

import java.util.ArrayList;
import java.util.List;

import com.fortune.Table_DTO.Accept_Alarm_DTO;
import com.fortune.Table_DTO.Alarm_DTO;
import com.fortune.function_DTO.Select_Alarm_DTO;

public interface IAcceptAlarm {
	
	
	public List<Accept_Alarm_DTO> selectAcceptAlarm(String user_id);
	
	//알림 확인할시에 해당 알림 지워주기 
	public int deleteAcceptAlarm(String collabo_no);
	
}
