package com.fortune.Ajax_Controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.connector.Request;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fortune.Table_DTO.Join_DTO;
import com.fortune.member_DAO.IJoin;
import com.fortune.password_Service.PassWord_Service;

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
	@RequestMapping("/pwdsearch.ajax")
	public @ResponseBody int getpwd(HttpServletRequest request, Model model){
		//System.out.println("컨트롤러 오긴 오냐?ㅅㅂ");
		IJoin dao = sqlsession.getMapper(IJoin.class);
		PassWord_Service passWord_Service = new PassWord_Service();
		Random random = new Random();
		Join_DTO dto = new Join_DTO();
		
		int ranNum = random.nextInt(9000)+1000;
		String ranNum2 = Integer.toString(ranNum);	
		//System.out.println("랜덤 숫자 : " + ranNum);
		
		String search_id = request.getParameter("search_id");
		String pwa = passWord_Service.encode(ranNum2);
		//System.out.println("??????"+pwa);
		dto.setUser_password(pwa);
		dao.searchpwd(pwa,search_id);
	
		return ranNum;
	}
}
