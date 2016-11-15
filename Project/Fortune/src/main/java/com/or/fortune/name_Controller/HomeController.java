package com.or.fortune.name_Controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	

	@RequestMapping(value = "/index.htm", method = RequestMethod.GET)
	public String index() {

		
		System.out.println("�떆�옉�럹�씠吏� 而⑦듃濡ㅻ윭 ��湲�");
		return "index";
	}

	@RequestMapping(value = "/sign.htm", method = RequestMethod.POST)
	public String sign() {

		
		System.out.println("�떆�옉�럹�씠吏� 而⑦듃濡ㅻ윭 ��湲�");
		return "sign";
	}

}
