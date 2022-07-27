package com.kh.petlab.store.model.dto;

import java.time.LocalDateTime;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cart {

	private int cartNo;
	private String productId;
	private String memberId;
	private int productCount;
}
