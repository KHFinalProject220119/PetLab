package com.kh.petlab.store.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.petlab.common.PetLabUtils;
import com.kh.petlab.member.model.dto.Attachment;
import com.kh.petlab.store.model.dto.ProductEntity;
import com.kh.petlab.store.model.service.StoreService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/store")
@Slf4j
public class StoreController {

	@Autowired
	StoreService storeService;
	
	@Autowired
	ServletContext application;
	
	@GetMapping("/storeMain")
	public void storeMain() {}

	/*
	 * @GetMapping("/mall/insertProduct") public void insertProduct() {}
	 */

	/*
	 * @GetMapping("/mall/insertProduct") public String insertProduct (ProductEntity
	 * product , RedirectAttributes redirectAttr) { log.info("insert product . . ."
	 * + product); storeService.insertProduct(product);
	 * redirectAttr.addFlashAttribute("Result=",product.getProductId());
	 * 
	 * return "/store/mall/insertProduct";
	 * 
	 * }
	 */

	/* @RequestMapping("/mall/insertProduct") */
	
	//접속
	@RequestMapping(value = "/mall/insertProduct", method = RequestMethod.GET)
	public void insertProduct() {
	}
	
	//등록
	 @RequestMapping(value="/mall/insertProduct",method=RequestMethod.POST)
	public String insertProduct (ProductEntity product , RedirectAttributes redirectAttr,
			HttpServletRequest request,@RequestParam("file") MultipartFile[] upFiles) 
	 {
	
		
		try {
			List<Attachment> attach = new ArrayList<>();
			String saveDirectory = application.getRealPath("/resources/upload/store/mall");

			for(MultipartFile upFile : upFiles) {
				if(upFile.getSize() > 0) {
					String originalFilename = upFile.getOriginalFilename();
					String renamedFilename = PetLabUtils.getRenamedFilename(originalFilename);
					
					File file = new File(saveDirectory,renamedFilename);
					try {
						upFile.transferTo(file);
					}catch(Exception e) {
						e.printStackTrace();
					}
					
					Attachment att = new Attachment();
					att.setOriginalFilename(upFile.getOriginalFilename());
					att.setRenamedFilename(renamedFilename);
					attach.add(att);
 				}
			}
			product.setAttachment(attach);
			
			try {
				
				int result = storeService.insertProduct(product);
				String msg = "상품 등록 완료";
				redirectAttr.addFlashAttribute("msg",msg);
			}catch(Exception e) {
				log.error("상품 등록 오류", e);
				throw e;				
			}
		}catch(Exception e) {
			log.error("상품 등록 오류", e);
			throw e;
		}
		

		return "/store/storeMain";
		//return "/store/storeMain";
	}
	
}
