package com.kh.petlab.customerservice.model.service;

import com.kh.petlab.customerservice.model.dto.CsEmailLog;

public interface CustomerService {

	int sendEmail(CsEmailLog emailLog);

}
