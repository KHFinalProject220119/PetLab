package com.kh.petlab.adminnotice.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.petlab.adminnotice.model.dto.AdminNoticeAttachment;
import com.kh.petlab.adminnotice.model.dto.AdminNotice;
import com.kh.petlab.adminnotice.model.service.AdminNoticeService;
import com.kh.petlab.common.PetLabUtils;
import com.kh.petlab.member.model.dto.Attachment;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/adminnotice")
@Slf4j
public class AdminNoticeController {

	@Autowired
	AdminNoticeService adminNoticeService;
	
	@Autowired
	ServletContext application;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	@GetMapping("/adminNoticeList")
	public ModelAndView adminNoticeList(
				@RequestParam(defaultValue = "1") int cPage, 
				ModelAndView mav,
				HttpServletRequest request) {
		try {
			// 목록조회
			int numPerPage = 5;
			List<AdminNotice> list = adminNoticeService.selectAdminNoticeList(cPage, numPerPage);
			log.debug("list = {}", list);
			mav.addObject("list", list);
			
			// 페이지바
			int totalContent = adminNoticeService.selectTotalContent();
			String url = request.getRequestURI();
			String pagebar = PetLabUtils.getPagebar(cPage, numPerPage, totalContent, url);
			mav.addObject("pagebar", pagebar);
			
			// viewName설정
			mav.setViewName("adminnotice/adminNoticeList");
		} catch (Exception e) {
			log.error("게시글 목록 조회 오류", e);
		}
		return mav;
	}
	
	@GetMapping("/adminNoticeForm")
	public void adminNoticeForm() {}
	
	@PostMapping("/adminNoticeEnroll")
	public ModelAndView adminNoticeEnroll(
			ModelAndView mav,
			@ModelAttribute AdminNotice adminNotice,
			@RequestParam("upFile") MultipartFile[] upFiles
			) throws Exception {
		try {
			log.debug("adminNotice = {}", adminNotice);
			String saveDirectory = application.getRealPath("/resources/upload/adminNotice");
			String attachGroupId = PetLabUtils.getAttachGroupId("notice");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS_");
			
			
			// 업로드한 파일 저장
			for(MultipartFile upFile : upFiles) {
				if(upFile.getSize() > 0) {
					adminNotice.addAttachment(getAttachment(saveDirectory, attachGroupId, upFile));
				}
			}
			int result = adminNoticeService.insertAdminNotice(adminNotice);
			
			mav.addObject("msg", "공지사항 등록 성공");
			mav.setViewName("redirect:/adminnotice/adminNoticeDetail?noticeNo=" + adminNotice.getNoticeNo());
		} catch (Exception e) {
			log.error("게시글 등록 오류", e);
			throw e;
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
	
	@GetMapping("/adminNoticeDetail")
	public ModelAndView adminNoticeDetail(@RequestParam int noticeNo, ModelAndView mav) {
		try {
			AdminNotice adminNotice = adminNoticeService.selectOneAdminNoticeCollection(noticeNo);
			log.debug("adminNotice = {}", adminNotice);
			
			mav.addObject("adminNotice", adminNotice);
			mav.setViewName("adminnotice/adminNoticeDetail");
		} catch (Exception e) {
			log.error("게시글 조회 오류", e);
			throw e;
		}
		return mav;
	}
	
	@GetMapping("/adminNoticeUpdate")
	public void adminNoticeUpdate(@RequestParam int noticeNo, Model model) {
		try {
			AdminNotice adminNotice = adminNoticeService.selectOneAdminNoticeCollection(noticeNo);
			log.debug("adminNotice = {}", adminNotice);
			model.addAttribute("adminNotice", adminNotice);
		} catch (Exception e) {
			log.error("게시글 수정폼 오류", e);
			throw e;
		}
	}
	
	@PostMapping("/adminNoticeUpdate.do")
	public String adminNoticeUpdate(
			@ModelAttribute AdminNotice adminNotice,
			@RequestParam("upFile") MultipartFile[] upFiles,
			@RequestParam(value="delFile", required=false) int[] delFiles,
			RedirectAttributes redirectAttr) throws Exception {
		String saveDirectory = application.getRealPath("/resources/upload/adminNotice");
		String attachGroupId = PetLabUtils.getAttachGroupId("notice");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS_");
		
		try {
			
			// 1. 첨부파일 삭제 (파일 삭제 + table 행삭제)
			// 복수개의 delFilec처리
			if(delFiles != null) {
				for(int attachNo : delFiles) {
					AdminNoticeAttachment attach = adminNoticeService.selectOneAttachment(attachNo);
					log.debug("attch = {}", attach);
					// a. 첨부파일삭제
					String renamedFilename = attach.getRenamedFilename();
					File delFile = new File(saveDirectory, renamedFilename);
					if(delFile.exists()) {
						delFile.delete();
						log.debug("{}번 {}파일 삭제", attachNo, renamedFilename);
					}
					
					// b. 레코드삭제
					int result = adminNoticeService.deleteAttachment(attachNo);
					log.debug("{}번 Attachment 레코드 삭제", attachNo);
				}
			}
			

			for(MultipartFile upFile : upFiles) {
				if(upFile.getSize() > 0) {
					adminNotice.addAttachment(getAttachment(saveDirectory, attachGroupId, upFile));
				}
			}
		
			// 3. 게시글 수정 
			int result = adminNoticeService.updateAdminNotice(adminNotice);
			
			redirectAttr.addFlashAttribute("msg", "게시글을 성공적으로 수정했습니다.");
		} 
		catch(Exception e) {
			log.error("게시글 수정 오류", e);
			throw e;
		}
		return "redirect:/adminNotice/adminNoticeDetail?noticeNo=" + adminNotice.getNoticeNo();
	}
	

	@GetMapping("/fileDownload")
	@ResponseBody
	public Resource fileDownload(@RequestParam int no, HttpServletResponse response) {
		Resource resource = null;
		try {
			// 1. 첨부파일 조회
			AdminNoticeAttachment attach = adminNoticeService.selectOneAttachment(no);
			log.debug("attach = {}", attach);
			
			String saveDirectory = application.getRealPath("/resources/upload/adminNotice");
			File downFile = new File(saveDirectory, attach.getRenamedFilename());
			
			// 2. Resource객체 생성
			String location = "file:" + downFile; // File#toString이 파일절대경로로 오버라이드되어 있다.
			log.debug("location = {}", location);
			resource = resourceLoader.getResource(location);
			
			// 3. 응답헤더 작성
			response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
			response.addHeader(HttpHeaders.CONTENT_DISPOSITION, 
					"attachment; filename=\"" + attach.getOriginalFilename() + "\"");
		}
		catch(Exception e) {
			log.error("파일 다운로드 오류!", e);
			throw e;
		}
		
		return resource;
	}
}










