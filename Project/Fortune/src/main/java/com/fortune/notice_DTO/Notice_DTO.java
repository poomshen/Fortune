/*
* @Class : Notice_DTO
* @Date : 2016.11.15
* @Author : 김지율
* @Desc : 공지사항게시판 DTO
*/

package com.fortune.notice_DTO;

import java.sql.Timestamp;

public class Notice_DTO {

	int notice_no; //게시번호
	String user_id; //ID
	String notice_title; //글제목
	String notice_text; //글내용
	int notice_hits; //조회수
	Timestamp notice_date; //작성일
	String notice_file_name; //파일명
	String notice_file_src; //파일경로
	
	public Notice_DTO(){
		
	}

	public Notice_DTO(int notice_no, String user_id, String notice_title, String notice_text, int notice_hits,
			Timestamp notice_date, String notice_file_name, String notice_file_src) {
		this.notice_no = notice_no;
		this.user_id = user_id;
		this.notice_title = notice_title;
		this.notice_text = notice_text;
		this.notice_hits = notice_hits;
		this.notice_date = notice_date;
		this.notice_file_name = notice_file_name;
		this.notice_file_src = notice_file_src;
	}

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_text() {
		return notice_text;
	}

	public void setNotice_text(String notice_text) {
		this.notice_text = notice_text;
	}

	public int getNotice_hits() {
		return notice_hits;
	}

	public void setNotice_hits(int notice_hits) {
		this.notice_hits = notice_hits;
	}

	public Timestamp getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(Timestamp notice_date) {
		this.notice_date = notice_date;
	}

	public String getNotice_file_name() {
		return notice_file_name;
	}

	public void setNotice_file_name(String notice_file_name) {
		this.notice_file_name = notice_file_name;
	}

	public String getNotice_file_src() {
		return notice_file_src;
	}

	public void setNotice_file_src(String notice_file_src) {
		this.notice_file_src = notice_file_src;
	}	
}
