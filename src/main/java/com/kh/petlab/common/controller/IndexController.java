package com.kh.petlab.common.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.petlab.community.model.dto.CommunityPhoto;
import com.kh.petlab.community.model.service.CommunityService;
import com.kh.petlab.hospital.model.service.HospitalService;
import com.kh.petlab.member.model.dto.Attachment;
import com.kh.petlab.store.model.dto.Product;
import com.kh.petlab.store.model.dto.ProductAttachment;
import com.kh.petlab.store.model.service.StoreService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class IndexController {

	@Autowired
	HospitalService hospitalService;
	
	@Autowired
	StoreService storeService;
	
	@Autowired
	CommunityService communityService;
	
	@GetMapping("/")
	public ModelAndView home(ModelAndView mav) {
		    try {
				List<Product> productList = storeService.selectProductLists(); 
				List<CommunityPhoto> photoList = communityService.selectPhotoListForIndex();
			
				mav.addObject("photoList", photoList);
				mav.addObject("productList", productList);
				mav.setViewName("/index");
			} catch (Exception e) {
				e.printStackTrace();
			}
			return mav;
	}
}
