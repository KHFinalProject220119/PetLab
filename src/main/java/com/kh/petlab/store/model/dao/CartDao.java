package com.kh.petlab.store.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.petlab.store.model.dto.Cart;




@Mapper
public interface CartDao {
	
	//장바구니 목록 조회
	List<Cart> CartList(String memberId);
	
	//장바구니 추가
	void insertCart(Cart cart);
	
	//장바구니 삭제
	int deleteCart(int no);
	
	int countCart(Cart cart);
	
	
	
	
	
}
