package com.kh.petlab.mypage.model.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
	
@Data
@NoArgsConstructor
@AllArgsConstructor
public class MyPet {

	private Number petNo ;
	private String petName;
	private String petType;
	private String breed;
	private String gender;
	private String weight;
	private String birthday;
	private String field;		
}
