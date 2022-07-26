package com.kh.petlab.store.model.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review {
	
	private int reviewNo;
	private String productId;
	private String memberId;
	private String reviewContent;
	private int reviewGrade;
	private LocalDateTime regDate;

}
