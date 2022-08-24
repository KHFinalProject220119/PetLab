package com.kh.petlab.customerservice.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.kh.petlab.customerservice.model.dto.CsEmailLog;

@Mapper
public interface CustomerServiceDao {

	int sendEmail(CsEmailLog emailLog);

}
