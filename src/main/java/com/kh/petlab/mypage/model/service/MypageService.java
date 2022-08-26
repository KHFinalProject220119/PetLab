package com.kh.petlab.mypage.model.service;

import java.util.List;

import com.kh.petlab.member.model.dto.Address;
import com.kh.petlab.member.model.dto.Member;
import com.kh.petlab.mypage.model.dto.MyPet;

public interface MypageService {
	
	Member selectOneMember(String memberId);
	Member selectOneMemberByNickname(String nickname);
	Member selectOneMemberByEmail(String email);
	
	List<Member> selectMemberList();
	Address selectAddress(String memberId);
	int updateAddress(Address address);
	
	int closeMember(Member member);
	int updateMember(Member member);
	
	
	int insertPet(MyPet mypet);
	int updatePet(MyPet mypet);
	MyPet selectOnePet(int petNo);
	List<MyPet> selectPetList(int cPage, int numPerPage);
	int selectTotalContent();
	


	

}
