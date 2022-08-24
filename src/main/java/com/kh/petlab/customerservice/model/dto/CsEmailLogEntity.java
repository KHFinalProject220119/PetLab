package com.kh.petlab.customerservice.model.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CsEmailLogEntity {
	protected int csEmailLogNo;
	protected int questionType;
	protected String name;
	protected String email;
	protected String title;
	protected String content;
	protected LocalDateTime regeDate;
	protected String attachGroupId;
	
	
	
}
