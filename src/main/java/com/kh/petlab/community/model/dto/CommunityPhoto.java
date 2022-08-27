package com.kh.petlab.community.model.dto;

import java.util.ArrayList;
import java.util.List;

import com.kh.petlab.member.model.dto.Attachment;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString(callSuper = true)
public class CommunityPhoto extends CommunityPhotoEntity {
	
	private List<Attachment> attachments = new ArrayList<>();
	private Attachment attachment;
	
	public void addAttachment(@NonNull Attachment attachment) {
		attachments.add(attachment);
	}

	public CommunityPhoto(List<Attachment> attachments, Attachment attachment) {
		super();
		this.attachments = attachments;
		this.attachment = attachment;
	}
	
	
	
}
