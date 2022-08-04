package com.kh.petlab.member.model.service;

import java.util.List;

import com.kh.petlab.member.model.dto.Address;
import com.kh.petlab.member.model.dto.Member;

import lombok.NonNull;

public interface MemberService {
	String ROLE_USER = "ROLE_USER";
	String ROLE_ADMIN = "ROLE_ADMIN";
	String ROLE_HOSPITAL = "ROLE_HOSPITAL";
	String ROLE_MALL = "ROLE_MALL";
	String ROLE_COUNSELOR = "ROLE_COUNSELOR";
	Member selectOneMember(String memberId);
	Member selectOneMemberByNickname(String nickname);
	Member selectOneMemberByEmail(String email);
	int insertMember(Member member, String memberType);
	int insertAddress(Address address);
	
	List<Member> selectMemberList();
	int updateMemberRole(@NonNull String memberId, List<String> authorities);
	

	
	
	
}
