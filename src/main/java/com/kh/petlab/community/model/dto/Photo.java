package com.kh.petlab.community.model.dto;

import java.time.LocalDateTime;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString(callSuper = true)
public class Photo {

	private int photoNo;
	private String pTitle;
	private String pContent;
	private int readCount;
	private int likeCount;
	private LocalDateTime regDate;
	
}
