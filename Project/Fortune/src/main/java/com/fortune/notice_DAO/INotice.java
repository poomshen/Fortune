/*
* @Class : NoticeAction
* @Date : 2016.11.15
* @Author : 김지율
* @Desc : 공지사항게시판 인터페이스
*/

package com.fortune.notice_DAO;

import java.util.ArrayList;

import com.fortune.notice_DTO.Notice_DTO;


public interface NoticeAction {
	
	//글목록보기
	public ArrayList<Notice_DTO> listNotice();
	
	//글작성하기
	public void writeNotice(String user_id, String notice_title, String notice_text);
	
	//작성글보기
	public Notice_DTO viewNotice(String user_id);
	
	//글삭제하기
	public void deleteNotice(String user_id);

}
