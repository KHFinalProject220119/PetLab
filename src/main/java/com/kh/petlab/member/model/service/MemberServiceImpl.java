package com.kh.petlab.member.model.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.petlab.member.model.dao.MemberDao;
import com.kh.petlab.member.model.dto.Address;
import com.kh.petlab.member.model.dto.Member;

@Service
public class MemberServiceImpl implements MemberService {

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

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertMember(Member member, String memberType) {
		int result = memberDao.insertMember(member);
		Map<String, Object> map = new HashMap<>();
		map.put("memberId", member.getMemberId());
		map.put("auth", MemberService.ROLE_USER);
		result = memberDao.insertAuthority(map); // ROLE_USER
		if(memberType.equals("hospital")) {
			map.remove("auth");
			map.put("auth", MemberService.ROLE_HOSPITAL);
			result = memberDao.insertAuthority(map); // ROLE_HOSPITAL
		}
		if(memberType.equals("mall")) {
			map.remove("auth");
			map.put("auth", MemberService.ROLE_MALL);
			result = memberDao.insertAuthority(map); // ROLE_MALL
		}
		return result;
	}

	@Override
	public int insertAddress(Address address) {
		return  memberDao.insertAddress(address);
	}
}
