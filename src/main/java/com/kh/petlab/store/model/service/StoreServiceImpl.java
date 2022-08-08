package com.kh.petlab.store.model.service;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.petlab.store.model.dao.StoreDao;
import com.kh.petlab.store.model.dto.Product;
import com.kh.petlab.store.model.dto.ProductAttachment;
import com.kh.petlab.store.model.dto.ProductdesAttachment;



@Service
public class StoreServiceImpl implements StoreService {
	@Autowired
	private StoreDao storeDao;

	@Transactional(readOnly = true)
	@Override
	public List<Product> selectProductList(int cPage, int numPerPage) {
		int offset = (cPage - 1) * numPerPage;
		int limit = numPerPage;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return storeDao.selectProductList(rowBounds);
	}

	@Override
	public int selectTotalContent() {
		return storeDao.selectTotalContent();
	}

	@Override
	public int insertProduct(Product product) {
		int result = 0;

		result = storeDao.insertProduct(product);

		List<ProductAttachment> attachments = product.getAttachments();
		List<ProductdesAttachment> att = product.getAtt();

		if (attachments != null) {
			
			for(ProductAttachment attach: attachments) {
				attach.setProductNo(product.getProductNo());
				
				result = storeDao.insertAttachment(attach);
			}
		}
		
		if (att != null) {
			
			for(ProductdesAttachment a: att) {
				a.setProductNo(product.getProductNo());
				
				result = storeDao.insertdesAttachment(a);
			}
		}

		return result;
	}

	@Override
	public Product selectOneProductCollection(int no) {
		return storeDao.selectOneProductCollection(no);
	}
	
	@Override
	public Product selectOneProductdesCollection(int no) {
		return storeDao.selectOneProductdesCollection(no);
	}

	@Override
	public int deleteProduct(int no) {
		return storeDao.deleteProduct(no);
	}
	
	
	@Override
	public Product selectOneProduct(int no) {
		Product product = storeDao.selectOneProduct(no);
		List<ProductAttachment> attachments = storeDao.selectAttachmentListByProductNo(no);
		product.setAttachments(attachments);
		List<ProductdesAttachment> att = storeDao.selectdesAttachmentListByProductNo(no);
		product.setAtt(att);
		
		return product;
	}

	@Override
	public ProductAttachment selectOneAttachment(int no) {
		return storeDao.selectOneAttachment(no);
	}
	
	@Override
	public ProductdesAttachment selectOnedesAttachment(int no) {
		return storeDao.selectOnedesAttachment(no);
	}
	
	

	@Override
	public int deleteAttachment(int no) {
		return storeDao.deleteAttachment(no);
	}

	@Override
	public int updateProduct(Product product) {
		// a. board 수정
				int result = storeDao.updateProduct(product);
				
				// b. attachment테이블의 등록
				List<ProductAttachment> attachments = product.getAttachments();
				if(!attachments.isEmpty()) {
					for(ProductAttachment attach : attachments)
						result = storeDao.insertAttachment(attach);
				}
				return result;
	}

	@Override
	public int deletedesAttachment(int no) {
		return storeDao.deletedesAttachment(no);
	}



	
	
	
	
	
	
	
	
	
	
	
	
	
	

	// public int insertProduct(Product product) {
	// int result = storeDao.insertProduct(product);

	// ProductAttachment attach = product.getAttach();
	// if(attach !=null) {
	// attach.setProductNo(product.getProductNo());
	// result = storeDao.insertAttachment(attach);
	// }
	// return result;
	// }

	// @Override
	// public int insertProduct(Product product) {
	// 1. board insert
	// int result = storeDao.insertProduct(product);

	// 2. attachments insert
	// List<ProductAttachment> attachments = product.getAttach();
	// if(!attachments.isEmpty()) {
	// for(ProductAttachment attach : attachments) {
	// attach.setProductNo(product.getProductNo());
	// result = storeDao.insertAttachment(attach);
	// }
	// }
	// return result;
	// }

}
