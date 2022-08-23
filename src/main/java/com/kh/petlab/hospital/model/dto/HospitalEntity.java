package com.kh.petlab.hospital.model.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class HospitalEntity {

	protected String id;
	protected String attachGroupId;
	protected String placeName;
	protected String tel;
	protected String addressName;
	protected String roadAddressName;
	protected int distance;
	protected String operationHours;
	protected String placeUrl;
	protected String content;
	protected Isparked isparked;
	protected String chiefVeterinarian;
	protected int cntVeterinarian;
	protected double x;
	protected double y;
	protected LocalDateTime enrollDate;
}
