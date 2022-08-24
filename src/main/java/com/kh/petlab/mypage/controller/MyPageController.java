package com.kh.petlab.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.petlab.common.PetLabUtils;
import com.kh.petlab.member.model.dto.Address;
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
	
	//파일경로 찾아ㅡㅡ
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
		
//		@GetMapping("/myPetList")
//		public ModelAndView myPetList(@AuthenticationPrincipal Member loginMember, Model model) {
//			try {
//				String memberId = loginMember.getMemberId();
//				Member member = mypageService.selectOneMember(memberId);
//				MyPet mypet = mypageService.selectPet(memberId);
//				model.addAttribute("member", member);
//				model.addAttribute("mypet", mypet);
//				
//			} catch (Exception e) {
//				e.printStackTrace();
//				throw e;
//			}
			
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
						@AuthenticationPrincipal Member loginMember, Model model) {
			try {
				String memberId = loginMember.getMemberId();
				Member member = mypageService.selectOneMember(memberId);
				MyPet mypet = mypageService.selectOnePet(memberId);
				model.addAttribute("member", member);
				model.addAttribute("mypet", mypet);
				
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
		public String myPetEnroll( MyPet mypet,
				@AuthenticationPrincipal Member loginMember, 
				@RequestParam("upFile") MultipartFile[] upFiles, RedirectAttributes redirectAttr) {
			log.info("mypet = {}", mypet);
			log.info("upFile = {}", upFiles);
			log.info("loginMember.memberid = {}", loginMember.getMemberId());
			mypet.setMemberId(loginMember.getMemberId());

			
			try {
				String saveDirectory = application.getRealPath("/resources/upload/mypage/mypet");
				String attachGroupId = PetLabUtils.getAttachGroupId("mypet");		
				
				
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
		public void myPetUpdate() {
			
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
