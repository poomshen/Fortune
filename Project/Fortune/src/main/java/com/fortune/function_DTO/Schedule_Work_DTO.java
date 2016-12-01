package com.fortune.function_DTO;

public class Schedule_Work_DTO {
	private int schedule_no;
	private String schedule_start;
	private String schedule_end;
	private String work_title;
	private String work_text;
	private String users;
	private int collabo_no;
	private float work_progress;
	
	
	

	public float getWork_progress() {
		return work_progress;
	}
	public void setWork_progress(float work_progress) {
		this.work_progress = work_progress;
	}
	public int getCollabo_no() {
		return collabo_no;
	}
	public void setCollabo_no(int collabo_no) {
		this.collabo_no = collabo_no;
	}
	public String getUsers() {
		return users;
	}
	public void setUsers(String users) {
		this.users = users;
	}
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
	public String getWork_title() {
		return work_title;
	}
	public void setWork_title(String work_title) {
		this.work_title = work_title;
	}
	public String getWork_text() {
		return work_text;
	}
	public void setWork_text(String work_text) {
		this.work_text = work_text;
	}
	
	
	
}
