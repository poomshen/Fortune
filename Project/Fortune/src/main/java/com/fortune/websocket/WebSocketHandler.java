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
	      //접속한 아이디를->key session->value에 저장 
	      users.put(userid, session);
	      //0,1,2..(session의 ID)->key userid->value에 저장
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
	     
	
		 String[] selectedId ={};
		 String[] selectedCount={};
		  
		 String msg = message.getPayload();
		  
		 //일정업무시 ( 선택자가 여러명일때)
		 if(msg.contains(",")){
			  
			  
		 String[] id_count_type = msg.split(",");
			  
	     selectedId=id_count_type[0].split("/");
		 selectedCount=id_count_type[1].split("/");
			  
			   
		 for (WebSocketSession s : users.values()) {          
		    for(int i =0; i < selectedId.length; i++){
		 //접속한 아이디가 선택된 아이디와 같을때 sendMessage 실행
		       if( ids.get(s.getId()).equals(selectedId[i]) ){
		 s.sendMessage(new TextMessage("알림 발생") );
		              }
		           }
		       }
		//프로젝트 생성 및 요청시 (선택자가 한명일때)	  
		 }else{
		        
		 for (WebSocketSession s : users.values()) {          
		
		//접속한 아이디가 선택된 아이디와 같을때 sendMessage 실행
			   if( ids.get(s.getId()).equals(msg) ){
	     s.sendMessage(new TextMessage("알림 발생") );
			              
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
