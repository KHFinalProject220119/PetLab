package com.kh.petlab.hospital.model.service;

import java.util.List;

import com.kh.petlab.hospital.model.dto.Hospital;
import com.kh.petlab.hospital.model.dto.PetHosReview;
import com.kh.petlab.member.model.dto.Attachment;

public interface HospitalService {

		Hospital selectHospital(String id);

		int hospitalEnroll(Hospital hospital);

		List<Attachment> selectAttachmentHostpital(String attachGroupId);

		List<PetHosReview> selectReviews(String id);

		List<Attachment> selectAttachmentHosReview(String attachGroupId);

		int hospitalReviewEnroll(PetHosReview review);

}
