package com.kh.petlab.store.model.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Cart extends CartEntity{

	private Product product;

	public Cart(Product product) {
		super();
		this.product = product;
	}
	
}
