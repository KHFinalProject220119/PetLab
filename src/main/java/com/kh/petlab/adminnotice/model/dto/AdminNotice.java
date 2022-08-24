package com.kh.petlab.adminnotice.model.dto;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.kh.petlab.member.model.dto.Member;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString(callSuper = true)
public class AdminNotice extends AdminNoticeEntity {
	private int attachCount;
	private List<AdminNoticeAttachment> attachments = new ArrayList<>();
	private Member member; 
	
	public AdminNotice(int noticeNo, String noticeTitle, String memberId, String content, LocalDateTime createdAt,
			LocalDateTime updatedAt, int readCount, int attachCount) {
		super(noticeNo, noticeTitle, memberId, content, createdAt, updatedAt, readCount);
		this.attachCount = attachCount;
	}

	public void addAttachment(@NonNull AdminNoticeAttachment attach) {
		attachments.add(attach);
	}


	
}
