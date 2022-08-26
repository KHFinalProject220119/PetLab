package com.kh.petlab.member.model.dto;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

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
public class Member extends MemberEntity implements UserDetails {
	private List<Attachment> attachments = new ArrayList<>();
	List<SimpleGrantedAuthority> authorities;
	private Attachment attach;	
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authorities;
	}

	@Override
	public String getUsername() {
		return memberId;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	
	public void addAttachment(@NonNull Attachment attachment) {
		attachments.add(attachment);

	}
	

	public Member(List<Attachment> attachments, List<SimpleGrantedAuthority> authorities, Attachment attach) {
		super();
		this.attachments = attachments;
		this.authorities = authorities;
		this.attach = attach;
	}

  
}