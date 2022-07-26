package com.kh.petlab.store.model.dto;

import java.time.LocalDateTime;
import java.util.Date;

import com.kh.petlab.member.model.dto.Gender;
import com.kh.petlab.member.model.dto.MemberEntity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductEntity {

	
	private String productId;
	private String categoryId;
	private String categorySubId;
	private String brandId;
	private String productName;
	private int productPrice;
	private String productDes;
	private int productGrade;

}
