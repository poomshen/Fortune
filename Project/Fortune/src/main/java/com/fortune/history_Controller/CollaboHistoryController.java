package com.fortune.history_Controller;


import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fortune.Table_DTO.With_DTO;
import com.fortune.history_DAO.IHistory;
import com.fortune.request_Service.ProService;

/**
* 
* @Filename Name : CollaboHistoryController.java
* @date:2016. 12. 02. 
* @author: 이성준
* @description :  협업에 관한 히스토리가 관리 되야 되는 컨틀롤러
*/
@Controller
public class CollaboHistoryController {
	
	
	@Autowired
	private SqlSession SqlSession;
	
	@Autowired
	private ProService proservice;
	
	// 완료 수정후 ajax 로 리스트 재호출
	@Transactional
	@RequestMapping("collaboComplet.htm")
	public ModelAndView collaboComplete( String  collabo_no ,
			String pg, String f, String q,HttpSession session){
		
		IHistory history = SqlSession.getMapper(IHistory.class);
		history.collaboComplete("완료", Integer.parseInt(collabo_no));
		ModelAndView mv = new ModelAndView();
		List<With_DTO> list = null;
		try {
		    mv = proservice.listResponse(pg, f, q, session);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mv.setViewName("cen.collaboList");
		
		return mv;
	}
	
/*	@RequestMapping("responseListFrom.htm")
	public String collaboselectList(String pg, String f, String q,HttpSession session ,Model model){
		try {
			System.out.println("성준이 :::"+pg);
			List<With_DTO> list = proservice.listResponse(pg, f, q, session);
			model.addAttribute("list", list); 
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return "cen.responseList_From";
	}*/
}
