package com.kh.petlab.chat.controller;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.petlab.chat.model.dto.ChatLog;
import com.kh.petlab.chat.model.dto.ChatMember;
import com.kh.petlab.chat.model.service.ChatService;
import com.kh.petlab.member.model.dto.Attachment;
import com.kh.petlab.member.model.dto.Member;
import com.kh.petlab.member.model.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/chat")
public class ChatController {

	@Autowired
	ChatService chatService;
	
	@Autowired
	MemberService memberService;
	
	 @GetMapping("/chat")
	 private void chat(String memberId, HttpSession session, Model model) {
			log.debug("memberId = {}", memberId);
			Member member = memberService.selectOneMember(memberId);
			String counsellorId = member.getCounsellor();
			ChatMember chatMember = chatService.findChatMemberByMemberId(memberId); 
			Member counsellor = memberService.selectOneMember(counsellorId);
			Attachment counsellorAattach = counsellor.getAttach();
			
			log.debug("chatMember = {}", chatMember);
			
			String chatroomId = null;
			if(chatMember != null) {
				// 채팅방이 존재하는 경우
				chatroomId = chatMember.getChatroomId();
				LocalDateTime openTime = chatMember.getCreatedAt();
				// 채팅내역 가져오기
				List<ChatLog> chatLogList = chatService.findChatLogByChatroomId(chatroomId);
				log.debug("chatLogList = {}", chatLogList);
				model.addAttribute("chatLogList", chatLogList);
				model.addAttribute("openTime", openTime);
				
				// session속성 unreadCount 제거
				session.removeAttribute("unreadCount");
			}
			else {	
				// 채팅방에 처음 입장한 경우
				// chatroomId 생성
				chatroomId = getChatroomId();
				
				// 채팅방멤버 생성 (member, admin)
				List<ChatMember> chatMemberList = Arrays.asList(
						new ChatMember(chatroomId, memberId),
						new ChatMember(chatroomId, counsellorId));
				int result = chatService.createChatroom(chatMemberList);
				
				ChatMember chatMem = chatService.findChatMemberByMemberId(memberId);
				LocalDateTime openTime = chatMember.getCreatedAt();
				model.addAttribute("openTime", openTime);
			}
			
			log.debug("chatroomId = {}", chatroomId);
			model.addAttribute("chatroomId", chatroomId);
			model.addAttribute("counsellor", counsellor);
			model.addAttribute("member", member);
			model.addAttribute("memberId", memberId);
			model.addAttribute("counsellorAattach", counsellorAattach);
		}
	 
		private String getChatroomId() {
			final int LEN = 8;
			Random rnd = new Random();
			StringBuffer sb = new StringBuffer();
			for(int i = 0; i < LEN; i++) {
				if(rnd.nextBoolean()) {
					if(rnd.nextBoolean())
						sb.append((char)(rnd.nextInt(26) + 'A'));
					else
						sb.append((char)(rnd.nextInt(26) + 'a'));
				}
				else {
					sb.append(rnd.nextInt(10));
				}
			}
			return sb.toString();
		}
	 
}
