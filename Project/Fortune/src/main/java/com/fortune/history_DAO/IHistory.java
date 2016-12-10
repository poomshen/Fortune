package com.fortune.history_DAO;

import java.util.ArrayList;

import com.fortune.Table_DTO.History_DTO;
import com.fortune.function_DTO.HistoryFunction_DTO;
import com.fortune.function_DTO.ProgectName_DTO;

public interface IHistory {
	//모든 히스토리 뽑기
	//public ArrayList<HistoryFunction_DTO> historyAllList();
	
	//모든 히스토리 뽑기 -16-12-02 페이지 처리
	public ArrayList<HistoryFunction_DTO> historyAllList(int page);
	
	//프로젝트의 히스토리 뽑기
	public ArrayList<HistoryFunction_DTO> historyList(String collabo_req_no, int page);
	
	//히스토리 추가 하기
	public void historyinsert(History_DTO history_DTO);
	
	//요청의 파일 리스트 뽑기//사용할지 미지수
	public void filelist();
	
	//초기 헙업 이름 가져오기
	public ArrayList<ProgectName_DTO>  progectNamelist();
	
	//헙업 요청 최대 값 가져 오기
	public int maxReqNo();
	
	//협업  테이블 수정 되는 값  16/12/02
	public void collaboComplete(String  change , int  collabo_no);
	
	//협업 제목 가져오는 DAO
	public String progectName(String collabo_req_no);
}
