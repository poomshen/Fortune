package com.fortune.Table_DTO;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class FileRoom_DTO {
	private int file_room_no;			//자료실 번호
	private int collabo_req_index;		//협업 구분자
	private int collabo_req_no;			//요청 번호
	private String user_id;				//올린이
	private Date file_room_date;		//올린 날짜
	private String file_room_name;		//파일명
	private String file_room_rename;	//새파일명
	private String file_room_ext;		//확장자명 
	private String file_room_cutname;	//파일명 자르기
	
	///////////////////////////////////////////////
	private MultipartFile file;			//파일 업로드
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	///////////////////////////////////////////////
	public String getFile_room_cutname() {
		return file_room_cutname;
	}
	public void setFile_room_cutname(String file_room_cutname) {
		this.file_room_cutname = file_room_cutname;
	}
	public String getFile_room_rename() {
		return file_room_rename;
	}
	public void setFile_room_rename(String file_room_rename) {
		this.file_room_rename = file_room_rename;
	}
	public int getFile_room_no() {
		return file_room_no;
	}
	public void setFile_room_no(int file_room_no) {
		this.file_room_no = file_room_no;
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
	public Date getFile_room_date() {
		return file_room_date;
	}
	public void setFile_room_date(Date file_room_date) {
		this.file_room_date = file_room_date;
	}
	public String getFile_room_name() {
		return file_room_name;
	}
	public void setFile_room_name(String file_room_name) {
		this.file_room_name = file_room_name;
	}
	public String getFile_room_ext() {
		return file_room_ext;
	}
	public void setFile_room_ext(String file_room_ext) {
		this.file_room_ext = file_room_ext;
	}
	@Override
	public String toString() {
		return "FileRoom_DTO [file_room_no=" + file_room_no + ", collabo_req_index=" + collabo_req_index
				+ ", collabo_req_no=" + collabo_req_no + ", user_id=" + user_id + ", file_room_date=" + file_room_date
				+ ", file_room_name=" + file_room_name + ", file_room_ext=" + file_room_ext + "]";
	}
}
