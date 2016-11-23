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
		
	/*
		log(session.getId() + "연결이 성공한 후 아이디");
		String parammsg = (String) session.getAttributes().get("userId");
		
	

		users.put(parammsg, session);*/
	

	
		
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
	    String userid = (String)session.getAttributes().get("userId");
	      String[] selectedid = message.getPayload().split("/");
	      log(" [발송자 아이디] // " +  userid);
	      System.out.println("[메시지] // " + message.getPayload());
	       System.out.println("session 객체 : "+session.getId());
	      
	       System.out.println(selectedid.length);

	       System.out.println("user size:"+users.size());
	       
	       
	       
	        for (WebSocketSession s : users.values()) { //users.values()           
	           for(int i =0; i < selectedid.length; i++){
	        	   
	        	   System.out.println("s아이디>"+ids.get(s.getId())+"<");
	        	   System.out.println("selectId>"+selectedid[i]+"<");
	              if( ids.get(s.getId()).equals(selectedid[i]) ){
	                 System.out.println(selectedid[i]);
	                 s.sendMessage(  new TextMessage("aaa")  );
	              }
	           }
	           
	       
	        }
		
		
/*			(String) session.getAttributes().get("userId");
	
	
			log((String) session.getAttributes().get("userId")+ message.getPayload());
	
		    System.out.println("handleTextMessage()");
	    
		    log(session.getAttributes().get("userId")+ message.getPayload());
		    
		    System.out.println("session : "+session.getId());
		   
		
		    for(int i=0;i<select.length;i++){
		    	
		    	if(users.containsKey(select[i])){
		    		real_users.put(select[i],users.get(select[i]));
		    		
		    	}
		    }
		    
	     	for (WebSocketSession s : real_users.values()) {
	     		
	     		
				s.sendMessage(new TextMessage( message.getPayload()+" [id : "+session.getAttributes().get("userId")+"]"));
	     		
				log(session.getAttributes().get("userId")+ message.getPayload());
	    	}
	         */
	   
		
		
	}

	@Override
	public void handleTransportError(
			WebSocketSession session, Throwable exception) throws Exception {
		log((String) session.getAttributes().get("userId") + " ?��?��?�� 발생: " + exception.getMessage());
	}

	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);
	}

}
