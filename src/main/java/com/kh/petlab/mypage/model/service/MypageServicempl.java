package com.kh.petlab.mypage.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petlab.member.model.dao.MemberDao;
import com.kh.petlab.member.model.dto.Address;
import com.kh.petlab.member.model.dto.Member;
import com.kh.petlab.mypage.model.dao.MypageDao;
import com.kh.petlab.mypage.model.dto.MyPet;

@Service
public class MypageServicempl implements MypageService {

	@Autowired
	private MypageDao mypageDao;
	@Autowired
	private MemberDao memberDao;

	

//	@Override
	public MyPet selectOnePet(String petId) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int updatePet(MyPet pet) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public Member selectOneMember(String memberId) {
		Member member = memberDao.selectOneMember(memberId);
		return member;
	}

	@Override
	public Member selectOneMemberByNickname(String nickname) {
		Member member = memberDao.selectOneMemberByNickname(nickname);  
		return member;
	}

	@Override
	public Member selectOneMemberByEmail(String email) {
		Member member = memberDao.selectOneMemberByEmail(email);
		return member;
	}
	
	@Override
	public int updateMember(Member member) {
		return mypageDao.updateMember(member);
		
	}
	
	@Override
	public List<Member> selectMemberList() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public Address selectAddress(String memberId) {
		
		return mypageDao.selectAddress(memberId);
	}
	
}

