package com.kh.petlab.store.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.kh.petlab.member.model.dto.Attachment;
import com.kh.petlab.store.model.dto.ProductEntity;

@Mapper
public interface StoreDao {
	/* int insertProduct(ProductEntity product); */
	int insertProduct(ProductEntity product);
	
	int insertAttachment(Attachment attach);
}
