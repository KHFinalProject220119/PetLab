package com.kh.petlab.customerservice.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.petlab.customerservice.model.dao.CustomerServiceDao;
import com.kh.petlab.customerservice.model.dto.CsEmailLog;
import com.kh.petlab.member.model.dao.MemberDao;
import com.kh.petlab.member.model.dto.Attachment;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	CustomerServiceDao customerServiceDao;
	
	@Autowired
	MemberDao memberDao;

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int sendEmail(CsEmailLog emailLog) {
		int result = 0;
		List<Attachment> attachments = emailLog.getAttachments(); 
		 if(!attachments.isEmpty()) {
			 for(Attachment attach : attachments) {
				 result = memberDao.insertAttachment(attach);
				 emailLog.setAttachGroupId(attach.getAttachGroupId());
			} 
		 }
		result = customerServiceDao.sendEmail(emailLog);
		return result;
	}
	
	
}
