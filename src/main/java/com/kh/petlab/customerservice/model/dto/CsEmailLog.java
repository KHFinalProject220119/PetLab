package com.kh.petlab.customerservice.model.dto;

import java.util.ArrayList;
import java.util.List;

import com.kh.petlab.hospital.model.dto.Hospital;
import com.kh.petlab.hospital.model.dto.PetHosReview;
import com.kh.petlab.member.model.dto.Attachment;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString(callSuper = true)
public class CsEmailLog extends CsEmailLogEntity {
	private List<Attachment> attachments = new ArrayList<>();
	
	public CsEmailLog(List<Attachment> attachments) {
		super();
		this.attachments = attachments;
	}

	public void addAttachment(@NonNull Attachment attachment) {
		attachments.add(attachment);
    }
}
