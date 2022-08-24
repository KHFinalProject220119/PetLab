package com.kh.petlab.mypage.model.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
	
@Data
@NoArgsConstructor
@ToString(callSuper = true)
public class MyPet extends MyPetEntity{
	private String attachGroupId;

	public void addAttachment(PetAttachment attach) {
		
	}

	
}

