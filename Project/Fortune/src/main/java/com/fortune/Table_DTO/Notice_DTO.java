/*
* @Class : Notice_DTO
* @Date : 2016.11.15
* @Author : 김지율
* @Desc : 공지사항게시판 DTO
*/

package com.fortune.Table_DTO;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class Notice_DTO {

	private int notice_no; //게시번호
	private String user_id; //ID
	private String notice_title; //글제목
	private String notice_text; //글내용
	private int notice_hits; //조회수
	private Timestamp notice_date; //작성일
	private String notice_filename; //파일명
	
	//파일 업로드 신규 추가///////////////////////////////
	private MultipartFile file;
	
	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
	////////////////////////////////////////////////

	public Notice_DTO(){
		
	}

	public Notice_DTO(int notice_no, String user_id, String notice_title, String notice_text, int notice_hits,
			Timestamp notice_date, String notice_filename, MultipartFile file) {
		this.notice_no = notice_no;
		this.user_id = user_id;
		this.notice_title = notice_title;
		this.notice_text = notice_text;
		this.notice_hits = notice_hits;
		this.notice_date = notice_date;
		this.notice_filename = notice_filename;
		this.file = file;
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

	public String getNotice_filename() {
		return notice_filename;
	}

	public void setNotice_filename(String notice_filename) {
		this.notice_filename = notice_filename;
	}	
}
