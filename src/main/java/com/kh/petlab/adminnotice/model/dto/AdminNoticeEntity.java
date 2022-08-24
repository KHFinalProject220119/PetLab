package com.kh.petlab.adminnotice.model.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminNoticeEntity {
	private int adminNoticeNo;
	private String noticeTitle;
	private String memberId;
	private String content;
	private LocalDateTime createdAt;
	private LocalDateTime updatedAt;
	private int readCount;
}
