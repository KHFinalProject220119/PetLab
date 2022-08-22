package com.kh.petlab.community.controller;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.petlab.common.PetLabUtils;
import com.kh.petlab.community.model.dto.CommunityPhoto;
import com.kh.petlab.community.model.service.CommunityService;
import com.kh.petlab.member.model.dto.Attachment;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/community")
@Slf4j

public class CommunityController {
	
	
	 @Autowired CommunityService communityService;
	  
	 @Autowired ServletContext application;

	@GetMapping("/communityMain")
	public void communityMain() {}
	
	@GetMapping("/smallGroupMain")
	public void smallGroupMain() {}
	
	@GetMapping("/small1")
	public void small1() {}
	
	@GetMapping("/small2")
	public void small2() {}
	
	@GetMapping("/freeBoardList")
	public void freeBoardList() {}
	
	@GetMapping("/knowhowList")
	public void knowhowList() {}
	
	@GetMapping("/photoList")
	public void photoList() {}
/*	public ModelAndView photoList(@RequestParam(defaultValue = "1") int cPage, ModelAndView mav,
			HttpServletRequest request) {
		try {
			// 목록조회
			int numPerPage = 10;
			List<Photo> list = communityService.selectPhotoList(cPage, numPerPage);
			 List<ProductAttachment> attlist = CommunityService.selectPhotoList(); 
			log.debug("list = {}", list);
			mav.addObject("list", list);
			 mav.addObject("attlist", attlist); 

			mav.setViewName("community/photoList");

			
			 * // 페이지바 int totalContent = storeService.selectTotalContent();
			 
			
			String url = request.getRequestURI();
			
			 * String pagebar = PetLabUtils.getPagebar(cPage, numPerPage, totalContent,
			 * url);
			 * 
			 * mav.addObject("pagebar", pagebar);
			 

		} catch (Exception e) {
			log.error("게시글 목록 조회 오류", e);
		}
		return mav;
		
	}*/
	
	@GetMapping("/enroll")
	public void enroll() {}
	
	@PostMapping("/enroll")
	public String enroll(CommunityPhoto communityPhoto, @RequestParam (name = "upFile", required = false) MultipartFile upFile) {
		try {
			log.debug("communityPhoto = {}", communityPhoto);
			log.debug("upFile ={}", upFile);
			String saveDirectory = application.getRealPath("/resources/upload/community");
			Attachment attachment = new Attachment();
			//업로드한 파일 저장
			if(upFile.getSize() > 0) {
				String originalFilename = upFile.getOriginalFilename();
				String renamedFilename = PetLabUtils.getRenamedFilename(originalFilename);
				log.debug("renamedFilename = {}", renamedFilename);
				
				// 파일 저장
				File destFile = new File(saveDirectory, renamedFilename);
				upFile.transferTo(destFile);
				
				String attachGroupId = PetLabUtils.getAttachGroupId("Community");
				attachment.setAttachGroupId(attachGroupId);
				communityPhoto.setAttachGroupId(attachGroupId);
				
				attachment.setOriginalFilename(originalFilename);
				
				attachment.setRenamedFilename(renamedFilename);
				
				communityPhoto.setAttachment(attachment);
			}
			
			int result = communityService.enroll(communityPhoto);
			
		} catch(Exception e) {
			log.error("커뮤니티 글 등록 오류", e);
			e.printStackTrace();
		}
		
		return "redirect:/community/photoList";
	}
	
}
