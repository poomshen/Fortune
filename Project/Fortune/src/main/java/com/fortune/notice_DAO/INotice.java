/*
* @Class : INotice
* @Date : 2016.11.15
* @Author : 김지율
* @Desc : 공지사항게시판 인터페이스
*/

package com.fortune.notice_DAO;

import java.util.List;

import com.fortune.Table_DTO.Notice_DTO;

public interface INotice {

	//공지사항 전체 개수
	public int countNotice();
	//전체 게시물
	public List<Notice_DTO> listNotice(int page);
	//게시물 상세
	public Notice_DTO detailNotice(int notice_no);
	//게시물 입력
	public int insertNotice(Notice_DTO ndto);
	//게시물 수정
	public int updateNotice(Notice_DTO ndto);
	//게시물 삭제
	public int deleteNotice(int notice_no);
	//공지사항 파일다운로드
	public Notice_DTO fileDownloadNotice(int notice_no);
	//공지사항 제목검색
	public List<Notice_DTO> searchTitleListNotices(String searchvalue);
	//공지사항 내용검색
	public List<Notice_DTO> searchTextListNotices(String searchvalue);
	//조회수
	public void updateHits(int notice_no);	
	//메인 화면 최신글
	public List<Notice_DTO> mainListNotice();
}
