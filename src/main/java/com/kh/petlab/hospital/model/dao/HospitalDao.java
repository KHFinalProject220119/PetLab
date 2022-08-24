package com.kh.petlab.hospital.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.petlab.hospital.model.dto.HosReviewRate;
import com.kh.petlab.hospital.model.dto.Hospital;
import com.kh.petlab.hospital.model.dto.PetHosReview;
import com.kh.petlab.member.model.dto.Attachment;

@Mapper
public interface HospitalDao {

	Hospital selectHospital(String id);

	int insertAttachment(Attachment attach);

	int hospitalEnroll(Hospital hospital);

	List<Attachment> selectAttachmentHostpital(String attachGroupId);

	List<PetHosReview> selectReviews(String id);

	List<Attachment> selectAttachmentHosReview(String attachGroupId);

	HosReviewRate selectReviewRate(int hosReviewNo);

	int hospitalReviewEnroll(PetHosReview review);

	int reviewRateEnroll(HosReviewRate reviewRate);

	PetHosReview selectHospitalReviewByAttachGroupId(String attachGroupId);

}
