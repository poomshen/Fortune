package com.fortune.Ajax_Controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.connector.Request;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fortune.member_DAO.IJoin;

@Controller
public class IdSearchAjax_Controller {

	@Autowired
	public SqlSession sqlsession;
	
	@RequestMapping(value="/idsearch.ajax", method=RequestMethod.GET)
	public @ResponseBody String geId(HttpServletRequest request, Model model){
		System.out.println("id search controller왔음~!~!~!~!~!");
		
		IJoin dao = sqlsession.getMapper(IJoin.class);
		String search_name = request.getParameter("search_name");
		String search_phone = request.getParameter("search_phone");
		String search_birth = request.getParameter("search_birth");
		
		String resultId = dao.searchId(search_name,search_phone,search_birth);
		model.addAttribute("resultId",resultId);
		
		return resultId;
	}
}
