package com.kh.petlab.store.model.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.kh.petlab.store.model.dto.Cart;

public interface CartService {

	List<Cart> CartList(String memberId);
	
	void insertCart(Cart cart);

	int deleteAllCart(String memberId);
	int deleteCart(int no);
	
	int sameProduct(int productNo, String memberId);

	void productCount(Cart cart);
}
