package com.kh.petlab.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.petlab.adminnotice.model.dto.AdminNoticeAttachment;
import com.kh.petlab.common.PetLabUtils;
import com.kh.petlab.member.model.dto.Address;
import com.kh.petlab.member.model.dto.Attachment;
import com.kh.petlab.member.model.dto.Member;
import com.kh.petlab.mypage.model.dto.MyPet;
import com.kh.petlab.mypage.model.dto.PetAttachment;
import com.kh.petlab.mypage.model.service.MypageService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/mypage")
@Slf4j

public class MyPageController {
	@Autowired
	MypageService mypageService;
	@Autowired
	ServletContext application;
	@Autowired
	ResourceLoader resourceLoader;
		
		@GetMapping("/mypageHome")
		public void mypageHome(	@AuthenticationPrincipal Member loginMember, Model model) {
			try {
				String memberId = loginMember.getMemberId();
				Member member = mypageService.selectOneMember(memberId);
				model.addAttribute("member", member);
				
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
			
		}	
		
		
		@GetMapping("/memberDetail")
		public void memberDetail(
				@AuthenticationPrincipal Member loginMember, Model model) {
			try {
				String memberId = loginMember.getMemberId();
				Address address = mypageService.selectAddress(memberId);
				Member member = mypageService.selectOneMember(memberId);
				model.addAttribute("address", address);
				model.addAttribute("member", member);
				
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
		}
		
		
		@PostMapping("/updateMember")
		public String updateMember(
				Member loginMember, Address address,
				RedirectAttributes redirectAttr, Model model) {
			
			log.info("address = {}", address);
			try {
				log.info("loginMember = {}", loginMember);
				int result = mypageService.updateMember(loginMember);
				result = mypageService.updateAddress(address);
				redirectAttr.addFlashAttribute("msg", "회원정보를 성공적으로 변경했습니다");
				
			} catch(Exception e) {
				e.printStackTrace();
				throw e;
			}
			
			return "redirect:/mypage/memberDetail";
		}
		
		@GetMapping("/closeMember")
		public void closeMember(@AuthenticationPrincipal Member loginMember, Model model) {
			try {
				String memberId = loginMember.getMemberId();
				Member member = mypageService.selectOneMember(memberId);
				model.addAttribute("member", member);
				
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
			
		}	
		
				
		@PostMapping("/closeMember")
			public String closeMember(@AuthenticationPrincipal Member loginMember, 
					RedirectAttributes redirectAttr, Model model) {
				try {
					
					log.info("loginMember = {}", loginMember);
				int result = mypageService.closeMember(loginMember);
				redirectAttr.addFlashAttribute("msg", "회원탈퇴 성공");
				
			} catch(Exception e) {
				e.printStackTrace();
				throw e;
			}
			
				return "redirect:/";
		}
			
			@GetMapping("/myPetList")
			public ModelAndView myPetList(
					@AuthenticationPrincipal Member loginMember, Model model,
					@RequestParam(defaultValue = "1") int cPage, ModelAndView mav,
					HttpServletRequest request) {
				try {
					String memberId = loginMember.getMemberId();
					Member member = mypageService.selectOneMember(memberId);
					model.addAttribute("member", member);
					// 목록조회
					int numPerPage = 5;
					List<MyPet> list = mypageService.selectPetList(cPage, numPerPage);
					log.debug("list = {}", list);
					mav.addObject("list", list);
					
					// 페이지바
					int totalContent = mypageService.selectTotalContent();
					String url = request.getRequestURI();
					//log.debug("totalContent = {}", totalContent);
					String pagebar = PetLabUtils.getPagebar(cPage, numPerPage, totalContent, url);
					//log.debug("pagebar = {}", pagebar);
					mav.addObject("pagebar", pagebar);
					
					// viewName 설정
					// model에서는 viewName을 return 하지만, modelandview에서는 세팅함. 
					mav.setViewName("mypage/myPetList");
					
				} catch(Exception e) {
					log.error("펫 목록 조회 오류", e);
				}
				
				return mav;
			}
		
		@GetMapping("/myPetDetail")
		public void myPetDetail(
						@AuthenticationPrincipal Member loginMember, Model model, 
						@RequestParam int petNo) {
			
			try {
				String memberId = loginMember.getMemberId();
				Member member = mypageService.selectOneMember(memberId);
				MyPet mypet = mypageService.selectOnePet(petNo);
				log.debug("mypet={}", mypet);
				model.addAttribute("member", member);
				model.addAttribute("mypet", mypet);
				log.debug("Detail = {}", mypet);
				
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
			
		}
						
		@GetMapping("/myPetEnroll")
		public void myPetEnroll(@AuthenticationPrincipal Member loginMember, Model model) {
			try {
				String memberId = loginMember.getMemberId();
				Member member = mypageService.selectOneMember(memberId);
				model.addAttribute("member", member);
				
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
		}
		
		@PostMapping("/myPetEnroll")
		public String myPetEnroll( 
				ModelAndView mav,
				@ModelAttribute MyPet mypet, 
				@AuthenticationPrincipal Member loginMember, 
				@RequestParam("upFile") MultipartFile[] upFiles, RedirectAttributes redirectAttr) {
			log.info("mypet = {}", mypet);
			log.info("upFile = {}", upFiles);
			log.info("loginMember.memberid = {}", loginMember.getMemberId());
			mypet.setMemberId(loginMember.getMemberId());

			
			try {
				String saveDirectory = application.getRealPath("/resources/upload/mypage/mypet");
				String attachGroupId = PetLabUtils.getAttachGroupId("mypet");	
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS_");
				
				// 업로드한 파일 저장
				for (MultipartFile upFile : upFiles) {
					if(upFile.getSize() > 0) {
						String originalFilename = upFile.getOriginalFilename();
						String renamedFilename = PetLabUtils.getRenamedFilename(originalFilename);
						 
						File destFile = new File(saveDirectory, renamedFilename);
						upFile.transferTo(destFile); // 파일저장
						PetAttachment attach = new PetAttachment(); 
						attach.setAttachGroupId(attachGroupId);
						mypet.setAttachGroupId(attachGroupId);
						attach.setOriginalFilename(originalFilename);
						attach.setRenamedFilename(renamedFilename);
						mypet.addAttachment(attach);
					}
				}
				// service에 insert 요청
				int result = mypageService.insertPet(mypet);
								
			}catch (IOException e) {
				log.error("첨부파일 저장 오류", e);
								
			}catch (Exception e) {
				log.error("펫 등록 오류", e);
				e.printStackTrace();
				
			}
			return "redirect:/mypage/myPetDetail";
	
		}
		
		
		@GetMapping("/myPetUpdate")
		public void myPetUpdate(
						@RequestParam int no,
						@AuthenticationPrincipal Member loginMember, Model model
						) {
						log.debug("mypet={}", no);
					try {
						String memberId = loginMember.getMemberId();
						Member member = mypageService.selectOneMember(memberId);
						MyPet mypet = mypageService.selectOnePet(no);
						model.addAttribute("member", member);
						model.addAttribute("mypet", mypet);
					
						
					} catch (Exception e) {
						e.printStackTrace();
						throw e;
					}
			
				}
			
		
		@PostMapping("/myPetUpdate")
		public String myPetUpdate(MyPet mypet, 
				@RequestParam RedirectAttributes redirectAttr,
				@AuthenticationPrincipal Member loginMember, Model model
				) {
			
			try {
				String memberId = loginMember.getMemberId();
				Member member = mypageService.selectOneMember(memberId);
				model.addAttribute("member", member);
				
				// 펫 수정
				int result = mypageService.updatePet(mypet);
				redirectAttr.addFlashAttribute("msg", "펫정보를 성공적으로 변경했습니다");
				
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
			return "redirect:/mypage/myPetDetail?petNo=" + mypet.getPetNo();
		}
	
	
		
}
