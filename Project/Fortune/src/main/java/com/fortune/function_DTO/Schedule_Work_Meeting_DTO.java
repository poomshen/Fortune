package com.fortune.function_DTO;

public class Schedule_Work_Meeting_DTO {
	
	private int schedule_no;
	private String schedule_start;
	private String schedule_end;
	private String wm_title;
	private String wm_text;
	private String users;
	private int collabo_no;
	private String progress_or_place;
	//추가내용 : 알림이 있는지 체크
	private int isNew;
	
	
	
	public int getSchedule_no() {
		return schedule_no;
	}
	public void setSchedule_no(int schedule_no) {
		this.schedule_no = schedule_no;
	}
	public String getSchedule_start() {
		return schedule_start;
	}
	public void setSchedule_start(String schedule_start) {
		this.schedule_start = schedule_start;
	}
	public String getSchedule_end() {
		return schedule_end;
	}
	public void setSchedule_end(String schedule_end) {
		this.schedule_end = schedule_end;
	}
	public String getWm_title() {
		return wm_title;
	}
	public void setWm_title(String wm_title) {
		this.wm_title = wm_title;
	}
	public String getWm_text() {
		return wm_text;
	}
	public void setWm_text(String wm_text) {
		this.wm_text = wm_text;
	}
	public String getUsers() {
		return users;
	}
	public void setUsers(String users) {
		this.users = users;
	}
	public int getCollabo_no() {
		return collabo_no;
	}
	public void setCollabo_no(int collabo_no) {
		this.collabo_no = collabo_no;
	}
	public String getProgress_or_place() {
		return progress_or_place;
	}
	public void setProgress_or_place(String progress_or_place) {
		this.progress_or_place = progress_or_place;
	}
	public int getIsNew() {
		return isNew;
	}
	public void setIsNew(int isNew) {
		this.isNew = isNew;
	}

}
