package com.kh.petlab.hospital.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import com.kh.petlab.common.PetLabUtils;
import com.kh.petlab.hospital.model.dto.HosReviewRate;
import com.kh.petlab.hospital.model.dto.Hospital;
import com.kh.petlab.hospital.model.dto.PetHosReview;
import com.kh.petlab.hospital.model.service.HospitalService;
import com.kh.petlab.member.model.dto.Attachment;
import com.kh.petlab.member.model.dto.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/hospital")
@Slf4j
public class HospitalController {

	
	 @Autowired HospitalService hospitalService;
	 
	 @Autowired ServletContext application;
	 
	 @GetMapping("/hospitalEnroll") 
	 public void hospitalEnroll(@AuthenticationPrincipal Member loginMember) {}
	 
	 @PostMapping("/hospitalEnroll") 
	 public ModelAndView hospitalEnroll(ModelAndView mav, Hospital hospital, @RequestParam MultipartFile upfile1, @RequestParam MultipartFile upfile2, @RequestParam MultipartFile upfile3, @RequestParam MultipartFile upfile4, @RequestParam MultipartFile upfile5) {

		 try {
				String saveDirectory = application.getRealPath("/resources/upload/hospital/hospital");
				String attachGroupId = PetLabUtils.getAttachGroupId("hospital");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS_");
				// 업로드 파일 저장
				
				if(upfile1 != null || upfile2 != null || upfile3 != null || upfile4 != null || upfile5 != null) {
					List<Attachment> attachments = new ArrayList<>();
					if(upfile1.getOriginalFilename() != null && upfile1.getOriginalFilename() != "") 
						hospital.addAttachment(getAttachment(saveDirectory, attachGroupId, upfile1));
					if(upfile2.getOriginalFilename() != null && upfile2.getOriginalFilename() != "") 
						hospital.addAttachment(getAttachment(saveDirectory, attachGroupId, upfile2));
					if(upfile3.getOriginalFilename() != null && upfile3.getOriginalFilename() != "") 
						hospital.addAttachment(getAttachment(saveDirectory, attachGroupId, upfile3));
					if(upfile4.getOriginalFilename() != null && upfile4.getOriginalFilename() != "") 
						hospital.addAttachment(getAttachment(saveDirectory, attachGroupId, upfile4));
					if(upfile5.getOriginalFilename() != null && upfile5.getOriginalFilename() != "") 
						hospital.addAttachment(getAttachment(saveDirectory, attachGroupId, upfile5));
					
				}
												 		 
				int result = hospitalService.hospitalEnroll(hospital);
				
				mav.addObject("msg", "성공적으로 병원 정보를 등록했습니다.");
				mav.setViewName("hospital/searchHospital");	
			} catch (Exception e) {
				log.error("병원정보 등록 오류!", e);
		
			}
			return mav;
	 }

	private Attachment getAttachment(String saveDirectory, String attachGroupId, MultipartFile upfile)
			throws IOException {
		String originalFilename = upfile.getOriginalFilename();
		String renamedFilename = PetLabUtils.getRenamedFilename(originalFilename);
		 
		File destFile = new File(saveDirectory, renamedFilename);
		upfile.transferTo(destFile); // 파일저장
		Attachment attach = new Attachment(); 
		attach.setAttachGroupId(attachGroupId);
		attach.setOriginalFilename(originalFilename);
		attach.setRenamedFilename(renamedFilename);
		return attach;
	}
	 
	 @GetMapping("/searchHospital") 
	 public void searchHospital() {}
	 
	
	 @GetMapping("/hospitalList") 
	 public ModelAndView hospitalList(ModelAndView mav, @RequestParam String keyword) {
			try {	
				mav.addObject("keyword", keyword);
				mav.setViewName("hospital/hospitalList");
			} catch (Exception e) {
				log.error("병원 목록 오류", e);
				throw e;
			}
			return mav;
	 }
	 
	 
	 @GetMapping("/hospitalDetail") 
	 public ModelAndView hospitalDetail(ModelAndView mav, @RequestParam String id) {
		 try {	
			 	Hospital hospital = hospitalService.selectHospital(id);
			    List<Attachment> hosAttachments = hospitalService.selectAttachmentHostpital(hospital.getAttachGroupId());
			   
			    List<PetHosReview> reviews = hospitalService.selectReviews(id);
			    List<PetHosReview> hospitalReviews = new ArrayList<>();
			    if(!reviews.isEmpty()) {
			    	for(PetHosReview review : reviews) {
			    		List<Attachment> reviewAttachments = hospitalService.selectAttachmentHosReview(review.getAttachGroupId());
			    		review.setAttachments(reviewAttachments);
			    		hospitalReviews.add(review);
			    	}	
			    }
			    
			    if(!hosAttachments.isEmpty()) {
			    	hospital.setAttachments(hosAttachments);
			    }
			    
			    if(!hospitalReviews.isEmpty()) {
			    	hospital.setReviews(hospitalReviews);
			    }
			    
			 	mav.addObject("hospital", hospital);
				mav.setViewName("hospital/hospitalDetail");
			} catch (Exception e) {
				log.error("병원 상세보기 오류", e);
				throw e;
			}
			return mav;
		}
		

	 @PostMapping("/hospitalReviewEnroll") 
	 public String hospitalReviewEnroll(PetHosReview review, HosReviewRate reviewRate, @RequestParam MultipartFile upfile1, @RequestParam MultipartFile upfile2) {

		 try {
				String saveDirectory = application.getRealPath("/resources/upload/hospital/review");
				String attachGroupId = PetLabUtils.getAttachGroupId("hospitalReview");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS_");
				// 업로드 파일 저장
				 
				if(upfile1 != null || upfile2 != null) {
					List<Attachment> attachments = new ArrayList<>();
					if(upfile1.getOriginalFilename() != null && upfile1.getOriginalFilename() != "") 
						review.addAttachment(getAttachment(saveDirectory, attachGroupId, upfile1));
					if(upfile2.getOriginalFilename() != null && upfile2.getOriginalFilename() != "") 
						review.addAttachment(getAttachment(saveDirectory, attachGroupId, upfile2));
				}
				
				review.setReviewRate(reviewRate);
				int result = hospitalService.hospitalReviewEnroll(review);
				
			} catch (Exception e) {
				log.error("병원 리뷰 등록 오류!", e);
		
			}
			return "redirect:/hospital/hospitalDetail?id="+ review.getId();
	 }
	 
	 
}
