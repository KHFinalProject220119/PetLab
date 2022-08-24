package com.kh.petlab.hospital.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class HosReviewRate {

	protected int no;
	protected int hosReviewNo;
	protected int kindness;
	protected int description;
	protected int diagnosis;
	protected int facility;
	protected int price;
	
}
