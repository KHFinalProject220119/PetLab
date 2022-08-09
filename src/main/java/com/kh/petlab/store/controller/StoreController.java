package com.kh.petlab.store.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.petlab.common.PetLabUtils;
import com.kh.petlab.store.model.dto.Product;
import com.kh.petlab.store.model.dto.ProductAttachment;
import com.kh.petlab.store.model.dto.ProductdesAttachment;
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
	public void storeMain() {
	}

	@GetMapping("/mall/productFeed")
	public ModelAndView productFeed(@RequestParam(defaultValue = "1") int cPage, ModelAndView mav,
			HttpServletRequest request) {
		try {
			// 목록조회
			int numPerPage = 10;
			List<Product> list = storeService.selectProductList(cPage, numPerPage);
			log.debug("list = {}", list);
			mav.addObject("list", list);

			mav.setViewName("store/mall/productFeed");

			// 페이지바
			int totalContent = storeService.selectTotalContent();

			String url = request.getRequestURI();
			String pagebar = PetLabUtils.getPagebar(cPage, numPerPage, totalContent, url);

			mav.addObject("pagebar", pagebar);

		} catch (Exception e) {
			log.error("상품(사료) 목록 조회 오류", e);
		}
		return mav;
	}

	@GetMapping("/mall/productSnack")
	public ModelAndView productSnack(@RequestParam(defaultValue = "1") int cPage, ModelAndView mav,
			HttpServletRequest request) {
		try {
			// 목록조회
			int numPerPage = 5;
			List<Product> list = storeService.selectProductList(cPage, numPerPage);
			log.debug("list = {}", list);
			mav.addObject("list", list);

			mav.setViewName("store/mall/productSnack");

			// 페이지바
			int totalContent = storeService.selectTotalContent();

			String url = request.getRequestURI();
			String pagebar = PetLabUtils.getPagebar(cPage, numPerPage, totalContent, url);

			mav.addObject("pagebar", pagebar);

		} catch (Exception e) {
			log.error("상품(간식) 목록 조회 오류", e);
		}
		return mav;
	}

	@GetMapping("/mall/productFeeding")
	public ModelAndView productFeeding(@RequestParam(defaultValue = "1") int cPage, ModelAndView mav,
			HttpServletRequest request) {
		try {
			// 목록조회
			int numPerPage = 5;
			List<Product> list = storeService.selectProductList(cPage, numPerPage);
			log.debug("list = {}", list);
			mav.addObject("list", list);

			mav.setViewName("store/mall/productFeeding");

			// 페이지바
			int totalContent = storeService.selectTotalContent();

			String url = request.getRequestURI();
			String pagebar = PetLabUtils.getPagebar(cPage, numPerPage, totalContent, url);

			mav.addObject("pagebar", pagebar);

		} catch (Exception e) {
			log.error("상품(급식/급수기) 목록 조회 오류", e);
		}
		return mav;
	}

	@GetMapping("/mall/productShampoo")
	public ModelAndView productShampoo(@RequestParam(defaultValue = "1") int cPage, ModelAndView mav,
			HttpServletRequest request) {
		try {
			// 목록조회
			int numPerPage = 5;
			List<Product> list = storeService.selectProductList(cPage, numPerPage);
			log.debug("list = {}", list);
			mav.addObject("list", list);

			mav.setViewName("store/mall/productShampoo");

			// 페이지바
			int totalContent = storeService.selectTotalContent();

			String url = request.getRequestURI();
			String pagebar = PetLabUtils.getPagebar(cPage, numPerPage, totalContent, url);

			mav.addObject("pagebar", pagebar);

		} catch (Exception e) {
			log.error("상품(샴푸/세정제) 목록 조회 오류", e);
		}
		return mav;
	}

	@GetMapping("/mall/productPad")
	public ModelAndView productPad(@RequestParam(defaultValue = "1") int cPage, ModelAndView mav,
			HttpServletRequest request) {
		try {
			// 목록조회
			int numPerPage = 5;
			List<Product> list = storeService.selectProductList(cPage, numPerPage);
			log.debug("list = {}", list);
			mav.addObject("list", list);

			mav.setViewName("store/mall/productPad");

			// 페이지바
			int totalContent = storeService.selectTotalContent();

			String url = request.getRequestURI();
			String pagebar = PetLabUtils.getPagebar(cPage, numPerPage, totalContent, url);

			mav.addObject("pagebar", pagebar);

		} catch (Exception e) {
			log.error("상품(배변판/패드) 목록 조회 오류", e);
		}
		return mav;
	}

	@GetMapping("/mall/productBrush")
	public ModelAndView productBrush(@RequestParam(defaultValue = "1") int cPage, ModelAndView mav,
			HttpServletRequest request) {
		try {
			// 목록조회
			int numPerPage = 5;
			List<Product> list = storeService.selectProductList(cPage, numPerPage);
			log.debug("list = {}", list);
			mav.addObject("list", list);

			mav.setViewName("store/mall/productBrush");

			// 페이지바
			int totalContent = storeService.selectTotalContent();

			String url = request.getRequestURI();
			String pagebar = PetLabUtils.getPagebar(cPage, numPerPage, totalContent, url);

			mav.addObject("pagebar", pagebar);

		} catch (Exception e) {
			log.error("상품(브러쉬/가위) 목록 조회 오류", e);
		}
		return mav;
	}

	@GetMapping("/mall/productToy")
	public ModelAndView productToy(@RequestParam(defaultValue = "1") int cPage, ModelAndView mav,
			HttpServletRequest request) {
		try {
			// 목록조회
			int numPerPage = 5;
			List<Product> list = storeService.selectProductList(cPage, numPerPage);
			log.debug("list = {}", list);
			mav.addObject("list", list);

			mav.setViewName("store/mall/productToy");

			// 페이지바
			int totalContent = storeService.selectTotalContent();

			String url = request.getRequestURI();
			String pagebar = PetLabUtils.getPagebar(cPage, numPerPage, totalContent, url);

			mav.addObject("pagebar", pagebar);

		} catch (Exception e) {
			log.error("상품(장난감/스크래쳐) 목록 조회 오류", e);
		}
		return mav;
	}


	@GetMapping("/mall/productBag")
	public ModelAndView producBag(@RequestParam(defaultValue = "1") int cPage, ModelAndView mav,
			HttpServletRequest request) {
		try {
			// 목록조회
			int numPerPage = 5;
			List<Product> list = storeService.selectProductList(cPage, numPerPage);
			log.debug("list = {}", list);
			mav.addObject("list", list);

			mav.setViewName("store/mall/productBag");

			// 페이지바
			int totalContent = storeService.selectTotalContent();

			String url = request.getRequestURI();
			String pagebar = PetLabUtils.getPagebar(cPage, numPerPage, totalContent, url);

			mav.addObject("pagebar", pagebar);

		} catch (Exception e) {
			log.error("상품(이동가방) 목록 조회 오류", e);
		}
		return mav;
	}

	// 등록화면
	@RequestMapping(value = "/mall/insertProduct", method = RequestMethod.GET)
	public void insertProduct() {
	}

	// 상품목록(사료)
	@GetMapping("/mall/feedMain")
	public ModelAndView feedproductList(@RequestParam(defaultValue = "1") int cPage, ModelAndView mav,
			HttpServletRequest request) {
		try {
			// 목록조회
			int numPerPage = 5;
			List<Product> list = storeService.selectProductList(cPage, numPerPage);
			log.debug("list = {}", list);
			mav.addObject("list", list);

			// 페이지바
			int totalContent = storeService.selectTotalContent();

			String url = request.getRequestURI();
			String pagebar = PetLabUtils.getPagebar(cPage, numPerPage, totalContent, url);

			mav.addObject("pagebar", pagebar);

			/*
			 * // viewName설정 mav.setViewName("store/mall/feedMain");
			 */
		} catch (Exception e) {
			log.error("상품(사료) 목록 조회 오류", e);
		}
		return mav;
	}

	// 상품목록(목욕)
	@GetMapping("/mall/bathMain")
	public ModelAndView bathproductList(@RequestParam(defaultValue = "1") int cPage, ModelAndView mav,
			HttpServletRequest request) {
		try {
			// 목록조회
			int numPerPage = 5;
			List<Product> list = storeService.selectProductList(cPage, numPerPage);
			log.debug("list = {}", list);
			mav.addObject("list", list);

			// 페이지바
			int totalContent = storeService.selectTotalContent();

			String url = request.getRequestURI();
			String pagebar = PetLabUtils.getPagebar(cPage, numPerPage, totalContent, url);

			mav.addObject("pagebar", pagebar);

			/*
			 * // viewName설정 mav.setViewName("store/mall/feedMain");
			 */
		} catch (Exception e) {
			log.error("상품(목욕) 목록 조회 오류", e);
		}
		return mav;
	}

	// 상품목록(기타)
	@GetMapping("/mall/etcMain")
	public ModelAndView etcproductList(@RequestParam(defaultValue = "1") int cPage, ModelAndView mav,
			HttpServletRequest request) {
		try {
			// 목록조회
			int numPerPage = 5;
			List<Product> list = storeService.selectProductList(cPage, numPerPage);
			log.debug("list = {}", list);
			mav.addObject("list", list);

			// 페이지바
			int totalContent = storeService.selectTotalContent();

			String url = request.getRequestURI();
			String pagebar = PetLabUtils.getPagebar(cPage, numPerPage, totalContent, url);

			mav.addObject("pagebar", pagebar);

			/*
			 * // viewName설정 mav.setViewName("store/mall/feedMain");
			 */
		} catch (Exception e) {
			log.error("상품(기타) 목록 조회 오류", e);
		}
		return mav;
	}

	// 상품등록
	@RequestMapping(value = "/mall/insertProduct", method = RequestMethod.POST)
	public ModelAndView insertProduct(Product product,
			@RequestParam(value="upFile",required = true) MultipartFile[] upFiles, 
			@RequestParam(value="desFile",required = true) MultipartFile[] upFiless, 
			HttpServletRequest request,
			RedirectAttributes redirectAttr, ModelAndView mav) {
		
		
		log.debug("upFile = {}", upFiles);

		try {

			String saveDirectory = application.getRealPath("/resources/upload/store/mall");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd_HHmmssSSS_");

			// 업로드 파일 저장
			for (MultipartFile upFile : upFiles) {
				if (upFile.getSize() > 0) {
					String originalFilename = upFile.getOriginalFilename();
					String renamedFilename = PetLabUtils.getRenamedFilename(originalFilename);

					File destFile = new File(saveDirectory, renamedFilename);
					upFile.transferTo(destFile); // 파일저장
					ProductAttachment attach = new ProductAttachment();

					attach.setOriginalFilename(originalFilename);
					attach.setRenamedFilename(renamedFilename);

					product.addAttachment(attach);
					
				}
			}
			
			for (MultipartFile desFile : upFiless) {
				if (desFile.getSize() > 0) {
					String originalFilename = desFile.getOriginalFilename();
					String renamedFilename = PetLabUtils.getRenamedFilename(originalFilename);

					File destFile = new File(saveDirectory, renamedFilename);
					desFile.transferTo(destFile); // 파일저장
					ProductdesAttachment attach = new ProductdesAttachment();

					attach.setOriginalFilename(originalFilename);
					attach.setRenamedFilename(renamedFilename);

					product.adddesAttachment(attach);
					
				}
			}
			int result = storeService.insertProduct(product);
			redirectAttr.addFlashAttribute("msg", "피드 등록 완료 !");

			mav.setViewName("/store/storeMain");

		} catch (Exception e) {
			log.error("상품등록 오류", e);

		}
		//return "redirect:/store/storeMain";
		return mav;
	}
	
	
	
	//상품상세
	@GetMapping("/mall/ProductDetail")
	public ModelAndView ProductDetail(@RequestParam int no, ModelAndView mav) {
		try {

			Product product = storeService.selectOneProductCollection(no);
			Product productdes = storeService.selectOneProductdesCollection(no);
			log.debug("product = {}", product);
			
			mav.addObject("product", product);
			mav.addObject("productdes", productdes);

			mav.setViewName("store/mall/productDetail");
		} catch (Exception e) {
			log.error("상품 상세 페이지 조회 오류", e);
			throw e;
		}
		return mav;
	}
	
	
	
	//상품삭제
	@RequestMapping(value = "/mall/deleteProduct", method = RequestMethod.GET)
	public String deleteProduct(@RequestParam("productNo") int productNo, 
			Product product, RedirectAttributes rt) {
		
		int result = storeService.deleteProduct(productNo);
		return "redirect:/store/storeMain";
		
	}
	
	
	
	//상품수정
	@GetMapping("/mall/updateProduct")
	public void updateProduct(@RequestParam int no, Model model) {
		try {
			Product product = storeService.selectOneProduct(no);
			log.debug("product = {}", product);
			model.addAttribute("product", product);
		} catch (Exception e) {
			log.error("게시글 수정폼 오류", e);
			throw e;
		}
	}
	
	@RequestMapping(value = "/mall/updateProduct", method = RequestMethod.POST)
	public String updateProduct(
			@ModelAttribute Product product,
			@RequestParam("productNo") int productNo,
			@RequestParam("upFile") MultipartFile[] upFiles,
			@RequestParam(value="delFile", required=false) int[] delFiles,
			RedirectAttributes redirectAttr) throws Exception {
		String saveDirectory = application.getRealPath("/resources/upload/store/mall");
		
		try {
			
			// 1. 첨부파일 삭제 (파일 삭제 + table 행삭제)
			// 복수개의 delFilec처리
			if(delFiles != null) {
				for(int attachNo : delFiles) {
					ProductAttachment attach = storeService.selectOneAttachment(attachNo);
					log.debug("attch = {}", attach);
					// a. 첨부파일삭제
					String renamedFilename = attach.getRenamedFilename();
					File delFile = new File(saveDirectory, renamedFilename);
					if(delFile.exists()) {
						delFile.delete();
						log.debug("{}번 {}파일 삭제", attachNo, renamedFilename);
					}
					
					// b. 레코드삭제
					int result = storeService.deleteAttachment(attachNo);
					log.debug("{}번 Attachment 레코드 삭제", attachNo);
				}
			}
			
			// 2. 첨부파일 등록
			for(MultipartFile upFile : upFiles) {
				if(upFile.getSize() > 0) {
					ProductAttachment attach = new ProductAttachment();
					attach.setOriginalFilename(upFile.getOriginalFilename());
					attach.setRenamedFilename(PetLabUtils.getRenamedFilename(upFile.getOriginalFilename()));
					attach.setProductNo(product.getProductNo());
					product.addAttachment(attach);
					
					File destFile = new File(saveDirectory, attach.getRenamedFilename());
					upFile.transferTo(destFile);
				}
			}
		
			// 3. 게시글 수정 (board수정 + 복수개의 attachment 등록)
			int result = storeService.updateProduct(product);
			
			redirectAttr.addFlashAttribute("msg", "게시글을 성공적으로 수정했습니다.");
		} 
		catch(Exception e) {
			log.error("게시글 수정 오류", e);
			throw e;
		}
		return "redirect:/store/mall/ProductDetail?no=" + product.getProductNo();
	}
	

}
