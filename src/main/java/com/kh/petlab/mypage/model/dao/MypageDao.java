package com.kh.petlab.mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.RowBounds;

import com.kh.petlab.member.model.dto.Address;
import com.kh.petlab.member.model.dto.Attachment;
import com.kh.petlab.member.model.dto.Member;
import com.kh.petlab.mypage.model.dto.MyPet;

@Mapper
public interface MypageDao {

	int insertMember(Member member);

	Member selectOneMember(String memberId);

	int updateMember(Member member);

	int insertAuthority(Member member);

	List<Member> selectMemberList();

	Address selectAddress(String memberId);

	int updateAddress(Address address);

	int attachmentEnroll(Attachment attachment);

//	MyPet selectPet(String memberId);

	// 펫 목록 조회
	List<MyPet> selectPetList(RowBounds rowBounds);
	
	//펫 등록
	int insertPet(MyPet mypet);

	// 펫 수정
	MyPet selectOnePet(int petNo);
	int updatePet(MyPet mypet);
	
	@Select("select count(*) from pet")
	int selectTotalContent();

	int closeMember(Member member);


}
