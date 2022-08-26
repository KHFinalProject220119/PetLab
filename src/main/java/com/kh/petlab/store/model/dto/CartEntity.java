package com.kh.petlab.store.model.dto;

import java.time.LocalDateTime;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartEntity {

	private int cartNo;
	private int productNo;
	private String memberId;
	private int productCount;
	private int productPrice;
	private String productName;
}

