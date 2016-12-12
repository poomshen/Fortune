/*작성자 : 이예지
알림에 대한 모든 정보를 담는 DTO*/

package com.fortune.function_DTO;

public class All_Alarm_DTO {
	private int alarm_index;
	private int schedule_no;
	private int collabo_no;
	private int collabo_req_index;
	private int collabo_req_no; 
	private String user_id;
	private int total_count;
	
	
	public int getAlarm_index() {
		return alarm_index;
	}
	public void setAlarm_index(int alarm_index) {
		this.alarm_index = alarm_index;
	}
	public int getSchedule_no() {
		return schedule_no;
	}
	public void setSchedule_no(int schedule_no) {
		this.schedule_no = schedule_no;
	}
	public int getCollabo_no() {
		return collabo_no;
	}
	public void setCollabo_no(int collabo_no) {
		this.collabo_no = collabo_no;
	}
	public int getCollabo_req_index() {
		return collabo_req_index;
	}
	public void setCollabo_req_index(int collabo_req_index) {
		this.collabo_req_index = collabo_req_index;
	}
	public int getCollabo_req_no() {
		return collabo_req_no;
	}
	public void setCollabo_req_no(int collabo_req_no) {
		this.collabo_req_no = collabo_req_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getTotal_count() {
		return total_count;
	}
	public void setTotal_count(int total_count) {
		this.total_count = total_count;
	}
	
	

}
