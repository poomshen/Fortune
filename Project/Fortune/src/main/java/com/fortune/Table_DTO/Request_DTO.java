package com.fortune.Table_DTO;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class Request_DTO {

	private String collabo_req_index; //구분자seq
	private String collabo_req_no; //요청 번호 ..
	private String collabo_req_title; //요청 타이틀 title
	private String collabo_req_text; //요청 글 content
	private String user_ID; //요청자 writer
	private Timestamp collabo_req_date; //요청 날짜 regdate
	private String collabo_req_state; //진행 상태 ref
	private String collabo_req_ID; //수신자 ..
	private String collabo_req_filesrc;
	private String dept_name;
	private String user_name;
	
	
	
	
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
	private List<CommonsMultipartFile> files;
		public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
		public String getCollabo_req_filesrc() {
		return collabo_req_filesrc;
	}
	public void setCollabo_req_filesrc(String collabo_req_filesrc) {
		this.collabo_req_filesrc = collabo_req_filesrc;
	}


	//멀티 파일 업로드///////////////////////////////
		
			
		public List<CommonsMultipartFile> getFiles() {
			return files;
		}
		public void setFiles(List<CommonsMultipartFile> files) {
			this.files = files;
		}
	////////////////////////////////////////////////
	
	
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
	public String getUser_ID() {
		return user_ID;
	}
	public void setUser_ID(String user_ID) {
		this.user_ID = user_ID;
	}
	public Timestamp getCollabo_req_date() {
		return collabo_req_date;
	}
	public void setCollabo_req_date(Timestamp collabo_req_date) {
		this.collabo_req_date = collabo_req_date;
	}
	public String getCollabo_req_state() {
		return collabo_req_state;
	}
	public void setCollabo_req_state(String collabo_req_state) {
		this.collabo_req_state = collabo_req_state;
	}
	public String getCollabo_req_ID() {
		return collabo_req_ID;
	}
	public void setCollabo_req_ID(String collabo_req_ID) {
		this.collabo_req_ID = collabo_req_ID;
	}
	@Override
	public String toString() {
		return "Request_DTO [collabo_req_index=" + collabo_req_index + ", collabo_req_no=" + collabo_req_no
				+ ", collabo_req_title=" + collabo_req_title + ", collabo_req_text=" + collabo_req_text + ", user_ID="
				+ user_ID + ", collabo_req_date=" + collabo_req_date + ", collabo_req_state=" + collabo_req_state
				+ ", collabo_req_ID=" + collabo_req_ID + ", collabo_req_filesrc=" + collabo_req_filesrc + ", files="
				+ files + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
