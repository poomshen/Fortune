/*
 작성자 : 이예지
최초 작업일 : 2016/11/23
최종 수정일 : 2016/11/24
*/
package com.fortune.req_alarm_DAO;

import java.util.List;

import com.fortune.Table_DTO.Alarm_DTO;
import com.fortune.Table_DTO.Req_Alarm_DTO;
import com.fortune.function_DTO.All_Alarm_DTO;
import com.fortune.function_DTO.Select_Alarm_DTO;

public interface IReqAlarm {

	//해당 아이디와 업무에 해당하는 알람을 체크 
	public List<Req_Alarm_DTO> selectReqAlarm();	
	
	//알림 확인할시에 해당 알림 지워주기 
	public int deleteReqAlarm(String collabo_req_index);
	
		
}
