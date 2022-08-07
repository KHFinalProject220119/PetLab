package com.kh.petlab.store.model.dto;

import java.util.List;


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
	private String productName;
	private int productPrice;
	private String productDes;
	
	/* private List<ProductAttachment> attachList; */
}
