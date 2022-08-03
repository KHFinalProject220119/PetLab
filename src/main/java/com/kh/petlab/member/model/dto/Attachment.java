package com.kh.petlab.member.model.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor 
public class Attachment {

	private String attachGroupId;
	private int attachNo;
	private String originalFilename; 
	private String renamedFilename; 
	private int downloadCount; 
	private LocalDateTime createdAt; 
}
