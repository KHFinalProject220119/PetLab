package com.kh.petlab.member.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.petlab.member.model.dto.Address;
import com.kh.petlab.member.model.dto.Member;
import com.kh.petlab.member.model.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member")
@Slf4j
public class MemberController {

	@Autowired
	MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@GetMapping("/signUpSelection")
	public void signUpSelection() {}
	
	@GetMapping("/agreement")
	public ModelAndView agreement(ModelAndView mav, @RequestParam String selection) {
		try {
			String viewName = "";
			String agreementTitle = "";
			
			switch(selection) {
				case "normal": 
					viewName = "member/normalSignUp";
					agreementTitle = "펫오너";
					break;
				case "hospital": 
					viewName = "member/hospitalSignUp";
					agreementTitle = "동물병원";
					break;
				case "mall": 
					viewName = "member/mallSignUp";
					agreementTitle = "입점몰";
					break;
			}

			mav.addObject("viewName", viewName);
			mav.addObject("agreementTitle", agreementTitle);
			mav.setViewName("member/agreement");
		} catch (Exception e) {
			log.error("회원가입 동의사항 오류", e);
			throw e;
		}
		return mav;
	}
	
	@GetMapping("/normalSignUp")
	public void normalSignup() {}
	
	@GetMapping("/hospitalSignUp")
	public void hospitalSignup() {}
	
	@GetMapping("/mallSignUp")
	public void mallSignup() {}
	
	@GetMapping("/duplicateId")
	public ResponseEntity<?> duplicateId(@RequestParam String memberId) {
		Map<String, Object> map = new HashMap<>();
		try {
			Member member = memberService.selectOneMember(memberId);
			boolean available = member == null;
			
			map.put("memberId", memberId);
			map.put("available", available);
			
		} catch (Exception e) {
			log.error("중복아이디 확인 오류", e);		
			map.put("error", e);
			map.put("msg", "이용에 불편을 드려 죄송합니다.");

			return ResponseEntity
					.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE)
					.body(map);
		}
		return ResponseEntity
					.status(HttpStatus.OK)
					.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE)
					.body(map);
	}
	
	@GetMapping("/duplicateNickname")
	public ResponseEntity<?> duplicateNickname(@RequestParam String nickname) {
		Map<String, Object> map = new HashMap<>();
		try {
			Member member = memberService.selectOneMemberByNickname(nickname);
			boolean available = member == null;
			
			map.put("nickname", nickname);
			map.put("available", available);
			
		} catch (Exception e) {
			log.error("중복 별명 확인 오류", e);		
			map.put("error", e);
			map.put("msg", "이용에 불편을 드려 죄송합니다.");
			
			return ResponseEntity
					.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE)
					.body(map);
		}
		return ResponseEntity
				.status(HttpStatus.OK)
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE)
				.body(map);
	}
	
	@GetMapping("/recommendedId")
	public ResponseEntity<?> checkRecommendedId(@RequestParam String recommendedId) {
		Map<String, Object> map = new HashMap<>();
		try {
			Member member = memberService.selectOneMember(recommendedId);
			boolean available = member != null;
			System.out.println("available = " + available);

			
			map.put("recommendedId", recommendedId);
			map.put("available", available);
			
		} catch (Exception e) {
			log.error("추천인 아이디 확인 오류", e);		
			map.put("error", e);
			map.put("msg", "이용에 불편을 드려 죄송합니다.");
			
			return ResponseEntity
					.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE)
					.body(map);
		}
		return ResponseEntity
				.status(HttpStatus.OK)
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE)
				.body(map);
	}
	
	@GetMapping("/findMemberByEmail")
	public ResponseEntity<?> findMemberByEmail(@RequestParam String email) {
		Map<String, Object> map = new HashMap<>();
		try {
			Member member = memberService.selectOneMemberByEmail(email);
			String memberId = "";
			if(member != null) {
				memberId = member.getMemberId();
				map.put("memberId", memberId);				
			}
			
		} catch (Exception e) {
			log.error("중복아이디 확인 오류", e);		
			map.put("error", e);
			map.put("msg", "이용에 불편을 드려 죄송합니다.");

			return ResponseEntity
					.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE)
					.body(map);
		}
		return ResponseEntity
					.status(HttpStatus.OK)
					.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE)
					.body(map);
	}
	

	@PostMapping("/memberEnroll")
	public ModelAndView insertMember(Member member, Address address, ModelAndView mav, @RequestParam String memberType, @RequestParam String rawBirthday) {
		log.info("member = {}", member);
		log.info("address = {}", address);
		try {
			// Date로 변환
			Date birthday = null;
			if(rawBirthday != null && !"".equals(rawBirthday)) {
				birthday = Date.valueOf(rawBirthday);
				member.setBirthday(birthday);
			}
			
			// 암호화 처리
			String rawPassword = member.getPassword();
			String encryptedPassword = bcryptPasswordEncoder.encode(rawPassword);
			member.setPassword(encryptedPassword);
			log.info("encryptedPassword = {}", encryptedPassword);
			
			// service에 insert 요청
			int result = memberService.insertMember(member, memberType);
			//address.setMemberId(member.getMemberId());
			result = memberService.insertAddress(address);
			
			// 사용자 처리 피드백
			mav.addObject("nickname", member.getNickname());
			mav.setViewName("member/welcome");
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return mav;
	}
	@GetMapping("/welcome")
	public void welcome() {}
	
	@GetMapping("/signIn")
	public void signIn() {}
	
	
}
