package com.kh.petlab.hospital.model.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.kh.petlab.hospital.model.dao.HospitalDao;
import com.kh.petlab.hospital.model.dto.HosReviewRate;
import com.kh.petlab.hospital.model.dto.Hospital;
import com.kh.petlab.hospital.model.dto.PetHosReview;
import com.kh.petlab.member.model.dao.MemberDao;
import com.kh.petlab.member.model.dto.Attachment;

import net.sf.json.JSONObject;


@Service
public class HospitalServiceImpl implements HospitalService {

	@Autowired
	HospitalDao hospitalDao;
	
	@Autowired
	MemberDao memberDao;

	@Override
	public Hospital selectHospital(String id) {
		return hospitalDao.selectHospital(id);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int hospitalEnroll(Hospital hospital) { 
		int result = 0;
		List<Attachment> attachments = hospital.getAttachments(); 
		 if(!attachments.isEmpty()) {
			 for(Attachment attach : attachments) {
				 result = memberDao.insertAttachment(attach);
				 hospital.setAttachGroupId(attach.getAttachGroupId());
			} 
		 }
		 result = hospitalDao.hospitalEnroll(hospital);

		 return result;
	}

	@Override
	public List<Attachment> selectAttachmentHostpital(String attachGroupId) {
		return hospitalDao.selectAttachmentHostpital(attachGroupId);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public List<PetHosReview> selectReviews(String id) {
		List<PetHosReview> reviews = hospitalDao.selectReviews(id);
		List<PetHosReview> hospitalReviews = new ArrayList<>();		
		if(!reviews.isEmpty()) {
			for(PetHosReview review : reviews) {
				HosReviewRate reviewRate = hospitalDao.selectReviewRate(review.getHosReviewNo());
				review.setReviewRate(reviewRate);
				hospitalReviews.add(review);
			}			
		}
		return hospitalReviews;
	}

	@Override
	public List<Attachment> selectAttachmentHosReview(String attachGroupId) {
		return hospitalDao.selectAttachmentHosReview(attachGroupId);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int hospitalReviewEnroll(PetHosReview review) {
		int result = 0;
		List<Attachment> attachments = review.getAttachments(); 
		 if(!attachments.isEmpty()) {
			 for(Attachment attach : attachments) {
				 result = memberDao.insertAttachment(attach);
				 review.setAttachGroupId(attach.getAttachGroupId());
			} 
		 }
		 result = hospitalDao.hospitalReviewEnroll(review);
		 PetHosReview reviewCur = hospitalDao.selectHospitalReviewByAttachGroupId(review.getAttachGroupId());
		 HosReviewRate reviewRate = review.getReviewRate();
		 reviewRate.setHosReviewNo(reviewCur.getHosReviewNo());
		 result = hospitalDao.reviewRateEnroll(reviewRate);

		 return result;
	}

}
