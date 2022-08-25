package com.kh.petlab.chat.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kh.petlab.chat.model.dto.ChatLog;
import com.kh.petlab.chat.model.dto.ChatMember;


@Mapper
public interface ChatDao {

	int insertChatMember(ChatMember chatMember);

	ChatMember findChatMemberByMemberId(String memberId);

	int insertChatLog(Map<String, Object> payload);

	List<ChatLog> findChatLogByChatroomId(String chatroomId);

	List<ChatLog> findRecentChatLogList(String counsellor);

	int updateLastCheck(Map<String, Object> payload);

	int getUnreadCount(ChatMember chatMember);
}
