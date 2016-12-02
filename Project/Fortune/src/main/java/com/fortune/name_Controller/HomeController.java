package com.fortune.name_Controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fortune.Table_DTO.Dept_DTO;
import com.fortune.Table_DTO.Jobtitle_DTO;
import com.fortune.Table_DTO.Join_DTO;
import com.fortune.Table_DTO.Team_DTO;
import com.fortune.member_DAO.IJoin;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	public SqlSession sqlsession;

	@RequestMapping(value = "/index.htm", method = RequestMethod.GET)
	public String index() {
	
		System.out.println("index 컨트롤러");

		return "index";
	}

	@RequestMapping(value = "/sign.htm")
	public String sign(Model m) {
	
		System.out.println("joinform 보여줌");
		//부서 리스트 보여주는 부분
		ArrayList<Dept_DTO> dto = new ArrayList<Dept_DTO>();
		IJoin dao = sqlsession.getMapper(IJoin.class);
		dto = dao.searchDept();
		m.addAttribute("dept", dto);
		
		//팀 리스트 보여주는 부분
		ArrayList<Team_DTO> tdto = new ArrayList<Team_DTO>();
		IJoin tdao = sqlsession.getMapper(IJoin.class);
		tdto = dao.searchTeam();
		m.addAttribute("team", tdto);
		
		//직함 리스트 보여주는 부분
		ArrayList<Jobtitle_DTO> jdto = new ArrayList<Jobtitle_DTO>();
		IJoin jdao = sqlsession.getMapper(IJoin.class);
		jdto = dao.searchTitle();
		m.addAttribute("position", jdto);
		
		return "sign";
	}
	
	@RequestMapping(value = "/main.htm", method = RequestMethod.GET)
	public String main() {

		
		System.out.println("메뉴 컨트롤러");
		return "home.main";
	}

	@RequestMapping(value = "/alarm.htm", method = RequestMethod.GET)
	public String test() {

		
		System.out.println("alarm jsp 보여주기 컨트롤러");
		return "home.alarm";
	}
	
	@RequestMapping(value = "/send.htm", method = RequestMethod.POST)
	public String send(HttpServletRequest request,Model model) {

		
	
		String[] selector = request.getParameterValues("selector");
	
		
		model.addAttribute("selector",selector);
		
		/*값 넘어오는지 확인*/
	
	/*	for(int i=0;i<selectors.length;i++)
		{System.out.println("selector : "+selectors[i]);}*/
		
		/*세션에 값을 저장*/
	   
	/*	 session.setAttribute("selector", selectors);*/
		
		System.out.println("selector 컨트롤러 끝");
		return "home.alarm";
	}
	
	//아이디 패스워드 찾기 화면이동
	@RequestMapping("/SearchIdPage.htm")
	public String getIdpage(){		
		System.out.println("아이디/패스워드 찾기 view 보냄");
		
		return "searchpage";
	}

}
