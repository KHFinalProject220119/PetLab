package com.kh.petlab.chat.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ChatLogEntity {

	protected long no;
	protected String chatroomId;
	protected String memberId;
	protected String msg;
	protected String time;
	protected long timer;
	
}
