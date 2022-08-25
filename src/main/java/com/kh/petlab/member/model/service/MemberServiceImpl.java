package com.kh.petlab.member.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.petlab.hospital.model.dto.HosReviewRate;
import com.kh.petlab.hospital.model.dto.PetHosReview;
import com.kh.petlab.member.model.dao.MemberDao;
import com.kh.petlab.member.model.dto.Address;
import com.kh.petlab.member.model.dto.Attachment;
import com.kh.petlab.member.model.dto.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;

	
	@Override
	public Member selectOneMember(String memberId) {
		Member member = memberDao.selectOneMember(memberId);
		String attachGroupId = member.getAttachGroupId();
		if(member != null) {
			Attachment attach = memberDao.selectOneAttachment(attachGroupId);
			member.setAttach(attach);
		}			
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
		 int result = 0;
		 List<Attachment> attachments = member.getAttachments(); 
		 if(!attachments.isEmpty()) {
			 for(Attachment attach : attachments) {
				 result = memberDao.insertAttachment(attach);
				 member.setAttachGroupId(attach.getAttachGroupId());
				 } 
		 }
		if(!memberType.equals("admin")){
			String counsellor = "counsellor";
			List<Member> counsellorList = memberDao.selectCounsellor(counsellor);
			int no = (int) Math.floor(Math.random() * counsellorList.size() + 1);
			String counsellorId = "counsellor" + no;
			member.setCounsellor(counsellorId);
		}
		result = memberDao.insertMember(member);
		Map<String, Object> map = new HashMap<>();
		map.put("memberId", member.getMemberId());
		map.put("auth", MemberService.ROLE_USER);
		result = memberDao.insertAuthority(map); // ROLE_USER
		if (memberType.equals("hospital")) {
			map.remove("auth");
			map.put("auth", MemberService.ROLE_HOSPITAL);
			result = memberDao.insertAuthority(map); // ROLE_HOSPITAL
		}
		if (memberType.equals("mall")) {
			map.remove("auth");
			map.put("auth", MemberService.ROLE_MALL);
			result = memberDao.insertAuthority(map); // ROLE_MALL
		}
		return result;
	}

	@Override
	public int insertAddress(Address address) {
		return memberDao.insertAddress(address);
	}

	@Override
	public int resetPassword(Map<String, Object> param) {
		return memberDao.resetPassword(param);
	}
	
	@Override
	public List<Member> selectMemberList() {
		return memberDao.selectMemberList();
	}
	
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateMemberRole(String memberId, List<String> authorities) {
		// 기존권한 삭제
		int result = memberDao.deleteMemeberRole(memberId);
		// 새권한 등록
		for(String auth : authorities) {
			Map<String, Object> map = new HashMap<>();
			map.put("memberId", memberId);
			map.put("auth", auth);
			result = memberDao.insertAuthority(map);
		}
		return result;
	}
	
}
