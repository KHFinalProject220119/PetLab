package com.kh.petlab.store.model.dto;

import java.util.List;

import com.kh.petlab.member.model.dto.Attachment;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductEntity {

	private int productNo;
	private String categoryId;
	private String categorySubId;
	private String brandId;
	private String attachgroupId;
	private String productName;
	private int productPrice;
	private String productDes;
	
	
	private List<Attachment> attachment;
}
