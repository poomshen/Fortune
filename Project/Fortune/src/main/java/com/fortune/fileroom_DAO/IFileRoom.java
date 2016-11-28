package com.fortune.fileroom_DAO;

import java.util.List;

import com.fortune.Table_DTO.FileRoom_DTO;

public interface IFileRoom {
	//파일 추가
	public int insertFile(FileRoom_DTO fileroom_DTO);
	//파일 이름 중복 확인
	public int selectOverlapNameFile(String file_room_name);
	//파일 실제 이름
	public String selectNameFile(FileRoom_DTO fileroom_DTO);
	//파일 목록
	public List<FileRoom_DTO> listFiles(int page);
	//파일 삭제
	public int deleteFile(FileRoom_DTO fileroom_DTO);
	//파일 전체 개수
	public int countFile();
	//파일 이름검색
	public List<FileRoom_DTO> searchNameListFiles(String searchvalue, int page);
	//파일 이름 검색 개수
	public int countSearchNameFile(String searchvalue);
	//파일 날짜검색
	public List<FileRoom_DTO> searchDateListFiles(String searchvalue, int page);
	//파일 이름 검색 개수
	public int countSearchDateFile(String searchvalue);
}
