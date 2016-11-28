package com.fortune.exception;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;

import org.apache.tiles.impl.CannotRenderException;
import org.apache.tiles.util.TilesIOException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice("com.fortune")
public class CommonExceptionHandler {

	@ExceptionHandler(RuntimeException.class)
	public String handleCommonException() {
		System.out.println("CommonException발생!!!!!!!!!!");
		return "error.CommonException";
	}
	
	@ExceptionHandler(IOException.class)
	public String handleIOException() {
		System.out.println("IOException발생!!!!!!!!!!");
		return "error.IOException";
	}
	
	@ExceptionHandler(NullPointerException.class)
	public String handleNullPointerException() {
		System.out.println("NullPointerException발생!!!!!!!!!!");
		return "error.NullPointerException";
	}
	
	@ExceptionHandler(TilesIOException.class)
	public String handleTilesIOException() {
		System.out.println("TilesIOException발생!!!!!!!!!!");
		return "error.TilesIOException";
	}
	
	@ExceptionHandler(CannotRenderException.class)
	public String handleCannotRenderException() {
		System.out.println("CannotRenderException발생!!!!!!!!!!");
		return "error.CannotRenderException";
	}
	
	@ExceptionHandler(ServletException.class)
	public String handleServletException() {
		System.out.println("ServletException발생!!!!!!!!!!");
		return "error.ServletException";
	}
	
	@ExceptionHandler(SQLException.class)
	public String handleSQLException() {
		System.out.println("SQLException발생!!!!!!!!!!");
		return "error.SQLException";
	}
	
}
