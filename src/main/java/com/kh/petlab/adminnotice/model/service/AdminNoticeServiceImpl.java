package com.kh.petlab.adminnotice.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.petlab.adminnotice.model.dao.AdminNoticeDao;
import com.kh.petlab.adminnotice.model.dto.AdminNotice;
import com.kh.petlab.adminnotice.model.dto.AdminNoticeAttachment;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional(rollbackFor = Exception.class)
public class AdminNoticeServiceImpl implements AdminNoticeService {
	
	@Autowired
	AdminNoticeDao adminNoticeDao;
	
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
		int result = adminNoticeDao.insertAdminNotice(adminnotice);
		log.debug("board#no = {}", adminnotice.getAdminNoticeNo());
		// 2. attachments insert
		List<AdminNoticeAttachment> attachments = adminnotice.getAttachments();
		if(!attachments.isEmpty()) {
			for(AdminNoticeAttachment attach : attachments) {
				attach.setNoticeNo(adminnotice.getAdminNoticeNo());
				result = adminNoticeDao.insertAttachment(attach);
			}
		}
		return result;
	}
	
	@Override
	public AdminNotice selectOneAdminNotice(int no) {
		AdminNotice adminnotice = adminNoticeDao.selectOneAdminNotice(no);

	//	List<AdminNoticeAttachment> attachments = adminNoticeDao.selectAttchmentListByBoardNo(no);
		//adminnotice.setAttachments(attachments);

		return adminnotice;
	}
	
	@Override
	public AdminNotice selectOneAdminNoticeCollection(int no) {
		return adminNoticeDao.selectOneAdminNoticeCollection(no);
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
		List<AdminNoticeAttachment> attachments = adminNotice.getAttachments();
		if(!attachments.isEmpty()) {
			for(AdminNoticeAttachment attach : attachments)
				result = adminNoticeDao.insertAttachment(attach);
		}
		return result;
	}
}
