package com.or.fortune.name_Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("/index.htm")
	public String home() {
		System.out.println("탄다");
		
		return "index";
	}
	
}
