package com.kh.petlab.store.model.dto;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;


import com.kh.petlab.store.model.dto.ProductEntity;
import com.kh.petlab.store.model.dto.ProductAttachment;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString(callSuper = true)
public class Product extends ProductEntity {
	private int attachCount;
	 private List<ProductAttachment> attachments = new ArrayList<>(); 
	//private ProductAttachment attach;

	

	/*
	 * public Product(int productNo, String categoryId, String categorySubId, String
	 * productName, int productPrice, String productDes) {
	 * super(productNo,categoryId,categorySubId,productName,productPrice,productDes)
	 * ; this.attachCount = attachCount; }
	 */
	
		public Product(List<ProductAttachment> attachments) {
			super();
			this.attachments = attachments;
		}

		public void addAttachment(@NonNull ProductAttachment attachment) {
			attachments.add(attachment);
	}
}
