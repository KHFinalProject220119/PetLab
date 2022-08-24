package com.kh.petlab.store.model.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor 
public class ProductAttachment{
	
	private int No;
	private int productNo;
	private String originalFilename; 
	private String renamedFilename; 

}
