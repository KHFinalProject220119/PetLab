package com.kh.petlab.community.model.dto;

import java.util.ArrayList;
import java.util.List;

import com.kh.petlab.member.model.dto.Attachment;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString(callSuper = true)
public class CommunityPhoto extends CommunityPhotoEntity {
	
	List <CommunityPhotoReply> replies = new ArrayList<>();
	Attachment attachment = new Attachment(); 
	
	
}
