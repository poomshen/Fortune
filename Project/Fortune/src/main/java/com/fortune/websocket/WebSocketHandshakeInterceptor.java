package com.fortune.websocket;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import com.fortune.Table_DTO.Join_DTO;

public class WebSocketHandshakeInterceptor extends HttpSessionHandshakeInterceptor{
	

    @Override
    public boolean beforeHandshake(ServerHttpRequest request,ServerHttpResponse response, WebSocketHandler wsHandler,
         Map<String, Object> attributes) throws Exception {     
    
          
        ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
        HttpServletRequest req =  ssreq.getServletRequest();
         
        //로그인한 사람 아이디 뽑기 
        //"userId"->key 로그인한 사용자 아이디->value
		Join_DTO dto = (Join_DTO) req.getSession().getAttribute("info");
        attributes.put("userId", dto.getUser_id());
        return super.beforeHandshake(request, response, wsHandler, attributes);
    }
  
    @Override
    public void afterHandshake(ServerHttpRequest request,
            ServerHttpResponse response, WebSocketHandler wsHandler,
            Exception ex) {
  
        super.afterHandshake(request, response, wsHandler, ex);
    }
    
}
