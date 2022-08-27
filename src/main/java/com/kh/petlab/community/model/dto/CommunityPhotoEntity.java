package com.kh.petlab.community.model.dto;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import com.kh.petlab.common.PetLabUtils;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class CommunityPhotoEntity {
	
	@NonNull
	protected String memberId;
	protected String attachGroupId;
	protected int photoNo;
	protected String pTitle;
	protected String pContent;
	protected int readCount;
	protected int likeCount;
	protected LocalDateTime regDate;
}
