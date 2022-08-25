package com.kh.petlab.community.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.petlab.common.PetLabUtils;
import com.kh.petlab.community.model.dto.CommunityFreeBoard;
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

	@GetMapping("/freebEnroll")
	public void freebEnroll() {}
	
	@PostMapping("/freebEnroll")
	public String freebEnroll(CommunityFreeBoard communityFreeBoard, @RequestParam (name = "upFile", required = false) MultipartFile upFile) {
		try {
			log.debug("CommunityFreeBoard = {}", communityFreeBoard);
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
				communityFreeBoard.setAttachGroupId(attachGroupId);
				
				attachment.setOriginalFilename(originalFilename);
				
				attachment.setRenamedFilename(renamedFilename);
			
				
	//			communityPhoto.setAttachment(attachment);
			}
			
			int result = communityService.freebEnroll(communityFreeBoard);
			
		} catch(Exception e) {
			log.error("커뮤니티 글 등록 오류", e);
			e.printStackTrace();
		}
		
		return "redirect:/community/freeBoardList";
	}
	
	@GetMapping("/freeBoardList")
	public ModelAndView freeBoardList(
				@RequestParam(defaultValue = "1") int cPage, 
				ModelAndView mav,
				HttpServletRequest request) {
		try {
			// 목록조회
			int numPerPage = 5;
			List<CommunityFreeBoard> freeBoardList = communityService.selectFreeBoardList(cPage, numPerPage);
			log.debug("list = {}", freeBoardList);
			mav.addObject("list", freeBoardList);
			System.out.println(freeBoardList);
			
			// 페이지바
			int totalContent = communityService.selectTotalContent();
			// log.debug("totalContent = {}", totalContent);
			String url = request.getRequestURI();
			String pagebar = PetLabUtils.getPagebar(cPage, numPerPage, totalContent, url);
			// log.debug("pagebar = {}", pagebar);
			mav.addObject("pagebar", pagebar);
			
			// viewName설정
			mav.setViewName("community/freeBoardList");
		} catch (Exception e) {
			log.error("게시글 목록 조회 오류", e);
		}
		return mav;
	}
	
	
	@GetMapping("/knowhowList")
	public void knowhowList() {}
	
	@GetMapping("/photoList")
	public ModelAndView photoList(@RequestParam(defaultValue = "1") int cPage, ModelAndView mav,
			HttpServletRequest request) {
		try {
			// 목록조회
			int numPerPage = 10;
			List<CommunityPhoto> photoLists = communityService.selectPhotoList(cPage, numPerPage);
			List<CommunityPhoto> list = new ArrayList<>();
			if(!photoLists.isEmpty()) {  
				for(CommunityPhoto photoList : photoLists) {
					List<Attachment> photoAttachs = communityService.selectAttachmentForPhoto(photoList.getAttachGroupId());
					photoList.setAttachments(photoAttachs);
					list.add(photoList);
				}
			}
			List<CommunityPhoto> listForBest = communityService.selectPhotoListByLike();
			List<CommunityPhoto> bestList = new ArrayList<>();
			if(!listForBest.isEmpty()) {  
				for(CommunityPhoto bestPhoto : listForBest) {
					List<Attachment> BestAttachs = communityService.selectAttachmentForPhoto(bestPhoto.getAttachGroupId());
					bestPhoto.setAttachments(BestAttachs);
					bestList.add(bestPhoto);
				}
			}
			/* List<CommunityPhoto> attlist = communityService.selectPhotoList(); */
			System.out.println("List=" + list);
			 
			mav.addObject("list", list);
			mav.addObject("bestList", bestList);
			/* mav.addObject("attlist", attlist); */

			mav.setViewName("community/photoList");

			
			/* 페이징바
			 * int totalContent = storeService.selectTotalContent(); */
			 
			
			/*
			 * 
			 * String url = request.getRequestURI();
			 * 
			 * String pagebar = PetLabUtils.getPagebar(cPage, numPerPage, totalContent,
			 * url);
			 * 
			 * mav.addObject("pagebar", pagebar);
			 */
			 
			 

		} catch (Exception e) {
			log.error("게시글 목록 조회 오류", e);
		}
		return mav;
		
	}
	
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
				
	//			communityPhoto.setAttachment(attachment);
			}
			
			int result = communityService.enroll(communityPhoto);
			
		} catch(Exception e) {
			log.error("커뮤니티 글 등록 오류", e);
			e.printStackTrace();
		}
		
		return "redirect:/community/photoList";
	}
	
}
