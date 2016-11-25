package com.fortune.websocket;

import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;

import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class WebSocketHandler extends TextWebSocketHandler {

	private Map<Object, WebSocketSession> users = new ConcurrentHashMap();
	private Map<String, String> ids = new ConcurrentHashMap();

	@Override
	public void afterConnectionEstablished(
			WebSocketSession session) throws Exception {
		
	      log("접속 성공" + session.getId() + "웹소켓 세션 아이디");
	      String userid = (String) session.getAttributes().get("userId");

	      users.put(userid, session);
	      ids.put(session.getId(), userid);
		

	
		
	}

	@Override
	public void afterConnectionClosed(
			WebSocketSession session, CloseStatus status) throws Exception {
		log((String) session.getAttributes().get("userId"));
	
		users.remove("parammsg");
	}

	@Override
	protected void handleTextMessage(
			WebSocketSession session, TextMessage message) throws Exception {
	     
		
		
	      
		  
		  String[] id_count_type = message.getPayload().split(",");
	      String[] selectedId=id_count_type[0].split("/");
	      String[] selectedCount=id_count_type[1].split("/");
	     
	      

	       
	       
	        for (WebSocketSession s : users.values()) {          
	           for(int i =0; i < selectedId.length; i++){
	        	   System.out.println("--------선택받은사람-----------");
	        	   System.out.println("아이디>"+selectedId[i]+"<");
	        	   System.out.println("메세지 건수>"+selectedCount[i]+"<");
	        	   System.out.println("---------------------");
	              if( ids.get(s.getId()).equals(selectedId[i]) ){
	                 System.out.println(selectedId[i]);
	                 s.sendMessage(new TextMessage(id_count_type[2]+"/"+selectedCount[i]+"건 알림 발생") );
	              }
	           }
	           
	       
	        }
		
		
		
	}

	@Override
	public void handleTransportError(
			WebSocketSession session, Throwable exception) throws Exception {
		log((String) session.getAttributes().get("userId") + " 에러 발생: " + exception.getMessage());
	}

	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);
	}

}
