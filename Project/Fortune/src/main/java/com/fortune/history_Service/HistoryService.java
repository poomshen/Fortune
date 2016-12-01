package com.fortune.history_Service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fortune.function_DTO.ProgectName_DTO;
import com.fortune.history_DAO.IHistory;

/**
* 
* @Filename Name : HistoryService
* @date:2016. 11. 23. 
* @author: 이성준
* @description : 히스토리를 남기기 위해  사용되기 위한 서비스( 다른 곳에서 히스토리 함수 사용 ) 되면 
*/
@Service
public class HistoryService {
	
	@Autowired
	private SqlSession SqlSession;
	
	
	//초기 헙업 요청된 요청 제목과 요청번호 가져오기
	public ArrayList<ProgectName_DTO> progetctNameList(){
		
		IHistory history = SqlSession.getMapper(IHistory.class);
		ArrayList<ProgectName_DTO> namelist =   history.progectNamelist();
		System.out.println(namelist.get(0).getProject_name());
		System.out.println(namelist.get(1).getProject_name());
		
		return namelist;
	}
	
	public int maxReqNo(){
		
		IHistory history = SqlSession.getMapper(IHistory.class);
		
		return history.maxReqNo();
	}

}
