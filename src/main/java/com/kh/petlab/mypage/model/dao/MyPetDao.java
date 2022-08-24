package com.kh.petlab.mypage.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.petlab.mypage.model.dto.MyPet;

@Mapper
public interface MyPetDao {
	
	int insertMyPet(MyPet mypet);

	MyPet selectOneMyPet(String memberId);

	int updateMyPet (MyPet mypet);

	List<MyPet> selectPetList();

}

