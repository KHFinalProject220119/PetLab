package com.kh.petlab.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
@Controller
@RequestMapping("/store")
@Slf4j
public class StoreController {

	
	@GetMapping("/storeMain")
	public void storeMain() {}
	
}
