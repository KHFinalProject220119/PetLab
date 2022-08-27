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
public class CommunityDknowBoardEntity {

	@NonNull
	protected int dknowbNo;
	protected String memberId;
	protected String attachGroupId;
	protected String dknowbTitle;
	protected String content;
	protected int readCount;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	protected LocalDate regDate;
	protected int likeCount;
	
}
