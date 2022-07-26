package com.kh.petlab.store.model.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductSubCategory {
	private String categorySubId;
	private String categoryId;
	private String categoryName;
}
