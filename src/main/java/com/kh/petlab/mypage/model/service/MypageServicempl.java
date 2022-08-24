package com.kh.petlab.mypage.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	
	@Override
	public int updateAddress(Address address) {
		return mypageDao.updateAddress(address);
	}

	@Override
	public MyPet selectOnePet(String memberId) {
		return mypageDao.selectOnePet(memberId);
	}
//
//	@Override
//	public MyPet selectPet(String memberId) {
//		return mypageDao.selectPet(memberId);
//	}

	@Override
	public int updatePet(MyPet mypet) {
		return mypageDao.updatePet(mypet);
	}

	@Override
	public int insertPet(MyPet mypet) {
		int result = mypageDao.insertPet(mypet);
		return result;
	}

//	@Override
//	public MyPet selectPet(String memberId) {
//		return mypageDao.selectPet(memberId);
//	}
	
	@Transactional(readOnly = true)
	@Override
	public List<MyPet> selectPetList(int cPage, int numPerPage) {
		int offset = (cPage - 1) * numPerPage;
		int limit = numPerPage;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return mypageDao.selectPetList(rowBounds);
	}

	@Override
	public int selectTotalContent() {
		return mypageDao.selectTotalContent();
	}


}
