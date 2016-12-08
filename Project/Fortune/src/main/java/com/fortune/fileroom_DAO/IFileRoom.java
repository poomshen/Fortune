/*
작성자 : 김중완
최초 작업일 : 2016/11/14
최종 수정일 : 2016/11/20
*/
package com.fortune.fileroom_DAO;

import java.util.List;

import com.fortune.Table_DTO.FileRoom_DTO;

public interface IFileRoom {
	//파일 업로드
	public int insertFile(FileRoom_DTO fileroom_DTO);
	//파일 이름 중복 확인
	public int selectOverlapNameFile(String file_room_name, int collabo_no);
	//파일 실제 이름 확인
	public String selectNameFile(FileRoom_DTO fileroom_DTO);
	//파일 리스트
	public List<FileRoom_DTO> listFiles(int page, int collabo_no);
	//파일 삭제
	public int deleteFile(FileRoom_DTO fileroom_DTO);
	//파일 전체 개수
	public int countFile(int collabo_no);
	//파일 이름 검색
	public List<FileRoom_DTO> searchNameListFiles(String searchvalue, int page, int collabo_no);
	//파일 이름 검색 개수
	public int countSearchNameFile(String searchvalue, int collabo_no);
	//파일 날짜 검색
	public List<FileRoom_DTO> searchDateListFiles(String searchvalue, int page, int collabo_no);
	//파일 날짜 검색 개수
	public int countSearchDateFile(String searchvalue, int collabo_no);
}
