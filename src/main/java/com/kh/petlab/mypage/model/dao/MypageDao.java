package com.kh.petlab.mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kh.petlab.member.model.dto.Address;
import com.kh.petlab.member.model.dto.Member;

@Mapper
public interface MypageDao {

	int insertMember(Member member);

	Member selectOneMember(String memberId);

	int updateMember(Member member);

	int insertAuthority(Member member);

	List<Member> selectMemberList();

	Address selectAddress(String memberId);

}
