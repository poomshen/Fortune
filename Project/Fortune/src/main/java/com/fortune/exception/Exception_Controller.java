package com.fortune.exception;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Exception_Controller {
	
	@RequestMapping(value="/error400", method=RequestMethod.GET)
	public String handle400(){
		System.out.println("400에러를 만나서!! 컨트롤러를 타서!!");
		return "error.400";
	}
	
	@RequestMapping(value="/error404", method=RequestMethod.GET)
	public String handle404(){
		System.out.println("404에러를 만나서!! 컨트롤러를 타서!!");
		return "error.404";
	}
	
	@RequestMapping(value="/error500", method=RequestMethod.GET)
	public String handle500(){
		System.out.println("500에러를 만나서!! 컨트롤러를 타서!!");
		return "error.500";
	}

}
