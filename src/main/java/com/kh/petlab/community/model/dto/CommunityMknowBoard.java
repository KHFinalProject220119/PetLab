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
public class CommunityMknowBoard extends CommunityMknowBoardEntity {

	private List<Attachment> attachments = new ArrayList<>();

	public void addAttachment(@NonNull Attachment attachment) {
		attachments.add(attachment);
	}
	
	public CommunityMknowBoard(List<Attachment> attachments) {
		super();
		this.attachments  = attachments;
	}
}