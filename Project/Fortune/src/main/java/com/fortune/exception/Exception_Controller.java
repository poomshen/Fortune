package com.fortune.exception;

import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/404.htm")
public class Exception_Controller {
	
	public String handle404(){
		/*return "redirect:/";*/
		System.out.println("404에러를 만나서!! 컨트롤러를 타서!!");
		return "index.htm";
	}

}
