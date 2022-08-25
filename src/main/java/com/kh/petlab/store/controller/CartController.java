package com.kh.petlab.store.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.petlab.member.model.service.MemberService;
import com.kh.petlab.store.model.dto.Cart;
import com.kh.petlab.store.model.dto.Product;
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
		
		if(count == 0) {
			cartService.insertCart(cart); 
		} else { 
			
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
	
	
	
	//장바구니 전체삭제
	// 상품삭제
	@RequestMapping(value = "/deleteAllCart", method = RequestMethod.GET)
	public String deleteProduct(HttpSession session,  RedirectAttributes rt) {
		String memberId = (String)session.getAttribute("memberId");
		int result = cartService.deleteAllCart(memberId);
		return "redirect:/store/cart/cartList";

	}
	
}
