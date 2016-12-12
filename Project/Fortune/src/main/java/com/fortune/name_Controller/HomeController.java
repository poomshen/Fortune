package com.fortune.name_Controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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

import com.fortune.Table_DTO.Chart_Data_DTO;
import com.fortune.Table_DTO.Dept_DTO;
import com.fortune.Table_DTO.Jobtitle_DTO;
import com.fortune.Table_DTO.Join_DTO;
import com.fortune.Table_DTO.Team_DTO;
import com.fortune.chart_DAO.IChart;
import com.fortune.member_DAO.IJoin;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	public static int homeindex = 0;
	@Autowired
	public SqlSession sqlsession;

	@RequestMapping(value = "/index.htm", method = RequestMethod.GET)
	public String index(Model model) {
		
		System.out.println("HomeController/index함수");
		//권한이 ROLE_NOUSER이면 로그인 막기(추가작업 : 김중완)
		if(homeindex == 0){
			model.addAttribute("msg", 0);
		}else{
			homeindex = 0;
			model.addAttribute("msg", 1);
		}
		
		return "index";
	}

	@RequestMapping(value = "/sign.htm")
	public String sign(Model m) {
	
		System.out.println("HomeController/sign함수");
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
	
	
	
	/*
	 작성자 : 이예지
	 최초작업일 : 2016/11/28
	 최종수정일 : 2016/11/30
	 작업내용 : 메인화면에서 chart 나타내기
	 =메인화면에 차트 추가
	 */
	@RequestMapping(value = "/main.htm", method = RequestMethod.GET)
	public String main(Model model) {
		System.out.println("HomeController/main함수");
		
	
		
		return "home.main";
	}

	@RequestMapping(value = "/alarm.htm", method = RequestMethod.GET)
	public String test() {

		
		System.out.println("HomeController/test함수");
		return "home.alarm";
	}
	
	@RequestMapping(value = "/send.htm", method = RequestMethod.POST)
	public String send(HttpServletRequest request,Model model) {

		System.out.println("HomeController/send함수");
		
	
		String[] selector = request.getParameterValues("selector");
	
		
		model.addAttribute("selector",selector);
	
		return "home.alarm";
	}
	
	//아이디 패스워드 찾기 화면이동
	@RequestMapping("/SearchIdPage.htm")
	public String getIdpage(){		

		System.out.println("HomeController/getIdpage함수");
	
		return "searchpage";
	}

}
