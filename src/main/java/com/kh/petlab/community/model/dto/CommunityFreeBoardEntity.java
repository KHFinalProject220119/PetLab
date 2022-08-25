package com.kh.petlab.community.model.dto;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

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
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	protected LocalDate regDate;
	protected int likeCount;
}
	

