package com.kh.petlab.mypage.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class MyPetEntity {
	
	@NonNull
	protected int pet_no;
	protected String member_Id;
	protected String type_Id;
	protected String breed_id;
	
	protected String attach_Group_Id;
	protected String pet_Id;
	
	
}
