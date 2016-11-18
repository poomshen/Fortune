package com.fortune.fileroom_DAO;

import java.util.List;

import com.fortune.Table_DTO.FileRoom_DTO;

public interface IFileRoom {
	//파일 추가
	public int insertFile(FileRoom_DTO fileroom_DTO);
	//파일 목록
	public List<FileRoom_DTO> listFiles(int page);
	//파일 삭제
	public int deleteFile(FileRoom_DTO fileroom_DTO);
	//파일 개수
	public int countFile();
}
