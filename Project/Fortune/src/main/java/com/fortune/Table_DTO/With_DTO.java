package com.fortune.Table_DTO;

import java.sql.Date;


public class With_DTO {

	private String collabo_no; //
	private String collabo_req_index;
	private String collabo_req_no;
	private String user_ID;
	private String collabo_start2;
	private String collabo_end2;
	private Date collabo_start;
	private Date collabo_end;
	private String collabo_state;
	
	
	public String getCollabo_no() {
		return collabo_no;
	}
	public void setCollabo_no(String collabo_no) {
		this.collabo_no = collabo_no;
	}
	public String getCollabo_req_index() {
		return collabo_req_index;
	}
	public void setCollabo_req_index(String collabo_req_index) {
		this.collabo_req_index = collabo_req_index;
	}
	public String getCollabo_req_no() {
		return collabo_req_no;
	}
	public void setCollabo_req_no(String collabo_req_no) {
		this.collabo_req_no = collabo_req_no;
	}
	public String getUser_ID() {
		return user_ID;
	}
	public void setUser_ID(String user_ID) {
		this.user_ID = user_ID;
	}
	public String getCollabo_state() {
		return collabo_state;
	}
	public void setCollabo_state(String collabo_state) {
		this.collabo_state = collabo_state;
	}
	public String getCollabo_start2() {
		return collabo_start2;
	}
	public void setCollabo_start2(String collabo_start2) {
		this.collabo_start2 = collabo_start2;
	}
	public String getCollabo_end2() {
		return collabo_end2;
	}
	public void setCollabo_end2(String collabo_end2) {
		this.collabo_end2 = collabo_end2;
	}
	public Date getCollabo_start() {
		return collabo_start;
	}
	public void setCollabo_start(Date collabo_start) {
		this.collabo_start = collabo_start;
	}
	public Date getCollabo_end() {
		return collabo_end;
	}
	public void setCollabo_end(Date collabo_end) {
		this.collabo_end = collabo_end;
	}
	
	@Override
	public String toString() {
		return "ReDto [collabo_no=" + collabo_no + ", collabo_req_index=" + collabo_req_index + ", collabo_req_no="
				+ collabo_req_no + ", user_ID=" + user_ID + ", collabo_start=" + collabo_start + ", collabo_end="
				+ collabo_end + ", collabo_state=" + collabo_state + "]";
	}
	
	
	
	

	
	
	
	
	
	
}
