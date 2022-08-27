package com.kh.petlab;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.petlab.hospital.model.service.HospitalService;
import com.kh.petlab.store.model.dto.Product;
import com.kh.petlab.store.model.service.StoreService;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
 
	/*
	 * @Autowired HospitalService hospitalService;
	 * 
	 * @Autowired StoreService storeService;
	 * 
	 * 
	 * @RequestMapping(value = "/", method = RequestMethod.GET) public ModelAndView
	 * home(ModelAndView mav) { List<Product> productList =
	 * storeService.selectProductLists(); log.debug("productList = {}",
	 * productList); System.out.println("productList = " + productList);
	 * mav.addObject("productList", productList); mav.setViewName("/"); return mav;
	 * }
	 */
	
}
