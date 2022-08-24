package com.kh.petlab.hospital.model.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class HospitalReviewEntity {

	protected int hosReviewNo;
	protected String attachGroupId;
	protected String memberId;
	protected String id;
	protected String title;
	protected String content;
	protected Date regDate; 
}