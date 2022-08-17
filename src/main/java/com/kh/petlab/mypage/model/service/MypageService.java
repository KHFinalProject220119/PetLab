package com.kh.petlab.mypage.model.service;

import java.util.List;

import com.kh.petlab.member.model.dto.Member;

public interface MypageService {
	
	String ROLE_USER = "ROLE_USER";
	String ROLE_ADMIN = "ROLE_ADMIN";
	String ROLE_HOSPITAL = "ROLE_HOSPITAL";
	String ROLE_MALL = "ROLE_MALL";
	String ROLE_COUNSELOR = "ROLE_COUNSELOR";
	Member selectOneMember(String memberId);
	Member selectOneMemberByNickname(String nickname);
	Member selectOneMemberByEmail(String email);
	
	int updateMember(Member member);

	List<Member> selectMemberList();

	int updateMemberRole(String memberId, List<String> authorities);

	

}
