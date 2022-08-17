package com.kh.petlab.mypage.model.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public class MyPetDao {
	
	int insertMyPet(MyPet mypet);

	MyPet selectOneMyPet(String memberId);

	int updateMyPet (MyPet mypet);

	List<MyPet> selectPetList();

}

