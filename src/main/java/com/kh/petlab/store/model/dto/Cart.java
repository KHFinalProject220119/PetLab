package com.kh.petlab.store.model.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Cart extends CartEntity{
        private int totalSum;
    private Product product;

    public Cart(int totalSum, Product product) {
        super();
        this.totalSum = totalSum;
                this.product = product;      
    }
}