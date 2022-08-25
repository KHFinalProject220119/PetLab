package com.kh.petlab.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.petlab.chat.model.dto.ChatMember;
import com.kh.petlab.chat.model.service.ChatService;
import com.kh.petlab.common.PetLabUtils;
import com.kh.petlab.customerservice.model.service.CustomerService;
import com.kh.petlab.member.model.dto.Address;
import com.kh.petlab.member.model.dto.Attachment;
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
	CustomerService customerService;
	
	@Autowired
	ChatService chatService;
	
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	ServletContext application;
	
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
	public ModelAndView memberEnroll(Member member, Address address, ModelAndView mav, @RequestParam String memberType, @RequestParam String rawBirthday, @RequestParam("file") MultipartFile[] upFiles) {
		log.info("member = {}", member);
		log.info("address = {}", address);
		log.info("upFiles = {}", upFiles);
		
		try {
			String saveDirectory = application.getRealPath("/resources/upload/member/businessLicense");
			String attachGroupId = PetLabUtils.getAttachGroupId(memberType);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd_HHmmssSSS_");
			// 업로드 파일 저장
			for(MultipartFile upFile : upFiles) {
				if(upFile.getSize() > 0) {
					String originalFilename = upFile.getOriginalFilename();
					String renamedFilename = PetLabUtils.getRenamedFilename(originalFilename);
					 
					File destFile = new File(saveDirectory, renamedFilename);
					upFile.transferTo(destFile); // 파일저장
					Attachment attach = new Attachment(); 
					attach.setAttachGroupId(attachGroupId);
					attach.setOriginalFilename(originalFilename);
					attach.setRenamedFilename(renamedFilename);
					member.addAttachment(attach);
				}
			}

			
			// Date로 변환 -> local로 바꿈 /*박지수*/
//			Date birthday = null;
//			if(rawBirthday != null && !"".equals(rawBirthday)) {
//				birthday = Date.valueOf(rawBirthday);
//				member.setBirthday(birthday);
//			}
			if(rawBirthday != null && !"".equals(rawBirthday)) {
				if(!"-월-0".equals(rawBirthday)) {
					log.debug("rawBirthday = {}", rawBirthday);
					int year = Integer.parseInt(rawBirthday.substring(0, 4));
					int month = Integer.parseInt(rawBirthday.substring(5, 7));
					int day = Integer.parseInt(rawBirthday.substring(8, 10));
				
					LocalDate ldt = LocalDate.of(year, month, day);
					member.setBirthday(ldt);
				}
			}
			// 암호화 처리
			String rawPassword = member.getPassword();
			String encryptedPassword = bcryptPasswordEncoder.encode(rawPassword);
			member.setPassword(encryptedPassword);
		//	log.info("encryptedPassword = {}", encryptedPassword);
			
			// service에 insert 요청
			int result = memberService.insertMember(member, memberType);
			result = memberService.insertAddress(address);
			
			// 사용자 처리 피드백
			mav.addObject("nickname", member.getNickname());
			mav.setViewName("/member/welcome");
			
		}  catch (IOException e) {
			log.error("첨부파일 저장 오류", e);
		} catch (Exception e) {
			log.error("회원 가입 오류", e);
			throw e;
		}
		return mav;
	}
	
	@GetMapping("/welcome")
	public void welcome() {}
	
	@GetMapping("/signIn")
	public void signIn() {}
	
	@GetMapping("/findAccountInfo")
	public ModelAndView findAccountInfo(ModelAndView mav, @RequestParam String selectionTab) {
		try {
			mav.addObject("selectionTab", selectionTab);
			mav.setViewName("member/findAccountInfo");
		} catch (Exception e) {
			log.error("아이디/ 비밀번호 재설정 오류", e);
			throw e;
		}
		return mav;
	}
	
	@PostMapping("/resetPassword")
	public ModelAndView resetPassword(ModelAndView mav, @RequestParam String memberId, @RequestParam String password,  @AuthenticationPrincipal Member loginMember) {
		try {
			String rawPassword =password;
			String encryptedPassword = bcryptPasswordEncoder.encode(rawPassword);
			
			Map<String, Object> param = new HashMap<>();
			param.put("memberId", memberId);
			param.put("password", encryptedPassword);
			
			int result = memberService.resetPassword(param);
			
			mav.addObject("msg", "비밀번호가 정상적으로 수정되었습니다.");
			mav.setViewName("/member/signIn");
			
		} catch (Exception e) {
			log.error("비밀번호 재설정 오류", e);
			throw e;
		}
		return mav;
	}
	
	@GetMapping("/socialSignUp")
	public ModelAndView socialSignUp(ModelAndView mav, @RequestParam String memberId, @RequestParam String password, @RequestParam String email, @RequestParam String socialType ) {
		try {
			
			String viewName = "/member/socialSignUp";
			mav.addObject("memberId", memberId);
			mav.addObject("password", password);
			mav.addObject("email", email);
			mav.addObject("memberSocial", socialType);
			mav.setViewName(viewName);
			
		} catch (Exception e) {
			log.error("소셜 회원가입 오류", e);		
			throw e;
		}
			return mav;
	}
	
	@PostMapping("/socialSignUp")
	public ModelAndView memberSocialEnroll(Member member, Address address, ModelAndView mav, @RequestParam String memberType, @RequestParam String rawBirthday, @RequestParam("file") MultipartFile[] upFiles) {
		log.info("member = {}", member);
		log.info("address = {}", address);
		log.info("upFiles = {}", upFiles);
		
		try {
			String saveDirectory = application.getRealPath("/resources/upload/member/businessLicense");
			String attachGroupId = PetLabUtils.getAttachGroupId(memberType);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd_HHmmssSSS_");
			// 업로드 파일 저장
			for(MultipartFile upFile : upFiles) {
				if(upFile.getSize() > 0) {
					String originalFilename = upFile.getOriginalFilename();
					String renamedFilename = PetLabUtils.getRenamedFilename(originalFilename);
					 
					File destFile = new File(saveDirectory, renamedFilename);
					upFile.transferTo(destFile); // 파일저장
					Attachment attach = new Attachment(); 
					attach.setAttachGroupId(attachGroupId);
					attach.setOriginalFilename(originalFilename);
					attach.setRenamedFilename(renamedFilename);
					member.addAttachment(attach);
				}
			}
			
			
			// Date로 변환 -> LocalDate변겅 /*박지수*/
//			Date birthday = null;
//			if(rawBirthday != null && !"".equals(rawBirthday)) {
//				birthday = Date.valueOf(rawBirthday);
//				member.setBirthday(birthday);
//			}
			if(rawBirthday != null && !"".equals(rawBirthday)) {
				if(!"-월-0".equals(rawBirthday)) {
					log.debug("rawBirthday = {}", rawBirthday);
					int year = Integer.parseInt(rawBirthday.substring(0, 4));
					int month = Integer.parseInt(rawBirthday.substring(5, 7));
					int day = Integer.parseInt(rawBirthday.substring(8, 10));
				
					LocalDate ldt = LocalDate.of(year, month, day);
					member.setBirthday(ldt);
				}
			}
			// 암호화 처리
			String rawPassword = member.getPassword();
			String encryptedPassword = bcryptPasswordEncoder.encode(rawPassword);
			member.setPassword(encryptedPassword);
		//	log.info("encryptedPassword = {}", encryptedPassword);
			
			// service에 insert 요청
			int result = memberService.insertMember(member, memberType);
			result = memberService.insertAddress(address);
			
			// 사용자 처리 피드백
			mav.addObject("nickname", member.getNickname());
			mav.setViewName("/member/welcome");
			
		}  catch (IOException e) {
			log.error("첨부파일 저장 오류", e);
		} catch (Exception e) {
			log.error("회원 가입 오류", e);
			throw e;
		}
		return mav;
	}
	
	@GetMapping("/memberIdCheckSocial")
	public ResponseEntity<?> memberIdCheckSocial(@RequestParam String memberId) {
		Map<String, Object> map = new HashMap<>();
		try {
			Member member = memberService.selectOneMember(memberId);
			boolean available = (member == null);
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
	
	
	@PostMapping("/loginSuccess")
	public String loginSuccess(@AuthenticationPrincipal Member member, HttpSession session, Model model) {

		List<SimpleGrantedAuthority> authorities = (List<SimpleGrantedAuthority>) member.getAuthorities();
		// 관리자가 아닌 경우에만 안읽은 메세지수 체크
		if(!authorities.contains(new SimpleGrantedAuthority("ROLE_ADMIN"))) {			
			// 관리자와의 1:1채팅 안읽은 메세지 카운팅
			ChatMember chatMember = chatService.findChatMemberByMemberId(member.getMemberId());
			if(chatMember != null) {
				int unreadCount = chatService.getUnreadCount(chatMember);
				// 세션스코프에 저장
				session.setAttribute("unreadCount", unreadCount);
			}
		}
		
		// security redirect사용하기
		SavedRequest savedRequest = (SavedRequest) session.getAttribute("SPRING_SECURITY_SAVED_REQUEST");
		String location = "/";
		if(savedRequest != null)
			location = savedRequest.getRedirectUrl();
	
		return "redirect:" + location;
	}
	
}
