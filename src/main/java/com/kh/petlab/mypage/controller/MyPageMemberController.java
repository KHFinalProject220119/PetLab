package com.kh.petlab.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.petlab.member.model.dto.Address;
import com.kh.petlab.member.model.dto.Member;
import com.kh.petlab.mypage.model.service.MypageService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/mypage")
@Slf4j
@SessionAttributes({"loginMember", "next"})
public class MyPageMemberController {
	
	@Autowired
	MypageService mypageService;
	
	@GetMapping("/memberDetail")
	public void memberDetail(
					@AuthenticationPrincipal Member loginMember, Model model) {
		try {
			String memberId = loginMember.getMemberId();
			Address address = mypageService.selectAddress(memberId);
			model.addAttribute("address", address);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	
	@PostMapping("/updateMember")
	public String updateMember(
					@ModelAttribute("loginMember") Member loginMember, 
					RedirectAttributes redirectAttr, 
					Model model) {
		
		try {
			
			log.info("loginMember = {}", loginMember);
			int result = mypageService.updateMember(loginMember);
			redirectAttr.addFlashAttribute("msg", "회원정보를 성공적으로 변경했습니다");
			
			// 세션 정보 갱신
			// 방법 1
			// model.addAttribute("loginMember", member);
			
			// 방법 2
			
			
		} catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return "redirect:/mypage/memberDetail";
	}
	
	
}
