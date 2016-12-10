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
* @description : 히스토리를 남기기 위해 ajax 이 사용되기 위한 컨틀롤러
*/
@Controller
public class HistoryController {
	
	@Autowired
	private SqlSession SqlSession;
 	
	//전체
	@RequestMapping("historyAllList.htm")
	public String historyList(Model model){
		IHistory  history = SqlSession.getMapper(IHistory.class);
		//첫 페이지는 1
		ArrayList<HistoryFunction_DTO> list =  history.historyAllList(0);
		
		model.addAttribute("list", list );
		return "history.historyList2";
	}
	
	//협업
	@RequestMapping("historyList.htm")
	public String historyList(Model model , String collabo_req_no){
		IHistory  history = SqlSession.getMapper(IHistory.class);
		ArrayList<HistoryFunction_DTO> list =  history.historyList(collabo_req_no,0);
		model.addAttribute("progectName",history.progectName(collabo_req_no));
		 model.addAttribute("req_no", collabo_req_no);
		 model.addAttribute("list", list );
		return "history.historyList3";
	}
	
	//전체
	@RequestMapping("historyAllList.ajax")
	public String historyAllpage(Model model,String page){
		IHistory  history = SqlSession.getMapper(IHistory.class);
		ArrayList<HistoryFunction_DTO> list =  history.historyAllList(Integer.parseInt(page));
		
		model.addAttribute("list", list );
		
		return "/WEB-INF/views/history/historyList.jsp";
	}
	
	//협업별 히스토리
	@RequestMapping("historyAllList2.ajax")
	public String historyAllpage2(Model model, String collabo_req_no,String page){
		IHistory  history = SqlSession.getMapper(IHistory.class);
		ArrayList<HistoryFunction_DTO> list =  history.historyList(collabo_req_no,Integer.parseInt(page));
		
		model.addAttribute("list", list );
		
		return "/WEB-INF/views/history/historyList.jsp";
	}
}
