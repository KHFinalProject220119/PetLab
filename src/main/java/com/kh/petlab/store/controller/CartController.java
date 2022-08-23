package com.kh.petlab.store.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.petlab.member.model.service.MemberService;
import com.kh.petlab.store.model.dto.Cart;
import com.kh.petlab.store.model.service.CartService;
import com.kh.petlab.store.model.service.StoreService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/store/cart")
@Slf4j
public class CartController {

	@Autowired
	CartService cartService;

	@Autowired
	StoreService storeService;

	@Autowired
	MemberService memberService;

	@Autowired
	ServletContext application;

//mav.setViewName("store/cart/addCart");
	@RequestMapping(value="/addCart")
	public String insertCart(Cart cart, HttpSession session) {
		
		String memberId = (String)session.getAttribute("memberId");

		//cart.setMemberId(memberId);
		
		// (1) 동일 상품이 존재하는지 확인
		int count = cartService.sameProduct(cart.getProductNo(), memberId);
		
		if(count == 0) { // 동일 상품이 존재하지 않으면
			cartService.insertCart(cart); // (2) 장바구에 새로 추가
		} else { 
			// (3) 존재하면 장바구니에서 해당 상품의 주문수량 변경
			cartService.productCount(cart);
		}


	return "redirect:/store/cart/cartList";

	}

	@RequestMapping("/cartList")
	public String cartList(HttpSession session, Model model) {
		
		String memberId = (String)session.getAttribute("memberId");
		List<Cart> cartList = cartService.CartList(memberId);
		model.addAttribute("cartList", cartList);
		
		return "store/cart/cartList";
	}
}
