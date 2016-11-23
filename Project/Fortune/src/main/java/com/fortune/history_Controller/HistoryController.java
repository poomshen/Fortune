package com.fortune.history_Controller;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fortune.function_DTO.HistoryFunction_DTO;
import com.fortune.history_DAO.IHistory;

/**
* 
* @Filename Name : HistoryController
* @date:2016. 11. 23. 
* @author: 이성준
* @description : 히스토리를 남기기 위해 ajax 이 사용되기 위한 서비스 
*/
@Controller
public class HistoryController {
	
	@Autowired
	private SqlSession SqlSession;
 	
	@RequestMapping("historyList.htm")
	public String historyList(Model model){
		
		IHistory  history = SqlSession.getMapper(IHistory.class);
		ArrayList<HistoryFunction_DTO> list =  history.historyAllList();
		
		model.addAttribute("list", list );
		return "history.historyList2";
	}
}
