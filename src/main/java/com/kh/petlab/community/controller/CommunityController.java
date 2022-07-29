package com.kh.petlab.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
@Controller
@RequestMapping("/community")
@Slf4j

public class CommunityController {
	
	@GetMapping("/communityMain")
	public void storeMain() {}
	
}
