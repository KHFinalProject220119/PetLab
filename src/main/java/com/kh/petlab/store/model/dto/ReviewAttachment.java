package com.kh.petlab.store.model.dto;

import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewAttachment {
	private int attachNo;
	private int reviewNo;
	private String originalFilename;
	private String renamedFilename;
	private LocalDateTime regDate;
}
