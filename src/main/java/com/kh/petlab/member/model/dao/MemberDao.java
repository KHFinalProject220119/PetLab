package com.kh.petlab.member.model.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kh.petlab.member.model.dto.Address;
import com.kh.petlab.member.model.dto.Member;

@Mapper
public interface MemberDao {

	Member selectOneMember(String memberId);

	Member selectOneMemberByNickname(String nickname);

	Member selectOneMemberByEmail(String email);

	int insertMember(Member member);

	int insertAuthority(Map<String, Object> map);

	int insertAddress(Address address);

}
