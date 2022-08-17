package com.kh.petlab.store.model.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.kh.petlab.store.model.dto.Cart;

public interface CartService {

	List<Cart> CartList(String memberId);
	
	void insertCart(Cart cart);

	int deleteCart(int no);

}
