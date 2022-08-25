package com.kh.petlab.community.model.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class CommunityFreeBoardEntity {

	@NonNull
	protected int freebNo;
	protected String memberId;
	protected String attachGroupId;
	protected String freebTitle;
	protected String content;
	protected int readCount;
	protected LocalDateTime regDate;
	protected int likeCount;
}
	

