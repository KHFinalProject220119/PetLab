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
public class Hospital extends HospitalEntity {


	private List<Attachment> attachments = new ArrayList<>();
	private List<PetHosReview> reviews = new ArrayList<>();
	
	public Hospital(List<Attachment> attachments, List<PetHosReview> reviews) {
		super();
		this.attachments = attachments;
		this.reviews = reviews;
	}

	public void addAttachment(@NonNull Attachment attachment) {
		attachments.add(attachment);
    }
}
