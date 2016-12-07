package com.fortune.exception;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

public class CustomExceptionHandler {
	
	@ExceptionHandler
	public ModelAndView numberFormatExceptionHandler(){
		
		ModelAndView view = new ModelAndView();
		
		return view;
		
	}

}
