package com.kh.petlab.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;


import com.kh.petlab.mypage.model.service.MypageService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/mypage")
@Slf4j
public class MyPagePetController {
	
	@Autowired
	MypageService mypageService;
	
	@GetMapping("/myPetHome")
	public void myPetHome() {
		
	}
	
	@GetMapping("/myPetEnroll")
	public void myPetEnroll() {
		
	}
	
	@GetMapping("/myPetUpdate")
	public void myPetUpdate() {
		
	}
	
	
	
	
}

