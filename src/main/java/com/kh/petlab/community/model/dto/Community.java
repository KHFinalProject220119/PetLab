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
public class Community{
	
	private int freebNo;
	private String freebTitle;
	private String content;
	private int readCount;
	private LocalDateTime regDate;
	private int likeCount;
}
