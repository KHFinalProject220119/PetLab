package com.kh.petlab.store.model.service;

import java.util.List;

import com.kh.petlab.store.model.dto.Product;
import com.kh.petlab.store.model.dto.ProductAttachment;
import com.kh.petlab.store.model.dto.ProductdesAttachment;

public interface StoreService {

	List<Product> selectProductList(int cPage,int numPerPage);
	
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
