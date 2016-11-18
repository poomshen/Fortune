package com.fortune.name_Controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fortune.Table_DTO.Join_DTO;
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
	
		System.out.println("index 화면 보여줌");
		return "index";
	}

	@RequestMapping(value = "/sign.htm", method = RequestMethod.POST)
	public String sign() {
	
		System.out.println("joinform 보여줌");
		return "sign";
	}
	
	@RequestMapping(value = "/main.htm", method = RequestMethod.POST)
	public String main() {

		
		System.out.println("메뉴 컨트롤러");
		return "home.main";
	}
	
	@RequestMapping(value= "/schedule.htm", method = RequestMethod.GET)
	public String lmc() {
		
		System.out.println("위치 : HomeController // 내용 : 이명철 캘린더 테스트");
		return "schedule/schedule";
	}


}
