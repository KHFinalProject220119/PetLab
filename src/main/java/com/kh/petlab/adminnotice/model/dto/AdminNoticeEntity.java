package com.kh.petlab.adminnotice.model.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminNoticeEntity {
	protected int noticeNo;
	protected String attachGroupId;
	protected String memberId;
	protected String nickname;
	protected String noticeTitle;
	protected String content;
	protected int readCount;
	protected LocalDateTime regDate;
}
