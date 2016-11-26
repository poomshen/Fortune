package com.fortune.history_DAO;

import java.util.ArrayList;

import com.fortune.Table_DTO.History_DTO;
import com.fortune.function_DTO.HistoryFunction_DTO;

public interface IHistory {
	//모든 히스토리 뽑기
	public ArrayList<HistoryFunction_DTO> historyAllList();
	
	//프로젝트의 히스토리 뽑기
	public ArrayList<HistoryFunction_DTO> historyList(String req_no);
	
	//히스토리 추가 하기
	public void historyinsert(History_DTO history_DTO);
	
	//요청의 파일 리스트 뽑기//사용할지 미지수
	public void filelist();
	
}