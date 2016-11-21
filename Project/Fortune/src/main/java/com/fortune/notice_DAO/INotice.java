/*
* @Class : NoticeAction
* @Date : 2016.11.15
* @Author : 김지율
* @Desc : 공지사항게시판 인터페이스
*/

package com.fortune.notice_DAO;

import java.sql.SQLException;
import java.util.List;

import com.fortune.Table_DTO.Notice_DTO;

public interface INotice {
	
	//게시물 개수
	public int getCountNotice(String field, String query) throws ClassNotFoundException, SQLException;
	//전체 게시물
	public List<Notice_DTO> listNotice(int page, String field, String query) throws ClassNotFoundException, SQLException;
	//게시물 삭제
	public int deleteNotice(String notice_no) throws ClassNotFoundException, SQLException;
	//게시물 수정
	public int updateNotice(Notice_DTO ndto) throws ClassNotFoundException, SQLException;
	//게시물 상세
	public Notice_DTO detailNotice(String notice_no) throws ClassNotFoundException, SQLException;
	//게시물 입력
	public int insertNotice(Notice_DTO ndto) throws ClassNotFoundException, SQLException;
	//공지사항 파일다운로드
	public Notice_DTO fileDownloadNotice(String notice_no) throws ClassNotFoundException, SQLException;
	
	
	/*	//조회수
	public void upHit(String notice_no) throws ClassNotFoundException, SQLException;*/

}
