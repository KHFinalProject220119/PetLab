package com.kh.petlab.mypage.model.dto;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import com.kh.petlab.member.model.dto.Gender;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class MyPetEntity {
	
	
	protected int petNo; // 등록시 발생번호
	@NonNull
	protected String memberId; // 반려동물 집사아이디
	@NonNull
	protected String typeId; // 동물 분류 (ex 개, 고양이, 기타)
	@NonNull
	protected String breed; // 동물 소분류 (ex 푸들, 샴 ...)
	
	protected String attachGroupId; // 첨부파일
	protected String petId; // 칩 등록번호
	protected String weight; // 무게
	
	@NonNull
	protected String petName; // 동물 이름
	@NonNull
	protected Gender gender; // 성별
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	protected LocalDate birthday; // 생일
	
	protected String neutering ; // 중성화 여부
	
	
}
