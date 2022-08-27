package com.kh.petlab.mypage.model.service;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.petlab.member.model.dao.MemberDao;
import com.kh.petlab.member.model.dto.Address;
import com.kh.petlab.member.model.dto.Attachment;
import com.kh.petlab.member.model.dto.Member;
import com.kh.petlab.mypage.model.dao.MypageDao;
import com.kh.petlab.mypage.model.dto.MyPet;
import com.kh.petlab.mypage.model.dto.PetAttachment;

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
	public int closeMember(Member member) {
		return mypageDao.closeMember(member);
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
	public MyPet selectOnePet(int petNo) {
		return mypageDao.selectOnePet(petNo);
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

	/**
	 * @Transaction은 Runtime 예외가 발생시에만 rollback처리
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertPet(MyPet mypet) {
		int result =0;
		List<PetAttachment> attachments = mypet.getAttachments(); 
		 if(!attachments.isEmpty()) {
			 for(PetAttachment attach : attachments) {
				 result = mypageDao.attachmentEnroll(attach);
				 mypet.setAttachGroupId(attach.getAttachGroupId());
			} 
		 }		
		result = mypageDao.insertPet(mypet);
		return result;
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public MyPet selectOnePetCollection(int petNo) {
		MyPet mypet = mypageDao.selectOnePetCollection(petNo);
		String attachGroupId = mypet.getAttachGroupId();
		List<PetAttachment> AttachList = mypageDao.selectPetAttachments(attachGroupId);

		if (mypet != null && !AttachList.isEmpty()) {
		mypet.setAttachments(AttachList);
		}
		return mypet;
	}
	
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

	@Override
	public int deleteAttachment(int attachNo) {
		return mypageDao.deleteAttachment(attachNo);
	}

	@Override
	public PetAttachment selectOneAttachment(int attachNo) {
		return mypageDao.selectOneAttachment(attachNo);
	}



}
