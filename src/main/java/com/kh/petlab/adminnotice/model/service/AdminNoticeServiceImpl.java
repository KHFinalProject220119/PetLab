package com.kh.petlab.adminnotice.model.service;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.petlab.adminnotice.model.dao.AdminNoticeDao;
import com.kh.petlab.adminnotice.model.dto.AdminNoticeAttachment;
import com.kh.petlab.hospital.model.dto.HosReviewRate;
import com.kh.petlab.hospital.model.dto.PetHosReview;
import com.kh.petlab.member.model.dao.MemberDao;
import com.kh.petlab.member.model.dto.Attachment;
import com.kh.petlab.adminnotice.model.dto.AdminNotice;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional(rollbackFor = Exception.class)
public class AdminNoticeServiceImpl implements AdminNoticeService {
	
	@Autowired
	AdminNoticeDao adminNoticeDao;
	@Autowired
	MemberDao memberDao;
	
	@Transactional(readOnly = true)
	@Override
	public List<AdminNotice> selectAdminNoticeList(int cPage, int numPerPage) {
		int offset = (cPage -1) * numPerPage;
		int limit = numPerPage;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return adminNoticeDao.selectAdminNoticeList(rowBounds);
	}
	
	@Override
	public int selectTotalContent() {
		return adminNoticeDao.selectTotalContent();
	}
	
	/**
	 * @Transaction은 Runtime 예외가 발생시에만 rollback처리
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertAdminNotice(AdminNotice adminnotice) {
		// 1. board insert
		int result =0;
		List<Attachment> attachments = adminnotice.getAttachments(); 
		 if(!attachments.isEmpty()) {
			 for(Attachment attach : attachments) {
				 result = memberDao.insertAttachment(attach);
				 adminnotice.setAttachGroupId(attach.getAttachGroupId());
			} 
		 }		
		result = adminNoticeDao.insertAdminNotice(adminnotice);

		return result;
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public AdminNotice selectOneAdminNoticeCollection(int noticeNo) {
		AdminNotice notice = adminNoticeDao.selectOneAdminNoticeCollection(noticeNo);
		
		log.debug("notice = {}", notice);
		
		String attachGroupId = notice.getAttachGroupId();
		
		log.debug("attachGroupId = {}", attachGroupId);		
		
		List<Attachment> noticeAttachList = adminNoticeDao.selectNoticeAttachments(attachGroupId);
		
		
		if (notice != null && !noticeAttachList.isEmpty()) {
		notice.setAttachments(noticeAttachList);
		}
		return notice;
	}
	
	@Override
	public AdminNoticeAttachment selectOneAttachment(int attachNo) {
		return adminNoticeDao.selectOneAttachment(attachNo);
	}
	
	@Override
	public int deleteAttachment(int attachNo) {
		return adminNoticeDao.deleteAttachment(attachNo);
	}
	
	@Override
	public int updateAdminNotice(AdminNotice adminNotice) {
		// a. board 수정
		int result = adminNoticeDao.updateAdminNotice(adminNotice);
		
		// b. attachment테이블의 등록
		List<Attachment> attachments = adminNotice.getAttachments();
		if(!attachments.isEmpty()) {
			for(Attachment attach : attachments)
				result = memberDao.insertAttachment(attach);
		}
		return result;
	}
}
