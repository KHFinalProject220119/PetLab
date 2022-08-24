package com.kh.petlab.mypage.model.service;

import java.util.List;

import com.kh.petlab.member.model.dto.Address;
import com.kh.petlab.member.model.dto.Member;
import com.kh.petlab.mypage.model.dto.MyPet;

public interface MypageService {
	
	Member selectOneMember(String memberId);
	Member selectOneMemberByNickname(String nickname);
	Member selectOneMemberByEmail(String email);
	MyPet selectOnePet(String petId);
	
	int updateMember(Member member);

	List<Member> selectMemberList();
	
	int updatePet(MyPet pet);
	Address selectAddress(String memberId);

	

}
