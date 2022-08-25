package com.kh.petlab.customerservice.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.petlab.common.PetLabUtils;
import com.kh.petlab.customerservice.model.dto.CsEmailLog;
import com.kh.petlab.customerservice.model.service.CustomerService;
import com.kh.petlab.member.model.dto.Attachment;
import com.kh.petlab.member.model.dto.Member;
import com.kh.petlab.member.model.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/customerservice")
@Slf4j
public class CustomerServiceController {

	 @Autowired 
	 CustomerService customerService;
	 
	 @Autowired 
	 MemberService memberService;
	 
	 @Autowired 
	 ServletContext application;
	 
	 @GetMapping("/csCenter")
	 public void customerserviceHome() {};
	 
	 @GetMapping("/sendEmail")
	 public void sendEmail() {};
	 
	 @PostMapping("/sendEmail")
	 public ModelAndView sendEmail(ModelAndView mav, CsEmailLog emailLog, @RequestParam MultipartFile upfile1, @RequestParam MultipartFile upfile2, @RequestParam MultipartFile upfile3) {
		 try {
				String saveDirectory = application.getRealPath("/resources/upload/customerservice/cslog");
				String attachGroupId = PetLabUtils.getAttachGroupId("csEmail");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS_");
				// 업로드 파일 저장
				 
				if(upfile1 != null || upfile2 != null || upfile3 != null) {
					List<Attachment> attachments = new ArrayList<>();
					if(upfile1.getOriginalFilename() != null && upfile1.getOriginalFilename() != "") 
						emailLog.addAttachment(getAttachment(saveDirectory, attachGroupId, upfile1));
					if(upfile2.getOriginalFilename() != null && upfile2.getOriginalFilename() != "") 
						emailLog.addAttachment(getAttachment(saveDirectory, attachGroupId, upfile2));
					if(upfile3.getOriginalFilename() != null && upfile2.getOriginalFilename() != "") 
						emailLog.addAttachment(getAttachment(saveDirectory, attachGroupId, upfile3));
				}
				
				int result = customerService.sendEmail(emailLog);
				mav.setViewName("customerservice/csCenter");
			} catch (Exception e) {
				log.error("이메일 고객 문의 오류!", e);
		
			}
			return mav;
	 };
	 

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
}
