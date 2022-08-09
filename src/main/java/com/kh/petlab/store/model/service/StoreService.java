package com.kh.petlab.store.model.service;

import java.util.List;

import com.kh.petlab.store.model.dto.Product;
import com.kh.petlab.store.model.dto.ProductAttachment;
import com.kh.petlab.store.model.dto.ProductdesAttachment;

public interface StoreService {

	List<Product> selectProductList(int cPage,int numPerPage);
	List<ProductAttachment> selectattToyList();
	List<ProductAttachment> selectattBagList();
	List<ProductAttachment> selectattBrushList();
	List<ProductAttachment> selectattPadList();
	List<ProductAttachment> selectattShamList();
	List<ProductAttachment> selectattFeedingList();
	List<ProductAttachment> selectattSnackList();
	List<ProductAttachment> selectattFeedList();
	
	int selectTotalContent();
	
	int insertProduct(Product product);

	int deleteProduct(int no);
	
	Product selectOneProductCollection(int no);
	Product selectOneProductdesCollection(int no);
	
	Product selectOneProduct(int no);
	
	ProductAttachment selectOneAttachment(int no);
	ProductdesAttachment selectOnedesAttachment(int no);
	
	int deleteAttachment(int no);
	int deletedesAttachment(int no);
	

	
	int updateProduct(Product product);


}
