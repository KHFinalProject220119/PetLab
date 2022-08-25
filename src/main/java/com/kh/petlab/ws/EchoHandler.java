package com.kh.petlab.ws;

import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class EchoHandler extends TextWebSocketHandler {
	// multithreading환경에서 동기화를 지원하는 ArrayList
	List<WebSocketSession> sessions = new CopyOnWriteArrayList<>();
	
	public void log(String status) {
		log.debug("[{}] 현재세션수 : {}", status, sessions.size());
	}
	
	/**
	 * open
	 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessions.add(session);
			
	}
	
	/**
	 * message
	 */
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.debug("[message] {} : {}", session.getId(), message.getPayload());
		for(WebSocketSession sess : sessions) {
			sess.sendMessage(message);
		}
	}
	
	/**
	 * close
	 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessions.remove(session);
		log("close");
	}

}
