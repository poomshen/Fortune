/*작성자 : 이예지
작업내용: 알림 선택시 담는 DTO*/
package com.fortune.function_DTO;

import java.util.ArrayList;

public class Select_Alarm_DTO {

	//아이디의 갯수를 여러개 선택햇을때의 alarm dto
	
	public int work_type;
	public int count;
		
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getWork_type() {
		return work_type;
	}
	public void setWork_type(int work_type) {
		this.work_type = work_type;
	}
	
	
}
