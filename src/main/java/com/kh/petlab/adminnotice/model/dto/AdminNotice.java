package com.kh.petlab.adminnotice.model.dto;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.kh.petlab.member.model.dto.Attachment;
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
	private List<Attachment> attachments = new ArrayList<>();
	private Member member;	

	public void addAttachment(@NonNull Attachment attach) {
		attachments.add(attach);
	}

	public AdminNotice(int attachCount, List<Attachment> attachments, Member member) {
		super();
		this.attachCount = attachCount;
		this.attachments = attachments;
		this.member = member;
	}


	
}
