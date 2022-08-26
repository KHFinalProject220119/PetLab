package com.kh.petlab.chat.model.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString(callSuper = true)
public class ChatLog extends ChatLogEntity {
	private int unreadCount;
}
