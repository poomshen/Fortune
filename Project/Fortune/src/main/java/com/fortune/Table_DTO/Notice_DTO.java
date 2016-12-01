/*
* @Class : Notice_DTO
* @Date : 2016.11.15 작성
* 		  2016.11.21 수정_1
* 		  2016.11.30 수정_2
* @Author : 김지율
* @Desc : 공지사항게시판 DTO
* 		  2016.11.21 수정내용은, 파일명 변경을 위해서 컬럼 추가, 파일확장자컬럼 추가, 첨부파일 추가
* 		  2016.11.30 @NotNull 조건 추가
*/

package com.fortune.Table_DTO;

import java.sql.Timestamp;
import java.util.List;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class Notice_DTO {

	//@NotNull
	private int notice_no; //게시번호
	//@NotEmpty(message="userid 필수 입력")
	private String user_id; //ID
	@NotEmpty(message="글제목은 필수 입력사항입니다.")
	private String notice_title; //글제목
	//@NotEmpty(message="내용을 입력해주세요.")
	private String notice_text; //글내용
	//@NotNull
	private int notice_hits; //조회수
	//@NotNull
	private Timestamp notice_date; //작성일
	private String notice_filename_org; //원본파일명
	private String notice_filename_re; //변경파일명
	private String notice_fileext; //파일 확장자
	private MultipartFile file; //첨부파일업로드
	
	@Override
	public String toString() {
		return "Notice_DTO [notice_no=" + notice_no + ", user_id=" + user_id + ", notice_title=" + notice_title
				+ ", notice_text=" + notice_text + ", notice_hits=" + notice_hits + ", notice_date=" + notice_date
				+ ", notice_filename_org=" + notice_filename_org + ", notice_filename_re=" + notice_filename_re
				+ ", notice_fileext=" + notice_fileext + ", file=" + file + "]";
	}

	public Notice_DTO(){
		
	}

	public Notice_DTO(int notice_no, String user_id, String notice_title, String notice_text, int notice_hits,
			Timestamp notice_date, String notice_filename_org, String notice_filename_re, String notice_fileext,
			MultipartFile file) {
		this.notice_no = notice_no;
		this.user_id = user_id;
		this.notice_title = notice_title;
		this.notice_text = notice_text;
		this.notice_hits = notice_hits;
		this.notice_date = notice_date;
		this.notice_filename_org = notice_filename_org;
		this.notice_filename_re = notice_filename_re;
		this.notice_fileext = notice_fileext;
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

	public String getNotice_filename_org() {
		return notice_filename_org;
	}

	public void setNotice_filename_org(String notice_filename_org) {
		this.notice_filename_org = notice_filename_org;
	}

	public String getNotice_filename_re() {
		return notice_filename_re;
	}

	public void setNotice_filename_re(String notice_filename_re) {
		this.notice_filename_re = notice_filename_re;
	}

	public String getNotice_fileext() {
		return notice_fileext;
	}

	public void setNotice_fileext(String notice_fileext) {
		this.notice_fileext = notice_fileext;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
}
