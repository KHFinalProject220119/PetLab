package com.kh.petlab.hospital.model.dto;

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
public class PetHosReview extends HospitalReviewEntity{
	private List<Attachment> attachments = new ArrayList<>();
	private HosReviewRate reviewRate;
	private double average;
	private double totalAvg;
	private double kindnessAvg;
	private double descriptionAvg;
	private double diagnosisAvg;
	private double facilityAvg;
	private double priceAvg;
	
	
	
	public void addAttachment(@NonNull Attachment attachment) {
		attachments.add(attachment);
    }



	public PetHosReview(List<Attachment> attachments, HosReviewRate reviewRate, double average, double totalAvg,
			double kindnessAvg, double descriptionAvg, double diagnosisAvg, double facilityAvg, double priceAvg) {
		super();
		this.attachments = attachments;
		this.reviewRate = reviewRate;
		this.average = average;
		this.totalAvg = totalAvg;
		this.kindnessAvg = kindnessAvg;
		this.descriptionAvg = descriptionAvg;
		this.diagnosisAvg = diagnosisAvg;
		this.facilityAvg = facilityAvg;
		this.priceAvg = priceAvg;
	}




}
