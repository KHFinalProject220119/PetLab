package com.kh.petlab.adminnotice.model.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminNoticeAttachment {

	private int no;
	private int NoticeNo;
	private String originalFilename;
	private String renamedFilename;
	private int downloadCount;
	private LocalDateTime createdAt;
	
	
}
