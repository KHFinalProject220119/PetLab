package com.kh.petlab.member.model.dto;

import java.time.LocalDateTime;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.kh.petlab.common.PetLabUtils;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class MemberEntity {

	@NonNull
	protected String memberId;
	protected String attachGroupId;
	protected int gradeNo;
	protected String password;
	@NonNull
	protected String memberName;
	@NonNull
	protected String nickname;
	@NonNull
	protected String phone;
	@NonNull
	protected String email;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	protected Date birthday;
	protected Gender gender;
	protected String memberSocial;
	protected String recommendedId;
	protected int membershipPoint;
	protected int point;
	protected boolean enabled;
	protected LocalDateTime enrollDate;
}
