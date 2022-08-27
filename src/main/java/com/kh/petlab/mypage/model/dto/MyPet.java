package com.kh.petlab.mypage.model.dto;
import com.kh.petlab.member.model.dto.Member;

import java.util.ArrayList;
import java.util.List;


import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
	
@Data
@NoArgsConstructor
@ToString(callSuper = true)
public class MyPet extends MyPetEntity{
	private int attachCount;
	private List<PetAttachment> attachments = new ArrayList<>();
	private Member member;	


	public void addAttachment(PetAttachment attach) {
		attachments.add(attach);
	}
	
	public MyPet(int attachCount, List<PetAttachment> attachments, Member member) {
		super();
		this.attachCount = attachCount;
		this.attachments = attachments;
		this.member = member;
	}
	
}

