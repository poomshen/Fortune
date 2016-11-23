package com.fortune.function_DTO;

import java.sql.Timestamp;

/**
* 
* @Filename Name : History_DTO 
* @date:2016. 11. 23. 
* @author: 이성준
* @description : 히스토리를 남기기 위해 만든 DTO 
*/
public class HistoryFunction_DTO {
	private int collaboration_NO;
	private int collabo_req_index;
	private int collabo_req_no;
	private Timestamp history_date;
	private String history_title;
	private String history_text;
	private String user_ID;//요청자
	private String collabo_req_ID;
	private String collabo_req_title;
	private String collabo_req_text;
	
	
	public HistoryFunction_DTO() {
		// TODO Auto-generated constructor stub
	}
	
	

	public HistoryFunction_DTO(int collaboration_NO, int collabo_req_index, int collabo_req_no, Timestamp history_date,
			String history_title, String history_text, String user_ID, String collabo_req_ID, String collabo_req_title,
			String collabo_req_text) {
		super();
		this.collaboration_NO = collaboration_NO;
		this.collabo_req_index = collabo_req_index;
		this.collabo_req_no = collabo_req_no;
		this.history_date = history_date;
		this.history_title = history_title;
		this.history_text = history_text;
		this.user_ID = user_ID;
		this.collabo_req_ID = collabo_req_ID;
		this.collabo_req_title = collabo_req_title;
		this.collabo_req_text = collabo_req_text;
	}



	public int getCollaboration_NO() {
		return collaboration_NO;
	}


	public void setCollaboration_NO(int collaboration_NO) {
		this.collaboration_NO = collaboration_NO;
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


	public Timestamp getHistory_date() {
		return history_date;
	}


	public void setHistory_date(Timestamp history_date) {
		this.history_date = history_date;
	}


	public String getHistory_title() {
		return history_title;
	}


	public void setHistory_title(String history_title) {
		this.history_title = history_title;
	}


	public String getHistory_text() {
		return history_text;
	}


	public void setHistory_text(String history_text) {
		this.history_text = history_text;
	}


	public String getUser_ID() {
		return user_ID;
	}


	public void setUser_ID(String user_ID) {
		this.user_ID = user_ID;
	}


	public String getCollabo_req_ID() {
		return collabo_req_ID;
	}


	public void setCollabo_req_ID(String collabo_req_ID) {
		this.collabo_req_ID = collabo_req_ID;
	}


	public String getCollabo_req_title() {
		return collabo_req_title;
	}


	public void setCollabo_req_title(String collabo_req_title) {
		this.collabo_req_title = collabo_req_title;
	}


	public String getCollabo_req_text() {
		return collabo_req_text;
	}


	public void setCollabo_req_text(String collabo_req_text) {
		this.collabo_req_text = collabo_req_text;
	}



	@Override
	public String toString() {
		return "HistoryFunction_DTO [collaboration_NO=" + collaboration_NO + ", collabo_req_index=" + collabo_req_index
				+ ", collabo_req_no=" + collabo_req_no + ", history_date=" + history_date + ", history_title="
				+ history_title + ", history_text=" + history_text + ", user_ID=" + user_ID + ", collabo_req_ID="
				+ collabo_req_ID + ", collabo_req_title=" + collabo_req_title + ", collabo_req_text=" + collabo_req_text
				+ "]";
	}
	
	
	

}
