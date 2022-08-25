package com.kh.petlab.ws;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;

import com.kh.petlab.chat.model.service.ChatService;
import com.kh.petlab.ws.payload.Payload;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class StompController {
	
	@Autowired
	ChatService chatService;

	/**
	 * 사용자가 /app/def 메세지를 전송한 경우
	 * 
	 * /topic/abc 구독자에게 메세지 전송(SimpleBroker)
	 * 
	 * @return
	 */
	@MessageMapping("/def")
	@SendTo("/app/def")
	public String app(String msg) {
		log.debug("/app/def : {}", msg);
		
		return msg;
	}
	
	
	@MessageMapping("/admin/notice")
	@SendTo("/app/notice")
	public Payload adminNotice(Payload payload) {
		log.debug("payload = {}", payload);
		return payload;
	}
	
	@MessageMapping("/admin/notice/{memberId}")
	@SendTo("/app/notice/{memberId}")
	public Payload adminNotice(Payload payload, @DestinationVariable String memberId) {
		log.debug("memberId = {}", memberId);
		log.debug("payload = {}", payload);
		return payload;
	}
	
	@MessageMapping("/chat/{chatroomId}")
	@SendTo({"/app/chat/{chatroomId}", "/app/admin/chatList"})
	public Map<String, Object> chat(@RequestBody Map<String, Object> payload, @DestinationVariable String chatroomId) {
		log.debug("payload = {}", payload);
		int result = chatService.insertChatLog(payload);
		return payload;
	}
	
	@MessageMapping({"/admin/lastCheck", "/lastCheck"})
	@SendTo("/app/admin/chatList")
	public Map<String, Object> lastCheck(@RequestBody Map<String, Object> payload){
		log.debug("payload = {}", payload);	
		int result = chatService.updateLastCheck(payload);
		return payload;
	}
	
	
}
