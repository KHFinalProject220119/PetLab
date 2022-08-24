package com.kh.petlab.adminnotice.controller;

import java.io.File;
import java.io.IOException;
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

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/adminNotice")
@Slf4j
public class AdminNoticeController {

	@Autowired
	AdminNoticeService adminNoticeService;
	
	@Autowired
	ServletContext application;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	@GetMapping("/adminNoticeList.do")
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
			// log.debug("totalContent = {}", totalContent);
			String url = request.getRequestURI();
			String pagebar = PetLabUtils.getPagebar(cPage, numPerPage, totalContent, url);
			// log.debug("pagebar = {}", pagebar);
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
	public String adminNoticeEnroll(
			@ModelAttribute AdminNotice adminNotice,
			@RequestParam("upFile") MultipartFile[] upFiles,
			RedirectAttributes redirectAttr) throws Exception {
		try {
			log.debug("adminNotice = {}", adminNotice);

			String saveDirectory = application.getRealPath("/resources/upload/adminNotice");
			
			// 업로드한 파일 저장
			for(MultipartFile upFile : upFiles) {
				if(upFile.getSize() > 0) {
					// 파일명 재지정
					String originalFilename = upFile.getOriginalFilename();
					String renamedFilename = PetLabUtils.getRenamedFilename(originalFilename);
					log.debug("renamedFilename = {}", renamedFilename);
					// 파일 저장
					File destFile = new File(saveDirectory, renamedFilename);
					upFile.transferTo(destFile); // 파일 저장
					AdminNoticeAttachment attach = new AdminNoticeAttachment();
					attach.setOriginalFilename(originalFilename);
					attach.setRenamedFilename(renamedFilename);
					adminNotice.addAttachment(attach);
				}
			}
			
			int result = adminNoticeService.insertAdminNotice(adminNotice);
			
			redirectAttr.addFlashAttribute("msg", "게시글을 성공적으로 등록했습니다.");
			
		} catch (IOException e) {
			log.error("첨부파일 저장 오류", e);
			throw e;
		} catch (Exception e) {
			log.error("게시글 등록 오류", e);
			throw e;
		}
		
		return "redirect:/adminnotice/adminNoticeDetail?no=" + adminNotice.getAdminNoticeNo();
	}
	
	@GetMapping("/adminNoticeDetail")
	public ModelAndView adminNoticeDetail(@RequestParam int no, ModelAndView mav) {
		try {
			AdminNotice adminNotice = adminNoticeService.selectOneAdminNoticeCollection(no);
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
	public void adminNoticeUpdate(@RequestParam int no, Model model) {
		try {
			AdminNotice adminNotice = adminNoticeService.selectOneAdminNotice(no);
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
					AdminNoticeAttachment attach = new AdminNoticeAttachment();
					attach.setOriginalFilename(upFile.getOriginalFilename());
					attach.setRenamedFilename(PetLabUtils.getRenamedFilename(upFile.getOriginalFilename()));
					attach.setNoticeNo(adminNotice.getAdminNoticeNo());
					adminNotice.addAttachment(attach);
					
					File destFile = new File(saveDirectory, attach.getRenamedFilename());
					upFile.transferTo(destFile);
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
		return "redirect:/adminNotice/adminNoticeDetail?no=" + adminNotice.getAdminNoticeNo();
	}
	
	/**
	 * Resource
	 * - UrlResource
	 * - ClassPathResource
	 * - FileSystemResource 서버컴퓨터 자원
	 * - ServletContextResource 웹루트상의 자원
	 * - InputStreamResource
	 * - ByteArrayResource
	 * 
	 * @ResponseBody
	 * - 응답메세지 바디에 핸들러 리턴객체를 직접 출력
	 *  
	 * @param no
	 * @return
	 */
	@GetMapping("/fileDownload.do")
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










