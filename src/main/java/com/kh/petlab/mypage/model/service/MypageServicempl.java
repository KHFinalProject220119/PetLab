package com.kh.petlab.mypage.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.petlab.mypage.model.dao.MypageDao;
import com.kh.petlab.mypage.model.dto.MyPet;
import com.kh.petlab.member.model.dto.Member;

@Service
public class MypageServicempl implements MypageService {

	@Autowired
	private MypageDao mypageDao;

	@Override
	public int updateMember(Member member) {
		return mypageDao.updateMember(member);
		
	}
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateMemberRole(String memberId, List<String> authorities) {
		
		// 기존권한 삭제
		int result = mypageDao.deleteMemberRole(memberId);
		
		// 새권한 등록
		for(String auth : authorities) {
			Map<String, Object> map = new HashMap<>();
			map.put("memberId", memberId);
			map.put("auth", auth);
			result = mypageDao.insertAuthority(map);
		}
		
		return result;
	}
	@Override
	public Member selectOneMember(String memberId) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public Member selectOneMemberByNickname(String nickname) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public Member selectOneMemberByEmail(String email) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<Member> selectMemberList() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public MyPet selectOnePet(String petId) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int updatePet(MyPet pet) {
		// TODO Auto-generated method stub
		return 0;
	}

}
