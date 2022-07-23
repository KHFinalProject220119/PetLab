package com.kh.petlab.member.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Address {
	private int addressNo;
	private String memberId;
	private String addressTitle;
	private String postcode;
	private String address;
	private String addressDetail;
	private String addressExtra;
}
