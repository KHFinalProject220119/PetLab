package com.kh.petlab.store.model.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petlab.member.model.dto.Attachment;
import com.kh.petlab.store.model.dao.StoreDao;
import com.kh.petlab.store.model.dto.ProductEntity;

@Service
public class StoreServiceImpl implements StoreService {
	@Autowired
	private StoreDao storeDao;
	
	
	/*
	 * @Override public void insertProduct(ProductEntity product) {
	 * storeDao.insertProduct(product); }
	 */
	
	@Override
	public int insertProduct(ProductEntity product) {
		int result = 0;
		result = storeDao.insertProduct(product);
		
		List<Attachment> attachment  = product.getAttachment();
		
		if(attachment !=null) {
			for(Attachment attach: attachment) {
				attach.setAttachGroupId(product.getAttachgroupId());
				result = storeDao.insertAttachment(attach);
			}
		}
		return result;
	}
}
