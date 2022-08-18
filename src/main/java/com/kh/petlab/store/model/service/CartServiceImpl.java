package com.kh.petlab.store.model.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petlab.member.model.dto.Member;
import com.kh.petlab.store.model.dao.CartDao;
import com.kh.petlab.store.model.dto.Cart;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDao cartDao;

	@Override
	public List<Cart> CartList(String memberId) {
		return cartDao.CartList(memberId);
	}

	@Override
	public void insertCart(Cart cart) {
		cartDao.insertCart(cart);
	}

	@Override
	public int deleteCart(int no) {
		int result = cartDao.deleteCart(no);
		return result;
	}

}
